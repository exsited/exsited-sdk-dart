/// The v4 usages endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'usages.dart' as endpoints;
import 'usages_dto.dart' as views;

/// The usages endpoints with [client] already applied.
class UsagesResource {
  /// Bind the resource to a client; normally reached via `client.usages`.
  const UsagesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/usages`
  Future<ApiResponse<views.UsageList>> getUsages({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getUsages(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/usages`
  Future<ApiResponse<views.Usages>> createUsage(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createUsage(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/usages/{usage_id}`
  Future<ApiResponse<views.Usage>> getUsage(
    Object usageId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getUsage(
        client,
        usageId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/usages/{usage_id}`
  Future<ApiResponse<Object?>> deleteUsage(
    Object usageId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteUsage(
        client,
        usageId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/usages/{usage_id}`
  Future<ApiResponse<views.UsageUpdated>> updateUsage(
    Object usageId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateUsage(
        client,
        usageId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PUT /api/{api_version}/usages/{usage_id}`
  Future<ApiResponse<views.UsageUpdated>> replaceUsage(
    Object usageId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.replaceUsage(
        client,
        usageId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
