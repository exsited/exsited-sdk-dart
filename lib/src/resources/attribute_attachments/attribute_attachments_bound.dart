/// The v4 attribute attachments endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'attribute_attachments.dart' as endpoints;

/// The attribute attachments endpoints with [client] already applied.
class AttributeAttachmentsResource {
  /// Bind the resource to a client; normally reached via `client.attributeAttachments`.
  const AttributeAttachmentsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/attribute_attachment/{file_uuid}`
  Future<ApiResponse<Object?>> getAttributeAttachment(
    Object fileUuid, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAttributeAttachment(
        client,
        fileUuid,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
