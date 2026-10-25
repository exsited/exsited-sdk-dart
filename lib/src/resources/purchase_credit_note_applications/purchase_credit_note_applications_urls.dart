/// Purchase credit note applications path templates and body keys; the client fills `{api_version}`.
library;

class PurchaseCreditNoteApplicationsUrls {
  PurchaseCreditNoteApplicationsUrls._();

  static const String purchaseCreditNoteApplications =
      '/api/{api_version}/purchase_credit_note_applications';
  static const String purchaseCreditNoteApplication =
      '/api/{api_version}/purchase_credit_note_applications/{purchase_credit_note_application_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String purchaseCreditNoteApplicationKey =
      'purchase_credit_note_application';
}
