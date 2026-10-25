/// The v4 external databases endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'external_databases_dto.dart';
import 'external_databases_urls.dart';

/// `GET /api/{api_version}/external_databases`
Future<ApiResponse<ExternalDatabases>> getExternalDatabases(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ExternalDatabasesUrls.externalDatabases,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ExternalDatabases.fromMap);

/// `POST /api/{api_version}/external_databases`
Future<ApiResponse<ExternalDatabasesView>> createExternalDatabase(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ExternalDatabasesUrls.externalDatabases,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ExternalDatabasesView.fromMap);

/// `GET /api/{api_version}/external_databases/{db_name}`
Future<ApiResponse<ExternalDatabases>> getExternalDatabase(
  ExsitedClient client,
  Object dbName, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ExternalDatabasesUrls.externalDatabase,
        pathParams: {'db_name': dbName},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ExternalDatabases.fromMap);

/// `POST /api/{api_version}/external_databases/{db_name}/insert_records`
Future<ApiResponse<ExternalDatabaseInsertRecord>>
    createExternalDatabaseInsertRecord(
  ExsitedClient client,
  Object dbName,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPostRequest(
            ExternalDatabasesUrls.externalDatabaseInsertRecords,
            pathParams: {'db_name': dbName},
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ExternalDatabaseInsertRecord.fromMap);

/// `POST /api/{api_version}/external_databases/{db_name}/search`
Future<ApiResponse<ExternalDatabaseSearch>> createExternalDatabaseSearch(
  ExsitedClient client,
  Object dbName,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ExternalDatabasesUrls.externalDatabaseSearch,
        pathParams: {'db_name': dbName},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ExternalDatabaseSearch.fromMap);

/// `PATCH /api/{api_version}/external_databases/{db_name}/update_records`
Future<ApiResponse<ExternalDatabaseUpdateRecordsUpdated>>
    updateExternalDatabaseUpdateRecords(
  ExsitedClient client,
  Object dbName,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(
            ExternalDatabasesUrls.externalDatabaseUpdateRecords,
            pathParams: {'db_name': dbName},
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ExternalDatabaseUpdateRecordsUpdated.fromMap);

/// `GET /api/{api_version}/external_databases/{db_name}/tables/{table_name}`
Future<ApiResponse<ExternalDatabaseTableList>> getExternalDatabaseTable(
  ExsitedClient client,
  Object dbName,
  Object tableName, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ExternalDatabasesUrls.externalDatabaseTable,
        pathParams: {'db_name': dbName, 'table_name': tableName},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ExternalDatabaseTableList.fromMap);
