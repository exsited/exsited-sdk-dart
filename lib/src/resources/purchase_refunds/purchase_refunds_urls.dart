/// Purchase refunds path templates and body keys; the client fills `{api_version}`.
library;

class PurchaseRefundsUrls {
  PurchaseRefundsUrls._();

  static const String purchaseRefunds = '/api/{api_version}/purchase_refunds';
  static const String purchaseRefund =
      '/api/{api_version}/purchase_refunds/{purchase_refund_id}';
  static const String purchaseCreditNotePurchaseRefunds =
      '/api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}/purchase_refunds';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String purchaseRefundKey = 'purchase_refund';
}
