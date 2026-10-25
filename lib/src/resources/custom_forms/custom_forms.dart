/// The v4 custom forms endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'custom_forms_dto.dart';
import 'custom_forms_urls.dart';

/// `GET /api/{api_version}/settings/custom_forms`
///
/// List the custom forms.
Future<ApiResponse<SettingsCustomFormList>> getSettingsCustomForms(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomFormsUrls.settingsCustomForms,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomFormList.fromMap);

/// `POST /api/{api_version}/settings/custom_forms`
///
/// Create a custom form; `name` and `setting_group`, a setting group name such
/// as `ACCOUNT`, are required.
Future<ApiResponse<SettingsCustomForm>> createSettingsCustomForm(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CustomFormsUrls.settingsCustomForms,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomForm.fromMap);

/// `GET /api/{api_version}/settings/custom_forms/{custom_form_id}`
///
/// Read one custom form by its `cf_` id.
Future<ApiResponse<SettingsCustomForm>> getSettingsCustomForm(
  ExsitedClient client,
  Object customFormId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomFormsUrls.settingsCustomForm,
        pathParams: {'custom_form_id': customFormId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomForm.fromMap);

/// `DELETE /api/{api_version}/settings/custom_forms/{custom_form_id}`
///
/// Delete a custom form that is not system generated.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsCustomForm(
  ExsitedClient client,
  Object customFormId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(CustomFormsUrls.settingsCustomForm,
        pathParams: {'custom_form_id': customFormId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/custom_forms/{custom_form_id}`
///
/// Update a custom form's name, display name, description or users.
Future<ApiResponse<SettingsCustomForm>> updateSettingsCustomForm(
  ExsitedClient client,
  Object customFormId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(CustomFormsUrls.settingsCustomForm,
        pathParams: {'custom_form_id': customFormId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomForm.fromMap);
