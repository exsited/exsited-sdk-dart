/// Where the access and refresh tokens live between calls.
///
/// Two stores. [MemoryTokenStore] is here and keeps the token for the life of
/// the process. `FileTokenStore` writes it to a file guarded by a lock, and
/// lives in `file_token_store.dart` because it needs `dart:io`; nothing here
/// imports it, so the token record, the interface and the memory store work on
/// the web.
library;

import 'dart:convert';

import 'sha256.dart';
import 'token_grammar.dart';

/// The most of the cache file this SDK will read, and the size above which it
/// refuses the file instead.
///
/// The whole file is parsed at once, from a per-user path any process running as
/// this user can write, so an unbounded read would let that writer decide how
/// much memory this SDK holds.
///
/// A generous entry carrying two 4 KB credentials is about 9 KB and an ordinary
/// one is under 1 KB, so a megabyte holds a hundred of the first or a thousand
/// of the second.
const int maxTokenCacheBytes = 1024 * 1024;

/// How long a lock is believed before it is treated as abandoned.
///
/// Deliberately longer than [defaultLockWait]: a caller that arrives during a
/// legitimate hold degrades rather than waits out the age gate, and it is the
/// *next* call that reclaims a lock its holder died under.
const Duration staleLockDuration = Duration(seconds: 30);

/// How long an acquisition waits before giving up and refusing the work.
const Duration defaultLockWait = Duration(seconds: 10);

const String defaultTokenCacheFilename = 'exsited_dart_token.json';

/// A minted token and when it stops being usable.
class TokenRecord {
  const TokenRecord({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });

  final String accessToken;
  final String? refreshToken;

  /// Absolute epoch milliseconds.
  final int expiresAt;

  /// Refreshed *before* expiry rather than after a rejection, so a token never
  /// expires mid-flight.
  bool needsRefresh(Duration skew) =>
      DateTime.now().millisecondsSinceEpoch >= expiresAt - skew.inMilliseconds;

  Map<String, Object?> toJson() => {
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'expiresAt': expiresAt,
      };

  /// Read one cache entry, or null when it is not one this SDK can send.
  ///
  /// Null rather than a throw for every rejection, including a credential that
  /// fails its grammar: the file is shared, and refusing the call over bytes
  /// somebody else wrote is worse than minting a fresh token. The entry stays on
  /// disk untouched either way.
  ///
  /// The grammar check stops a value carrying CR LF reaching
  /// `Authorization: Bearer`.
  static TokenRecord? fromJson(Object? value) {
    if (value is! Map) return null;
    final accessToken = value['accessToken'];
    final expiresAt = value['expiresAt'];
    if (accessToken is! String || expiresAt is! int) return null;
    final refreshToken = value['refreshToken'];
    final refresh = refreshToken is String ? refreshToken : null;
    if (!areValidTokenCredentials(accessToken, refresh)) return null;
    return TokenRecord(
      accessToken: accessToken,
      refreshToken: refresh,
      expiresAt: expiresAt,
    );
  }
}

abstract class TokenStore {
  /// This namespace's record, or null when there is none cached.
  ///
  /// Throws [SdkTokenCacheException] when a cache that is **there** cannot be
  /// used. An absent cache is not that: it is ordinary and costs one
  /// authentication.
  TokenRecord? read(String namespace);

  /// Replace this namespace's entry, leaving every other one alone.
  ///
  /// Throws [SdkTokenCacheException] when the existing file could not be read,
  /// because the snapshot the write would rebuild it from is then not the
  /// file's contents.
  void write(String namespace, TokenRecord record);

  void clear(String namespace);

  /// Run [work] with exclusive access, or refuse.
  ///
  /// **`FileTokenStore` fails closed.** When there is no cross-process lock to
  /// take, [work] does not run and [SdkTokenLockException] is thrown: a guard
  /// only this isolate can see does not stop the process next to it, and two
  /// writers would overwrite each other's entry, refresh token included. A
  /// caller who would rather have no coordination than no token passes
  /// `AuthConfig.inMemoryToken`.
  T withLock<T>(String namespace, T Function() work);
}

/// Fingerprint a set of credentials, for keying a shared token file.
///
/// Derived from every value that decides *which principal the server mints for*,
/// so identical credentials share one cached token and any difference gets its own
/// entry. `redirectUri` is sent by the token request but selects no token, so it
/// is not included.
///
/// Each value is fed in **with its length in code points** rather than joined on a
/// separator, which would be forgeable.
///
/// Any change to the material below changes every key, and a token cached under
/// the old key is not found.
String buildCredentialsNamespace(
  String baseUrl,
  String clientId, [
  String clientSecret = '',
  String grantType = '',
]) {
  // The leading 'v4' is the fingerprint scheme label: it is what lets the
  // cache key change if the material ever does.
  final values = ['v4', baseUrl, clientId, clientSecret, '', grantType];
  final material = StringBuffer();
  for (final value in values) {
    material.write('${value.runes.length}:$value');
  }
  return sha256Hex(utf8.encode(material.toString())).substring(0, 16);
}

class MemoryTokenStore implements TokenStore {
  final Map<String, TokenRecord> _records = {};

  @override
  TokenRecord? read(String namespace) => _records[namespace];

  @override
  void write(String namespace, TokenRecord record) => _records[namespace] = record;

  @override
  void clear(String namespace) => _records.remove(namespace);

  @override
  T withLock<T>(String namespace, T Function() work) {
    // Dart is single-threaded per isolate, so there is nothing to exclude.
    return work();
  }
}
