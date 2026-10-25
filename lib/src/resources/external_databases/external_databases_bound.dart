/// The v4 external databases endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'external_databases.dart' as endpoints;
import 'external_databases_dto.dart' as views;

/// The external databases endpoints with [client] already applied.
class ExternalDatabasesResource {
  /// Bind the resource to a client; normally reached via `client.externalDatabases`.
  const ExternalDatabasesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/external_databases`
  Future<ApiResponse<views.ExternalDatabases>> getExternalDatabases({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getExternalDatabases(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/external_databases`
  Future<ApiResponse<views.ExternalDatabasesView>> createExternalDatabase(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createExternalDatabase(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/external_databases/{db_name}`
  Future<ApiResponse<views.ExternalDatabases>> getExternalDatabase(
    Object dbName, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getExternalDatabase(
        client,
        dbName,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/external_databases/{db_name}/insert_records`
  Future<ApiResponse<views.ExternalDatabaseInsertRecord>>
      createExternalDatabaseInsertRecord(
    Object dbName,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createExternalDatabaseInsertRecord(
            client,
            dbName,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/external_databases/{db_name}/search`
  Future<ApiResponse<views.ExternalDatabaseSearch>>
      createExternalDatabaseSearch(
    Object dbName,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createExternalDatabaseSearch(
            client,
            dbName,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/external_databases/{db_name}/update_records`
  Future<ApiResponse<views.ExternalDatabaseUpdateRecordsUpdated>>
      updateExternalDatabaseUpdateRecords(
    Object dbName,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateExternalDatabaseUpdateRecords(
            client,
            dbName,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/external_databases/{db_name}/tables/{table_name}`
  Future<ApiResponse<views.ExternalDatabaseTableList>> getExternalDatabaseTable(
    Object dbName,
    Object tableName, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getExternalDatabaseTable(
        client,
        dbName,
        tableName,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
