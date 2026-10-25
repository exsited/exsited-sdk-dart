/// The v4 alerts endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'alerts_dto.dart';
import 'alerts_urls.dart';

/// `GET /api/{api_version}/alerts`
Future<ApiResponse<Alerts>> getAlerts(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AlertsUrls.alerts,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Alerts.fromMap);

/// `GET /api/{api_version}/alerts/{alert_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getAlert(
  ExsitedClient client,
  Object alertId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AlertsUrls.alert,
        pathParams: {'alert_id': alertId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/alerts/account/{account_id}`
Future<ApiResponse<Alerts>> getAlertsAccountById(
  ExsitedClient client,
  Object accountId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AlertsUrls.alertsAccountById,
        pathParams: {'account_id': accountId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Alerts.fromMap);

/// `GET /api/{api_version}/alerts/employee/{employee_id}`
Future<ApiResponse<AlertsEmployeeByIdList>> getAlertsEmployeeById(
  ExsitedClient client,
  Object employeeId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AlertsUrls.alertsEmployeeById,
        pathParams: {'employee_id': employeeId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AlertsEmployeeByIdList.fromMap);

/// `GET /api/{api_version}/alerts/labour/{labour_id}`
Future<ApiResponse<AlertsLabourByIdList>> getAlertsLabourById(
  ExsitedClient client,
  Object labourId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AlertsUrls.alertsLabourById,
        pathParams: {'labour_id': labourId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AlertsLabourByIdList.fromMap);
