/// The v4 alerts endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'alerts.dart' as endpoints;
import 'alerts_dto.dart' as views;

/// The alerts endpoints with [client] already applied.
class AlertsResource {
  /// Bind the resource to a client; normally reached via `client.alerts`.
  const AlertsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/alerts`
  Future<ApiResponse<views.Alerts>> getAlerts({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAlerts(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/alerts/{alert_id}`
  Future<ApiResponse<Object?>> getAlert(
    Object alertId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAlert(
        client,
        alertId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/alerts/account/{account_id}`
  Future<ApiResponse<views.Alerts>> getAlertsAccountById(
    Object accountId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAlertsAccountById(
        client,
        accountId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/alerts/employee/{employee_id}`
  Future<ApiResponse<views.AlertsEmployeeByIdList>> getAlertsEmployeeById(
    Object employeeId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAlertsEmployeeById(
        client,
        employeeId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/alerts/labour/{labour_id}`
  Future<ApiResponse<views.AlertsLabourByIdList>> getAlertsLabourById(
    Object labourId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAlertsLabourById(
        client,
        labourId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
