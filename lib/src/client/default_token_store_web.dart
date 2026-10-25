/// The default half of the choice of default token store: no `dart:io`, so
/// memory is the only store there is.
///
/// Selected by a conditional import in `exsited_client.dart` when
/// `dart.library.io` is absent, which is what Flutter web is. Asking for the
/// platform cache path there throws `UnsupportedError: Platform._pathSeparator`
/// under dart2js.
library;

import '../auth/token_store.dart';
import '../config/sdk_config.dart';
import '../errors.dart';

/// The store a client builds when the caller passed none: always memory.
///
/// A token cached in memory lasts as long as the page.
///
/// A `tokenCachePath` set explicitly is refused rather than ignored, since this
/// platform cannot honour it. Leaving it unset is the default, which is what a
/// cross-platform app writes when it wants a file cache where there is a
/// filesystem.
TokenStore buildDefaultTokenStore(SdkConfig config) {
  final path = config.auth.tokenCachePath;
  if (path != null) {
    throw SdkConfigException(
        'instance ${config.clientName}: tokenCachePath is set to "$path", and '
        'there is no filesystem on this platform to write it to - leave it '
        'unset to use the in-memory store here, or pass a TokenStore of your '
        'own to ExsitedClient');
  }
  return MemoryTokenStore();
}
