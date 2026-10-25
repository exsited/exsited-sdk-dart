/// Credit note applications path templates and body keys; the client fills `{api_version}`.
library;

class CreditNoteApplicationsUrls {
  CreditNoteApplicationsUrls._();

  static const String creditNoteApplications =
      '/api/{api_version}/credit_note_applications';
  static const String creditNoteApplication =
      '/api/{api_version}/credit_note_applications/{credit_note_application_id}';
  static const String invoiceCreditNoteApplications =
      '/api/{api_version}/invoices/{invoice_id}/credit_note_applications';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String creditNoteApplicationKey = 'credit_note_application';
}
