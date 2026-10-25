/// Quote orders path templates and body keys; the client fills `{api_version}`.
library;

class QuoteOrdersUrls {
  QuoteOrdersUrls._();

  static const String quoteOrderInvoices =
      '/api/{api_version}/quote_orders/{quote_order_id}/invoices';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';
}
