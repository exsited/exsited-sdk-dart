/// Item receipts path templates and body keys; the client fills `{api_version}`.
library;

class ItemReceiptsUrls {
  ItemReceiptsUrls._();

  static const String itemReceipts = '/api/{api_version}/item_receipts';
  static const String itemReceipt =
      '/api/{api_version}/item_receipts/{item_receipt_id}';
  static const String purchaseOrderItemReceipts =
      '/api/{api_version}/purchase_orders/{purchase_order_id}/item_receipts';
  static const String itemReceiptNote =
      '/api/{api_version}/item_receipts/{item_receipt_id}/notes/{note_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String itemReceiptHyphenatedKey = 'item-receipt';
  static const String itemReceiptKey = 'item_receipt';
  static const String purchaseOrderKey = 'purchase_order';
}
