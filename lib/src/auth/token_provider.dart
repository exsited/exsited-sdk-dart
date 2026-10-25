/// Obtaining and refreshing the OAuth2 access token.
///
/// Success means any 2xx: the token endpoint may answer 200 or 201. It issues a
/// refresh token and honours the `refresh_token` grant, so a renewal tries that
/// first and falls back to a full `client_credentials` request.
///
/// A v4 client authenticates at `/api/v4/oauth2/token`.
library;

import '../client/api_response.dart';
import '../client/exsited_client.dart';
import '../config/sdk_config.dart';
import '../errors.dart';
import '../http/media_type.dart';
import '../redaction.dart';
import 'token_grammar.dart';
import 'token_store.dart';

const Duration _defaultTokenTtl = Duration(hours: 1);

/// Refreshed this long before expiry, so a token never expires mid-flight.
const Duration expirySkew = Duration(seconds: 60);

/// The longest lifetime believed from the server.
///
/// `expiresAt` is an absolute stamp from whichever machine minted the token, so a
/// clock running ahead could make an expired one look fresh; bounding the window
/// lets it reach the API and be answered 401, which refresh-and-replay handles.
const Duration maxTokenTtl = Duration(hours: 24);

class TokenProvider {
  TokenProvider(this._config, this._store, this._client)
      : _namespace = buildCredentialsNamespace(
          _config.auth.baseUrl,
          _config.auth.clientId,
          _config.auth.clientSecret,
          _config.auth.grantType,
        );

  final SdkConfig _config;
  final TokenStore _store;
  final ExsitedClient _client;
  final String _namespace;

  String get tokenUrl => '${_config.baseUrl}${_config.tokenPath}';

  /// A usable token, fetched only if needed.
  Future<String> accessToken() async {
    final cached = _store.read(_namespace);
    if (cached != null && !cached.needsRefresh(expirySkew)) {
      return cached.accessToken;
    }
    return _renew(null);
  }

  /// Replace a token the API has rejected.
  ///
  /// If the store already holds a different one, another worker refreshed first
  /// and that token is used rather than minting a third.
  Future<String> refresh(String? stale) => _renew(stale);

  /// Evict a token the API has refused, if the cache still holds it.
  ///
  /// Called when the refresh that should have replaced it failed: the cache is
  /// shared by every process running as this user, and a dead token left in it
  /// would be read, sent and refused by every later process.
  ///
  /// A **compare**-and-clear rather than a bare clear: between the 401 and this
  /// call another worker may have refreshed and written a live token. On these
  /// credentials a new grant invalidates the previous token, so every worker
  /// minting its own would leave them taking turns being refused.
  ///
  /// Under the same lock [_renew] writes through, so the read and the clear
  /// cannot straddle another process's write.
  ///
  /// [deadAccessToken] is the token that produced the 401. Null or empty names no
  /// token and evicts nothing: clearing on "I do not know which" would discard a
  /// live entry. Returns whether an entry was removed.
  Future<bool> invalidateAccessToken(String? deadAccessToken) async {
    if (deadAccessToken == null || deadAccessToken.isEmpty) return false;
    return _store.withLock(_namespace, () {
      final record = _store.read(_namespace);
      if (record == null || record.accessToken != deadAccessToken) return false;
      _store.clear(_namespace);
      return true;
    });
  }

  Future<String> _renew(String? stale) async {
    final existing = _store.read(_namespace);
    if (existing != null &&
        existing.accessToken != stale &&
        !existing.needsRefresh(expirySkew)) {
      return existing.accessToken;
    }

    TokenRecord? minted;
    if (existing?.refreshToken != null) {
      minted = await _requestWithRefreshGrant(existing!.refreshToken!);
    }
    minted ??= await _requestWithCredentials();

    final record = minted;
    _store.withLock(_namespace, () => _store.write(_namespace, record));
    return record.accessToken;
  }

  Future<TokenRecord> _requestWithCredentials() async {
    // Four fields, exactly as the API takes them. The instance ignores a field
    // it does not recognise rather than refusing it.
    final ApiResponse<Object?> response;
    try {
      response = await _post({
        'grant_type': _config.auth.grantType,
        'client_id': _config.auth.clientId,
        'client_secret': _config.auth.clientSecret,
        'redirect_uri': _config.auth.redirectUri,
      });
    } on SdkException catch (error) {
      // raiseOnError raises a redirect before it can be read here.
      final status = error.statusCode;
      if (status != null && _isRedirect(status)) {
        throw _refusedByRedirect(status, error.responseHeaders);
      }
      rethrow;
    }
    if (_isRedirect(response.statusCode)) {
      throw _refusedByRedirect(response.statusCode, response.headers);
    }
    if (response.statusCode < 200 || response.statusCode >= 300) {
      final messages = response.errorMessages;
      throw SdkAuthException(
        'token request failed with ${response.statusCode}: '
        '${messages.isEmpty ? 'no detail' : messages.first}',
        statusCode: response.statusCode,
        errorType: ErrorType.authentication.wireName,
        rawResponse: redactValue(response.map),
      );
    }
    final body = response.map;
    if ((body is String || body is List<int>) &&
        !isJsonContentType(response.contentType)) {
      // A redirect the platform followed (a browser always does) lands on the
      // sign-in page, which answers 2xx with HTML.
      throw SdkAuthException(
        '$_refusedPrefix (the API answered ${response.statusCode} with a page '
        'that is not JSON, its sign-in page after a followed redirect)',
        statusCode: response.statusCode,
        errorType: ErrorType.authentication.wireName,
      );
    }
    return _buildRecord(response.map, null);
  }

  static const String _refusedPrefix = 'the token request was refused: check '
      'client_id, client_secret and redirect_uri';

  static bool _isRedirect(int statusCode) =>
      statusCode >= 300 && statusCode < 400;

  /// The refusal for a token request answered with a redirect. The Location is
  /// read for its path only and never quoted: its query may carry the request.
  static SdkAuthException _refusedByRedirect(
      int statusCode, Map<String, String> headers) {
    String? location;
    for (final entry in headers.entries) {
      if (entry.key.toLowerCase() == 'location') location = entry.value;
    }
    final path = location == null ? '' : (Uri.tryParse(location)?.path ?? '');
    final target = path.toLowerCase().contains('/login')
        ? 'redirecting to its sign-in page'
        : 'a redirect the SDK does not follow';
    return SdkAuthException(
      '$_refusedPrefix (the API answered $statusCode, $target)',
      statusCode: statusCode,
      errorType: ErrorType.authentication.wireName,
    );
  }

  Future<TokenRecord?> _requestWithRefreshGrant(String refreshToken) async {
    try {
      // No redirect_uri: the refresh grant does not take one.
      final response = await _post({
        'grant_type': 'refresh_token',
        'client_id': _config.auth.clientId,
        'client_secret': _config.auth.clientSecret,
        'refresh_token': refreshToken,
      });
      if (response.statusCode < 200 || response.statusCode >= 300) return null;
      return _buildRecord(response.map, refreshToken);
    } on SdkException {
      // A failed refresh must fall back to a full grant, not propagate.
      return null;
    }
  }

  Future<ApiResponse<Object?>> _post(Map<String, Object?> payload) =>
      _client.sendApiRequest<Object?>('POST', _config.tokenPath,
          options: CallOptions(
            jsonBody: payload,
            authenticated: false,
            headers: const {'Content-Type': 'application/json'},
          ));

  TokenRecord _buildRecord(Object? body, String? previousRefreshToken) {
    if (body is! Map) {
      throw SdkAuthException('token response was not a JSON object',
          errorType: ErrorType.authentication.wireName);
    }
    final accessToken = body['access_token'];
    if (accessToken is! String || accessToken.isEmpty) {
      throw SdkAuthException('token response carried no access_token',
          errorType: ErrorType.authentication.wireName,
          rawResponse: redactValue(body));
    }
    var ttl = _defaultTokenTtl;
    final expiresIn = body['expires_in'];
    if (expiresIn is num) {
      final seconds = expiresIn.toInt();
      ttl = Duration(seconds: seconds < 0 ? 0 : seconds);
      if (ttl > maxTokenTtl) ttl = maxTokenTtl;
    }
    final refreshToken = body['refresh_token'];
    final refresh = refreshToken is String && refreshToken.isNotEmpty
        ? refreshToken
        : previousRefreshToken;
    // Each credential is held to its own grammar: the access token becomes an
    // `Authorization: Bearer` header, the refresh token is a body field. This
    // stops a value carrying CR LF being written into a header and read as a
    // header of its own.
    validateTokenCredentials(accessToken, refresh);
    return TokenRecord(
      accessToken: accessToken,
      refreshToken: refresh,
      expiresAt: DateTime.now().add(ttl).millisecondsSinceEpoch,
    );
  }
}
