/// The v4 document templates endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'document_templates_dto.dart';
import 'document_templates_urls.dart';

/// `GET /api/{api_version}/settings/document_templates`
///
/// List the document templates.
Future<ApiResponse<SettingsDocumentTemplateList>> getSettingsDocumentTemplates(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(DocumentTemplatesUrls.settingsDocumentTemplates,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsDocumentTemplateList.fromMap);

/// `POST /api/{api_version}/settings/document_templates`
///
/// Create a document template; `name` and `document_template_type`, such as
/// `PDF_DOCUMENT`, are required.
Future<ApiResponse<SettingsDocumentTemplate>> createSettingsDocumentTemplate(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(DocumentTemplatesUrls.settingsDocumentTemplates,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsDocumentTemplate.fromMap);

/// `GET /api/{api_version}/settings/document_templates/{document_template_id}`
///
/// Read one document template by its `dt_` id.
Future<ApiResponse<SettingsDocumentTemplate>> getSettingsDocumentTemplate(
  ExsitedClient client,
  Object documentTemplateId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(DocumentTemplatesUrls.settingsDocumentTemplate,
        pathParams: {'document_template_id': documentTemplateId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsDocumentTemplate.fromMap);

/// `DELETE /api/{api_version}/settings/document_templates/{document_template_id}`
///
/// Delete a document template.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsDocumentTemplate(
  ExsitedClient client,
  Object documentTemplateId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(DocumentTemplatesUrls.settingsDocumentTemplate,
        pathParams: {'document_template_id': documentTemplateId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/document_templates/{document_template_id}`
///
/// Update a document template's fields or its content.
Future<ApiResponse<SettingsDocumentTemplate>> updateSettingsDocumentTemplate(
  ExsitedClient client,
  Object documentTemplateId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(DocumentTemplatesUrls.settingsDocumentTemplate,
        pathParams: {'document_template_id': documentTemplateId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsDocumentTemplate.fromMap);
