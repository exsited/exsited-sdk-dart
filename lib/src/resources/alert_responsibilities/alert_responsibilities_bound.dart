/// The v4 alert responsibilities endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'alert_responsibilities.dart' as endpoints;

/// The alert responsibilities endpoints with [client] already applied.
class AlertResponsibilitiesResource {
  /// Bind the resource to a client; normally reached via `client.alertResponsibilities`.
  const AlertResponsibilitiesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/alert_responsibilities`
  Future<ApiResponse<Object?>> getSettingsAlertResponsibilities({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsAlertResponsibilities(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/alert_responsibilities`
  Future<ApiResponse<Object?>> createSettingsAlertResponsibility(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsAlertResponsibility(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/alert_responsibilities/{alert_responsibility_id}`
  Future<ApiResponse<Object?>> getSettingsAlertResponsibility(
    Object alertResponsibilityId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsAlertResponsibility(
        client,
        alertResponsibilityId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/alert_responsibilities/{alert_responsibility_id}`
  Future<ApiResponse<Object?>> deleteSettingsAlertResponsibility(
    Object alertResponsibilityId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsAlertResponsibility(
        client,
        alertResponsibilityId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/alert_responsibilities/{alert_responsibility_id}`
  Future<ApiResponse<Object?>> updateSettingsAlertResponsibility(
    Object alertResponsibilityId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsAlertResponsibility(
        client,
        alertResponsibilityId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
