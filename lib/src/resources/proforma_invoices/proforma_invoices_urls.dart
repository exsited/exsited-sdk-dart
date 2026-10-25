/// Proforma invoices path templates and body keys; the client fills `{api_version}`.
library;

class ProformaInvoicesUrls {
  ProformaInvoicesUrls._();

  static const String proformaInvoices = '/api/{api_version}/proforma_invoices';
  static const String proformaInvoice =
      '/api/{api_version}/proforma_invoices/{proforma_id}';
  static const String proformaInvoicePayments =
      '/api/{api_version}/proforma_invoices/{proforma_id}/payments';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String paymentKey = 'payment';
  static const String proformaInvoiceKey = 'proforma_invoice';
}
