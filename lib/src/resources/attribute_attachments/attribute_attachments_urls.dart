/// Attribute attachments path templates and body keys; the client fills `{api_version}`.
library;

class AttributeAttachmentsUrls {
  AttributeAttachmentsUrls._();

  static const String attributeAttachment =
      '/api/{api_version}/attribute_attachment/{file_uuid}';
}
