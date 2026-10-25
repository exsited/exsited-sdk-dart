/// Payments path templates and body keys; the client fills `{api_version}`.
library;

class PaymentsUrls {
  PaymentsUrls._();

  static const String payments = '/api/{api_version}/payments';
  static const String paymentsNotes = '/api/{api_version}/payments/notes';
  static const String payment = '/api/{api_version}/payments/{payment_id}';
  static const String invoicePayments =
      '/api/{api_version}/invoices/{invoice_id}/payments';
  static const String orderPayments =
      '/api/{api_version}/orders/{order_id}/payments';
  static const String paymentNotes =
      '/api/{api_version}/payments/{payment_id}/notes';
  static const String paymentNote =
      '/api/{api_version}/payments/{payment_id}/notes/{payment_note_id}';
  static const String paymentNoteFile =
      '/api/{api_version}/payments/{payment_id}/notes/{payment_note_id}/files/{payment_file_id}';
  static const String invoicePayment =
      '/api/{api_version}/invoices/{invoice_id}/payments/{payment_id}';
  static const String paymentNoteFiles =
      '/api/{api_version}/payments/{payment_id}/notes/{payment_note_id}/files';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String fileKey = 'file';
  static const String noteKey = 'note';
  static const String paymentKey = 'payment';
}
