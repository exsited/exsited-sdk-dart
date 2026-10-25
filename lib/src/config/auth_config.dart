import '../errors.dart';
import '../redaction.dart';

/// Credentials for one Exsited instance: exactly the four the token endpoint
/// takes.
///
/// Validated at construction, and [toString] masks the secret so an instance is
/// safe to log.
class AuthConfig {
  /// Build and validate. Every problem is reported at once rather than the
  /// first, so one round of fixing clears them all.
  factory AuthConfig({
    required String clientName,
    required String baseUrl,
    required String clientId,
    required String clientSecret,
    required String redirectUri,
    String grantType = 'client_credentials',
    String? tokenCachePath,
    bool inMemoryToken = false,
  }) {
    final problems = <String>[];
    void require(String name, String value) {
      if (value.trim().isEmpty) problems.add('$name: must not be blank');
    }

    require('clientName', clientName);
    require('baseUrl', baseUrl);
    require('clientId', clientId);
    require('clientSecret', clientSecret);
    require('redirectUri', redirectUri);
    require('grantType', grantType);

    final normalisedBase = _normaliseBaseUrl(baseUrl, problems);

    if (tokenCachePath != null && tokenCachePath.trim().isEmpty) {
      // A blank string is how an unset environment variable arrives, and
      // treating it as "in memory" would silently stop sharing the token.
      problems.add('tokenCachePath: must not be blank - pass inMemoryToken: true '
          'to keep it in memory, or a path to cache it');
    }

    if (problems.isNotEmpty) {
      final label = clientName.trim().isEmpty ? '<unnamed>' : clientName;
      throw SdkConfigException('instance $label: ${problems.join('; ')}');
    }

    return AuthConfig._(
      clientName: clientName,
      baseUrl: normalisedBase,
      clientId: clientId,
      clientSecret: clientSecret,
      redirectUri: redirectUri,
      grantType: grantType,
      tokenCachePath: tokenCachePath,
      inMemoryToken: inMemoryToken,
    );
  }

  const AuthConfig._({
    required this.clientName,
    required this.baseUrl,
    required this.clientId,
    required this.clientSecret,
    required this.redirectUri,
    required this.grantType,
    required this.tokenCachePath,
    required this.inMemoryToken,
  });

  final String clientName;
  final String baseUrl;
  final String clientId;
  final String clientSecret;
  final String redirectUri;
  final String grantType;

  /// Where the token is cached. Null with [inMemoryToken] false means the
  /// platform default.
  final String? tokenCachePath;

  /// Keep the token in memory for the life of the process.
  final bool inMemoryToken;

  static String _normaliseBaseUrl(String raw, List<String> problems) {
    final trimmed = raw.trim().replaceAll(RegExp(r'/+$'), '');
    if (trimmed.isEmpty) return trimmed;
    final parsed = Uri.tryParse(trimmed);
    if (parsed == null) {
      problems.add('baseUrl: not a URL: $trimmed');
      return trimmed;
    }
    if (parsed.scheme != 'http' && parsed.scheme != 'https') {
      problems.add('baseUrl: needs an http:// or https:// scheme');
    }
    if (parsed.userInfo.isNotEmpty) {
      // An HTTP client turns userinfo into a Basic header that replaces the
      // bearer token.
      problems.add('baseUrl: must not carry user:password@ credentials');
    }
    if (parsed.hasQuery || parsed.hasFragment) {
      problems.add('baseUrl: must not carry a query string or fragment');
    }
    if (parsed.hasPort && (parsed.port < 1 || parsed.port > 65535)) {
      // Uri.tryParse accepts ':0' and ':99999', which would fail at connect
      // time on the token grant and read as an authentication problem. A path
      // stays allowed: an instance can be mounted under a sub-path.
      problems.add('baseUrl: port must be a number from 1 to 65535, '
          'got ${parsed.port}');
    }
    return trimmed;
  }

  @override
  String toString() => 'AuthConfig(clientName: $clientName, baseUrl: $baseUrl, '
      'clientId: $clientId, clientSecret: $redacted, redirectUri: $redirectUri)';
}
