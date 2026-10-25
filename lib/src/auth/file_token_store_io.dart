/// The `dart:io` half of the file-backed token cache.
///
/// Selected by the conditional export in `file_token_store.dart` where
/// `dart.library.io` exists. It must never be imported directly: this library
/// does not compile on the web at all.
///
/// [FileTokenStore] writes the token to a file guarded by a lock, so one
/// process's read-modify-write of that file cannot drop another's entry.
///
/// The lock does **not** make concurrent processes mint one token between them:
/// `TokenProvider` mints outside it and takes it only to write. Two tokens is a
/// cost the API allows; a call that failed waiting for a lock is not.
///
/// The lock is a **file created exclusively** with `File.createSync(exclusive:
/// true)`, which POSIX and Windows both make atomic without a dependency: it
/// either creates and returns, or throws because somebody else holds it.
/// `Directory.createSync` is not that operation: Dart treats an existing
/// directory as a successful create.
///
/// Exclusive creation, unlike an OS lock, is not released when the holder dies,
/// so the lock carries a stamp - pid, host, time, serial - and a holder that is
/// gone is recovered from it. Age is the backstop; the stamp is the shortcut.
///
/// **The lock is one per cache file, not one per namespace**, because every
/// mutation is a read-modify-write of the whole file.
///
/// **Failing to take that lock fails the call.** [FileTokenStore.withLock]
/// throws [SdkTokenLockException] and does not run the work. A caller who would
/// rather have the token than the exclusion sets `AuthConfig.inMemoryToken`.
/// [FileTokenStore.crossProcessLockingDegraded] names the condition, for a
/// caller who caught the refusal broadly and for a supervisor watching a path
/// that never locks.
library;

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import '../errors.dart';
import 'token_grammar.dart';
import 'token_store.dart';

const Duration _lockPoll = Duration(milliseconds: 25);

/// Prefixes the host name inside a lock stamp. Keyed rather than positional, so
/// a stamp that carries no host reads as carrying none instead of having some
/// other field misread as one.
const String _lockHostField = 'host=';

/// The platform's per-user cache path for the token file.
String defaultTokenCachePath() {
  final separator = Platform.pathSeparator;
  String directory;
  if (Platform.isWindows) {
    final local = Platform.environment['LOCALAPPDATA'] ?? Directory.systemTemp.path;
    directory = '$local${separator}exsited';
  } else if (Platform.isMacOS) {
    final home = Platform.environment['HOME'] ?? Directory.systemTemp.path;
    directory = '$home${separator}Library${separator}Caches${separator}exsited';
  } else {
    final cache = Platform.environment['XDG_CACHE_HOME'] ??
        '${Platform.environment['HOME'] ?? Directory.systemTemp.path}$separator.cache';
    directory = '$cache${separator}exsited';
  }
  return '$directory$separator$defaultTokenCacheFilename';
}

/// The in-isolate half of the lock over one cache path.
///
/// One instance per file, shared by every store pointed at that file, so two
/// clients built from one set of credentials share it.
///
/// It holds no mutex: `withLock` runs a synchronous callback, so within one
/// isolate the only way two calls overlap is a nested one, and a mutex would
/// deadlock on exactly that. The guard holds the state that has to be shared:
/// whether this isolate is already inside the file's lock, and whether the
/// condition has been announced.
class _CachePathGuard {
  /// How deep this isolate is inside the file's lock, so a nested acquisition
  /// re-enters rather than waiting for a lock it is itself holding.
  int depth = 0;

  /// The stamp the outermost holder wrote, released by that same holder.
  String? heldStamp;

  /// Why the last attempt on this path could not lock, or null while it can.
  String? degradedReason;

  /// Whether the current unbroken run of refusals has been announced. Re-armed
  /// after a success, so a condition that comes back is announced again rather
  /// than staying silent for the life of the process.
  bool announced = false;
}

final Map<String, _CachePathGuard> _guardsByCachePath = <String, _CachePathGuard>{};

/// The one guard for a resolved path, created once.
_CachePathGuard _guardForCachePath(String resolved) {
  // Two spellings that differ only in case name one file on Windows, and two
  // guards over one file are no guard at all.
  final key = Platform.isWindows ? resolved.toLowerCase() : resolved;
  return _guardsByCachePath.putIfAbsent(key, _CachePathGuard.new);
}

/// The absolute file a cache path names, worked out once, so a later change of
/// `Directory.current` does not move the I/O away from the guard and the lock.
///
/// The directory is what is resolved through symlinks, not the file, because
/// the file usually does not exist yet on the first call: resolving the file
/// would answer one path before it was written and another afterwards.
/// Resolving the directory also normalises a `.` or a `..` segment, so two
/// spellings of one file cannot get two guards.
String _resolveCachePath(String path) {
  try {
    final file = File(path).absolute;
    final name = file.uri.pathSegments.last;
    if (name.isEmpty) return file.path;
    try {
      final directory = file.parent.resolveSymbolicLinksSync();
      return '$directory${Platform.pathSeparator}$name';
    } on FileSystemException {
      // The directory is not there yet, so there is nothing to resolve and
      // nothing to normalise against. The absolute path is still a stable key.
      return file.path;
    }
  } on Object {
    // A platform that cannot answer at all. The unresolved path is still a
    // key, and a consistent one for as long as nothing calls chdir.
    return path;
  }
}

class FileTokenStore implements TokenStore {
  /// [lockWait] and [staleAfter] default to [defaultLockWait] and
  /// [staleLockDuration].
  FileTokenStore(
    String path, {
    Duration? lockWait,
    Duration? staleAfter,
  })  : path = _resolveCachePath(path),
        _lockWait = lockWait ?? defaultLockWait,
        _staleAfter = staleAfter ?? staleLockDuration {
    _guard = _guardForCachePath(this.path);
  }

  /// The cache file, absolute and resolved once at construction.
  final String path;
  final Duration _lockWait;
  final Duration _staleAfter;

  /// Shared with every other store naming this same file. See [_CachePathGuard].
  late final _CachePathGuard _guard;

  /// The one lock for the whole file. Not per namespace: a mutation rewrites the
  /// file, so a per-namespace lock would let two writers into it at once.
  String get lockPath => '$path.lock';

  /// Distinguishes this store's stamps from another store's in the same process.
  ///
  /// Random per instance rather than a shared counter, because a static in Dart
  /// is per-isolate: two isolates share one process and one pid but no statics,
  /// so a counter alone would let them mint the same stamp.
  final String _lockTag = Random().nextInt(0x40000000).toRadixString(16);
  int _lockSerial = 0;

  /// Why the last attempt on this cache path could not take the cross-process
  /// lock, or `null` while the lock is in force.
  ///
  /// The work is refused when this is set, so a caller does not have to poll it
  /// to stay safe. It says which condition it was to a caller who caught the
  /// refusal broadly, and lets a supervisor notice a path that never locks. Per
  /// cache path rather than per store.
  String? get crossProcessLockingDegraded => _guard.degradedReason;

  @override
  TokenRecord? read(String namespace) => TokenRecord.fromJson(_readAll()[namespace]);

  @override
  void write(String namespace, TokenRecord record) {
    // Before the read, so a credential this SDK would not send never becomes
    // the reason a shared file is rewritten at all.
    validateTokenCredentials(record.accessToken, record.refreshToken);
    final all = _readAll();
    all[namespace] = record.toJson();
    _writeAll(all);
  }

  /// Forget this namespace's entry.
  ///
  /// **The lock sidecar is not removed with it.** Unlinking it breaks mutual
  /// exclusion: a waiter keeps its handle on the unlinked file while a newcomer
  /// creates a fresh sidecar and takes that, so two holders are inside at once.
  @override
  void clear(String namespace) {
    final all = _readAll();
    all.remove(namespace);
    _writeAll(all);
  }

  /// Run [work] holding the file's cross-process lock, or refuse.
  ///
  /// [namespace] does not choose the lock: see [lockPath]. It is in the
  /// signature because the interface takes it.
  ///
  /// A nested call re-enters rather than deadlocking: the callback is
  /// synchronous, so within one isolate a second `withLock` can only begin
  /// inside the first, and the exclusion it wants is already held.
  @override
  T withLock<T>(String namespace, T Function() work) {
    if (_guard.depth > 0) {
      _guard.depth++;
      try {
        return work();
      } finally {
        _guard.depth--;
      }
    }
    // Throws rather than returning null: there is no unlocked path.
    final stamp = _acquireLock(lockPath);
    _guard
      ..depth = 1
      ..heldStamp = stamp;
    try {
      return work();
    } finally {
      _guard
        ..depth = 0
        ..heldStamp = null;
      _releaseLock(lockPath, stamp);
    }
  }

  /// Take the lock, or refuse the work by throwing.
  ///
  /// Returns the exact stamp written, which [_releaseLock] needs.
  String _acquireLock(String lockPath) {
    final deadline = DateTime.now().add(_lockWait);
    while (true) {
      try {
        Directory(File(path).parent.path).createSync(recursive: true);
        final lock = File(lockPath)..createSync(exclusive: true);
        final stamp = _writeStamp(lock);
        if (stamp == null) {
          // Release removes only a lock carrying this holder's stamp, so an
          // unstamped one could never be released by anybody. Drop it now
          // rather than leave a lock nothing but the age gate can clear.
          _tryDelete(lockPath);
          throw _degrade('the lock file $lockPath could not be stamped, so '
              'nothing could ever release it');
        }
        // Back in force: a later call succeeding must not keep reporting a
        // degradation that has passed, and must re-arm the announcement so a
        // condition that comes back is announced again.
        _guard
          ..degradedReason = null
          ..announced = false;
        return stamp;
      } on FileSystemException {
        // Somebody holds it, or the path cannot be created at all. Both are
        // waited out; only the first can be recovered early.
        if (_breakStaleLock(lockPath)) continue;
      } on UnsupportedError {
        // A filesystem that refuses the operation outright. Nothing to wait
        // for, so do not: refuse on the first attempt.
        throw _degrade('this platform has no filesystem, so $lockPath cannot '
            'be created');
      }
      if (!DateTime.now().isBefore(deadline)) {
        throw _degrade('the lock at $lockPath could not be taken within '
            '${_lockWait.inMilliseconds}ms');
      }
      sleep(_lockPoll);
    }
  }

  /// Write this holder's identity into the lock it just created: pid, host, an
  /// ISO-8601 UTC timestamp and a serial, space-separated on one line.
  ///
  /// The pid is first because [_readLockHolder] reads it positionally, and
  /// [_releaseLock] compares the whole line, so the field order is load-bearing.
  ///
  /// Returns the line written, or `null` when the write failed, which is a
  /// failed acquisition rather than an unstamped lock.
  String? _writeStamp(File lock) {
    final stamp = '$pid $_lockHostField${_localHostname()} '
        '${DateTime.now().toUtc().toIso8601String()} '
        '$_lockTag-${++_lockSerial}\n';
    try {
      lock.writeAsStringSync(stamp);
      return stamp;
    } on FileSystemException {
      return null;
    }
  }

  /// Remove a lock whose holder is gone, and report whether it did.
  ///
  /// Age is the gate. The one shortcut past it is a stamp that names **this
  /// host** and a pid that is gone: a pid means nothing on another machine, and
  /// a shared cache path is exactly what puts two machines on one lock file.
  ///
  /// A stamp naming *this* pid never takes the shortcut: isolates share a
  /// process and a pid, so the pid may belong to a sibling isolate holding the
  /// lock, or be a recycled pid that now names us. Both fall through to the age
  /// gate.
  bool _breakStaleLock(String lockPath) {
    final holder = _readLockHolder(lockPath);
    // The empty-host guard: [_localHostname] answers '' when the machine cannot
    // name itself, and two unnameable hosts would otherwise compare equal.
    if (holder != null &&
        holder.host.isNotEmpty &&
        holder.host == _localHostname() &&
        holder.pid != pid &&
        !_processIsAlive(holder.pid)) {
      return _tryDelete(lockPath);
    }
    final stat = FileStat.statSync(lockPath);
    // A missing lock is not one this call broke: statSync does not throw for an
    // absent path, it answers notFound with an epoch-zero mtime that every age
    // test reads as ancient.
    if (stat.type == FileSystemEntityType.notFound) return false;
    if (DateTime.now().difference(stat.modified) <= _staleAfter) return false;
    return _tryDelete(lockPath);
  }

  /// Whether [holderPid] names a running process, as far as this platform can be
  /// asked **without harming it**.
  ///
  /// POSIX only: `Process.killPid` on Windows ignores the signal and calls
  /// `TerminateProcess`, so asking there would kill whatever process now holds
  /// that pid. On Windows the answer is always "alive" and the age gate is the
  /// only recovery.
  ///
  /// `SIGCONT` because Dart exposes no signal 0: it resumes a stopped process
  /// and is otherwise a no-op, and `killPid` answers `false` only when the
  /// kernel refused to deliver it.
  ///
  /// Two blind spots, both covered by the age gate. A zombie still accepts a
  /// signal and so reads as alive. A live process owned by another user answers
  /// `EPERM`, which `killPid` flattens into the same `false` as "no such
  /// process", so it reads as dead; the cache directory is per-user, which keeps
  /// that off the normal path.
  static bool _processIsAlive(int holderPid) {
    if (holderPid <= 0) return false;
    if (Platform.isWindows) return true;
    try {
      return Process.killPid(holderPid, ProcessSignal.sigcont);
    } on Object {
      // The question could not be asked; a lock is never taken over on a guess.
      return true;
    }
  }

  /// Remove the lock only while it still carries this holder's own stamp.
  ///
  /// After a takeover it belongs to whoever broke this holder's lock, and
  /// removing that one would let a third writer straight in.
  void _releaseLock(String lockPath, String stamp) {
    try {
      if (File(lockPath).readAsStringSync() != stamp) return;
    } on Object {
      // Gone, or not readable: nothing this holder should remove.
      return;
    }
    _tryDelete(lockPath);
  }

  /// The pid and host a lock records, or `null` when it is unreadable or is not
  /// in the format [_writeStamp] writes.
  static _LockHolder? _readLockHolder(String lockPath) {
    String content;
    try {
      content = File(lockPath).readAsStringSync();
    } on Object {
      return null;
    }
    final fields = content.trim().split(RegExp(r'\s+'));
    final holderPid = int.tryParse(fields.first);
    if (holderPid == null || holderPid <= 0) return null;
    var host = '';
    for (final field in fields.skip(1)) {
      if (field.startsWith(_lockHostField)) {
        host = field.substring(_lockHostField.length);
        break;
      }
    }
    return _LockHolder(holderPid, host);
  }

  /// The machine writing a stamp, so a pid is only ever judged against the
  /// process table it was minted in.
  ///
  /// Empty when the host cannot be named, or names itself with whitespace, which
  /// would split one stamp field into two; every pid rule then falls back to the
  /// age gate.
  static String _localHostname() {
    try {
      final name = Platform.localHostname;
      return RegExp(r'\s').hasMatch(name) ? '' : name;
    } on Object {
      return '';
    }
  }

  static bool _tryDelete(String lockPath) {
    try {
      File(lockPath).deleteSync();
      return true;
    } on Object {
      // Another worker got there first, or it is not ours to remove.
      return false;
    }
  }

  /// Record the condition, announce it once per unbroken run of refusals, and
  /// hand back the refusal for the caller to throw.
  SdkTokenLockException _degrade(String reason) {
    _guard.degradedReason = reason;
    final refusal = SdkTokenLockException(
        'the token cache at $path could not be locked across processes, so '
        'the operation was refused rather than run without exclusion: '
        '$reason. Two processes sharing this file would otherwise write it at '
        "the same time and overwrite each other's entry, losing a refresh "
        'token that was still valid. Set AuthConfig.inMemoryToken to keep the '
        'token in memory, or point tokenCachePath at a filesystem where '
        'locking works');
    if (_guard.announced) return refusal;
    // Announced once per unbroken run rather than once per call: a line per
    // token refresh would be a log flood on the busiest path in the SDK.
    _guard.announced = true;
    try {
      // stderr, never stdout, which the rendered exchanges own. The path is the
      // caller's own and no token text is in this message.
      stderr.writeln('exsited: ${refusal.message}');
    } on Object {
      // No stderr to write to: a detached process, or a platform without one.
    }
    return refusal;
  }

  /// Every namespace in the cache file, as the raw JSON values it holds.
  ///
  /// An empty map means the file holds **nothing**: it is missing, or it is
  /// empty. Anything else - unreadable, larger than [maxTokenCacheBytes], not
  /// JSON, not a JSON object - throws [SdkTokenCacheException] rather than
  /// answering empty.
  ///
  /// Both mutations rebuild the file from what this returns, so answering empty
  /// for a file that could not be parsed would make the next write delete every
  /// other namespace's entry, refresh tokens included.
  ///
  /// Entries are kept as the values they arrived as and decoded one at a time,
  /// so a namespace this build cannot make sense of is written back byte for
  /// byte rather than dropped by a rewrite that only meant to add one entry.
  Map<String, Object?> _readAll() {
    final text = _readWithinTheCeiling();
    if (text == null || text.trim().isEmpty) return {};
    Object? parsed;
    try {
      parsed = jsonDecode(text);
    } on FormatException catch (error) {
      throw _refuseTheCacheFile('does not hold JSON', error.message);
    }
    if (parsed is! Map) {
      throw _refuseTheCacheFile(
          'does not hold a JSON object of credential namespaces',
          'it holds a ${parsed.runtimeType}');
    }
    return Map<String, Object?>.from(parsed);
  }

  /// The cache file's text, or null when there is no file.
  ///
  /// Read one byte past [maxTokenCacheBytes] and no further: enough to know the
  /// file is over the ceiling without holding the whole of it.
  String? _readWithinTheCeiling() {
    RandomAccessFile handle;
    try {
      handle = File(path).openSync();
    } on FileSystemException catch (error) {
      // A path that is not there is ordinary and costs one authentication. A
      // path that is there and will not open is not, and must not read as
      // absent.
      if (!File(path).existsSync()) return null;
      throw _refuseTheCacheFile('could not be opened', '${error.osError}');
    }
    try {
      final Uint8List bytes = handle.readSync(maxTokenCacheBytes + 1);
      if (bytes.length > maxTokenCacheBytes) {
        throw _refuseTheCacheFile(
            'is larger than the $maxTokenCacheBytes-byte ceiling this SDK '
                'reads it to, so it was not loaded',
            null);
      }
      return utf8.decode(bytes, allowMalformed: true);
    } on FileSystemException catch (error) {
      throw _refuseTheCacheFile('could not be read', '${error.osError}');
    } finally {
      try {
        handle.closeSync();
      } on FileSystemException {
        // Already gone. Nothing here is worth failing a call over.
      }
    }
  }

  /// The one refusal for a cache file that is there and cannot be used.
  SdkTokenCacheException _refuseTheCacheFile(String problem, String? cause) =>
      SdkTokenCacheException(
          'the token cache $problem. It is not read as empty: this file is '
          'keyed by credentials namespace and is meant to be shared, so '
          'rewriting it from an empty snapshot would discard every other '
          'namespace in it. Repair or move the file, or set '
          'AuthConfig.inMemoryToken to keep the token in memory. Path: $path'
          '${cause == null ? '' : ': $cause'}');

  /// Replace the file with [all].
  ///
  /// Throws on failure: every caller reaches here having read the file, so a
  /// failure now is a failure to persist a token the caller believes is cached.
  void _writeAll(Map<String, Object?> all) {
    final encoded = jsonEncode(all);
    try {
      Directory(File(path).parent.path).createSync(recursive: true);
    } on FileSystemException catch (error) {
      throw _refuseTheCacheFile(
          'could not be written: its directory does not exist', '${error.osError}');
    }
    // Written to a sibling and renamed, so a reader never sees half a file.
    final temporary = File('$path.$pid.tmp');
    try {
      temporary.writeAsStringSync(encoded);
    } on FileSystemException catch (error) {
      throw _refuseTheCacheFile('could not be written', '${error.osError}');
    }
    try {
      temporary.renameSync(path);
    } on FileSystemException catch (error) {
      try {
        temporary.deleteSync();
      } on FileSystemException {
        // The half-written sibling stays. It is named for this pid and is not
        // the cache, so nothing reads it.
      }
      throw _refuseTheCacheFile('could not be replaced', '${error.osError}');
    }
  }
}

/// Who a lock stamp says is holding it.
class _LockHolder {
  const _LockHolder(this.pid, this.host);

  final int pid;

  /// Empty when the stamp names no host. Every pid rule treats that as unknown.
  final String host;
}
