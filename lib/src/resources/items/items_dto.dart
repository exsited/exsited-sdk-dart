/// Typed views over the v4 item bodies.
///
/// The sale, purchase and inventories reads answer a stub under `item`, not the
/// item: the sale and purchase stubs carry an integer `id`, not the String item id
/// every path takes, so each read has its own view.
/// `quantity_on_hand` is an `int` inside `inventories.warehouses[]` and a
/// `String` on an [InventoryAdjustment]; neither is coerced.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

// Re-exported so a caller importing this family gets the shared types too.
export '../common/common_dto.dart'
    show Pagination, PaginationLinks, Reference, User;

/// The custom form an item was created under. Present on every item.
class CustomForm extends Dto {
  const CustomForm({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static CustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomForm(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'href': href,
      };
}

/// One entry of `codes`: a named code slot.
class ItemCode extends Dto {
  const ItemCode({
    this.name,
    this.value,
  });

  static ItemCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemCode(
      name: readText(source['name']),
      value: readText(source['value']),
    );
  }

  final String? name;

  final String? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'value': value,
      };
}

/// One entry of `currencies`; all four flags are always present and always
/// booleans.
class ItemCurrency extends Dto {
  const ItemCurrency({
    this.name,
    this.usedForSale,
    this.defaultForSale,
    this.usedForPurchase,
    this.defaultForPurchase,
    this.suppliers,
  });

  static ItemCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemCurrency(
      name: readText(source['name']),
      usedForSale: readFlag(source['used_for_sale']),
      defaultForSale: readFlag(source['default_for_sale']),
      usedForPurchase: readFlag(source['used_for_purchase']),
      defaultForPurchase: readFlag(source['default_for_purchase']),
      suppliers: readList<Object>(source['suppliers'], readAny),
    );
  }

  final String? name;

  final bool? usedForSale;

  final bool? defaultForSale;

  final bool? usedForPurchase;

  final bool? defaultForPurchase;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? suppliers;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'used_for_sale': usedForSale,
        'default_for_sale': defaultForSale,
        'used_for_purchase': usedForPurchase,
        'default_for_purchase': defaultForPurchase,
        'suppliers': suppliers,
      };
}

/// One component of a bundle.
class BundleDetail extends Dto {
  const BundleDetail({
    this.id,
    this.name,
    this.quantity,
    this.uom,
  });

  static BundleDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BundleDetail(
      id: readText(source['id']),
      name: readText(source['name']),
      quantity: readDecimal(source['quantity']),
      uom: readText(source['uom']),
    );
  }

  final String? id;

  final String? name;

  final double? quantity;

  final String? uom;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'quantity': quantity,
        'uom': uom,
      };
}

/// One member of an item family: the id and name only,
/// with no `object` and no `href`.
class FamilyDetail extends Dto {
  const FamilyDetail({
    this.itemId,
    this.itemName,
  });

  static FamilyDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return FamilyDetail(
      itemId: readText(source['item_id']),
      itemName: readText(source['item_name']),
    );
  }

  final String? itemId;

  final String? itemName;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'item_id': itemId,
        'item_name': itemName,
      };
}

/// One variation axis, in `configure_variations` or `use_variations`.
class VariationOption extends Dto {
  const VariationOption({
    this.object,
    this.id,
    this.name,
    this.href,
    this.values,
  });

  static VariationOption? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return VariationOption(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      href: readText(source['href']),
      values: readList<VariationOptionValue>(
          source['values'], VariationOptionValue.fromMap),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? href;

  final List<VariationOptionValue?>? values;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'href': href,
        'values': values,
      };
}

/// One package on an item.
class PackageDetail extends Dto {
  const PackageDetail({
    this.object,
    this.id,
    this.uuid,
    this.name,
    this.displayName,
    this.status,
    this.rank,
    this.items,
    this.billingPeriods,
    this.customAttributes,
    this.createdOn,
    this.createdBy,
    this.lastUpdatedOn,
    this.lastUpdatedBy,
  });

  static PackageDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PackageDetail(
      object: readText(source['object']),
      id: readText(source['id']),
      uuid: readText(source['uuid']),
      name: readText(source['name']),
      displayName: readText(source['display_name']),
      status: readText(source['status']),
      rank: readInteger(source['rank']),
      items: readList<PackageDetailItem>(
          source['items'], PackageDetailItem.fromMap),
      billingPeriods: readList<PackageDetailBillingPeriod>(
          source['billing_periods'], PackageDetailBillingPeriod.fromMap),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      createdOn: readText(source['created_on']),
      createdBy: User.fromMap(source['created_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      lastUpdatedBy: readAny(source['last_updated_by']),
    );
  }

  final String? object;

  final String? id;

  final String? uuid;

  final String? name;

  final String? displayName;

  final String? status;

  final int? rank;

  final List<PackageDetailItem?>? items;

  final List<PackageDetailBillingPeriod?>? billingPeriods;

  final List<Object?>? customAttributes;

  final String? createdOn;

  final User? createdBy;

  final Object? lastUpdatedOn;

  final Object? lastUpdatedBy;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'uuid': uuid,
        'name': name,
        'display_name': displayName,
        'status': status,
        'rank': rank,
        'items': items,
        'billing_periods': billingPeriods,
        'custom_attributes': customAttributes,
        'created_on': createdOn,
        'created_by': createdBy,
        'last_updated_on': lastUpdatedOn,
        'last_updated_by': lastUpdatedBy,
      };
}

/// Whether a price is entered inclusive of tax.
class TaxConfiguration extends Dto {
  const TaxConfiguration({
    this.salePriceEnteredInclusiveOfTax,
    this.purchasePriceEnteredInclusiveOfTax,
    this.salePriceBasedOn,
    this.taxCode,
  });

  static TaxConfiguration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaxConfiguration(
      salePriceEnteredInclusiveOfTax:
          readFlag(source['sale_price_entered_inclusive_of_tax']),
      purchasePriceEnteredInclusiveOfTax:
          readFlag(source['purchase_price_entered_inclusive_of_tax']),
      salePriceBasedOn: readText(source['sale_price_based_on']),
      taxCode: TaxConfigurationTaxCode.fromMap(source['tax_code']),
    );
  }

  final bool? salePriceEnteredInclusiveOfTax;

  final bool? purchasePriceEnteredInclusiveOfTax;

  final String? salePriceBasedOn;

  final TaxConfigurationTaxCode? taxCode;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'sale_price_entered_inclusive_of_tax': salePriceEnteredInclusiveOfTax,
        'purchase_price_entered_inclusive_of_tax':
            purchasePriceEnteredInclusiveOfTax,
        'sale_price_based_on': salePriceBasedOn,
        'tax_code': taxCode,
      };
}

/// The pricing block on a sale or purchase.
class Pricing extends Dto {
  const Pricing({
    this.type,
    this.version,
    this.latestUsedPricingVersion,
    this.pricingModule,
  });

  static Pricing? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return Pricing(
      type: readText(source['type']),
      version: readInteger(source['version']),
      latestUsedPricingVersion:
          readInteger(source['latest_used_pricing_version']),
      pricingModule: readList<PricingPricingModule>(
          source['pricing_module'], PricingPricingModule.fromMap),
    );
  }

  final String? type;

  final int? version;

  final int? latestUsedPricingVersion;

  final List<PricingPricingModule?>? pricingModule;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'type': type,
        'version': version,
        'latest_used_pricing_version': latestUsedPricingVersion,
        'pricing_module': pricingModule,
      };
}

/// The charge block on a sale.
class SaleCharge extends Dto {
  const SaleCharge({
    this.type,
    this.pricePeriod,
    this.properties,
  });

  static SaleCharge? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SaleCharge(
      type: readText(source['type']),
      pricePeriod: readText(source['price_period']),
      properties: readList<SaleChargeProperty>(
          source['properties'], SaleChargeProperty.fromMap),
    );
  }

  final String? type;

  final String? pricePeriod;

  final List<SaleChargeProperty?>? properties;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'type': type,
        'price_period': pricePeriod,
        'properties': properties,
      };
}

/// An item's sale configuration.
class ItemSale extends Dto {
  const ItemSale({
    this.enabled,
    this.enableBackOrder,
    this.invoiceNote,
    this.defaultSalePrice,
    this.pricingMethod,
    this.salePriceVariant,
    this.useOnSalePrice,
    this.taxExemptWhenSold,
    this.taxConfiguration,
    this.charge,
    this.pricing,
    this.pricingLevels,
    this.pricingSchedules,
    this.paymentProperties,
    this.accountingCode,
    this.discountProfile,
    this.pricingProfile,
    this.shippingProfile,
    this.salePrice,
    this.startDate,
    this.endDate,
    this.width,
    this.height,
    this.length,
    this.weight,
  });

  static ItemSale? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemSale(
      enabled: readFlag(source['enabled']),
      enableBackOrder: readFlag(source['enable_back_order']),
      invoiceNote: readText(source['invoice_note']),
      defaultSalePrice: readDecimal(source['default_sale_price']),
      pricingMethod: readText(source['pricing_method']),
      salePriceVariant: readText(source['sale_price_variant']),
      useOnSalePrice: readFlag(source['use_on_sale_price']),
      taxExemptWhenSold: readFlag(source['tax_exempt_when_sold']),
      taxConfiguration: TaxConfiguration.fromMap(source['tax_configuration']),
      charge: SaleCharge.fromMap(source['charge']),
      pricing: Pricing.fromMap(source['pricing']),
      pricingLevels: readList<ItemSalePricingLevel>(
          source['pricing_levels'], ItemSalePricingLevel.fromMap),
      pricingSchedules: readList<Object>(source['pricing_schedules'], readAny),
      paymentProperties: readList<ItemSalePaymentProperty>(
          source['payment_properties'], ItemSalePaymentProperty.fromMap),
      accountingCode: readAny(source['accounting_code']),
      discountProfile: readAny(source['discount_profile']),
      pricingProfile: readAny(source['pricing_profile']),
      shippingProfile: readAny(source['shipping_profile']),
      salePrice: readAny(source['sale_price']),
      startDate: readAny(source['start_date']),
      endDate: readAny(source['end_date']),
      width: ItemSaleWidth.fromMap(source['width']),
      height: ItemSaleHeight.fromMap(source['height']),
      length: ItemSaleLength.fromMap(source['length']),
      weight: ItemSaleWeight.fromMap(source['weight']),
    );
  }

  final bool? enabled;

  final bool? enableBackOrder;

  final String? invoiceNote;

  final double? defaultSalePrice;

  final String? pricingMethod;

  final String? salePriceVariant;

  final bool? useOnSalePrice;

  final bool? taxExemptWhenSold;

  final TaxConfiguration? taxConfiguration;

  final SaleCharge? charge;

  final Pricing? pricing;

  final List<ItemSalePricingLevel?>? pricingLevels;

  final List<Object?>? pricingSchedules;

  final List<ItemSalePaymentProperty?>? paymentProperties;

  final Object? accountingCode;

  final Object? discountProfile;

  final Object? pricingProfile;

  final Object? shippingProfile;

  final Object? salePrice;

  final Object? startDate;

  final Object? endDate;

  final ItemSaleWidth? width;

  final ItemSaleHeight? height;

  final ItemSaleLength? length;

  final ItemSaleWeight? weight;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'enabled': enabled,
        'enable_back_order': enableBackOrder,
        'invoice_note': invoiceNote,
        'default_sale_price': defaultSalePrice,
        'pricing_method': pricingMethod,
        'sale_price_variant': salePriceVariant,
        'use_on_sale_price': useOnSalePrice,
        'tax_exempt_when_sold': taxExemptWhenSold,
        'tax_configuration': taxConfiguration,
        'charge': charge,
        'pricing': pricing,
        'pricing_levels': pricingLevels,
        'pricing_schedules': pricingSchedules,
        'payment_properties': paymentProperties,
        'accounting_code': accountingCode,
        'discount_profile': discountProfile,
        'pricing_profile': pricingProfile,
        'shipping_profile': shippingProfile,
        'sale_price': salePrice,
        'start_date': startDate,
        'end_date': endDate,
        'width': width,
        'height': height,
        'length': length,
        'weight': weight,
      };
}

/// An item's purchase configuration.
class ItemPurchase extends Dto {
  const ItemPurchase({
    this.enabled,
    this.supplierManagementEnabled,
    this.purchaseOrderNote,
    this.defaultPurchasePrice,
    this.taxExemptWhenPurchase,
    this.taxConfiguration,
    this.pricing,
    this.purchaseProperties,
    this.accountingCode,
    this.pricingProfile,
    this.suppliers,
  });

  static ItemPurchase? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemPurchase(
      enabled: readFlag(source['enabled']),
      supplierManagementEnabled:
          readFlag(source['supplier_management_enabled']),
      purchaseOrderNote: readText(source['purchase_order_note']),
      defaultPurchasePrice: readDecimal(source['default_purchase_price']),
      taxExemptWhenPurchase: readFlag(source['tax_exempt_when_purchase']),
      taxConfiguration: TaxConfiguration.fromMap(source['tax_configuration']),
      pricing: Pricing.fromMap(source['pricing']),
      purchaseProperties: readList<ItemPurchasePurchaseProperty>(
          source['purchase_properties'], ItemPurchasePurchaseProperty.fromMap),
      accountingCode: readAny(source['accounting_code']),
      pricingProfile: readAny(source['pricing_profile']),
      suppliers: readList<ItemPurchaseSupplier>(
          source['suppliers'], ItemPurchaseSupplier.fromMap),
    );
  }

  final bool? enabled;

  final bool? supplierManagementEnabled;

  final String? purchaseOrderNote;

  final double? defaultPurchasePrice;

  final bool? taxExemptWhenPurchase;

  final TaxConfiguration? taxConfiguration;

  final Pricing? pricing;

  final List<ItemPurchasePurchaseProperty?>? purchaseProperties;

  final Object? accountingCode;

  final Object? pricingProfile;

  final List<ItemPurchaseSupplier?>? suppliers;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'enabled': enabled,
        'supplier_management_enabled': supplierManagementEnabled,
        'purchase_order_note': purchaseOrderNote,
        'default_purchase_price': defaultPurchasePrice,
        'tax_exempt_when_purchase': taxExemptWhenPurchase,
        'tax_configuration': taxConfiguration,
        'pricing': pricing,
        'purchase_properties': purchaseProperties,
        'accounting_code': accountingCode,
        'pricing_profile': pricingProfile,
        'suppliers': suppliers,
      };
}

/// The inventory settings block.
class InventoryProperties extends Dto {
  const InventoryProperties({
    this.enabled,
    this.enableBatchTracking,
    this.enableSerialization,
    this.enableInventoryCosting,
    this.enableLowStockNotification,
    this.enablePreorder,
    this.enableReordering,
    this.lowStockThresholdBasedOn,
    this.reorderingThresholdBasedOn,
    this.quantityAvailableForSale,
    this.quantityAvailableForSaleDetermination,
    this.useAtpValueAsQuantityAvailableForWebhook,
    this.defaultCostPerUnit,
    this.preorderPeriod,
    this.preorderConfiguration,
  });

  static InventoryProperties? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InventoryProperties(
      enabled: readFlag(source['enabled']),
      enableBatchTracking: readFlag(source['enable_batch_tracking']),
      enableSerialization: readFlag(source['enable_serialization']),
      enableInventoryCosting: readFlag(source['enable_inventory_costing']),
      enableLowStockNotification:
          readFlag(source['enable_low_stock_notification']),
      enablePreorder: readFlag(source['enable_preorder']),
      enableReordering: readFlag(source['enable_reordering']),
      lowStockThresholdBasedOn:
          readText(source['low_stock_threshold_based_on']),
      reorderingThresholdBasedOn:
          readText(source['reordering_threshold_based_on']),
      quantityAvailableForSale: readText(source['quantity_available_for_sale']),
      quantityAvailableForSaleDetermination: readList<Object>(
          source['quantity_available_for_sale_determination'], readAny),
      useAtpValueAsQuantityAvailableForWebhook:
          readFlag(source['use_atp_value_as_quantity_available_for_webhook']),
      defaultCostPerUnit: readAny(source['default_cost_per_unit']),
      preorderPeriod: readText(source['preorder_period']),
      preorderConfiguration: readList<InventoryPropertiesPreorderConfiguration>(
          source['preorder_configuration'],
          InventoryPropertiesPreorderConfiguration.fromMap),
    );
  }

  final bool? enabled;

  final bool? enableBatchTracking;

  final bool? enableSerialization;

  final bool? enableInventoryCosting;

  final bool? enableLowStockNotification;

  final bool? enablePreorder;

  final bool? enableReordering;

  final String? lowStockThresholdBasedOn;

  final String? reorderingThresholdBasedOn;

  final String? quantityAvailableForSale;

  final List<Object?>? quantityAvailableForSaleDetermination;

  final bool? useAtpValueAsQuantityAvailableForWebhook;

  final Object? defaultCostPerUnit;

  final String? preorderPeriod;

  final List<InventoryPropertiesPreorderConfiguration?>? preorderConfiguration;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'enabled': enabled,
        'enable_batch_tracking': enableBatchTracking,
        'enable_serialization': enableSerialization,
        'enable_inventory_costing': enableInventoryCosting,
        'enable_low_stock_notification': enableLowStockNotification,
        'enable_preorder': enablePreorder,
        'enable_reordering': enableReordering,
        'low_stock_threshold_based_on': lowStockThresholdBasedOn,
        'reordering_threshold_based_on': reorderingThresholdBasedOn,
        'quantity_available_for_sale': quantityAvailableForSale,
        'quantity_available_for_sale_determination':
            quantityAvailableForSaleDetermination,
        'use_atp_value_as_quantity_available_for_webhook':
            useAtpValueAsQuantityAvailableForWebhook,
        'default_cost_per_unit': defaultCostPerUnit,
        'preorder_period': preorderPeriod,
        'preorder_configuration': preorderConfiguration,
      };
}

/// One warehouse's stock line.
class WarehouseInventory extends Dto {
  const WarehouseInventory({
    this.quantityOnHand,
    this.quantityOnHandValue,
    this.quantityAvailable,
    this.quantityAvailableValue,
    this.quantityOnOrder,
    this.quantityPromised,
    this.quantityOnReturn,
    this.quantityOnPurchaseReturn,
    this.warehouse,
    this.uom,
  });

  static WarehouseInventory? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return WarehouseInventory(
      quantityOnHand: readInteger(source['quantity_on_hand']),
      quantityOnHandValue: readText(source['quantity_on_hand_value']),
      quantityAvailable: readDecimal(source['quantity_available']),
      quantityAvailableValue: readText(source['quantity_available_value']),
      quantityOnOrder: readInteger(source['quantity_on_order']),
      quantityPromised: readDecimal(source['quantity_promised']),
      quantityOnReturn: readInteger(source['quantity_on_return']),
      quantityOnPurchaseReturn:
          readInteger(source['quantity_on_purchase_return']),
      warehouse: WarehouseInventoryWarehouse.fromMap(source['warehouse']),
      uom: readText(source['uom']),
    );
  }

  final int? quantityOnHand;

  final String? quantityOnHandValue;

  final double? quantityAvailable;

  final String? quantityAvailableValue;

  final int? quantityOnOrder;

  final double? quantityPromised;

  final int? quantityOnReturn;

  final int? quantityOnPurchaseReturn;

  final WarehouseInventoryWarehouse? warehouse;

  final String? uom;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'quantity_on_hand': quantityOnHand,
        'quantity_on_hand_value': quantityOnHandValue,
        'quantity_available': quantityAvailable,
        'quantity_available_value': quantityAvailableValue,
        'quantity_on_order': quantityOnOrder,
        'quantity_promised': quantityPromised,
        'quantity_on_return': quantityOnReturn,
        'quantity_on_purchase_return': quantityOnPurchaseReturn,
        'warehouse': warehouse,
        'uom': uom,
      };
}

/// An item's inventory block.
class ItemInventories extends Dto {
  const ItemInventories({
    this.enabled,
    this.enableWarehouseManagement,
    this.defaultWarehouse,
    this.inventoryProperties,
    this.warehouses,
  });

  static ItemInventories? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemInventories(
      enabled: readFlag(source['enabled']),
      enableWarehouseManagement:
          readFlag(source['enable_warehouse_management']),
      defaultWarehouse: readText(source['default_warehouse']),
      inventoryProperties:
          InventoryProperties.fromMap(source['inventory_properties']),
      warehouses: readList<WarehouseInventory>(
          source['warehouses'], WarehouseInventory.fromMap),
    );
  }

  final bool? enabled;

  final bool? enableWarehouseManagement;

  final String? defaultWarehouse;

  final InventoryProperties? inventoryProperties;

  final List<WarehouseInventory?>? warehouses;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'enabled': enabled,
        'enable_warehouse_management': enableWarehouseManagement,
        'default_warehouse': defaultWarehouse,
        'inventory_properties': inventoryProperties,
        'warehouses': warehouses,
      };
}

/// One file on a note.
class NoteAttachment extends Dto {
  const NoteAttachment({
    this.object,
    this.id,
    this.name,
    this.href,
    this.uuid,
    this.filename,
    this.contentType,
    this.size,
  });

  static NoteAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return NoteAttachment(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      href: readText(source['href']),
      uuid: readText(source['uuid']),
      filename: readText(source['filename']),
      contentType: readText(source['content_type']),
      size: readInteger(source['size']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? href;

  final String? uuid;

  final String? filename;

  final String? contentType;

  final int? size;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'href': href,
        'uuid': uuid,
        'filename': filename,
        'content_type': contentType,
        'size': size,
      };
}

/// One note on an item.
class Note extends Dto {
  const Note({
    this.object,
    this.id,
    this.content,
    this.version,
    this.href,
    this.createdOn,
    this.createdBy,
    this.item,
    this.attachments,
    this.watchers,
    this.group,
    this.user,
    this.lastUpdatedOn,
    this.lastUpdatedBy,
  });

  static Note? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return Note(
      object: readText(source['object']),
      id: readText(source['id']),
      content: readText(source['content']),
      version: readInteger(source['version']),
      href: readText(source['href']),
      createdOn: readText(source['created_on']),
      createdBy: User.fromMap(source['created_by']),
      item: Reference.fromMap(source['item']),
      attachments: readList<NoteAttachment>(
          source['attachments'], NoteAttachment.fromMap),
      watchers: readList<NoteWatcher>(source['watchers'], NoteWatcher.fromMap),
      group: readAny(source['group']),
      user: readAny(source['user']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lastUpdatedBy: NoteLastUpdatedBy.fromMap(source['last_updated_by']),
    );
  }

  final String? object;

  final String? id;

  final String? content;

  final int? version;

  final String? href;

  final String? createdOn;

  final User? createdBy;

  final Reference? item;

  final List<NoteAttachment?>? attachments;

  final List<NoteWatcher?>? watchers;

  final Object? group;

  final Object? user;

  final String? lastUpdatedOn;

  final NoteLastUpdatedBy? lastUpdatedBy;

  @override
  String? get envelopeKey => 'note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'content': content,
        'version': version,
        'href': href,
        'created_on': createdOn,
        'created_by': createdBy,
        'item': item,
        'attachments': attachments,
        'watchers': watchers,
        'group': group,
        'user': user,
        'last_updated_on': lastUpdatedOn,
        'last_updated_by': lastUpdatedBy,
      };
}

/// One item, as `getItem` and the listing return it.
class Item extends Dto {
  const Item({
    this.object,
    this.id,
    this.name,
    this.displayName,
    this.description,
    this.type,
    this.status,
    this.origin,
    this.invoiceNote,
    this.version,
    this.href,
    this.saleEnabled,
    this.purchaseEnabled,
    this.inventoryEnabled,
    this.variationsEnabled,
    this.parent,
    this.child,
    this.parentItemId,
    this.customForm,
    this.manager,
    this.group,
    this.createdOn,
    this.createdBy,
    this.lastUpdatedOn,
    this.lastUpdatedBy,
    this.codes,
    this.currencies,
    this.sale,
    this.purchase,
    this.inventories,
    this.bundleDetails,
    this.familyDetails,
    this.packageDetails,
    this.configureVariations,
    this.useVariations,
    this.customObjects,
    this.uoms,
    this.customAttributes,
    this.activityLogs,
    this.baseUom,
    this.imageUrl,
  });

  static Item? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item');
    if (source == null) return null;
    return Item(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      displayName: readText(source['display_name']),
      description: readText(source['description']),
      type: readText(source['type']),
      status: readText(source['status']),
      origin: readText(source['origin']),
      invoiceNote: readText(source['invoice_note']),
      version: readInteger(source['version']),
      href: readText(source['href']),
      saleEnabled: readFlag(source['sale_enabled']),
      purchaseEnabled: readFlag(source['purchase_enabled']),
      inventoryEnabled: readFlag(source['inventory_enabled']),
      variationsEnabled: readFlag(source['variations_enabled']),
      parent: readFlag(source['parent']),
      child: readFlag(source['child']),
      parentItemId: readText(source['parent_item_id']),
      customForm: CustomForm.fromMap(source['custom_form']),
      manager: Reference.fromMap(source['manager']),
      group: Reference.fromMap(source['group']),
      createdOn: readText(source['created_on']),
      createdBy: User.fromMap(source['created_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lastUpdatedBy: User.fromMap(source['last_updated_by']),
      codes: readList<ItemCode>(source['codes'], ItemCode.fromMap),
      currencies:
          readList<ItemCurrency>(source['currencies'], ItemCurrency.fromMap),
      sale: ItemSale.fromMap(source['sale']),
      purchase: ItemPurchase.fromMap(source['purchase']),
      inventories: ItemInventories.fromMap(source['inventories']),
      bundleDetails: readList<BundleDetail>(
          source['bundle_details'], BundleDetail.fromMap),
      familyDetails: readList<FamilyDetail>(
          source['family_details'], FamilyDetail.fromMap),
      packageDetails: readList<PackageDetail>(
          source['package_details'], PackageDetail.fromMap),
      configureVariations: readList<VariationOption>(
          source['configure_variations'], VariationOption.fromMap),
      useVariations: readList<VariationOption>(
          source['use_variations'], VariationOption.fromMap),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      uoms: readList<Object>(source['uoms'], readAny),
      customAttributes: readList<ItemCustomAttribute>(
          source['custom_attributes'], ItemCustomAttribute.fromMap),
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      baseUom: readAny(source['base_uom']),
      imageUrl: readAny(source['image_url']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? displayName;

  final String? description;

  final String? type;

  final String? status;

  final String? origin;

  final String? invoiceNote;

  final int? version;

  final String? href;

  final bool? saleEnabled;

  final bool? purchaseEnabled;

  final bool? inventoryEnabled;

  final bool? variationsEnabled;

  /// The **read** spelling. Written as `is_parent` / `is_child`.
  final bool? parent;

  final bool? child;

  final String? parentItemId;

  final CustomForm? customForm;

  final Reference? manager;

  /// Nearly always null.
  final Reference? group;

  final String? createdOn;

  final User? createdBy;

  /// Both null on an item never edited.
  final String? lastUpdatedOn;

  final User? lastUpdatedBy;

  final List<ItemCode?>? codes;

  final List<ItemCurrency?>? currencies;

  final ItemSale? sale;

  final ItemPurchase? purchase;

  final ItemInventories? inventories;

  final List<BundleDetail?>? bundleDetails;

  final List<FamilyDetail?>? familyDetails;

  final List<PackageDetail?>? packageDetails;

  final List<VariationOption?>? configureVariations;

  final List<VariationOption?>? useVariations;

  final List<Object?>? customObjects;

  /// Present but empty on every record measured, so the element
  /// type is unknown.
  final List<Object?>? uoms;

  final List<ItemCustomAttribute?>? customAttributes;

  final List<Object?>? activityLogs;

  /// Null on every record measured.
  final Object? baseUom;

  /// Null on every record measured. Use the image endpoint.
  final Object? imageUrl;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'display_name': displayName,
        'description': description,
        'type': type,
        'status': status,
        'origin': origin,
        'invoice_note': invoiceNote,
        'version': version,
        'href': href,
        'sale_enabled': saleEnabled,
        'purchase_enabled': purchaseEnabled,
        'inventory_enabled': inventoryEnabled,
        'variations_enabled': variationsEnabled,
        'parent': parent,
        'child': child,
        'parent_item_id': parentItemId,
        'custom_form': customForm,
        'manager': manager,
        'group': group,
        'created_on': createdOn,
        'created_by': createdBy,
        'last_updated_on': lastUpdatedOn,
        'last_updated_by': lastUpdatedBy,
        'codes': codes,
        'currencies': currencies,
        'sale': sale,
        'purchase': purchase,
        'inventories': inventories,
        'bundle_details': bundleDetails,
        'family_details': familyDetails,
        'package_details': packageDetails,
        'configure_variations': configureVariations,
        'use_variations': useVariations,
        'custom_objects': customObjects,
        'uoms': uoms,
        'custom_attributes': customAttributes,
        'activity_logs': activityLogs,
        'base_uom': baseUom,
        'image_url': imageUrl,
      };
}

/// The listing envelope. Items page by **cursor**, like accounts: every
/// pagination block carries `has_more`, `limit`, `links`, `next_cursor` and
/// `prev_cursor`. There is no offset shape here.
class ItemList extends Dto {
  const ItemList({
    this.object,
    this.url,
    this.data,
    this.pagination,
  });

  static ItemList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<Item>(source['data'], Item.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<Item?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

/// What `getItemSale` answers: a **stub**, not the item.
class ItemSaleView extends Dto {
  const ItemSaleView({
    this.id,
    this.name,
    this.sale,
  });

  static ItemSaleView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item');
    if (source == null) return null;
    return ItemSaleView(
      id: readInteger(source['id']),
      name: readText(source['name']),
      sale: ItemSale.fromMap(source['sale']),
    );
  }

  final int? id;

  final String? name;

  final ItemSale? sale;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'sale': sale,
      };
}

/// `{item: {id, name, purchase}}`, `id` an int.
class ItemPurchaseView extends Dto {
  const ItemPurchaseView({
    this.id,
    this.name,
    this.purchase,
  });

  static ItemPurchaseView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item');
    if (source == null) return null;
    return ItemPurchaseView(
      id: readInteger(source['id']),
      name: readText(source['name']),
      purchase: ItemPurchase.fromMap(source['purchase']),
    );
  }

  final int? id;

  final String? name;

  final ItemPurchase? purchase;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'purchase': purchase,
      };
}

/// `{item: {id, name, inventories}}`, `id` the String path code.
class ItemInventoriesView extends Dto {
  const ItemInventoriesView({
    this.id,
    this.name,
    this.inventories,
  });

  static ItemInventoriesView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item');
    if (source == null) return null;
    return ItemInventoriesView(
      id: readText(source['id']),
      name: readText(source['name']),
      inventories: ItemInventories.fromMap(source['inventories']),
    );
  }

  final String? id;

  final String? name;

  final ItemInventories? inventories;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'inventories': inventories,
      };
}

/// One inventory movement.
class InventoryAdjustment extends Dto {
  const InventoryAdjustment({
    this.object,
    this.id,
    this.itemId,
    this.itemName,
    this.warehouseName,
    this.adjustmentAmount,
    this.adjustmentType,
    this.reference,
    this.status,
    this.quantityOnHand,
    this.quantityAvailable,
    this.quantityOnOrder,
    this.quantityPromised,
    this.quantityOnReturn,
    this.quantityOnPurchaseReturn,
    this.quantityOnReserve,
    this.createdOn,
    this.lastUpdatedOn,
    this.href,
    this.createdBy,
    this.lastUpdatedBy,
  });

  static InventoryAdjustment? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'inventory_adjustment');
    if (source == null) return null;
    return InventoryAdjustment(
      object: readText(source['object']),
      id: readText(source['id']),
      itemId: readText(source['item_id']),
      itemName: readText(source['item_name']),
      warehouseName: readText(source['warehouse_name']),
      adjustmentAmount: readText(source['adjustment_amount']),
      adjustmentType: readText(source['adjustment_type']),
      reference: readText(source['reference']),
      status: readText(source['status']),
      quantityOnHand: readText(source['quantity_on_hand']),
      quantityAvailable: readText(source['quantity_available']),
      quantityOnOrder: readText(source['quantity_on_order']),
      quantityPromised: readText(source['quantity_promised']),
      quantityOnReturn: readText(source['quantity_on_return']),
      quantityOnPurchaseReturn: readText(source['quantity_on_purchase_return']),
      quantityOnReserve: readText(source['quantity_on_reserve']),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      href: readText(source['href']),
      createdBy: readAny(source['created_by']),
      lastUpdatedBy: readAny(source['last_updated_by']),
    );
  }

  final String? object;

  final String? id;

  final String? itemId;

  final String? itemName;

  final String? warehouseName;

  final String? adjustmentAmount;

  final String? adjustmentType;

  final String? reference;

  final String? status;

  final String? quantityOnHand;

  final String? quantityAvailable;

  final String? quantityOnOrder;

  final String? quantityPromised;

  final String? quantityOnReturn;

  final String? quantityOnPurchaseReturn;

  final String? quantityOnReserve;

  final String? createdOn;

  final String? lastUpdatedOn;

  final String? href;

  final Object? createdBy;

  final Object? lastUpdatedBy;

  @override
  String? get envelopeKey => 'inventory_adjustment';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'item_id': itemId,
        'item_name': itemName,
        'warehouse_name': warehouseName,
        'adjustment_amount': adjustmentAmount,
        'adjustment_type': adjustmentType,
        'reference': reference,
        'status': status,
        'quantity_on_hand': quantityOnHand,
        'quantity_available': quantityAvailable,
        'quantity_on_order': quantityOnOrder,
        'quantity_promised': quantityPromised,
        'quantity_on_return': quantityOnReturn,
        'quantity_on_purchase_return': quantityOnPurchaseReturn,
        'quantity_on_reserve': quantityOnReserve,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'href': href,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
      };
}

/// The listing envelope for inventory adjustments.
class InventoryAdjustmentList extends Dto {
  const InventoryAdjustmentList({
    this.object,
    this.url,
    this.data,
    this.pagination,
  });

  static InventoryAdjustmentList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InventoryAdjustmentList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<InventoryAdjustment>(
          source['data'], InventoryAdjustment.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<InventoryAdjustment?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

/// The listing envelope for an item's notes.
class NoteList extends Dto {
  const NoteList({
    this.object,
    this.url,
    this.data,
    this.pagination,
  });

  static NoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return NoteList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<Note>(source['data'], Note.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<Note?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

/// The listing envelope for a note's attachments.
class NoteFileList extends Dto {
  const NoteFileList({
    this.object,
    this.url,
    this.data,
    this.pagination,
  });

  static NoteFileList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return NoteFileList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<NoteAttachment>(source['data'], NoteAttachment.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<NoteAttachment?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

// Every write body is wrapped in an `item` envelope, the sale, purchase and
// inventories writes included; the image upload alone sits at the top level.

/// The body `createItem` takes.
///
/// `type` and `name` are the minimum that works. `type` takes `"STANDARD"`, `"BUNDLE"`, `"FAMILY"`
/// or `"VARIATION_BASED"`.
///
/// **The family flags are written `is_parent`/`is_child` and read back as
/// `parent`/`child`.**
///
/// `group` rejects an unknown value with `400 internal_error "Invalid
/// group"`.
class ItemCreate extends Dto {
  const ItemCreate({
    this.name,
    this.type,
    this.displayName,
    this.description,
    this.origin,
    this.invoiceNote,
    this.manager,
    this.customForm,
    this.group,
    this.isParent,
    this.isChild,
    this.parentItemId,
    this.currencies,
    this.uoms,
    this.sale,
    this.purchase,
    this.inventories,
    this.bundleDetails,
  });

  final String? name;

  final String? type;

  final String? displayName;

  final String? description;

  final String? origin;

  final String? invoiceNote;

  final String? manager;

  final String? customForm;

  final String? group;

  /// The **write** spelling. Reads back as `parent` / `child`.
  final bool? isParent;

  final bool? isChild;

  final String? parentItemId;

  final List<ItemCurrency?>? currencies;

  final List<Object?>? uoms;

  final Object? sale;

  final Object? purchase;

  final Object? inventories;

  final List<Object?>? bundleDetails;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'type': type,
        'display_name': displayName,
        'description': description,
        'origin': origin,
        'invoice_note': invoiceNote,
        'manager': manager,
        'custom_form': customForm,
        'group': group,
        'is_parent': isParent,
        'is_child': isChild,
        'parent_item_id': parentItemId,
        'currencies': currencies,
        'uoms': uoms,
        'sale': sale,
        'purchase': purchase,
        'inventories': inventories,
        'bundle_details': bundleDetails,
      };
}

/// The body `updateItemInformation` takes. Partial: send only what changes.
class ItemInformationUpdate extends Dto {
  const ItemInformationUpdate({
    this.name,
    this.displayName,
    this.description,
    this.origin,
    this.invoiceNote,
    this.manager,
    this.customForm,
  });

  final String? name;

  final String? displayName;

  final String? description;

  final String? origin;

  final String? invoiceNote;

  final String? manager;

  final String? customForm;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'display_name': displayName,
        'description': description,
        'origin': origin,
        'invoice_note': invoiceNote,
        'manager': manager,
        'custom_form': customForm,
      };
}

/// The body the sale create and update take.
///
/// `{"item": {"sale": {...}, "currencies": [...]}}` - the sale block sits
/// *inside* the item envelope, and `currencies` sits beside it rather than
/// within it.
///
/// `sale` is `Object?`, with no declared shape: `{default_sale_price: 75}` and
/// `{charge: {type: "RECURRING"}}` are both accepted.
class ItemSaleWrite extends Dto {
  const ItemSaleWrite({
    this.sale,
    this.currencies,
  });

  final Object? sale;

  final List<ItemCurrency?>? currencies;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'sale': sale,
        'currencies': currencies,
      };
}

/// `{"item": {"purchase": {...}, "currencies": [...]}}`.
class ItemPurchaseWrite extends Dto {
  const ItemPurchaseWrite({
    this.purchase,
    this.currencies,
  });

  final Object? purchase;

  final List<ItemCurrency?>? currencies;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'purchase': purchase,
        'currencies': currencies,
      };
}

/// `{"item": {"inventories": {...}}}`.
///
/// Turning inventory **off** is refused with `400 "Unable to disable
/// Inventory Management"` once stock exists. The write spells warehouse
/// management `warehouse_enabled` where the read returns
/// `enable_warehouse_management`.
class ItemInventoriesWrite extends Dto {
  const ItemInventoriesWrite({
    this.inventories,
  });

  final Object? inventories;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'inventories': inventories,
      };
}

/// `{"item": {"inventories": {"warehouses": [{name, quantity,
/// accounting_code}]}}}` - `name`, where the read side calls the same thing
/// `warehouse`.
class InventoryAdd extends Dto {
  const InventoryAdd({
    this.inventories,
  });

  final Object? inventories;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'inventories': inventories,
      };
}

/// The body `updateItemVariations` takes, in one of two forms: a
/// parent declares `configure_variations`; a child sets `parent_item_id` and
/// `use_variations`. The API answers both with a 400.
class ItemVariationsWrite extends Dto {
  const ItemVariationsWrite({
    this.configureVariations,
    this.useVariations,
    this.parentItemId,
  });

  final List<Object?>? configureVariations;

  final List<Object?>? useVariations;

  final String? parentItemId;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'configure_variations': configureVariations,
        'use_variations': useVariations,
        'parent_item_id': parentItemId,
      };
}

/// `{"item": {"bundle_details": [{id, quantity}]}}` - a **bare list**, the
/// opposite of how `family_details` is written.
class ItemBundleDetailsWrite extends Dto {
  const ItemBundleDetailsWrite({
    this.bundleDetails,
  });

  final List<Object?>? bundleDetails;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'bundle_details': bundleDetails,
      };
}

/// `{"item": {"family_details": {"add": ["ITEM-0002"]}}}` - an **object
/// with an `add` list**, not a bare list. The API answers 405.
class ItemFamilyDetailsWrite extends Dto {
  const ItemFamilyDetailsWrite({
    this.familyDetails,
  });

  final Object? familyDetails;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'family_details': familyDetails,
      };
}

/// `{"item": {"package_details": {...}}}`. The API answers 405.
class ItemPackageDetailsWrite extends Dto {
  const ItemPackageDetailsWrite({
    this.packageDetails,
  });

  final Object? packageDetails;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'package_details': packageDetails,
      };
}

/// Base64 in a JSON body, as on an account - **not** a multipart upload, and
/// the one write in this family with no `item` envelope. The API answers 500.
class ItemImageUpload extends Dto {
  const ItemImageUpload({
    this.imageBase64,
  });

  final String? imageBase64;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'image_base64': imageBase64,
      };
}

/// What `getItemFamilyDetails` answers, under `item`.
class ItemFamilyDetails extends Dto {
  const ItemFamilyDetails({
    this.id,
    this.name,
    this.familyDetails,
  });

  static ItemFamilyDetails? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item');
    if (source == null) return null;
    return ItemFamilyDetails(
      id: readText(source['id']),
      name: readText(source['name']),
      familyDetails: readList<ItemFamilyDetailsFamilyDetail>(
          source['family_details'], ItemFamilyDetailsFamilyDetail.fromMap),
    );
  }

  final String? id;

  final String? name;

  final List<ItemFamilyDetailsFamilyDetail?>? familyDetails;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'family_details': familyDetails,
      };
}

/// What `getItemPackageDetails` answers, under `item`.
class ItemPackageDetails extends Dto {
  const ItemPackageDetails({
    this.id,
    this.name,
    this.packageDetails,
  });

  static ItemPackageDetails? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item');
    if (source == null) return null;
    return ItemPackageDetails(
      id: readText(source['id']),
      name: readText(source['name']),
      packageDetails: readList<ItemPackageDetailsPackageDetail>(
          source['package_details'], ItemPackageDetailsPackageDetail.fromMap),
    );
  }

  final String? id;

  final String? name;

  final List<ItemPackageDetailsPackageDetail?>? packageDetails;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'package_details': packageDetails,
      };
}

/// What `getItemPackageDetail` answers, under `item`.
class ItemPackageDetail extends Dto {
  const ItemPackageDetail({
    this.id,
    this.name,
    this.packageDetails,
  });

  static ItemPackageDetail? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item');
    if (source == null) return null;
    return ItemPackageDetail(
      id: readText(source['id']),
      name: readText(source['name']),
      packageDetails: readList<ItemPackageDetailPackageDetail>(
          source['package_details'], ItemPackageDetailPackageDetail.fromMap),
    );
  }

  final String? id;

  final String? name;

  final List<ItemPackageDetailPackageDetail?>? packageDetails;

  @override
  String? get envelopeKey => 'item';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'package_details': packageDetails,
      };
}

/// What `getItemNoteFile` answers, under `file`.
class ItemNoteFile extends Dto {
  const ItemNoteFile({
    this.uuid,
    this.filename,
    this.contentType,
    this.size,
    this.href,
  });

  static ItemNoteFile? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'file');
    if (source == null) return null;
    return ItemNoteFile(
      uuid: readText(source['uuid']),
      filename: readText(source['filename']),
      contentType: readText(source['content_type']),
      size: readInteger(source['size']),
      href: readText(source['href']),
    );
  }

  final String? uuid;

  final String? filename;

  final String? contentType;

  final int? size;

  final String? href;

  @override
  String? get envelopeKey => 'file';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'uuid': uuid,
        'filename': filename,
        'content_type': contentType,
        'size': size,
        'href': href,
      };
}

/// One entry of a [Item]'s `custom_attributes`.
class ItemCustomAttribute extends Dto {
  const ItemCustomAttribute({
    this.object,
    this.id,
    this.type,
    this.name,
    this.value,
    this.href,
  });

  static ItemCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemCustomAttribute(
      object: readText(source['object']),
      id: readText(source['id']),
      type: readText(source['type']),
      name: readText(source['name']),
      value: readText(source['value']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? type;

  final String? name;

  final String? value;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'type': type,
        'name': name,
        'value': value,
        'href': href,
      };
}

/// One entry of a [Note]'s `watchers`.
class NoteWatcher extends Dto {
  const NoteWatcher({
    this.type,
    this.name,
    this.email,
  });

  static NoteWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return NoteWatcher(
      type: readText(source['type']),
      name: readText(source['name']),
      email: readText(source['email']),
    );
  }

  final String? type;

  final String? name;

  final String? email;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'type': type,
        'name': name,
        'email': email,
      };
}

/// A [Note]'s `last_updated_by`.
class NoteLastUpdatedBy extends Dto {
  const NoteLastUpdatedBy({
    this.object,
    this.name,
  });

  static NoteLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return NoteLastUpdatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// One entry of a [VariationOption]'s `values`.
class VariationOptionValue extends Dto {
  const VariationOptionValue({
    this.uuid,
    this.name,
  });

  static VariationOptionValue? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return VariationOptionValue(
      uuid: readText(source['uuid']),
      name: readText(source['name']),
    );
  }

  final String? uuid;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'uuid': uuid,
        'name': name,
      };
}

/// One entry of a [PackageDetail]'s `items`.
class PackageDetailItem extends Dto {
  const PackageDetailItem({
    this.itemId,
    this.itemName,
    this.quantity,
    this.uom,
  });

  static PackageDetailItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PackageDetailItem(
      itemId: readText(source['item_id']),
      itemName: readText(source['item_name']),
      quantity: readDecimal(source['quantity']),
      uom: readAny(source['uom']),
    );
  }

  final String? itemId;

  final String? itemName;

  final double? quantity;

  /// Untyped: null in every record measured.
  final Object? uom;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'item_id': itemId,
        'item_name': itemName,
        'quantity': quantity,
        'uom': uom,
      };
}

/// One entry of a [PackageDetail]'s `billing_periods`.
class PackageDetailBillingPeriod extends Dto {
  const PackageDetailBillingPeriod({
    this.name,
    this.rank,
  });

  static PackageDetailBillingPeriod? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PackageDetailBillingPeriod(
      name: readText(source['name']),
      rank: readInteger(source['rank']),
    );
  }

  final String? name;

  final int? rank;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'rank': rank,
      };
}

/// One entry of a [ItemSale]'s `pricing_levels`.
class ItemSalePricingLevel extends Dto {
  const ItemSalePricingLevel({
    this.name,
    this.uuid,
  });

  static ItemSalePricingLevel? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemSalePricingLevel(
      name: readText(source['name']),
      uuid: readText(source['uuid']),
    );
  }

  final String? name;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'uuid': uuid,
      };
}

/// One entry of a [ItemSale]'s `payment_properties`.
class ItemSalePaymentProperty extends Dto {
  const ItemSalePaymentProperty({
    this.name,
    this.value,
  });

  static ItemSalePaymentProperty? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemSalePaymentProperty(
      name: readText(source['name']),
      value: readText(source['value']),
    );
  }

  final String? name;

  final String? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'value': value,
      };
}

/// A [ItemSale]'s `width`.
class ItemSaleWidth extends Dto {
  const ItemSaleWidth({
    this.uom,
    this.value,
  });

  static ItemSaleWidth? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemSaleWidth(
      uom: readText(source['uom']),
      value: readDecimal(source['value']),
    );
  }

  final String? uom;

  final double? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'uom': uom,
        'value': value,
      };
}

/// A [ItemSale]'s `height`.
class ItemSaleHeight extends Dto {
  const ItemSaleHeight({
    this.uom,
    this.value,
  });

  static ItemSaleHeight? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemSaleHeight(
      uom: readText(source['uom']),
      value: readDecimal(source['value']),
    );
  }

  final String? uom;

  final double? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'uom': uom,
        'value': value,
      };
}

/// A [ItemSale]'s `length`.
class ItemSaleLength extends Dto {
  const ItemSaleLength({
    this.uom,
    this.value,
  });

  static ItemSaleLength? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemSaleLength(
      uom: readText(source['uom']),
      value: readDecimal(source['value']),
    );
  }

  final String? uom;

  final double? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'uom': uom,
        'value': value,
      };
}

/// A [ItemSale]'s `weight`.
class ItemSaleWeight extends Dto {
  const ItemSaleWeight({
    this.uom,
    this.value,
  });

  static ItemSaleWeight? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemSaleWeight(
      uom: readText(source['uom']),
      value: readDecimal(source['value']),
    );
  }

  final String? uom;

  final double? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'uom': uom,
        'value': value,
      };
}

/// One entry of a [ItemPurchase]'s `purchase_properties`.
class ItemPurchasePurchaseProperty extends Dto {
  const ItemPurchasePurchaseProperty({
    this.name,
    this.value,
  });

  static ItemPurchasePurchaseProperty? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemPurchasePurchaseProperty(
      name: readText(source['name']),
      value: readText(source['value']),
    );
  }

  final String? name;

  final String? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'value': value,
      };
}

/// One entry of a [ItemPurchase]'s `suppliers`.
class ItemPurchaseSupplier extends Dto {
  const ItemPurchaseSupplier({
    this.id,
    this.name,
    this.accountingCode,
    this.purchaseOrderNote,
    this.defaultPurchasePrice,
    this.taxExemptWhenPurchase,
    this.taxConfiguration,
    this.pricing,
  });

  static ItemPurchaseSupplier? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemPurchaseSupplier(
      id: readAny(source['id']),
      name: readText(source['name']),
      accountingCode: readAny(source['accounting_code']),
      purchaseOrderNote: readAny(source['purchase_order_note']),
      defaultPurchasePrice: readDecimal(source['default_purchase_price']),
      taxExemptWhenPurchase: readFlag(source['tax_exempt_when_purchase']),
      taxConfiguration: ItemPurchaseSupplierTaxConfiguration.fromMap(
          source['tax_configuration']),
      pricing: ItemPurchaseSupplierPricing.fromMap(source['pricing']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? id;

  final String? name;

  /// Untyped: null in every record measured.
  final Object? accountingCode;

  /// Untyped: null in every record measured.
  final Object? purchaseOrderNote;

  final double? defaultPurchasePrice;

  final bool? taxExemptWhenPurchase;

  final ItemPurchaseSupplierTaxConfiguration? taxConfiguration;

  final ItemPurchaseSupplierPricing? pricing;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'accounting_code': accountingCode,
        'purchase_order_note': purchaseOrderNote,
        'default_purchase_price': defaultPurchasePrice,
        'tax_exempt_when_purchase': taxExemptWhenPurchase,
        'tax_configuration': taxConfiguration,
        'pricing': pricing,
      };
}

/// One entry of a [ItemFamilyDetails]'s `family_details`.
class ItemFamilyDetailsFamilyDetail extends Dto {
  const ItemFamilyDetailsFamilyDetail({
    this.itemId,
    this.itemName,
  });

  static ItemFamilyDetailsFamilyDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFamilyDetailsFamilyDetail(
      itemId: readText(source['item_id']),
      itemName: readText(source['item_name']),
    );
  }

  final String? itemId;

  final String? itemName;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'item_id': itemId,
        'item_name': itemName,
      };
}

/// One entry of a [ItemPackageDetails]'s `package_details`.
class ItemPackageDetailsPackageDetail extends Dto {
  const ItemPackageDetailsPackageDetail({
    this.object,
    this.id,
    this.status,
    this.uuid,
    this.name,
    this.displayName,
    this.rank,
    this.createdBy,
    this.createdOn,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.items,
    this.billingPeriods,
    this.customAttributes,
  });

  static ItemPackageDetailsPackageDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemPackageDetailsPackageDetail(
      object: readText(source['object']),
      id: readText(source['id']),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
      name: readText(source['name']),
      displayName: readText(source['display_name']),
      rank: readInteger(source['rank']),
      createdBy: ItemPackageDetailsPackageDetailCreatedBy.fromMap(
          source['created_by']),
      createdOn: readText(source['created_on']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      items: readList<ItemPackageDetailsPackageDetailItem>(
          source['items'], ItemPackageDetailsPackageDetailItem.fromMap),
      billingPeriods: readList<ItemPackageDetailsPackageDetailBillingPeriod>(
          source['billing_periods'],
          ItemPackageDetailsPackageDetailBillingPeriod.fromMap),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
    );
  }

  final String? object;

  final String? id;

  final String? status;

  final String? uuid;

  final String? name;

  final String? displayName;

  final int? rank;

  final ItemPackageDetailsPackageDetailCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final List<ItemPackageDetailsPackageDetailItem?>? items;

  final List<ItemPackageDetailsPackageDetailBillingPeriod?>? billingPeriods;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? customAttributes;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'status': status,
        'uuid': uuid,
        'name': name,
        'display_name': displayName,
        'rank': rank,
        'created_by': createdBy,
        'created_on': createdOn,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'items': items,
        'billing_periods': billingPeriods,
        'custom_attributes': customAttributes,
      };
}

/// One entry of a [ItemPackageDetail]'s `package_details`.
class ItemPackageDetailPackageDetail extends Dto {
  const ItemPackageDetailPackageDetail({
    this.object,
    this.id,
    this.status,
    this.uuid,
    this.name,
    this.displayName,
    this.rank,
    this.createdBy,
    this.createdOn,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.items,
    this.billingPeriods,
    this.customAttributes,
  });

  static ItemPackageDetailPackageDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemPackageDetailPackageDetail(
      object: readText(source['object']),
      id: readText(source['id']),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
      name: readText(source['name']),
      displayName: readText(source['display_name']),
      rank: readInteger(source['rank']),
      createdBy:
          ItemPackageDetailPackageDetailCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      items: readList<ItemPackageDetailPackageDetailItem>(
          source['items'], ItemPackageDetailPackageDetailItem.fromMap),
      billingPeriods: readList<ItemPackageDetailPackageDetailBillingPeriod>(
          source['billing_periods'],
          ItemPackageDetailPackageDetailBillingPeriod.fromMap),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
    );
  }

  final String? object;

  final String? id;

  final String? status;

  final String? uuid;

  final String? name;

  final String? displayName;

  final int? rank;

  final ItemPackageDetailPackageDetailCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final List<ItemPackageDetailPackageDetailItem?>? items;

  final List<ItemPackageDetailPackageDetailBillingPeriod?>? billingPeriods;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? customAttributes;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'status': status,
        'uuid': uuid,
        'name': name,
        'display_name': displayName,
        'rank': rank,
        'created_by': createdBy,
        'created_on': createdOn,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'items': items,
        'billing_periods': billingPeriods,
        'custom_attributes': customAttributes,
      };
}

/// A [TaxConfiguration]'s `tax_code`.
class TaxConfigurationTaxCode extends Dto {
  const TaxConfigurationTaxCode({
    this.object,
    this.id,
    this.href,
  });

  static TaxConfigurationTaxCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaxConfigurationTaxCode(
      object: readText(source['object']),
      id: readText(source['id']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'href': href,
      };
}

/// One entry of a [Pricing]'s `pricing_module`.
class PricingPricingModule extends Dto {
  const PricingPricingModule({
    this.price,
    this.currency,
    this.pricingLevel,
    this.lastPurchasePrice,
    this.averagePurchasePrice,
    this.unit,
    this.priceType,
  });

  static PricingPricingModule? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PricingPricingModule(
      price: readDecimal(source['price']),
      currency: readText(source['currency']),
      pricingLevel: readText(source['pricing_level']),
      lastPurchasePrice: readAny(source['last_purchase_price']),
      averagePurchasePrice: readAny(source['average_purchase_price']),
      unit: readText(source['unit']),
      priceType: readText(source['price_type']),
    );
  }

  final double? price;

  final String? currency;

  final String? pricingLevel;

  /// Untyped: null in every record measured.
  final Object? lastPurchasePrice;

  /// Untyped: null in every record measured.
  final Object? averagePurchasePrice;

  final String? unit;

  final String? priceType;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'price': price,
        'currency': currency,
        'pricing_level': pricingLevel,
        'last_purchase_price': lastPurchasePrice,
        'average_purchase_price': averagePurchasePrice,
        'unit': unit,
        'price_type': priceType,
      };
}

/// One entry of a [SaleCharge]'s `properties`.
class SaleChargeProperty extends Dto {
  const SaleChargeProperty({
    this.name,
    this.value,
  });

  static SaleChargeProperty? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SaleChargeProperty(
      name: readText(source['name']),
      value: readText(source['value']),
    );
  }

  final String? name;

  final String? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'value': value,
      };
}

/// One entry of a [InventoryProperties]'s `preorder_configuration`.
class InventoryPropertiesPreorderConfiguration extends Dto {
  const InventoryPropertiesPreorderConfiguration({
    this.name,
    this.endDate,
    this.startDate,
  });

  static InventoryPropertiesPreorderConfiguration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InventoryPropertiesPreorderConfiguration(
      name: readText(source['name']),
      endDate: readText(source['end_date']),
      startDate: readText(source['start_date']),
    );
  }

  final String? name;

  final String? endDate;

  final String? startDate;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'end_date': endDate,
        'start_date': startDate,
      };
}

/// A [WarehouseInventory]'s `warehouse`.
class WarehouseInventoryWarehouse extends Dto {
  const WarehouseInventoryWarehouse({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static WarehouseInventoryWarehouse? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return WarehouseInventoryWarehouse(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'href': href,
      };
}

/// A [ItemPurchaseSupplier]'s `tax_configuration`.
class ItemPurchaseSupplierTaxConfiguration extends Dto {
  const ItemPurchaseSupplierTaxConfiguration({
    this.purchasePriceEnteredInclusiveOfTax,
    this.taxCode,
  });

  static ItemPurchaseSupplierTaxConfiguration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemPurchaseSupplierTaxConfiguration(
      purchasePriceEnteredInclusiveOfTax:
          readFlag(source['purchase_price_entered_inclusive_of_tax']),
      taxCode: ItemPurchaseSupplierTaxConfigurationTaxCode.fromMap(
          source['tax_code']),
    );
  }

  final bool? purchasePriceEnteredInclusiveOfTax;

  final ItemPurchaseSupplierTaxConfigurationTaxCode? taxCode;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'purchase_price_entered_inclusive_of_tax':
            purchasePriceEnteredInclusiveOfTax,
        'tax_code': taxCode,
      };
}

/// A [ItemPurchaseSupplier]'s `pricing`.
class ItemPurchaseSupplierPricing extends Dto {
  const ItemPurchaseSupplierPricing({
    this.type,
    this.version,
    this.latestUsedPricingVersion,
    this.pricingModule,
  });

  static ItemPurchaseSupplierPricing? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemPurchaseSupplierPricing(
      type: readText(source['type']),
      version: readInteger(source['version']),
      latestUsedPricingVersion:
          readInteger(source['latest_used_pricing_version']),
      pricingModule: readList<Object>(source['pricing_module'], readAny),
    );
  }

  final String? type;

  final int? version;

  final int? latestUsedPricingVersion;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? pricingModule;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'type': type,
        'version': version,
        'latest_used_pricing_version': latestUsedPricingVersion,
        'pricing_module': pricingModule,
      };
}

/// A [ItemPackageDetailsPackageDetail]'s `created_by`.
class ItemPackageDetailsPackageDetailCreatedBy extends Dto {
  const ItemPackageDetailsPackageDetailCreatedBy({
    this.object,
    this.name,
  });

  static ItemPackageDetailsPackageDetailCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemPackageDetailsPackageDetailCreatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// One entry of a [ItemPackageDetailsPackageDetail]'s `items`.
class ItemPackageDetailsPackageDetailItem extends Dto {
  const ItemPackageDetailsPackageDetailItem({
    this.itemId,
    this.itemName,
    this.quantity,
    this.uom,
  });

  static ItemPackageDetailsPackageDetailItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemPackageDetailsPackageDetailItem(
      itemId: readText(source['item_id']),
      itemName: readText(source['item_name']),
      quantity: readDecimal(source['quantity']),
      uom: readAny(source['uom']),
    );
  }

  final String? itemId;

  final String? itemName;

  final double? quantity;

  /// Untyped: null in every record measured.
  final Object? uom;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'item_id': itemId,
        'item_name': itemName,
        'quantity': quantity,
        'uom': uom,
      };
}

/// One entry of a [ItemPackageDetailsPackageDetail]'s `billing_periods`.
class ItemPackageDetailsPackageDetailBillingPeriod extends Dto {
  const ItemPackageDetailsPackageDetailBillingPeriod({
    this.name,
    this.rank,
  });

  static ItemPackageDetailsPackageDetailBillingPeriod? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemPackageDetailsPackageDetailBillingPeriod(
      name: readText(source['name']),
      rank: readInteger(source['rank']),
    );
  }

  final String? name;

  final int? rank;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'rank': rank,
      };
}

/// A [ItemPackageDetailPackageDetail]'s `created_by`.
class ItemPackageDetailPackageDetailCreatedBy extends Dto {
  const ItemPackageDetailPackageDetailCreatedBy({
    this.object,
    this.name,
  });

  static ItemPackageDetailPackageDetailCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemPackageDetailPackageDetailCreatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// One entry of a [ItemPackageDetailPackageDetail]'s `items`.
class ItemPackageDetailPackageDetailItem extends Dto {
  const ItemPackageDetailPackageDetailItem({
    this.itemId,
    this.itemName,
    this.quantity,
    this.uom,
  });

  static ItemPackageDetailPackageDetailItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemPackageDetailPackageDetailItem(
      itemId: readText(source['item_id']),
      itemName: readText(source['item_name']),
      quantity: readDecimal(source['quantity']),
      uom: readAny(source['uom']),
    );
  }

  final String? itemId;

  final String? itemName;

  final double? quantity;

  /// Untyped: null in every record measured.
  final Object? uom;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'item_id': itemId,
        'item_name': itemName,
        'quantity': quantity,
        'uom': uom,
      };
}

/// One entry of a [ItemPackageDetailPackageDetail]'s `billing_periods`.
class ItemPackageDetailPackageDetailBillingPeriod extends Dto {
  const ItemPackageDetailPackageDetailBillingPeriod({
    this.name,
    this.rank,
  });

  static ItemPackageDetailPackageDetailBillingPeriod? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemPackageDetailPackageDetailBillingPeriod(
      name: readText(source['name']),
      rank: readInteger(source['rank']),
    );
  }

  final String? name;

  final int? rank;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'rank': rank,
      };
}

/// A [ItemPurchaseSupplierTaxConfiguration]'s `tax_code`.
class ItemPurchaseSupplierTaxConfigurationTaxCode extends Dto {
  const ItemPurchaseSupplierTaxConfigurationTaxCode({
    this.object,
    this.id,
    this.href,
  });

  static ItemPurchaseSupplierTaxConfigurationTaxCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemPurchaseSupplierTaxConfigurationTaxCode(
      object: readText(source['object']),
      id: readText(source['id']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'href': href,
      };
}
