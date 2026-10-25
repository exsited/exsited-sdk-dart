/// What a token credential is allowed to be: the two credentials are validated
/// against two different grammars.
///
/// An access token becomes the credentials of an `Authorization: Bearer`
/// header, so it has to satisfy RFC 6750 section 2.1 `b64token`:
///
/// ```
/// b64token = 1*( ALPHA / DIGIT / "-" / "." / "_" / "~" / "+" / "/" ) *"="
/// ```
///
/// A refresh token is never a header. It is a field of a token request body,
/// RFC 6749 section 5.1, whose grammar is `*VSCHAR` - visible ASCII, %x20-7E -
/// and that keeps the punctuation Bearer has no room for, a comma or a colon or
/// a quote among them. Holding a refresh token to the header grammar would
/// refuse tokens this API is entitled to issue.
///
/// They are validated rather than coerced. Beyond `is String`, this refuses a
/// value carrying CR or LF, which splits the header and lets anything after it
/// be read as a header of its own; a value carrying a space, which ends the
/// credential and starts a parameter; an empty one; and a control character.
///
/// Nothing here imports `dart:io`.
library;

import '../client/api_response.dart';
import '../errors.dart';

/// Whether [token] satisfies RFC 6750 2.1 `b64token`.
bool isValidAccessToken(String token) => _accessTokenProblem(token) == null;

/// Whether [token] satisfies RFC 6749 5.1 visible ASCII.
///
/// An empty refresh token is valid and means "there is none": the grant need
/// not issue one.
bool isValidRefreshToken(String? token) => _refreshTokenProblem(token) == null;

/// Whether both credentials satisfy their own grammar.
bool areValidTokenCredentials(String accessToken, String? refreshToken) =>
    isValidAccessToken(accessToken) && isValidRefreshToken(refreshToken);

/// Refuse a pair of credentials that this SDK will not send.
///
/// Throws [SdkAuthException]. Used where the caller cannot carry on without a
/// credential - decoding a grant, writing the cache - as opposed to the cache
/// read, which treats an invalid cached value as no cached value at all.
void validateTokenCredentials(String accessToken, String? refreshToken) {
  final access = _accessTokenProblem(accessToken);
  if (access != null) throw _refuse('access_token', access, accessToken);
  final refresh = _refreshTokenProblem(refreshToken);
  if (refresh != null) throw _refuse('refresh_token', refresh, refreshToken!);
}

String? _accessTokenProblem(String token) {
  if (token.isEmpty) return 'is empty';
  var padding = false;
  var padCount = 0;
  for (final unit in token.codeUnits) {
    if (unit == 0x3d) {
      // '=' is padding, and only ever at the end.
      padding = true;
      padCount++;
      continue;
    }
    if (padding) return "carries a character after its '=' padding";
    if (!_isB64TokenUnit(unit)) {
      return 'carries the code unit ${_hex(unit)}, which the RFC 6750 2.1 '
          'b64token grammar an Authorization: Bearer header is built from does '
          'not allow';
    }
  }
  if (padCount == token.length) return "is nothing but '=' padding";
  return null;
}

String? _refreshTokenProblem(String? token) {
  if (token == null) return null;
  for (final unit in token.codeUnits) {
    if (unit < 0x20 || unit > 0x7e) {
      return 'carries the code unit ${_hex(unit)}, which is outside the RFC '
          '6749 5.1 visible-ASCII range a token-request field is written in';
    }
  }
  return null;
}

bool _isB64TokenUnit(int unit) {
  if (unit >= 0x41 && unit <= 0x5a) return true; // A-Z
  if (unit >= 0x61 && unit <= 0x7a) return true; // a-z
  if (unit >= 0x30 && unit <= 0x39) return true; // 0-9
  // '-' '.' '_' '~' '+' '/'
  return unit == 0x2d ||
      unit == 0x2e ||
      unit == 0x5f ||
      unit == 0x7e ||
      unit == 0x2b ||
      unit == 0x2f;
}

String _hex(int unit) => '0x${unit.toRadixString(16).padLeft(2, '0')}';

/// Name the problem without ever printing the credential.
///
/// The length is given instead: it is what tells a truncated value from a
/// mistyped one, and it discloses nothing.
SdkAuthException _refuse(String field, String problem, String token) =>
    SdkAuthException(
      'the $field $problem, so it is not a credential this SDK will send. Its '
      'value is not shown; it is ${token.length} code units long',
      errorType: ErrorType.authentication.wireName,
    );
