/// Purchase invoices path templates and body keys; the client fills `{api_version}`.
library;

class PurchaseInvoicesUrls {
  PurchaseInvoicesUrls._();

  static const String purchaseInvoices = '/api/{api_version}/purchase_invoices';
  static const String purchaseInvoicesNotes =
      '/api/{api_version}/purchase_invoices/notes';
  static const String purchaseInvoice =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}';
  static const String purchaseInvoiceAmend =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/amend';
  static const String purchaseInvoiceCancel =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/cancel';
  static const String purchaseInvoiceInformation =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/information';
  static const String purchaseInvoiceLines =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/lines';
  static const String purchaseInvoiceNotes =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes';
  static const String purchaseInvoicePdf =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/pdf';
  static const String purchaseInvoicePurchaseCreditNoteApplications =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_credit_note_applications';
  static const String purchaseInvoicePurchasePayments =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_payments';
  static const String purchaseInvoiceReactivate =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/reactivate';
  static const String purchaseInvoiceLine =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/lines/{purchase_invoice_line_uuid}';
  static const String purchaseInvoiceNote =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}';
  static const String purchaseInvoiceNoteFiles =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}/files';
  static const String purchaseInvoiceNoteFile =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}/files/{file_id}';
  static const String purchaseInvoicePurchaseCreditNoteApplication =
      '/api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_credit_note_applications/{application_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String fileKey = 'file';
  static const String noteKey = 'note';
  static const String purchaseCreditNoteApplicationKey =
      'purchase_credit_note_application';
  static const String purchaseInvoiceKey = 'purchase_invoice';
  static const String watcherListKey = 'watcherList';
}
