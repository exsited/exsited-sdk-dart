/// Purchase payments path templates and body keys; the client fills `{api_version}`.
library;

class PurchasePaymentsUrls {
  PurchasePaymentsUrls._();

  static const String purchasePayments = '/api/{api_version}/purchase_payments';
  static const String purchasePayment =
      '/api/{api_version}/purchase_payments/{purchase_payment_id}';
  static const String purchaseInvoicePurchasePayments =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_payments';
  static const String purchasePaymentNotes =
      '/api/{api_version}/purchase_payments/{purchase_payment_id}/notes';
  static const String purchasePaymentNote =
      '/api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}';
  static const String purchasePaymentNoteFiles =
      '/api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}/files';
  static const String purchasePaymentNoteFile =
      '/api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}/files/{file_id}';
  static const String purchasePaymentPurchaseCreditNotes =
      '/api/{api_version}/purchase_payments/{purchase_payment_id}/purchase_credit_notes';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String fileKey = 'file';
  static const String filesKey = 'files';
  static const String noteKey = 'note';
  static const String purchasePaymentKey = 'purchase_payment';
}
