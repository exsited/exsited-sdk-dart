/// The v4 document templates endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'document_templates.dart' as endpoints;
import 'document_templates_dto.dart' as views;

/// The document templates endpoints with [client] already applied.
class DocumentTemplatesResource {
  /// Bind the resource to a client; normally reached via `client.documentTemplates`.
  const DocumentTemplatesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/document_templates`
  Future<ApiResponse<views.SettingsDocumentTemplateList>>
      getSettingsDocumentTemplates({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsDocumentTemplates(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/document_templates`
  Future<ApiResponse<views.SettingsDocumentTemplate>>
      createSettingsDocumentTemplate(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsDocumentTemplate(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/document_templates/{document_template_id}`
  Future<ApiResponse<views.SettingsDocumentTemplate>>
      getSettingsDocumentTemplate(
    Object documentTemplateId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsDocumentTemplate(
            client,
            documentTemplateId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/settings/document_templates/{document_template_id}`
  Future<ApiResponse<Object?>> deleteSettingsDocumentTemplate(
    Object documentTemplateId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsDocumentTemplate(
        client,
        documentTemplateId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/document_templates/{document_template_id}`
  Future<ApiResponse<views.SettingsDocumentTemplate>>
      updateSettingsDocumentTemplate(
    Object documentTemplateId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsDocumentTemplate(
            client,
            documentTemplateId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );
}
