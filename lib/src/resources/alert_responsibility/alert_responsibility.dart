/// The v4 alert responsibility endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'alert_responsibility_dto.dart';
import 'alert_responsibility_urls.dart';

/// `GET /api/{api_version}/alert_responsibility`
///
/// List alert responsibilities, the singular path the workflow services serve.
Future<ApiResponse<AlertResponsibilityList>> getAlertResponsibilities(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AlertResponsibilityUrls.alertResponsibilities,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AlertResponsibilityList.fromMap);

/// `GET /api/{api_version}/alert_responsibility/{alert_responsibility_id}`
///
/// One alert responsibility; the `ar_` id or the raw uuid.
Future<ApiResponse<AlertResponsibility>> getAlertResponsibility(
  ExsitedClient client,
  Object alertResponsibilityId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AlertResponsibilityUrls.alertResponsibility,
        pathParams: {'alert_responsibility_id': alertResponsibilityId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AlertResponsibility.fromMap);

/// `POST /api/{api_version}/alert_responsibility`
///
/// Create an alert responsibility, under `alert_responsibility`; `name` is
/// required and unique, beside `display_name` and `description` only.
Future<ApiResponse<AlertResponsibility>> createAlertResponsibility(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AlertResponsibilityUrls.alertResponsibilities,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AlertResponsibility.fromMap);

/// `PATCH /api/{api_version}/alert_responsibility/{alert_responsibility_id}`
///
/// Update an alert responsibility; `status` may move between `active` and
/// `inactive` beside the three create keys.
Future<ApiResponse<AlertResponsibility>> updateAlertResponsibility(
  ExsitedClient client,
  Object alertResponsibilityId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(AlertResponsibilityUrls.alertResponsibility,
        pathParams: {'alert_responsibility_id': alertResponsibilityId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AlertResponsibility.fromMap);

/// `DELETE /api/{api_version}/alert_responsibility/{alert_responsibility_id}`
///
/// Delete an alert responsibility, a soft delete; the id must be the `ar_` one.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteAlertResponsibility(
  ExsitedClient client,
  Object alertResponsibilityId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(AlertResponsibilityUrls.alertResponsibility,
        pathParams: {'alert_responsibility_id': alertResponsibilityId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
