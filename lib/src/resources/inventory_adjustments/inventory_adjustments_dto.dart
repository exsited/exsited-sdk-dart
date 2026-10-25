/// Typed views over the v4 inventory adjustments bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The inventory adjustment body.
class InventoryAdjustment extends Dto {
  const InventoryAdjustment({
    this.adjustmentAmount,
    this.adjustmentType,
    this.createdBy,
    this.createdOn,
    this.href,
    this.id,
    this.itemId,
    this.itemName,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.quantityAvailable,
    this.quantityOnHand,
    this.quantityOnOrder,
    this.quantityOnPurchaseReturn,
    this.quantityOnReserve,
    this.quantityOnReturn,
    this.quantityPromised,
    this.reference,
    this.status,
    this.warehouseName,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/inventory_adjustments',
    'GET /api/{api_version}/inventory_adjustments/{inventory_adjustment_id}',
    'GET /api/{api_version}/items/{item_id}/inventory_adjustments',
  ];

  static InventoryAdjustment? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'inventory_adjustment');
    if (source == null) return null;
    return InventoryAdjustment(
      adjustmentAmount: readText(source['adjustment_amount']),
      adjustmentType: readText(source['adjustment_type']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      href: readText(source['href']),
      id: readText(source['id']),
      itemId: readText(source['item_id']),
      itemName: readText(source['item_name']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      quantityAvailable: readText(source['quantity_available']),
      quantityOnHand: readText(source['quantity_on_hand']),
      quantityOnOrder: readText(source['quantity_on_order']),
      quantityOnPurchaseReturn: readText(source['quantity_on_purchase_return']),
      quantityOnReserve: readText(source['quantity_on_reserve']),
      quantityOnReturn: readText(source['quantity_on_return']),
      quantityPromised: readText(source['quantity_promised']),
      reference: readText(source['reference']),
      status: readText(source['status']),
      warehouseName: readText(source['warehouse_name']),
    );
  }

  final String? adjustmentAmount;

  final String? adjustmentType;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final String? href;

  final String? id;

  final String? itemId;

  final String? itemName;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? quantityAvailable;

  final String? quantityOnHand;

  final String? quantityOnOrder;

  final String? quantityOnPurchaseReturn;

  final String? quantityOnReserve;

  final String? quantityOnReturn;

  final String? quantityPromised;

  final String? reference;

  final String? status;

  final String? warehouseName;

  @override
  String? get envelopeKey => 'inventory_adjustment';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'adjustment_amount': adjustmentAmount,
        'adjustment_type': adjustmentType,
        'created_by': createdBy,
        'created_on': createdOn,
        'href': href,
        'id': id,
        'item_id': itemId,
        'item_name': itemName,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'quantity_available': quantityAvailable,
        'quantity_on_hand': quantityOnHand,
        'quantity_on_order': quantityOnOrder,
        'quantity_on_purchase_return': quantityOnPurchaseReturn,
        'quantity_on_reserve': quantityOnReserve,
        'quantity_on_return': quantityOnReturn,
        'quantity_promised': quantityPromised,
        'reference': reference,
        'status': status,
        'warehouse_name': warehouseName,
      };
}

/// A page of InventoryAdjustment records.
class InventoryAdjustmentList extends Dto {
  const InventoryAdjustmentList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/inventory_adjustments',
    'GET /api/{api_version}/items/{item_id}/inventory_adjustments',
  ];

  static InventoryAdjustmentList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InventoryAdjustmentList(
      data: readList<InventoryAdjustment>(
          source['data'], InventoryAdjustment.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<InventoryAdjustment?>? data;

  final String? object;

  final Pagination? pagination;

  final String? url;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'data': data,
        'object': object,
        'pagination': pagination,
        'url': url,
      };
}
