/// Item fulfillments path templates and body keys; the client fills `{api_version}`.
library;

class ItemFulfillmentsUrls {
  ItemFulfillmentsUrls._();

  static const String itemFulfillments = '/api/{api_version}/item_fulfillments';
  static const String itemFulfillment =
      '/api/{api_version}/item_fulfillments/{fulfillment_id}';
  static const String itemFulfillmentNotes =
      '/api/{api_version}/item_fulfillments/{fulfillment_id}/notes';
  static const String itemFulfillmentNote =
      '/api/{api_version}/item_fulfillments/{fulfillment_id}/notes/{note_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String invoiceKey = 'invoice';
  static const String itemFulfillmentKey = 'item_fulfillment';
  static const String noteKey = 'note';
}
