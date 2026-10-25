/// Typed views over the v4 item fulfillments bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The item fulfillment body.
class ItemFulfillment extends Dto {
  const ItemFulfillment({
    this.account,
    this.code,
    this.createdBy,
    this.createdOn,
    this.customAttributes,
    this.date,
    this.deliveryStatus,
    this.fulfillmentCompleted,
    this.fulfillmentDate,
    this.fulfillmentNote,
    this.fulfillmentStatus,
    this.fulfillments,
    this.href,
    this.id,
    this.invoice,
    this.invoiceId,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.note,
    this.object,
    this.order,
    this.orderId,
    this.status,
    this.trackingNumber,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/item_fulfillments',
  ];

  static ItemFulfillment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillment(
      account: ItemFulfillmentAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      customAttributes: readAny(source['custom_attributes']),
      date: readText(source['date']),
      deliveryStatus: readAny(source['delivery_status']),
      fulfillmentCompleted: readFlag(source['fulfillment_completed']),
      fulfillmentDate: readText(source['fulfillment_date']),
      fulfillmentNote: readText(source['fulfillment_note']),
      fulfillmentStatus: readText(source['fulfillment_status']),
      fulfillments: readList<ItemFulfillmentFulfillment>(
          source['fulfillments'], ItemFulfillmentFulfillment.fromMap),
      href: readText(source['href']),
      id: readText(source['id']),
      invoice: ItemFulfillmentInvoice.fromMap(source['invoice']),
      invoiceId: readText(source['invoice_id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      note: readText(source['note']),
      object: readText(source['object']),
      order: readAny(source['order']),
      orderId: readText(source['order_id']),
      status: readText(source['status']),
      trackingNumber: readText(source['tracking_number']),
      uuid: readText(source['uuid']),
      version: readAny(source['version']),
    );
  }

  final ItemFulfillmentAccount? account;

  final String? code;

  /// Untyped: a String on some records and a map on others.
  final Object? createdBy;

  final String? createdOn;

  final Object? customAttributes;

  final String? date;

  /// Untyped: never populated in the records measured.
  final Object? deliveryStatus;

  final bool? fulfillmentCompleted;

  final String? fulfillmentDate;

  final String? fulfillmentNote;

  final String? fulfillmentStatus;

  final List<ItemFulfillmentFulfillment?>? fulfillments;

  final String? href;

  final String? id;

  final ItemFulfillmentInvoice? invoice;

  final String? invoiceId;

  /// Untyped: a String on some records and a map on others.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? note;

  final String? object;

  /// Untyped: never populated in the records measured.
  final Object? order;

  final String? orderId;

  final String? status;

  final String? trackingNumber;

  final String? uuid;

  /// Untyped: a String on some records and an int on others.
  final Object? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_attributes': customAttributes,
        'date': date,
        'delivery_status': deliveryStatus,
        'fulfillment_completed': fulfillmentCompleted,
        'fulfillment_date': fulfillmentDate,
        'fulfillment_note': fulfillmentNote,
        'fulfillment_status': fulfillmentStatus,
        'fulfillments': fulfillments,
        'href': href,
        'id': id,
        'invoice': invoice,
        'invoice_id': invoiceId,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'note': note,
        'object': object,
        'order': order,
        'order_id': orderId,
        'status': status,
        'tracking_number': trackingNumber,
        'uuid': uuid,
        'version': version,
      };
}

/// A page of ItemFulfillment records.
class ItemFulfillmentList extends Dto {
  const ItemFulfillmentList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/item_fulfillments',
  ];

  static ItemFulfillmentList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentList(
      data: readList<ItemFulfillment>(source['data'], ItemFulfillment.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<ItemFulfillment?>? data;

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

/// The item fulfillment read body.
class ItemFulfillmentRead extends Dto {
  const ItemFulfillmentRead({
    this.account,
    this.code,
    this.createdBy,
    this.createdOn,
    this.customAttributes,
    this.deliveryStatus,
    this.fulfillmentCompleted,
    this.fulfillmentDate,
    this.fulfillmentNote,
    this.fulfillmentStatus,
    this.fulfillments,
    this.href,
    this.id,
    this.invoice,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.order,
    this.status,
    this.trackingNumber,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/invoices/{invoice_id}/item_fulfillments',
    'GET /api/{api_version}/invoices/{invoice_id}/item_fulfillments/{fulfillment_id}',
    'GET /api/{api_version}/item_fulfillments/{fulfillment_id}',
  ];

  static ItemFulfillmentRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item_fulfillment');
    if (source == null) return null;
    return ItemFulfillmentRead(
      account: ItemFulfillmentReadAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy: ItemFulfillmentReadCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      customAttributes: readAny(source['custom_attributes']),
      deliveryStatus: readAny(source['delivery_status']),
      fulfillmentCompleted: readFlag(source['fulfillment_completed']),
      fulfillmentDate: readText(source['fulfillment_date']),
      fulfillmentNote: readText(source['fulfillment_note']),
      fulfillmentStatus: readText(source['fulfillment_status']),
      fulfillments: readList<ItemFulfillmentReadFulfillment>(
          source['fulfillments'], ItemFulfillmentReadFulfillment.fromMap),
      href: readText(source['href']),
      id: readText(source['id']),
      invoice: ItemFulfillmentReadInvoice.fromMap(source['invoice']),
      lastUpdatedBy:
          ItemFulfillmentReadLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      order: readAny(source['order']),
      status: readText(source['status']),
      trackingNumber: readText(source['tracking_number']),
      version: readInteger(source['version']),
    );
  }

  final ItemFulfillmentReadAccount? account;

  final String? code;

  final ItemFulfillmentReadCreatedBy? createdBy;

  final String? createdOn;

  final Object? customAttributes;

  /// Untyped: never populated in the records measured.
  final Object? deliveryStatus;

  final bool? fulfillmentCompleted;

  final String? fulfillmentDate;

  final String? fulfillmentNote;

  final String? fulfillmentStatus;

  final List<ItemFulfillmentReadFulfillment?>? fulfillments;

  final String? href;

  final String? id;

  final ItemFulfillmentReadInvoice? invoice;

  final ItemFulfillmentReadLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  /// Untyped: never populated in the records measured.
  final Object? order;

  final String? status;

  final String? trackingNumber;

  final int? version;

  @override
  String? get envelopeKey => 'item_fulfillment';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_attributes': customAttributes,
        'delivery_status': deliveryStatus,
        'fulfillment_completed': fulfillmentCompleted,
        'fulfillment_date': fulfillmentDate,
        'fulfillment_note': fulfillmentNote,
        'fulfillment_status': fulfillmentStatus,
        'fulfillments': fulfillments,
        'href': href,
        'id': id,
        'invoice': invoice,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'order': order,
        'status': status,
        'tracking_number': trackingNumber,
        'version': version,
      };
}

/// The item fulfillments body.
class ItemFulfillments extends Dto {
  const ItemFulfillments({
    this.activityLogs,
    this.code,
    this.fulfillmentDate,
    this.fulfillmentNote,
    this.fulfillmentStatus,
    this.href,
    this.id,
    this.itemFulfillment,
    this.object,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/item_fulfillments',
  ];

  static ItemFulfillments? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item_fulfillment');
    if (source == null) return null;
    return ItemFulfillments(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      code: readText(source['code']),
      fulfillmentDate: readText(source['fulfillment_date']),
      fulfillmentNote: readAny(source['fulfillment_note']),
      fulfillmentStatus: readText(source['fulfillment_status']),
      href: readText(source['href']),
      id: readText(source['id']),
      itemFulfillment: readAny(source['item_fulfillment']),
      object: readText(source['object']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final List<Object?>? activityLogs;

  final String? code;

  final String? fulfillmentDate;

  /// Untyped: null in every record measured.
  final Object? fulfillmentNote;

  final String? fulfillmentStatus;

  final String? href;

  final String? id;

  final Object? itemFulfillment;

  final String? object;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'item_fulfillment';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'code': code,
        'fulfillment_date': fulfillmentDate,
        'fulfillment_note': fulfillmentNote,
        'fulfillment_status': fulfillmentStatus,
        'href': href,
        'id': id,
        'item_fulfillment': itemFulfillment,
        'object': object,
        'status': status,
        'version': version,
      };
}

/// The item fulfillment updated body.
class ItemFulfillmentUpdated extends Dto {
  const ItemFulfillmentUpdated({
    this.code,
    this.href,
    this.id,
    this.note,
    this.object,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/item_fulfillments/{fulfillment_id}',
  ];

  static ItemFulfillmentUpdated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item_fulfillment');
    if (source == null) return null;
    return ItemFulfillmentUpdated(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      note: readText(source['note']),
      object: readText(source['object']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? note;

  final String? object;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'item_fulfillment';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'note': note,
        'object': object,
        'status': status,
        'version': version,
      };
}

/// What `createItemFulfillmentNote` answers, under `note`.
class ItemFulfillmentNotes extends Dto {
  const ItemFulfillmentNotes({
    this.href,
    this.id,
    this.itemFulfillment,
    this.object,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/item_fulfillments/{fulfillment_id}/notes',
  ];

  static ItemFulfillmentNotes? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return ItemFulfillmentNotes(
      href: readText(source['href']),
      id: readText(source['id']),
      itemFulfillment: ItemFulfillmentNotesItemFulfillment.fromMap(
          source['item_fulfillment']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final ItemFulfillmentNotesItemFulfillment? itemFulfillment;

  final String? object;

  @override
  String? get envelopeKey => 'note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'item_fulfillment': itemFulfillment,
        'object': object,
      };
}

/// A [ItemFulfillmentRead]'s `account`.
class ItemFulfillmentReadAccount extends Dto {
  const ItemFulfillmentReadAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ItemFulfillmentReadAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentReadAccount(
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

/// A [ItemFulfillmentRead]'s `invoice`.
class ItemFulfillmentReadInvoice extends Dto {
  const ItemFulfillmentReadInvoice({
    this.href,
    this.id,
    this.object,
  });

  static ItemFulfillmentReadInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentReadInvoice(
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'object': object,
      };
}

/// One entry of a [ItemFulfillmentRead]'s `fulfillments`.
class ItemFulfillmentReadFulfillment extends Dto {
  const ItemFulfillmentReadFulfillment({
    this.fulfillmentIndex,
    this.fulfillmentQty,
    this.fulfillmentSentQty,
    this.id,
    this.inventoryTracking,
    this.item,
    this.object,
    this.pendingReturn,
    this.returned,
    this.servingStatus,
    this.uom,
    this.uomPrecision,
  });

  static ItemFulfillmentReadFulfillment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentReadFulfillment(
      fulfillmentIndex: readInteger(source['fulfillment_index']),
      fulfillmentQty: readDecimal(source['fulfillment_qty']),
      fulfillmentSentQty: readDecimal(source['fulfillment_sent_qty']),
      id: readText(source['id']),
      inventoryTracking: readAny(source['inventory_tracking']),
      item: ItemFulfillmentReadFulfillmentItem.fromMap(source['item']),
      object: readText(source['object']),
      pendingReturn: readDecimal(source['pending_return']),
      returned: readDecimal(source['returned']),
      servingStatus: readText(source['serving_status']),
      uom: readText(source['uom']),
      uomPrecision: readInteger(source['uom_precision']),
    );
  }

  final int? fulfillmentIndex;

  final double? fulfillmentQty;

  final double? fulfillmentSentQty;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? inventoryTracking;

  final ItemFulfillmentReadFulfillmentItem? item;

  final String? object;

  final double? pendingReturn;

  final double? returned;

  final String? servingStatus;

  final String? uom;

  final int? uomPrecision;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'fulfillment_index': fulfillmentIndex,
        'fulfillment_qty': fulfillmentQty,
        'fulfillment_sent_qty': fulfillmentSentQty,
        'id': id,
        'inventory_tracking': inventoryTracking,
        'item': item,
        'object': object,
        'pending_return': pendingReturn,
        'returned': returned,
        'serving_status': servingStatus,
        'uom': uom,
        'uom_precision': uomPrecision,
      };
}

/// A [ItemFulfillmentRead]'s `created_by`.
class ItemFulfillmentReadCreatedBy extends Dto {
  const ItemFulfillmentReadCreatedBy({
    this.name,
    this.object,
  });

  static ItemFulfillmentReadCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentReadCreatedBy(
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

/// A [ItemFulfillmentRead]'s `last_updated_by`.
class ItemFulfillmentReadLastUpdatedBy extends Dto {
  const ItemFulfillmentReadLastUpdatedBy({
    this.name,
    this.object,
  });

  static ItemFulfillmentReadLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentReadLastUpdatedBy(
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

/// A [ItemFulfillment]'s `account`.
class ItemFulfillmentAccount extends Dto {
  const ItemFulfillmentAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ItemFulfillmentAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentAccount(
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

/// A [ItemFulfillment]'s `invoice`.
class ItemFulfillmentInvoice extends Dto {
  const ItemFulfillmentInvoice({
    this.href,
    this.id,
    this.object,
  });

  static ItemFulfillmentInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentInvoice(
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'object': object,
      };
}

/// One entry of a [ItemFulfillment]'s `fulfillments`.
class ItemFulfillmentFulfillment extends Dto {
  const ItemFulfillmentFulfillment({
    this.fulfillmentIndex,
    this.fulfillmentQty,
    this.fulfillmentSentQty,
    this.id,
    this.inventoryTracking,
    this.item,
    this.object,
    this.pendingReturn,
    this.returned,
    this.servingStatus,
    this.uom,
    this.uomPrecision,
  });

  static ItemFulfillmentFulfillment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentFulfillment(
      fulfillmentIndex: readInteger(source['fulfillment_index']),
      fulfillmentQty: readDecimal(source['fulfillment_qty']),
      fulfillmentSentQty: readDecimal(source['fulfillment_sent_qty']),
      id: readText(source['id']),
      inventoryTracking: readAny(source['inventory_tracking']),
      item: ItemFulfillmentFulfillmentItem.fromMap(source['item']),
      object: readText(source['object']),
      pendingReturn: readDecimal(source['pending_return']),
      returned: readDecimal(source['returned']),
      servingStatus: readText(source['serving_status']),
      uom: readText(source['uom']),
      uomPrecision: readInteger(source['uom_precision']),
    );
  }

  final int? fulfillmentIndex;

  final double? fulfillmentQty;

  final double? fulfillmentSentQty;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? inventoryTracking;

  final ItemFulfillmentFulfillmentItem? item;

  final String? object;

  final double? pendingReturn;

  final double? returned;

  final String? servingStatus;

  final String? uom;

  final int? uomPrecision;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'fulfillment_index': fulfillmentIndex,
        'fulfillment_qty': fulfillmentQty,
        'fulfillment_sent_qty': fulfillmentSentQty,
        'id': id,
        'inventory_tracking': inventoryTracking,
        'item': item,
        'object': object,
        'pending_return': pendingReturn,
        'returned': returned,
        'serving_status': servingStatus,
        'uom': uom,
        'uom_precision': uomPrecision,
      };
}

/// A [ItemFulfillmentNotes]'s `item_fulfillment`.
class ItemFulfillmentNotesItemFulfillment extends Dto {
  const ItemFulfillmentNotesItemFulfillment({
    this.href,
    this.id,
    this.object,
  });

  static ItemFulfillmentNotesItemFulfillment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentNotesItemFulfillment(
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'object': object,
      };
}

/// A [ItemFulfillmentReadFulfillment]'s `item`.
class ItemFulfillmentReadFulfillmentItem extends Dto {
  const ItemFulfillmentReadFulfillmentItem({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ItemFulfillmentReadFulfillmentItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentReadFulfillmentItem(
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

/// A [ItemFulfillmentFulfillment]'s `item`.
class ItemFulfillmentFulfillmentItem extends Dto {
  const ItemFulfillmentFulfillmentItem({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ItemFulfillmentFulfillmentItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentFulfillmentItem(
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

/// One fulfillment note as the notes listing and read answer it; the note is
/// stored on the fulfillment's sale invoice.
class ItemFulfillmentNote extends Dto {
  const ItemFulfillmentNote({
    this.attachments,
    this.content,
    this.createdBy,
    this.createdOn,
    this.group,
    this.href,
    this.id,
    this.itemFulfillment,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.user,
    this.version,
    this.watchers,
  });

  static ItemFulfillmentNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentNote(
      attachments: readList<ItemFulfillmentNoteAttachment>(
          source['attachments'], ItemFulfillmentNoteAttachment.fromMap),
      content: readText(source['content']),
      createdBy: ItemFulfillmentCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      itemFulfillment:
          ItemFulfillmentNotesDetail.fromMap(source['item_fulfillment']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<ItemFulfillmentNoteWatcher>(
          source['watchers'], ItemFulfillmentNoteWatcher.fromMap),
    );
  }

  final List<ItemFulfillmentNoteAttachment?>? attachments;

  final String? content;

  final ItemFulfillmentCreatedBy? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? group;

  final String? href;

  final String? id;

  final ItemFulfillmentNotesDetail? itemFulfillment;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedOn;

  final String? object;

  /// Null in every record measured, so untyped.
  final Object? user;

  final int? version;

  final List<ItemFulfillmentNoteWatcher?>? watchers;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'attachments': attachments,
        'content': content,
        'created_by': createdBy,
        'created_on': createdOn,
        'group': group,
        'href': href,
        'id': id,
        'item_fulfillment': itemFulfillment,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// One entry of a [ItemFulfillmentNote]'s `attachments`.
class ItemFulfillmentNoteAttachment extends Dto {
  const ItemFulfillmentNoteAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static ItemFulfillmentNoteAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentNoteAttachment(
      contentType: readText(source['content_type']),
      filename: readText(source['filename']),
      href: readText(source['href']),
      size: readInteger(source['size']),
      uuid: readText(source['uuid']),
    );
  }

  final String? contentType;

  final String? filename;

  final String? href;

  final int? size;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'content_type': contentType,
        'filename': filename,
        'href': href,
        'size': size,
        'uuid': uuid,
      };
}

/// One entry of a [ItemFulfillmentNote]'s `watchers`.
class ItemFulfillmentNoteWatcher extends Dto {
  const ItemFulfillmentNoteWatcher({
    this.email,
    this.name,
    this.type,
  });

  static ItemFulfillmentNoteWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentNoteWatcher(
      email: readText(source['email']),
      name: readText(source['name']),
      type: readText(source['type']),
    );
  }

  final String? email;

  final String? name;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'email': email,
        'name': name,
        'type': type,
      };
}

/// One page of `ItemFulfillmentNote` records, under `data`.
class ItemFulfillmentNoteList extends Dto {
  const ItemFulfillmentNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/item_fulfillments/{fulfillment_id}/notes',
  ];

  static ItemFulfillmentNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentNoteList(
      data: readList<ItemFulfillmentNote>(
          source['data'], ItemFulfillmentNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<ItemFulfillmentNote?>? data;

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

/// What `getItemFulfillmentNote` answers: the note under
/// `item_fulfillment.note`.
class ItemFulfillmentNoteRead extends Dto {
  const ItemFulfillmentNoteRead({
    this.note,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/item_fulfillments/{fulfillment_id}/notes/{note_id}',
  ];

  static ItemFulfillmentNoteRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item_fulfillment');
    if (source == null) return null;
    return ItemFulfillmentNoteRead(
      note: ItemFulfillmentNote.fromMap(source['note']),
    );
  }

  final ItemFulfillmentNote? note;

  @override
  String? get envelopeKey => 'item_fulfillment';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'note': note,
      };
}

/// A [ItemFulfillmentNotes]'s `item_fulfillment`.
class ItemFulfillmentNotesDetail extends Dto {
  const ItemFulfillmentNotesDetail({
    this.href,
    this.id,
    this.object,
  });

  static ItemFulfillmentNotesDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentNotesDetail(
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'object': object,
      };
}

/// A [ItemFulfillment]'s `created_by`.
class ItemFulfillmentCreatedBy extends Dto {
  const ItemFulfillmentCreatedBy({
    this.name,
    this.object,
  });

  static ItemFulfillmentCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ItemFulfillmentCreatedBy(
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
