/// The v4 attribute attachments endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'attribute_attachments_urls.dart';

/// `GET /api/{api_version}/attribute_attachment/{file_uuid}`
///
/// A custom attribute's file as base64, the uuid an account's file attribute
/// links to; answered as `{"base64":...}` with no envelope.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getAttributeAttachment(
  ExsitedClient client,
  Object fileUuid, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AttributeAttachmentsUrls.attributeAttachment,
        pathParams: {'file_uuid': fileUuid},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
