/// Reconciliations path templates and body keys; the client fills `{api_version}`.
library;

class ReconciliationsUrls {
  ReconciliationsUrls._();

  static const String reconciliationSalePayments =
      '/api/{api_version}/reconciliations/{reconciliation_id}/sale_payments';
  static const String reconciliationSaleRefunds =
      '/api/{api_version}/reconciliations/{reconciliation_id}/sale_refunds';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';
}
