/// The v4 integration connections endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'integration_connections_dto.dart';
import 'integration_connections_urls.dart';

/// `GET /api/{api_version}/integration_connections`
///
/// Filter by status with `filter_status`, which `filterParam('status')` builds:
/// `ACTIVE`, `INACTIVE` or `DISCONNECTED`. v4 ignores a plain `status` parameter.
Future<ApiResponse<IntegrationConnections>> getIntegrationConnections(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(IntegrationConnectionsUrls.integrationConnections,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: IntegrationConnections.fromMap);

/// `GET /api/{api_version}/integration_connections/{integration_connection_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getIntegrationConnection(
  ExsitedClient client,
  Object integrationConnectionId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(IntegrationConnectionsUrls.integrationConnection,
        pathParams: {'integration_connection_id': integrationConnectionId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
