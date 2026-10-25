/// Integration connections path templates and body keys; the client fills `{api_version}`.
library;

class IntegrationConnectionsUrls {
  IntegrationConnectionsUrls._();

  static const String integrationConnections =
      '/api/{api_version}/integration_connections';
  static const String integrationConnection =
      '/api/{api_version}/integration_connections/{integration_connection_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';
}
