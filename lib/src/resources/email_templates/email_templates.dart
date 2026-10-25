/// The v4 email templates endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'email_templates_dto.dart';
import 'email_templates_urls.dart';

/// `GET /api/{api_version}/settings/email_templates`
///
/// List the email templates shared across the instance.
Future<ApiResponse<SettingsEmailTemplateList>> getSettingsEmailTemplates(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(EmailTemplatesUrls.settingsEmailTemplates,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsEmailTemplateList.fromMap);

/// `POST /api/{api_version}/settings/email_templates`
///
/// Create an email template; `name` is required, and `cc` and `bcc` are lists
/// of addresses.
Future<ApiResponse<SettingsEmailTemplate>> createSettingsEmailTemplate(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(EmailTemplatesUrls.settingsEmailTemplates,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsEmailTemplate.fromMap);

/// `GET /api/{api_version}/settings/email_templates/{email_template_id}`
///
/// Read one email template by its `et_` id.
Future<ApiResponse<SettingsEmailTemplate>> getSettingsEmailTemplate(
  ExsitedClient client,
  Object emailTemplateId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(EmailTemplatesUrls.settingsEmailTemplate,
        pathParams: {'email_template_id': emailTemplateId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsEmailTemplate.fromMap);

/// `DELETE /api/{api_version}/settings/email_templates/{email_template_id}`
///
/// Delete an email template.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsEmailTemplate(
  ExsitedClient client,
  Object emailTemplateId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(EmailTemplatesUrls.settingsEmailTemplate,
        pathParams: {'email_template_id': emailTemplateId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/email_templates/{email_template_id}`
///
/// Update an email template's fields or its content.
Future<ApiResponse<SettingsEmailTemplate>> updateSettingsEmailTemplate(
  ExsitedClient client,
  Object emailTemplateId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(EmailTemplatesUrls.settingsEmailTemplate,
        pathParams: {'email_template_id': emailTemplateId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsEmailTemplate.fromMap);
