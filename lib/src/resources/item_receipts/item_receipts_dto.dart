/// Typed views over the v4 item receipts bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The item receipt body.
class ItemReceipt extends Dto {
  const ItemReceipt({
    this.code,
    this.createdBy,
    this.createdOn,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.lines,
    this.object,
    this.purchaseOrder,
    this.receiptDate,
    this.receiptNote,
    this.receiptStatus,
    this.receiveCompleted,
    this.status,
    this.trackingNumber,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/item_receipts',
    'GET /api/{api_version}/item_receipts/{item_receipt_id}',
  ];

  static ItemReceipt? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item_receipt');
    if (source == null) return null;
    return ItemReceipt(
      code: readText(source['code']),
      createdBy: ItemReceiptCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy:
          ItemReceiptLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lines:
          readList<ItemReceiptLine>(source['lines'], ItemReceiptLine.fromMap),
      object: readText(source['object']),
      purchaseOrder: ItemReceiptPurchaseOrder.fromMap(source['purchase_order']),
      receiptDate: readText(source['receipt_date']),
      receiptNote: readText(source['receipt_note']),
      receiptStatus: readText(source['receipt_status']),
      receiveCompleted: readFlag(source['receive_completed']),
      status: readText(source['status']),
      trackingNumber: readText(source['tracking_number']),
      version: readInteger(source['version']),
    );
  }

  final String? code;

  final ItemReceiptCreatedBy? createdBy;

  final String? createdOn;

  final String? href;

  final String? id;

  final ItemReceiptLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final List<ItemReceiptLine?>? lines;

  final String? object;

  final ItemReceiptPurchaseOrder? purchaseOrder;

  final String? receiptDate;

  final String? receiptNote;

  final String? receiptStatus;

  final bool? receiveCompleted;

  final String? status;

  final String? trackingNumber;

  final int? version;

  @override
  String? get envelopeKey => 'item_receipt';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'lines': lines,
        'object': object,
        'purchase_order': purchaseOrder,
        'receipt_date': receiptDate,
        'receipt_note': receiptNote,
        'receipt_status': receiptStatus,
        'receive_completed': receiveCompleted,
        'status': status,
        'tracking_number': trackingNumber,
        'version': version,
      };
}

/// A page of ItemReceipt records.
class ItemReceiptList extends Dto {
  const ItemReceiptList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/item_receipts',
  ];

  static ItemReceiptList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptList(
      data: readList<ItemReceipt>(source['data'], ItemReceipt.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<ItemReceipt?>? data;

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

/// The item receipts body.
class ItemReceipts extends Dto {
  const ItemReceipts({
    this.activityLogs,
    this.createdBy,
    this.createdOn,
    this.date,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.note,
    this.purchaseOrderId,
    this.receiptStatus,
    this.receipts,
    this.trackingNumber,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/item_receipts',
  ];

  static ItemReceipts? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item-receipt');
    if (source == null) return null;
    return ItemReceipts(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      createdBy: readText(source['created_by']),
      createdOn: readText(source['created_on']),
      date: readText(source['date']),
      id: readText(source['id']),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      note: readText(source['note']),
      purchaseOrderId: readText(source['purchase_order_id']),
      receiptStatus: readText(source['receipt_status']),
      receipts: readList<Object>(source['receipts'], readAny),
      trackingNumber: readText(source['tracking_number']),
      uuid: readText(source['uuid']),
      version: readText(source['version']),
    );
  }

  final List<Object?>? activityLogs;

  final String? createdBy;

  final String? createdOn;

  final String? date;

  final String? id;

  final String? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? note;

  final String? purchaseOrderId;

  final String? receiptStatus;

  final List<Object?>? receipts;

  final String? trackingNumber;

  final String? uuid;

  final String? version;

  @override
  String? get envelopeKey => 'item-receipt';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'created_by': createdBy,
        'created_on': createdOn,
        'date': date,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'note': note,
        'purchase_order_id': purchaseOrderId,
        'receipt_status': receiptStatus,
        'receipts': receipts,
        'tracking_number': trackingNumber,
        'uuid': uuid,
        'version': version,
      };
}

/// The item receipt updated body.
class ItemReceiptUpdated extends Dto {
  const ItemReceiptUpdated({
    this.code,
    this.createdBy,
    this.createdOn,
    this.date,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.lines,
    this.note,
    this.object,
    this.purchaseOrder,
    this.purchaseOrderId,
    this.receiptDate,
    this.receiptNote,
    this.receiptStatus,
    this.receipts,
    this.receiveCompleted,
    this.status,
    this.trackingNumber,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/item_receipts/{item_receipt_id}',
  ];

  static ItemReceiptUpdated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item_receipt');
    if (source == null) return null;
    return ItemReceiptUpdated(
      code: readText(source['code']),
      createdBy: ItemReceiptUpdatedCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      date: readText(source['date']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy:
          ItemReceiptUpdatedLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lines: readList<ItemReceiptUpdatedLine>(
          source['lines'], ItemReceiptUpdatedLine.fromMap),
      note: readText(source['note']),
      object: readText(source['object']),
      purchaseOrder:
          ItemReceiptUpdatedPurchaseOrder.fromMap(source['purchase_order']),
      purchaseOrderId: readText(source['purchase_order_id']),
      receiptDate: readText(source['receipt_date']),
      receiptNote: readAny(source['receipt_note']),
      receiptStatus: readText(source['receipt_status']),
      receipts: readList<Object>(source['receipts'], readAny),
      receiveCompleted: readFlag(source['receive_completed']),
      status: readText(source['status']),
      trackingNumber: readText(source['tracking_number']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final String? code;

  final ItemReceiptUpdatedCreatedBy? createdBy;

  final String? createdOn;

  final String? date;

  final String? href;

  final String? id;

  final ItemReceiptUpdatedLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final List<ItemReceiptUpdatedLine?>? lines;

  final String? note;

  final String? object;

  final ItemReceiptUpdatedPurchaseOrder? purchaseOrder;

  final String? purchaseOrderId;

  final String? receiptDate;

  /// Untyped: null in every record measured.
  final Object? receiptNote;

  final String? receiptStatus;

  final List<Object?>? receipts;

  final bool? receiveCompleted;

  final String? status;

  final String? trackingNumber;

  final String? uuid;

  final int? version;

  @override
  String? get envelopeKey => 'item_receipt';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'date': date,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'lines': lines,
        'note': note,
        'object': object,
        'purchase_order': purchaseOrder,
        'purchase_order_id': purchaseOrderId,
        'receipt_date': receiptDate,
        'receipt_note': receiptNote,
        'receipt_status': receiptStatus,
        'receipts': receipts,
        'receive_completed': receiveCompleted,
        'status': status,
        'tracking_number': trackingNumber,
        'uuid': uuid,
        'version': version,
      };
}

/// The purchase order item receipts body.
class PurchaseOrderItemReceipts extends Dto {
  const PurchaseOrderItemReceipts({
    this.itemReceipts,
    this.pagination,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/item_receipts',
  ];

  static PurchaseOrderItemReceipts? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_order');
    if (source == null) return null;
    return PurchaseOrderItemReceipts(
      itemReceipts: readList<Object>(source['item_receipts'], readAny),
      pagination: readAny(source['pagination']),
    );
  }

  final List<Object?>? itemReceipts;

  final Object? pagination;

  @override
  String? get envelopeKey => 'purchase_order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'item_receipts': itemReceipts,
        'pagination': pagination,
      };
}

/// A [ItemReceipt]'s `purchase_order`.
class ItemReceiptPurchaseOrder extends Dto {
  const ItemReceiptPurchaseOrder({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static ItemReceiptPurchaseOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptPurchaseOrder(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'object': object,
      };
}

/// One entry of a [ItemReceipt]'s `lines`.
class ItemReceiptLine extends Dto {
  const ItemReceiptLine({
    this.item,
    this.pendingReturnQuantity,
    this.purchaseOrderLine,
    this.receiptQuantity,
    this.receivedQuantity,
    this.returnedQuantity,
    this.uom,
    this.warehouse,
  });

  static ItemReceiptLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptLine(
      item: ItemReceiptLineItem.fromMap(source['item']),
      pendingReturnQuantity: readDecimal(source['pending_return_quantity']),
      purchaseOrderLine: ItemReceiptLinePurchaseOrderLine.fromMap(
          source['purchase_order_line']),
      receiptQuantity: readDecimal(source['receipt_quantity']),
      receivedQuantity: readDecimal(source['received_quantity']),
      returnedQuantity: readDecimal(source['returned_quantity']),
      uom: ItemReceiptLineUom.fromMap(source['uom']),
      warehouse: ItemReceiptLineWarehouse.fromMap(source['warehouse']),
    );
  }

  final ItemReceiptLineItem? item;

  final double? pendingReturnQuantity;

  final ItemReceiptLinePurchaseOrderLine? purchaseOrderLine;

  final double? receiptQuantity;

  final double? receivedQuantity;

  final double? returnedQuantity;

  final ItemReceiptLineUom? uom;

  final ItemReceiptLineWarehouse? warehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'item': item,
        'pending_return_quantity': pendingReturnQuantity,
        'purchase_order_line': purchaseOrderLine,
        'receipt_quantity': receiptQuantity,
        'received_quantity': receivedQuantity,
        'returned_quantity': returnedQuantity,
        'uom': uom,
        'warehouse': warehouse,
      };
}

/// A [ItemReceipt]'s `created_by`.
class ItemReceiptCreatedBy extends Dto {
  const ItemReceiptCreatedBy({
    this.name,
    this.object,
  });

  static ItemReceiptCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptCreatedBy(
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'object': object,
      };
}

/// A [ItemReceipt]'s `last_updated_by`.
class ItemReceiptLastUpdatedBy extends Dto {
  const ItemReceiptLastUpdatedBy({
    this.name,
    this.object,
  });

  static ItemReceiptLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptLastUpdatedBy(
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'object': object,
      };
}

/// A [ItemReceiptUpdated]'s `purchase_order`.
class ItemReceiptUpdatedPurchaseOrder extends Dto {
  const ItemReceiptUpdatedPurchaseOrder({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static ItemReceiptUpdatedPurchaseOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptUpdatedPurchaseOrder(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'object': object,
      };
}

/// One entry of a [ItemReceiptUpdated]'s `lines`.
class ItemReceiptUpdatedLine extends Dto {
  const ItemReceiptUpdatedLine({
    this.item,
    this.pendingReturnQuantity,
    this.purchaseOrderLine,
    this.receiptQuantity,
    this.receivedQuantity,
    this.returnedQuantity,
    this.uom,
    this.warehouse,
  });

  static ItemReceiptUpdatedLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptUpdatedLine(
      item: ItemReceiptUpdatedLineItem.fromMap(source['item']),
      pendingReturnQuantity: readDecimal(source['pending_return_quantity']),
      purchaseOrderLine: ItemReceiptUpdatedLinePurchaseOrderLine.fromMap(
          source['purchase_order_line']),
      receiptQuantity: readDecimal(source['receipt_quantity']),
      receivedQuantity: readDecimal(source['received_quantity']),
      returnedQuantity: readDecimal(source['returned_quantity']),
      uom: ItemReceiptUpdatedLineUom.fromMap(source['uom']),
      warehouse: ItemReceiptUpdatedLineWarehouse.fromMap(source['warehouse']),
    );
  }

  final ItemReceiptUpdatedLineItem? item;

  final double? pendingReturnQuantity;

  final ItemReceiptUpdatedLinePurchaseOrderLine? purchaseOrderLine;

  final double? receiptQuantity;

  final double? receivedQuantity;

  final double? returnedQuantity;

  final ItemReceiptUpdatedLineUom? uom;

  final ItemReceiptUpdatedLineWarehouse? warehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'item': item,
        'pending_return_quantity': pendingReturnQuantity,
        'purchase_order_line': purchaseOrderLine,
        'receipt_quantity': receiptQuantity,
        'received_quantity': receivedQuantity,
        'returned_quantity': returnedQuantity,
        'uom': uom,
        'warehouse': warehouse,
      };
}

/// A [ItemReceiptUpdated]'s `created_by`.
class ItemReceiptUpdatedCreatedBy extends Dto {
  const ItemReceiptUpdatedCreatedBy({
    this.name,
    this.object,
  });

  static ItemReceiptUpdatedCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptUpdatedCreatedBy(
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'object': object,
      };
}

/// A [ItemReceiptUpdated]'s `last_updated_by`.
class ItemReceiptUpdatedLastUpdatedBy extends Dto {
  const ItemReceiptUpdatedLastUpdatedBy({
    this.name,
    this.object,
  });

  static ItemReceiptUpdatedLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptUpdatedLastUpdatedBy(
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'object': object,
      };
}

/// A [ItemReceiptLine]'s `purchase_order_line`.
class ItemReceiptLinePurchaseOrderLine extends Dto {
  const ItemReceiptLinePurchaseOrderLine({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ItemReceiptLinePurchaseOrderLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptLinePurchaseOrderLine(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [ItemReceiptLine]'s `item`.
class ItemReceiptLineItem extends Dto {
  const ItemReceiptLineItem({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ItemReceiptLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptLineItem(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [ItemReceiptLine]'s `uom`.
class ItemReceiptLineUom extends Dto {
  const ItemReceiptLineUom({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ItemReceiptLineUom? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptLineUom(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [ItemReceiptLine]'s `warehouse`.
class ItemReceiptLineWarehouse extends Dto {
  const ItemReceiptLineWarehouse({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ItemReceiptLineWarehouse? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptLineWarehouse(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [ItemReceiptUpdatedLine]'s `purchase_order_line`.
class ItemReceiptUpdatedLinePurchaseOrderLine extends Dto {
  const ItemReceiptUpdatedLinePurchaseOrderLine({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ItemReceiptUpdatedLinePurchaseOrderLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptUpdatedLinePurchaseOrderLine(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [ItemReceiptUpdatedLine]'s `item`.
class ItemReceiptUpdatedLineItem extends Dto {
  const ItemReceiptUpdatedLineItem({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ItemReceiptUpdatedLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptUpdatedLineItem(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [ItemReceiptUpdatedLine]'s `uom`.
class ItemReceiptUpdatedLineUom extends Dto {
  const ItemReceiptUpdatedLineUom({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ItemReceiptUpdatedLineUom? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptUpdatedLineUom(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [ItemReceiptUpdatedLine]'s `warehouse`.
class ItemReceiptUpdatedLineWarehouse extends Dto {
  const ItemReceiptUpdatedLineWarehouse({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ItemReceiptUpdatedLineWarehouse? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemReceiptUpdatedLineWarehouse(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}
