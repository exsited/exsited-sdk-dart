/// The v4 custom forms endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'custom_forms.dart' as endpoints;
import 'custom_forms_dto.dart' as views;

/// The custom forms endpoints with [client] already applied.
class CustomFormsResource {
  /// Bind the resource to a client; normally reached via `client.customForms`.
  const CustomFormsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/custom_forms`
  Future<ApiResponse<views.SettingsCustomFormList>> getSettingsCustomForms({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsCustomForms(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/custom_forms`
  Future<ApiResponse<views.SettingsCustomForm>> createSettingsCustomForm(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsCustomForm(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/custom_forms/{custom_form_id}`
  Future<ApiResponse<views.SettingsCustomForm>> getSettingsCustomForm(
    Object customFormId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsCustomForm(
        client,
        customFormId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/custom_forms/{custom_form_id}`
  Future<ApiResponse<Object?>> deleteSettingsCustomForm(
    Object customFormId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsCustomForm(
        client,
        customFormId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/custom_forms/{custom_form_id}`
  Future<ApiResponse<views.SettingsCustomForm>> updateSettingsCustomForm(
    Object customFormId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsCustomForm(
        client,
        customFormId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
