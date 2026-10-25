/// Inventory adjustments path templates and body keys; the client fills `{api_version}`.
library;

class InventoryAdjustmentsUrls {
  InventoryAdjustmentsUrls._();

  static const String inventoryAdjustments =
      '/api/{api_version}/inventory_adjustments';
  static const String inventoryAdjustment =
      '/api/{api_version}/inventory_adjustments/{inventory_adjustment_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String inventoryAdjustmentKey = 'inventory_adjustment';
}
