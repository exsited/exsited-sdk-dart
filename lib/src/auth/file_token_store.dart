/// `FileTokenStore` and `defaultTokenCachePath`, whichever half this platform
/// has.
///
/// A conditional **export**, not an import, because both names are part of the
/// public surface: `exsited.dart` re-exports them from here, and a caller
/// naming either gets the half their build compiles for. The `dart:io`
/// implementation is the real one; the other throws from every member so the
/// names still resolve on the web.
library;

export 'file_token_store_web.dart'
    if (dart.library.io) 'file_token_store_io.dart';
