/// Reports path templates and body keys; the client fills `{api_version}`.
library;

class ReportsUrls {
  ReportsUrls._();

  static const String reportsAccountsAccountOverview =
      '/api/{api_version}/reports/accounts/account_overview';
  static const String reportsInvoicesInvoiceOverview =
      '/api/{api_version}/reports/invoices/invoice_overview';
  static const String reportsOrdersOrderOverview =
      '/api/{api_version}/reports/orders/order_overview';
  static const String reportsPurchaseInvoicesPurchaseInvoiceOverview =
      '/api/{api_version}/reports/purchase_invoices/purchase_invoice_overview';
  static const String reportsPurchaseOrdersPurchaseOrderOverview =
      '/api/{api_version}/reports/purchase_orders/purchase_order_overview';
  static const String
      reportsPurchaseTransactionsPurchasePaymentAndRefundOverview =
      '/api/{api_version}/reports/purchase_transactions/purchase_payment_and_refund_overview';
  static const String reportsTransactionsPaymentAndRefundOverview =
      '/api/{api_version}/reports/transactions/payment_and_refund_overview';

  /// The envelopes one record arrives under, read off this family's views.
  static const String reportKey = 'report';
}
