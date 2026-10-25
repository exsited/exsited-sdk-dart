/// Note attachments path templates and body keys; the client fills `{api_version}`.
library;

class NoteAttachmentsUrls {
  NoteAttachmentsUrls._();

  static const String noteAttachment =
      '/api/{api_version}/note_attachment/{attachment_uuid}';

  /// The envelopes one record arrives under, read off this family's views.
  static const String noteAttachmentKey = 'note_attachment';
}
