/// The v4 alert responsibilities endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'alert_responsibilities_urls.dart';

/// `GET /api/{api_version}/settings/alert_responsibilities`
///
/// List the alert responsibilities.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getSettingsAlertResponsibilities(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(
        AlertResponsibilitiesUrls.settingsAlertResponsibilities,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/settings/alert_responsibilities`
///
/// Create an alert responsibility; `name` is required.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createSettingsAlertResponsibility(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(
        AlertResponsibilitiesUrls.settingsAlertResponsibilities,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/settings/alert_responsibilities/{alert_responsibility_id}`
///
/// Read one alert responsibility by its `ar_` id.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getSettingsAlertResponsibility(
  ExsitedClient client,
  Object alertResponsibilityId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AlertResponsibilitiesUrls.settingsAlertResponsibility,
        pathParams: {'alert_responsibility_id': alertResponsibilityId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/settings/alert_responsibilities/{alert_responsibility_id}`
///
/// Delete an alert responsibility.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsAlertResponsibility(
  ExsitedClient client,
  Object alertResponsibilityId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(
        AlertResponsibilitiesUrls.settingsAlertResponsibility,
        pathParams: {'alert_responsibility_id': alertResponsibilityId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/alert_responsibilities/{alert_responsibility_id}`
///
/// Update an alert responsibility's fields or its status.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateSettingsAlertResponsibility(
  ExsitedClient client,
  Object alertResponsibilityId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(
        AlertResponsibilitiesUrls.settingsAlertResponsibility,
        pathParams: {'alert_responsibility_id': alertResponsibilityId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
