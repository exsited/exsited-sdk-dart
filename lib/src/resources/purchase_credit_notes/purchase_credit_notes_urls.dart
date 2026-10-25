/// Purchase credit notes path templates and body keys; the client fills `{api_version}`.
library;

class PurchaseCreditNotesUrls {
  PurchaseCreditNotesUrls._();

  static const String purchaseCreditNotes =
      '/api/{api_version}/purchase_credit_notes';
  static const String purchaseCreditNote =
      '/api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}';
  static const String purchaseCreditNoteApply =
      '/api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}/apply';
  static const String purchaseCreditNoteNotes =
      '/api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}/notes';
  static const String purchaseCreditNoteNote =
      '/api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}/notes/{note_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String noteKey = 'note';
  static const String purchaseCreditNoteKey = 'purchase_credit_note';
}
