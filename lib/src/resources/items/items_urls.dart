/// Items path templates and body keys; the client fills `{api_version}`.
/// `{item_id}` takes the item's `id` such as `"ITEM-0001"`, never the `uuid`;
/// `{warehouse_name}` is a name, the one slot in this family that is not an id.
library;

class ItemsUrls {
  ItemsUrls._();

  static const String items = '/api/{api_version}/items';
  static const String item = '/api/{api_version}/items/{item_id}';
  static const String itemInformation =
      '/api/{api_version}/items/{item_id}/information';

  /// The API answers both with HTTP 500.
  static const String itemDeactivate =
      '/api/{api_version}/items/{item_id}/deactivate';
  static const String itemReactivate =
      '/api/{api_version}/items/{item_id}/reactivate';

  static const String itemImage = '/api/{api_version}/items/{item_id}/image';

  /// Each of these three **reads** answers a stub rather than the whole item.
  static const String itemSale = '/api/{api_version}/items/{item_id}/sale';
  static const String itemPurchase =
      '/api/{api_version}/items/{item_id}/purchase';
  static const String itemInventories =
      '/api/{api_version}/items/{item_id}/inventories';

  /// The segment is `inventory`, singular; every other one is plural.
  static const String itemInventoryAdd =
      '/api/{api_version}/items/{item_id}/inventory/add';
  static const String itemInventoryAdjustments =
      '/api/{api_version}/items/{item_id}/inventory_adjustments';

  static const String itemWarehouseInventories =
      '/api/{api_version}/items/{item_id}/warehouses/{warehouse_name}/inventories';

  static const String itemBundleDetails =
      '/api/{api_version}/items/{item_id}/bundle_details';
  static const String itemVariations =
      '/api/{api_version}/items/{item_id}/variations';

  static const String itemFamilyDetails =
      '/api/{api_version}/items/{item_id}/family_details';

  static const String itemPackageDetails =
      '/api/{api_version}/items/{item_id}/package_details';
  static const String itemPackageDetail =
      '/api/{api_version}/items/{item_id}/package_details/{package_detail_id}';

  static const String itemNotes = '/api/{api_version}/items/{item_id}/notes';
  static const String itemNote =
      '/api/{api_version}/items/{item_id}/notes/{note_id}';
  static const String itemNoteFiles =
      '/api/{api_version}/items/{item_id}/notes/{note_id}/files';
  static const String itemNoteFile =
      '/api/{api_version}/items/{item_id}/notes/{note_id}/files/{file_id}';
  static const String itemInventory =
      '/api/{api_version}/items/{item_id}/inventory';
  static const String itemInventoriesAdd =
      '/api/{api_version}/items/{item_id}/inventories/add';
  static const String itemKpis = '/api/{api_version}/items/{item_id}/kpis';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String fileKey = 'file';
  static const String inventoryAdjustmentKey = 'inventory_adjustment';
  static const String itemKey = 'item';
  static const String itemKpisKey = 'item_kpis';
  static const String noteKey = 'note';

  /// The paging and sorting names the listing takes, and the `filter`
  /// expression for a nested field; a top-level filter is
  /// `filter_<field>[_<op>]` beside them, built with `itemFilterParam`.
  static const List<String> queryParams = <String>[
    'limit',
    'cursor',
    'order_by',
    'direction',
    'filter',
  ];

  /// Top-level item fields that `filter_<field>` accepts. Every one also takes
  /// `_neq`; the text ones additionally
  /// take `_contains` and `_not_contains`.
  static const Set<String> filterableFields = {
    'id',
    'uuid',
    'name',
    'display_name',
    'description',
    'status',
    'type',
    'origin',
    'invoice_note',
    'image_uri',
    'base_uom',
    'group',
    'manager',
    'custom_form',
    'created_by',
    'last_updated_by',
    'version',
  };

  /// Fields documented as `filter_<field>` that the API **rejects**
  /// with `400 "Filter syntax deprecated bracket"`.
  ///
  /// Each lives inside a nested block and is reachable through the `filter`
  /// expression instead.
  static const Set<String> deprecatedFilters = {
    'item_number',
    'upc_code',
    'sale_enabled',
    'sales_accounting_code_revenue',
    'sales_billing_mode',
    'sales_charge_type',
    'sales_currency',
    'sales_fulfillment_mode',
    'sales_payment_mode',
    'sales_pricing_method',
    'sales_tax_inclusive_based_on',
    'purchase_enabled',
    'purchase_currency',
    'purchase_order_note',
    'purchase_profile',
    'purchase_receive_mode',
    'inventory_enabled',
    'inventory_quantity_available',
    'inventory_quantity_on_hand',
    'inventory_qty_avl_on_sale_determination',
  };
}
