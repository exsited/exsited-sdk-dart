/// The default half of the file-backed token cache: no `dart:io`, so no file to
/// cache a token in.
///
/// Selected by the conditional export in `file_token_store.dart` when
/// `dart.library.io` is absent, which is what Flutter web is.
///
/// Every member throws [UnsupportedError] naming itself. The class exists so
/// `FileTokenStore` resolves on both platforms: code that mentions the type in a
/// doc reference, a signature or an `is` test still compiles for the web.
///
/// A web caller wanting persistence passes the client a [TokenStore] of their
/// own; [MemoryTokenStore] is what the client picks by itself.
library;

import 'token_store.dart';

/// There is no platform cache path here, because there is no filesystem.
///
/// It throws rather than inventing a path, which would move the failure to the
/// first token write and describe it as an I/O error.
String defaultTokenCachePath() => throw UnsupportedError(
    'defaultTokenCachePath: there is no filesystem on this platform, so there '
    'is no path to cache a token in - the client uses MemoryTokenStore here, '
    'or pass a TokenStore of your own');

/// The web stand-in for the file-backed store: constructing one throws.
class FileTokenStore implements TokenStore {
  /// Always throws. Nothing on this platform can hold the file this needs.
  FileTokenStore(this.path, {Duration? lockWait, Duration? staleAfter}) {
    throw UnsupportedError(
        'FileTokenStore: there is no filesystem on this platform - use '
        'MemoryTokenStore, which is what the client picks here by itself, or '
        'pass a TokenStore of your own');
  }

  /// The path that was asked for. Never read: the constructor throws first.
  final String path;

  /// Present so the name exists on both platforms. Never read: the constructor
  /// throws first.
  String get lockPath => '$path.lock';

  /// Always throws. Present so the name exists on both platforms.
  String? get crossProcessLockingDegraded =>
      throw UnsupportedError('FileTokenStore.crossProcessLockingDegraded: '
          'there is no filesystem on this platform');

  @override
  TokenRecord? read(String namespace) => throw UnsupportedError(
      'FileTokenStore.read: there is no filesystem on this platform');

  @override
  void write(String namespace, TokenRecord record) => throw UnsupportedError(
      'FileTokenStore.write: there is no filesystem on this platform');

  @override
  void clear(String namespace) => throw UnsupportedError(
      'FileTokenStore.clear: there is no filesystem on this platform');

  @override
  T withLock<T>(String namespace, T Function() work) => throw UnsupportedError(
      'FileTokenStore.withLock: there is no filesystem on this platform');
}
