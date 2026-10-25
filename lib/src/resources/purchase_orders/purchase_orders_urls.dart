/// Purchase orders path templates and body keys; the client fills `{api_version}`.
library;

class PurchaseOrdersUrls {
  PurchaseOrdersUrls._();

  static const String purchaseOrders = '/api/{api_version}/purchase_orders';
  static const String purchaseOrdersNotes =
      '/api/{api_version}/purchase_orders/notes';
  static const String purchaseOrder =
      '/api/{api_version}/purchase_orders/{purchase_order_id}';
  static const String purchaseOrderCancel =
      '/api/{api_version}/purchase_orders/{purchase_order_id}/cancel';
  static const String purchaseOrderChange =
      '/api/{api_version}/purchase_orders/{purchase_order_id}/change';
  static const String purchaseOrderInformation =
      '/api/{api_version}/purchase_orders/{purchase_order_id}/information';
  static const String purchaseOrderLines =
      '/api/{api_version}/purchase_orders/{purchase_order_id}/lines';
  static const String purchaseOrderNotes =
      '/api/{api_version}/purchase_orders/{purchase_order_id}/notes';
  static const String purchaseOrderPurchaseInvoices =
      '/api/{api_version}/purchase_orders/{purchase_order_id}/purchase_invoices';
  static const String purchaseOrderPurchasePayments =
      '/api/{api_version}/purchase_orders/{purchase_order_id}/purchase_payments';
  static const String purchaseOrderReactivate =
      '/api/{api_version}/purchase_orders/{purchase_order_id}/reactivate';
  static const String purchaseOrderLine =
      '/api/{api_version}/purchase_orders/{purchase_order_id}/lines/{purchase_order_line_uuid}';
  static const String purchaseOrderNote =
      '/api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}';
  static const String purchaseOrderNoteFiles =
      '/api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}/files';
  static const String purchaseOrderNoteFile =
      '/api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}/files/{purchase_order_file_id}';
  static const String purchaseOrderKpis =
      '/api/{api_version}/purchase_orders/{purchase_order_id}/kpis';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String fileKey = 'file';
  static const String noteKey = 'note';
  static const String purchaseInvoiceKey = 'purchase_invoice';
  static const String purchaseOrderKey = 'purchase_order';
  static const String purchaseOrderKpisKey = 'purchase_order_kpis';
  static const String purchaseOrderLineKey = 'purchase_order_line';
}
