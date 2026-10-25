/// Document templates path templates and body keys; the client fills `{api_version}`.
library;

class DocumentTemplatesUrls {
  DocumentTemplatesUrls._();

  static const String settingsDocumentTemplates =
      '/api/{api_version}/settings/document_templates';
  static const String settingsDocumentTemplate =
      '/api/{api_version}/settings/document_templates/{document_template_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String documentTemplateKey = 'document_template';
}
