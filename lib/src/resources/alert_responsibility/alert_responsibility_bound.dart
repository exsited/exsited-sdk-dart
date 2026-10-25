/// The v4 alert responsibility endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'alert_responsibility.dart' as endpoints;
import 'alert_responsibility_dto.dart' as views;

/// The alert responsibility endpoints with [client] already applied.
class AlertResponsibilityResource {
  /// Bind the resource to a client; normally reached via `client.alertResponsibility`.
  const AlertResponsibilityResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/alert_responsibility`
  Future<ApiResponse<views.AlertResponsibilityList>> getAlertResponsibilities({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAlertResponsibilities(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/alert_responsibility/{alert_responsibility_id}`
  Future<ApiResponse<views.AlertResponsibility>> getAlertResponsibility(
    Object alertResponsibilityId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAlertResponsibility(
        client,
        alertResponsibilityId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/alert_responsibility`
  Future<ApiResponse<views.AlertResponsibility>> createAlertResponsibility(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createAlertResponsibility(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/alert_responsibility/{alert_responsibility_id}`
  Future<ApiResponse<views.AlertResponsibility>> updateAlertResponsibility(
    Object alertResponsibilityId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateAlertResponsibility(
        client,
        alertResponsibilityId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/alert_responsibility/{alert_responsibility_id}`
  Future<ApiResponse<Object?>> deleteAlertResponsibility(
    Object alertResponsibilityId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteAlertResponsibility(
        client,
        alertResponsibilityId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
