/// The v4 usages endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'usages_dto.dart';
import 'usages_urls.dart';

/// `GET /api/{api_version}/usages`
Future<ApiResponse<UsageList>> getUsages(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(UsagesUrls.usages,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: UsageList.fromMap);

/// `POST /api/{api_version}/usages`
Future<ApiResponse<Usages>> createUsage(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(UsagesUrls.usages,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Usages.fromMap);

/// `GET /api/{api_version}/usages/{usage_id}`
Future<ApiResponse<Usage>> getUsage(
  ExsitedClient client,
  Object usageId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(UsagesUrls.usage,
        pathParams: {'usage_id': usageId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Usage.fromMap);

/// `DELETE /api/{api_version}/usages/{usage_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteUsage(
  ExsitedClient client,
  Object usageId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(UsagesUrls.usage,
        pathParams: {'usage_id': usageId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/usages/{usage_id}`
Future<ApiResponse<UsageUpdated>> updateUsage(
  ExsitedClient client,
  Object usageId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(UsagesUrls.usage,
        pathParams: {'usage_id': usageId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: UsageUpdated.fromMap);

/// `PUT /api/{api_version}/usages/{usage_id}`
Future<ApiResponse<UsageUpdated>> replaceUsage(
  ExsitedClient client,
  Object usageId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPutRequest(UsagesUrls.usage,
        pathParams: {'usage_id': usageId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: UsageUpdated.fromMap);
