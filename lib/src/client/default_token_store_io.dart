/// The `dart:io` half of the choice of default token store.
///
/// Selected by a conditional import in `exsited_client.dart` where
/// `dart.library.io` exists. It must never be imported directly.
library;

import '../auth/file_token_store.dart';
import '../auth/token_store.dart';
import '../config/sdk_config.dart';

/// The store a client builds when the caller passed none.
///
/// `inMemoryToken` is the caller asking for memory outright. Otherwise the
/// token is cached in a file, at the path the config names or the platform's
/// per-user one, so several processes with the same credentials share a token
/// rather than each minting their own.
TokenStore buildDefaultTokenStore(SdkConfig config) {
  final auth = config.auth;
  if (auth.inMemoryToken) return MemoryTokenStore();
  return FileTokenStore(auth.tokenCachePath ?? defaultTokenCachePath());
}
