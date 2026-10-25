/// The v4 integration connections endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'integration_connections.dart' as endpoints;
import 'integration_connections_dto.dart' as views;

/// The integration connections endpoints with [client] already applied.
class IntegrationConnectionsResource {
  /// Bind the resource to a client; normally reached via `client.integrationConnections`.
  const IntegrationConnectionsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/integration_connections`
  Future<ApiResponse<views.IntegrationConnections>> getIntegrationConnections({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getIntegrationConnections(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/integration_connections/{integration_connection_id}`
  Future<ApiResponse<Object?>> getIntegrationConnection(
    Object integrationConnectionId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getIntegrationConnection(
        client,
        integrationConnectionId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
