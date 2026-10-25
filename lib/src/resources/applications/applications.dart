/// The v4 applications endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'applications_dto.dart';
import 'applications_urls.dart';

/// `GET /api/{api_version}/settings/applications`
///
/// List the OAuth applications.
Future<ApiResponse<SettingsApplicationList>> getSettingsApplications(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ApplicationsUrls.settingsApplications,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsApplicationList.fromMap);

/// `POST /api/{api_version}/settings/applications`
///
/// Create an OAuth application; `name` and `redirect_url` are required, and the
/// client id and secret are generated server side and never answered.
Future<ApiResponse<SettingsApplication>> createSettingsApplication(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ApplicationsUrls.settingsApplications,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsApplication.fromMap);

/// `GET /api/{api_version}/settings/applications/{application_id}`
///
/// Read one OAuth application by its `app_` id.
Future<ApiResponse<SettingsApplication>> getSettingsApplication(
  ExsitedClient client,
  Object applicationId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ApplicationsUrls.settingsApplication,
        pathParams: {'application_id': applicationId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsApplication.fromMap);

/// `DELETE /api/{api_version}/settings/applications/{application_id}`
///
/// Delete an OAuth application.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsApplication(
  ExsitedClient client,
  Object applicationId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ApplicationsUrls.settingsApplication,
        pathParams: {'application_id': applicationId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/applications/{application_id}`
///
/// Update an OAuth application's fields or its status.
Future<ApiResponse<SettingsApplication>> updateSettingsApplication(
  ExsitedClient client,
  Object applicationId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ApplicationsUrls.settingsApplication,
        pathParams: {'application_id': applicationId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsApplication.fromMap);
