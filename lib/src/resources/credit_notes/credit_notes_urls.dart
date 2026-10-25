/// Credit notes path templates and body keys; the client fills `{api_version}`.
library;

class CreditNotesUrls {
  CreditNotesUrls._();

  static const String creditNotes = '/api/{api_version}/credit_notes';
  static const String creditNote =
      '/api/{api_version}/credit_notes/{credit_note_id}';
  static const String creditNoteApply =
      '/api/{api_version}/credit_notes/{credit_note_id}/apply';
  static const String creditNoteItems =
      '/api/{api_version}/credit_notes/{credit_note_id}/items';
  static const String creditNoteCreditNoteApplications =
      '/api/{api_version}/credit_notes/{credit_note_id}/credit_note_applications';
  static const String creditNoteNotes =
      '/api/{api_version}/credit_notes/{credit_note_id}/notes';
  static const String creditNoteNote =
      '/api/{api_version}/credit_notes/{credit_note_id}/notes/{note_id}';
  static const String creditNoteNoteFiles =
      '/api/{api_version}/credit_notes/{credit_note_id}/notes/{note_id}/files';
  static const String creditNoteNoteFile =
      '/api/{api_version}/credit_notes/{credit_note_id}/notes/{note_id}/files/{file_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String creditNoteKey = 'credit_note';
  static const String fileKey = 'file';
  static const String noteKey = 'note';
}
