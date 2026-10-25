/// Orders path templates and body keys; the client fills `{api_version}`.
library;

class OrdersUrls {
  OrdersUrls._();

  static const String orders = '/api/{api_version}/orders';
  static const String order = '/api/{api_version}/orders/{order_id}';
  static const String orderActivate =
      '/api/{api_version}/orders/{order_id}/activate';
  static const String orderActivateDraft =
      '/api/{api_version}/orders/{order_id}/activate_draft';
  static const String orderBillingPreferences =
      '/api/{api_version}/orders/{order_id}/billing_preferences';
  static const String orderCancel =
      '/api/{api_version}/orders/{order_id}/cancel';
  static const String orderChange =
      '/api/{api_version}/orders/{order_id}/change';
  static const String orderConvertToOrder =
      '/api/{api_version}/orders/{order_id}/convert_to_order';
  static const String orderCustomObjects =
      '/api/{api_version}/orders/{order_id}/custom_objects';
  static const String orderCustomObjectsInstances =
      '/api/{api_version}/orders/{order_id}/custom_objects_instances';
  static const String orderDiscardDraft =
      '/api/{api_version}/orders/{order_id}/discard_draft';
  static const String orderExtendTrial =
      '/api/{api_version}/orders/{order_id}/extend_trial';
  static const String orderInformation =
      '/api/{api_version}/orders/{order_id}/information';
  static const String orderItemFulfillments =
      '/api/{api_version}/orders/{order_id}/item_fulfillments';
  static const String orderLines = '/api/{api_version}/orders/{order_id}/lines';
  static const String orderNotes = '/api/{api_version}/orders/{order_id}/notes';
  static const String orderPaymentMethods =
      '/api/{api_version}/orders/{order_id}/payment_methods';
  static const String orderPdf = '/api/{api_version}/orders/{order_id}/pdf';
  static const String orderReactivate =
      '/api/{api_version}/orders/{order_id}/reactivate';
  static const String orderRelinquish =
      '/api/{api_version}/orders/{order_id}/relinquish';
  static const String orderLine =
      '/api/{api_version}/orders/{order_id}/lines/{line_uuid}';
  static const String orderNote =
      '/api/{api_version}/orders/{order_id}/notes/{order_note_id}';
  static const String orderPaymentMethod =
      '/api/{api_version}/orders/{order_id}/payment_methods/{payment_method_ref}';
  static const String orderLineBillingPreferences =
      '/api/{api_version}/orders/{order_id}/lines/{line_uuid}/billing_preferences';
  static const String orderNoteFiles =
      '/api/{api_version}/orders/{order_id}/notes/{order_note_id}/files';
  static const String orderNoteFile =
      '/api/{api_version}/orders/{order_id}/notes/{order_note_id}/files/{order_file_id}';
  static const String ordersNotes = '/api/{api_version}/orders/notes';
  static const String ordersPreview = '/api/{api_version}/orders/preview';
  static const String ordersExpress = '/api/{api_version}/orders/express';
  static const String orderAccept =
      '/api/{api_version}/orders/{order_id}/accept';
  static const String orderActivateInvoiceFromDormant =
      '/api/{api_version}/orders/{order_id}/activate_invoice_from_dormant/{invoice_uuid}';
  static const String orderChangePreview =
      '/api/{api_version}/orders/{order_id}/change/preview';
  static const String orderChangeStatus =
      '/api/{api_version}/orders/{order_id}/change_status';
  static const String orderContractAdjustment =
      '/api/{api_version}/orders/{order_id}/contract_adjustment';
  static const String orderContractAdjustmentPreview =
      '/api/{api_version}/orders/{order_id}/contract_adjustment/preview';
  static const String orderDowngrade =
      '/api/{api_version}/orders/{order_id}/downgrade';
  static const String orderDowngradePreview =
      '/api/{api_version}/orders/{order_id}/downgrade/preview';
  static const String orderUpgrade =
      '/api/{api_version}/orders/{order_id}/upgrade';
  static const String orderUpgradePreview =
      '/api/{api_version}/orders/{order_id}/upgrade/preview';
  static const String orderTerminateTrial =
      '/api/{api_version}/orders/{order_id}/terminate_trial';
  static const String orderCustomObject =
      '/api/{api_version}/orders/{order_id}/custom_objects/{custom_object_id}';
  static const String orderCustomObjectInstance =
      '/api/{api_version}/orders/{order_id}/custom_objects/{custom_object_id}/instances/{instance_id}';
  static const String orderCustomObjectsInstance =
      '/api/{api_version}/orders/{order_id}/custom_objects_instances/{custom_object_id}';
  static const String orderCustomObjectsInstanceInstance =
      '/api/{api_version}/orders/{order_id}/custom_objects_instances/{custom_object_id}/instances/{instance_id}';
  static const String orderItemFulfillment =
      '/api/{api_version}/orders/{order_id}/item_fulfillments/{fulfillment_id}';
  static const String orderKpis = '/api/{api_version}/orders/{order_id}/kpis';
  static const String orderPayment =
      '/api/{api_version}/orders/{order_id}/payments/{payment_id}';
  static const String orderQuotePartialInvoices =
      '/api/{api_version}/orders/{order_id}/quote_partial_invoices';
  static const String orderShippingPdf =
      '/api/{api_version}/orders/{order_id}/shipping_pdf/{shipping_line_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String fileKey = 'file';
  static const String noteKey = 'note';
  static const String orderKey = 'order';
  static const String orderLineKey = 'order_line';
}
