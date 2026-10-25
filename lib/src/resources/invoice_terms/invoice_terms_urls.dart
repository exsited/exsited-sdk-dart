/// Invoice terms path templates and body keys; the client fills `{api_version}`.
library;

class InvoiceTermsUrls {
  InvoiceTermsUrls._();

  static const String settingsInvoiceTerms =
      '/api/{api_version}/settings/invoice_terms';
  static const String settingsInvoiceTerm =
      '/api/{api_version}/settings/invoice_terms/{invoice_term_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String invoiceTermKey = 'invoice_term';
}
