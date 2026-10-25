/// The v4 note attachments endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'note_attachments_dto.dart';
import 'note_attachments_urls.dart';

/// `GET /api/{api_version}/note_attachment/{attachment_uuid}`
///
/// Any note's attachment as base64, the `uuid` a note's `attachments` entry
/// carries, whatever the note is attached to.
Future<ApiResponse<NoteAttachment>> getNoteAttachment(
  ExsitedClient client,
  Object attachmentUuid, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(NoteAttachmentsUrls.noteAttachment,
        pathParams: {'attachment_uuid': attachmentUuid},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: NoteAttachment.fromMap);
