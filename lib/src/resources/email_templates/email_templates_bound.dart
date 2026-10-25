/// The v4 email templates endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'email_templates.dart' as endpoints;
import 'email_templates_dto.dart' as views;

/// The email templates endpoints with [client] already applied.
class EmailTemplatesResource {
  /// Bind the resource to a client; normally reached via `client.emailTemplates`.
  const EmailTemplatesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/email_templates`
  Future<ApiResponse<views.SettingsEmailTemplateList>>
      getSettingsEmailTemplates({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsEmailTemplates(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/email_templates`
  Future<ApiResponse<views.SettingsEmailTemplate>> createSettingsEmailTemplate(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsEmailTemplate(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/email_templates/{email_template_id}`
  Future<ApiResponse<views.SettingsEmailTemplate>> getSettingsEmailTemplate(
    Object emailTemplateId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsEmailTemplate(
        client,
        emailTemplateId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/email_templates/{email_template_id}`
  Future<ApiResponse<Object?>> deleteSettingsEmailTemplate(
    Object emailTemplateId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsEmailTemplate(
        client,
        emailTemplateId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/email_templates/{email_template_id}`
  Future<ApiResponse<views.SettingsEmailTemplate>> updateSettingsEmailTemplate(
    Object emailTemplateId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsEmailTemplate(
        client,
        emailTemplateId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
