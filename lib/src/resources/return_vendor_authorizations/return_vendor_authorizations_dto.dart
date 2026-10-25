/// Typed views over the v4 return vendor authorizations bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// One return vendor authorization, as the listing returns it.
class ReturnVendorAuthorization extends Dto {
  const ReturnVendorAuthorization({
    this.account,
    this.code,
    this.createdBy,
    this.createdOn,
    this.href,
    this.id,
    this.itemCount,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.note,
    this.object,
    this.purchaseOrder,
    this.returnStatus,
    this.rvaDate,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/return_vendor_authorizations',
  ];

  static ReturnVendorAuthorization? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnVendorAuthorization(
      account: ReturnVendorAuthorizationAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy:
          ReturnVendorAuthorizationCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      href: readText(source['href']),
      id: readText(source['id']),
      itemCount: readInteger(source['item_count']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      note: readText(source['note']),
      object: readText(source['object']),
      purchaseOrder: ReturnVendorAuthorizationPurchaseOrder.fromMap(
          source['purchase_order']),
      returnStatus: readText(source['return_status']),
      rvaDate: readText(source['rva_date']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final ReturnVendorAuthorizationAccount? account;

  final String? code;

  final ReturnVendorAuthorizationCreatedBy? createdBy;

  final String? createdOn;

  final String? href;

  final String? id;

  final int? itemCount;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedOn;

  final String? note;

  final String? object;

  final ReturnVendorAuthorizationPurchaseOrder? purchaseOrder;

  final String? returnStatus;

  final String? rvaDate;

  final String? status;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'href': href,
        'id': id,
        'item_count': itemCount,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'note': note,
        'object': object,
        'purchase_order': purchaseOrder,
        'return_status': returnStatus,
        'rva_date': rvaDate,
        'status': status,
        'version': version,
      };
}

/// One page of `ReturnVendorAuthorization` records, under `data`; paged by
/// cursor.
class ReturnVendorAuthorizationList extends Dto {
  const ReturnVendorAuthorizationList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/return_vendor_authorizations',
  ];

  static ReturnVendorAuthorizationList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnVendorAuthorizationList(
      data: readList<ReturnVendorAuthorization>(
          source['data'], ReturnVendorAuthorization.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<ReturnVendorAuthorization?>? data;

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

/// What `getReturnVendorAuthorization` answers, under
/// `return_vendor_authorization`: the listing's record with its `lines` and
/// `receive_rvas`.
class ReturnVendorAuthorizationView extends Dto {
  const ReturnVendorAuthorizationView({
    this.account,
    this.code,
    this.createdBy,
    this.createdOn,
    this.href,
    this.id,
    this.itemCount,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.note,
    this.object,
    this.purchaseOrder,
    this.returnStatus,
    this.rvaDate,
    this.status,
    this.version,
    this.lines,
    this.receiveRvas,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/return_vendor_authorizations/{rva_id}',
  ];

  static ReturnVendorAuthorizationView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'return_vendor_authorization');
    if (source == null) return null;
    return ReturnVendorAuthorizationView(
      account: ReturnVendorAuthorizationAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy:
          ReturnVendorAuthorizationCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      href: readText(source['href']),
      id: readText(source['id']),
      itemCount: readInteger(source['item_count']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      note: readText(source['note']),
      object: readText(source['object']),
      purchaseOrder: ReturnVendorAuthorizationPurchaseOrder.fromMap(
          source['purchase_order']),
      returnStatus: readText(source['return_status']),
      rvaDate: readText(source['rva_date']),
      status: readText(source['status']),
      version: readInteger(source['version']),
      lines: readList<Object>(source['lines'], readAny),
      receiveRvas: readList<Object>(source['receive_rvas'], readAny),
    );
  }

  final ReturnVendorAuthorizationAccount? account;

  final String? code;

  final ReturnVendorAuthorizationCreatedBy? createdBy;

  final String? createdOn;

  final String? href;

  final String? id;

  final int? itemCount;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedOn;

  final String? note;

  final String? object;

  final ReturnVendorAuthorizationPurchaseOrder? purchaseOrder;

  final String? returnStatus;

  final String? rvaDate;

  final String? status;

  final int? version;

  /// Empty in every record measured, so the entries are untyped.
  final List<Object?>? lines;

  /// Empty in every record measured, so the entries are untyped.
  final List<Object?>? receiveRvas;

  @override
  String? get envelopeKey => 'return_vendor_authorization';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'href': href,
        'id': id,
        'item_count': itemCount,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'note': note,
        'object': object,
        'purchase_order': purchaseOrder,
        'return_status': returnStatus,
        'rva_date': rvaDate,
        'status': status,
        'version': version,
        'lines': lines,
        'receive_rvas': receiveRvas,
      };
}

/// A [ReturnVendorAuthorization]'s `account`.
class ReturnVendorAuthorizationAccount extends Dto {
  const ReturnVendorAuthorizationAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ReturnVendorAuthorizationAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnVendorAuthorizationAccount(
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

/// A [ReturnVendorAuthorization]'s `purchase_order`.
class ReturnVendorAuthorizationPurchaseOrder extends Dto {
  const ReturnVendorAuthorizationPurchaseOrder({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static ReturnVendorAuthorizationPurchaseOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnVendorAuthorizationPurchaseOrder(
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

/// A [ReturnVendorAuthorization]'s `created_by`.
class ReturnVendorAuthorizationCreatedBy extends Dto {
  const ReturnVendorAuthorizationCreatedBy({
    this.name,
    this.object,
  });

  static ReturnVendorAuthorizationCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnVendorAuthorizationCreatedBy(
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
