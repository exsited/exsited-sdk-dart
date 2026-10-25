/// Whether a base URL puts this SDK's credentials on the wire in the clear.
///
/// Nothing here does I/O or resolves a name: it runs while a client is being
/// constructed, where a DNS lookup would block, could fail, and would reveal the
/// host name before the first request. Every host form is parsed from the string.
///
/// The client consults this, not `AuthConfig` validation, which has no side
/// effects. An `http://` base URL is warned about rather than refused: a local
/// instance is a legitimate target.
library;

/// Host names that reach nothing but this machine, so nothing is on a wire to
/// intercept. `localhost.localdomain` is what a stock `/etc/hosts` on several
/// distributions carries beside `localhost`.
const Set<String> loopbackHostnames = <String>{
  'localhost',
  'localhost.localdomain',
};

/// Whether a host name or literal address refers only to this machine: the
/// names in [loopbackHostnames], the whole of `127.0.0.0/8`, and `::1` in any of
/// its spellings. `Uri.parseIPv4Address` and `Uri.parseIPv6Address` are pure
/// parsers over the string, so this never touches a resolver.
bool isLoopbackHost(String? host) {
  if (host == null) return false;
  final name = host.trim().toLowerCase();
  if (name.isEmpty) return false;
  if (loopbackHostnames.contains(name)) return true;
  // `Uri.host` strips the brackets from an IPv6 literal, but a caller may hand
  // this a raw authority that still carries them.
  final bare = name.startsWith('[') && name.endsWith(']')
      ? name.substring(1, name.length - 1)
      : name;
  try {
    // The whole /8, not only 127.0.0.1: 127.0.0.2 and 127.1.2.3 are equally
    // this machine, and a warning that fired on those would be a false alarm.
    return Uri.parseIPv4Address(bare)[0] == 127;
  } on FormatException {
    // Not a dotted quad. Fall through to the v6 reading.
  }
  final List<int> address;
  try {
    address = Uri.parseIPv6Address(bare);
  } on FormatException {
    // A name this cannot parse is a name, and a name is not loopback unless it
    // is one of the two above. It is not resolved: see the library doc.
    return false;
  }
  for (var index = 0; index < 15; index++) {
    if (address[index] != 0) return false;
  }
  return address[15] == 1;
}

/// The warning an `http://` base URL deserves, or null when there is none.
///
/// An unparseable URL answers null: the config has already refused it.
String? plaintextTransportWarning(String baseUrl) {
  final parsed = Uri.tryParse(baseUrl.trim());
  if (parsed == null || parsed.scheme.toLowerCase() != 'http') return null;
  if (isLoopbackHost(parsed.host)) return null;
  return 'baseUrl uses http://, so every request to ${parsed.host} crosses the '
      'network in cleartext - the bearer token on every call, and the '
      'clientId and clientSecret in the token request itself. Use https:// '
      'unless this is a local development instance';
}

/// Origins already warned about in this process, keyed host and port, so a
/// caller that builds a client per call is warned once, and two clients
/// differing only in path share one warning.
final Set<String> _warnedOrigins = <String>{};

/// The warning to emit for this base URL, or null when there is nothing to say
/// or this origin has already been warned about. Taking it marks it as given.
String? takeInsecureBaseUrlWarning(String baseUrl) {
  final message = plaintextTransportWarning(baseUrl);
  if (message == null) return null;
  final parsed = Uri.tryParse(baseUrl.trim());
  final key = parsed == null ? baseUrl.trim() : '${parsed.host}:${parsed.port}';
  return _warnedOrigins.add(key) ? message : null;
}

/// Forget every origin warned about so far, so the next client warns again.
void resetInsecureBaseUrlWarnings() => _warnedOrigins.clear();
