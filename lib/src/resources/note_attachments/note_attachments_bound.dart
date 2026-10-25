/// The v4 note attachments endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'note_attachments.dart' as endpoints;
import 'note_attachments_dto.dart' as views;

/// The note attachments endpoints with [client] already applied.
class NoteAttachmentsResource {
  /// Bind the resource to a client; normally reached via `client.noteAttachments`.
  const NoteAttachmentsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/note_attachment/{attachment_uuid}`
  Future<ApiResponse<views.NoteAttachment>> getNoteAttachment(
    Object attachmentUuid, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getNoteAttachment(
        client,
        attachmentUuid,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
