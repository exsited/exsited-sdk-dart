/// Whether a `Content-Type` labels a JSON body.
///
/// `application/json` and any `application/<subtype>+json` (the RFC 6839
/// structured syntax suffix) are JSON; `application/jsonp` is not. `text/json`
/// is not JSON here either: it is unregistered, and the SDK sends and expects
/// `application/json`.
///
/// Total and pure, because it runs on every response: parameters are dropped,
/// case is folded, and anything that is not a media type answers false rather
/// than throwing.
library;

const String jsonMediaType = 'application/json';

/// RFC 6839 structured syntax suffix.
const String _jsonSuffix = '+json';
const String _jsonTree = 'application/';

/// Reduce a `Content-Type` to the lowered `type/subtype` used for comparison.
///
/// Parameters are dropped and case is folded, so `Application/JSON; charset=utf-8`
/// and `application/json` are the same media type.
String mediaTypeOf(String value) => value.split(';').first.trim().toLowerCase();

/// Whether a raw `Content-Type` header labels a JSON body.
bool isJsonContentType(String? contentType) {
  if (contentType == null) return false;
  return isJsonMediaType(mediaTypeOf(contentType));
}

/// Whether this lowered `type/subtype` labels a JSON body.
bool isJsonMediaType(String mediaType) {
  if (mediaType == jsonMediaType) return true;
  return mediaType.startsWith(_jsonTree) &&
      mediaType.endsWith(_jsonSuffix) &&
      // `application/+json` has no subtype prefix, so it names nothing.
      mediaType.length > _jsonTree.length + _jsonSuffix.length;
}
