/// Typed views over the v4 return merchandise authorisations bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The return merchandise authorisation body.
class ReturnMerchandiseAuthorisation extends Dto {
  const ReturnMerchandiseAuthorisation({
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
    this.returnStatus,
    this.rmaDate,
    this.saleInvoice,
    this.saleOrder,
    this.status,
    this.version,
    this.warehouse,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/return_merchandise_authorisations',
  ];

  static ReturnMerchandiseAuthorisation? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnMerchandiseAuthorisation(
      account: ReturnMerchandiseAuthorisationAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy:
          ReturnMerchandiseAuthorisationCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      href: readText(source['href']),
      id: readText(source['id']),
      itemCount: readInteger(source['item_count']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      note: readText(source['note']),
      object: readText(source['object']),
      returnStatus: readText(source['return_status']),
      rmaDate: readText(source['rma_date']),
      saleInvoice: ReturnMerchandiseAuthorisationSaleInvoice.fromMap(
          source['sale_invoice']),
      saleOrder: readAny(source['sale_order']),
      status: readText(source['status']),
      version: readInteger(source['version']),
      warehouse: readAny(source['warehouse']),
    );
  }

  final ReturnMerchandiseAuthorisationAccount? account;

  final String? code;

  final ReturnMerchandiseAuthorisationCreatedBy? createdBy;

  final String? createdOn;

  final String? href;

  final String? id;

  final int? itemCount;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedOn;

  final String? note;

  final String? object;

  final String? returnStatus;

  final String? rmaDate;

  final ReturnMerchandiseAuthorisationSaleInvoice? saleInvoice;

  /// Untyped: never populated in the records measured.
  final Object? saleOrder;

  final String? status;

  final int? version;

  /// Untyped: never populated in the records measured.
  final Object? warehouse;

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
        'return_status': returnStatus,
        'rma_date': rmaDate,
        'sale_invoice': saleInvoice,
        'sale_order': saleOrder,
        'status': status,
        'version': version,
        'warehouse': warehouse,
      };
}

/// A page of ReturnMerchandiseAuthorisation records.
class ReturnMerchandiseAuthorisationList extends Dto {
  const ReturnMerchandiseAuthorisationList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/return_merchandise_authorisations',
  ];

  static ReturnMerchandiseAuthorisationList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnMerchandiseAuthorisationList(
      data: readList<ReturnMerchandiseAuthorisation>(
          source['data'], ReturnMerchandiseAuthorisation.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<ReturnMerchandiseAuthorisation?>? data;

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

/// The invoice return merchandise authorisation receive body.
class InvoiceReturnMerchandiseAuthorisationReceive extends Dto {
  const InvoiceReturnMerchandiseAuthorisationReceive({
    this.code,
    this.createdBy,
    this.createdOn,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.quantityReceived,
    this.receiveReturns,
    this.status,
    this.uuid,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations/{rma_code}/receive',
    'GET /api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations/{rma_code}/receive/{receive_uuid}',
  ];

  static InvoiceReturnMerchandiseAuthorisationReceive? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'receive_rma');
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationReceive(
      code: readText(source['code']),
      createdBy: InvoiceReturnMerchandiseAuthorisationReceiveCreatedBy.fromMap(
          source['created_by']),
      createdOn: readText(source['created_on']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      quantityReceived: readDecimal(source['quantity_received']),
      receiveReturns: readList<Object>(source['receive_returns'], readAny),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
    );
  }

  final String? code;

  final InvoiceReturnMerchandiseAuthorisationReceiveCreatedBy? createdBy;

  final String? createdOn;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final String? object;

  final double? quantityReceived;

  final List<Object?>? receiveReturns;

  final String? status;

  final String? uuid;

  @override
  String? get envelopeKey => 'receive_rma';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'quantity_received': quantityReceived,
        'receive_returns': receiveReturns,
        'status': status,
        'uuid': uuid,
      };
}

/// A page of InvoiceReturnMerchandiseAuthorisationReceive records.
class InvoiceReturnMerchandiseAuthorisationReceiveList extends Dto {
  const InvoiceReturnMerchandiseAuthorisationReceiveList({
    this.receiveReturnMerchandiseAuthorisations,
    this.pagination,
    this.object,
    this.url,
    this.data,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations/{rma_code}/receive',
  ];

  static InvoiceReturnMerchandiseAuthorisationReceiveList? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationReceiveList(
      receiveReturnMerchandiseAuthorisations:
          readList<InvoiceReturnMerchandiseAuthorisationReceive>(
              source['receive_return_merchandise_authorisations'],
              InvoiceReturnMerchandiseAuthorisationReceive.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<InvoiceReturnMerchandiseAuthorisationReceiveEntry>(
          source['data'],
          InvoiceReturnMerchandiseAuthorisationReceiveEntry.fromMap),
    );
  }

  final List<InvoiceReturnMerchandiseAuthorisationReceive?>?
      receiveReturnMerchandiseAuthorisations;

  final Pagination? pagination;

  final String? object;

  final String? url;

  final List<InvoiceReturnMerchandiseAuthorisationReceiveEntry?>? data;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'receive_return_merchandise_authorisations':
            receiveReturnMerchandiseAuthorisations,
        'pagination': pagination,
        'object': object,
        'url': url,
        'data': data,
      };
}

/// The return merchandise authorisation read body.
class ReturnMerchandiseAuthorisationRead extends Dto {
  const ReturnMerchandiseAuthorisationRead({
    this.account,
    this.code,
    this.createdBy,
    this.createdOn,
    this.href,
    this.id,
    this.itemCount,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.lines,
    this.note,
    this.object,
    this.receiveRmas,
    this.returnStatus,
    this.rmaDate,
    this.saleInvoice,
    this.saleOrder,
    this.status,
    this.version,
    this.warehouse,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations/{rma_id}',
    'GET /api/{api_version}/return_merchandise_authorisations/{rma_id}',
  ];

  static ReturnMerchandiseAuthorisationRead? fromMap(Object? body) {
    final source =
        readRecord(body, envelopeKey: 'return_merchandise_authorisation');
    if (source == null) return null;
    return ReturnMerchandiseAuthorisationRead(
      account:
          ReturnMerchandiseAuthorisationReadAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy: ReturnMerchandiseAuthorisationReadCreatedBy.fromMap(
          source['created_by']),
      createdOn: readText(source['created_on']),
      href: readText(source['href']),
      id: readText(source['id']),
      itemCount: readInteger(source['item_count']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      lines: readList<Object>(source['lines'], readAny),
      note: readText(source['note']),
      object: readText(source['object']),
      receiveRmas: readList<ReturnMerchandiseAuthorisationReadReceiveRma>(
          source['receive_rmas'],
          ReturnMerchandiseAuthorisationReadReceiveRma.fromMap),
      returnStatus: readText(source['return_status']),
      rmaDate: readText(source['rma_date']),
      saleInvoice: ReturnMerchandiseAuthorisationReadSaleInvoice.fromMap(
          source['sale_invoice']),
      saleOrder: readAny(source['sale_order']),
      status: readText(source['status']),
      version: readInteger(source['version']),
      warehouse: readAny(source['warehouse']),
    );
  }

  final ReturnMerchandiseAuthorisationReadAccount? account;

  final String? code;

  final ReturnMerchandiseAuthorisationReadCreatedBy? createdBy;

  final String? createdOn;

  final String? href;

  final String? id;

  final int? itemCount;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedOn;

  final List<Object?>? lines;

  final String? note;

  final String? object;

  final List<ReturnMerchandiseAuthorisationReadReceiveRma?>? receiveRmas;

  final String? returnStatus;

  final String? rmaDate;

  final ReturnMerchandiseAuthorisationReadSaleInvoice? saleInvoice;

  /// Untyped: never populated in the records measured.
  final Object? saleOrder;

  final String? status;

  final int? version;

  /// Untyped: never populated in the records measured.
  final Object? warehouse;

  @override
  String? get envelopeKey => 'return_merchandise_authorisation';

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
        'lines': lines,
        'note': note,
        'object': object,
        'receive_rmas': receiveRmas,
        'return_status': returnStatus,
        'rma_date': rmaDate,
        'sale_invoice': saleInvoice,
        'sale_order': saleOrder,
        'status': status,
        'version': version,
        'warehouse': warehouse,
      };
}

/// The return merchandise authorisations body.
class ReturnMerchandiseAuthorisations extends Dto {
  const ReturnMerchandiseAuthorisations({
    this.activityLogs,
    this.code,
    this.href,
    this.id,
    this.object,
    this.returnMerchandiseAuthorisation,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/return_merchandise_authorisations',
  ];

  static ReturnMerchandiseAuthorisations? fromMap(Object? body) {
    final source =
        readRecord(body, envelopeKey: 'return_merchandise_authorisation');
    if (source == null) return null;
    return ReturnMerchandiseAuthorisations(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
      returnMerchandiseAuthorisation:
          readAny(source['return_merchandise_authorisation']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  final String? code;

  final String? href;

  final String? id;

  final String? object;

  final Object? returnMerchandiseAuthorisation;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'return_merchandise_authorisation';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'code': code,
        'href': href,
        'id': id,
        'object': object,
        'return_merchandise_authorisation': returnMerchandiseAuthorisation,
        'status': status,
        'version': version,
      };
}

/// A [ReturnMerchandiseAuthorisationRead]'s `account`.
class ReturnMerchandiseAuthorisationReadAccount extends Dto {
  const ReturnMerchandiseAuthorisationReadAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ReturnMerchandiseAuthorisationReadAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnMerchandiseAuthorisationReadAccount(
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

/// A [ReturnMerchandiseAuthorisationRead]'s `sale_invoice`.
class ReturnMerchandiseAuthorisationReadSaleInvoice extends Dto {
  const ReturnMerchandiseAuthorisationReadSaleInvoice({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static ReturnMerchandiseAuthorisationReadSaleInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnMerchandiseAuthorisationReadSaleInvoice(
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

/// One entry of a [ReturnMerchandiseAuthorisationRead]'s `receive_rmas`.
class ReturnMerchandiseAuthorisationReadReceiveRma extends Dto {
  const ReturnMerchandiseAuthorisationReadReceiveRma({
    this.code,
    this.createdBy,
    this.createdOn,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.quantityReceived,
    this.status,
  });

  static ReturnMerchandiseAuthorisationReadReceiveRma? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnMerchandiseAuthorisationReadReceiveRma(
      code: readText(source['code']),
      createdBy: ReturnMerchandiseAuthorisationReadReceiveRmaCreatedBy.fromMap(
          source['created_by']),
      createdOn: readText(source['created_on']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      quantityReceived: readDecimal(source['quantity_received']),
      status: readText(source['status']),
    );
  }

  final String? code;

  final ReturnMerchandiseAuthorisationReadReceiveRmaCreatedBy? createdBy;

  final String? createdOn;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final String? object;

  final double? quantityReceived;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'quantity_received': quantityReceived,
        'status': status,
      };
}

/// A [ReturnMerchandiseAuthorisationRead]'s `created_by`.
class ReturnMerchandiseAuthorisationReadCreatedBy extends Dto {
  const ReturnMerchandiseAuthorisationReadCreatedBy({
    this.name,
    this.object,
  });

  static ReturnMerchandiseAuthorisationReadCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnMerchandiseAuthorisationReadCreatedBy(
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

/// One entry of a [InvoiceReturnMerchandiseAuthorisationReceiveList]'s `data`.
class InvoiceReturnMerchandiseAuthorisationReceiveEntry extends Dto {
  const InvoiceReturnMerchandiseAuthorisationReceiveEntry({
    this.code,
    this.createdBy,
    this.createdOn,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.quantityReceived,
    this.status,
  });

  static InvoiceReturnMerchandiseAuthorisationReceiveEntry? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationReceiveEntry(
      code: readText(source['code']),
      createdBy:
          InvoiceReturnMerchandiseAuthorisationReceiveEntryCreatedBy.fromMap(
              source['created_by']),
      createdOn: readText(source['created_on']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      quantityReceived: readDecimal(source['quantity_received']),
      status: readText(source['status']),
    );
  }

  final String? code;

  final InvoiceReturnMerchandiseAuthorisationReceiveEntryCreatedBy? createdBy;

  final String? createdOn;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final String? object;

  final double? quantityReceived;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'quantity_received': quantityReceived,
        'status': status,
      };
}

/// A [InvoiceReturnMerchandiseAuthorisationReceive]'s `created_by`.
class InvoiceReturnMerchandiseAuthorisationReceiveCreatedBy extends Dto {
  const InvoiceReturnMerchandiseAuthorisationReceiveCreatedBy({
    this.name,
    this.object,
  });

  static InvoiceReturnMerchandiseAuthorisationReceiveCreatedBy? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationReceiveCreatedBy(
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

/// A [ReturnMerchandiseAuthorisation]'s `account`.
class ReturnMerchandiseAuthorisationAccount extends Dto {
  const ReturnMerchandiseAuthorisationAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ReturnMerchandiseAuthorisationAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnMerchandiseAuthorisationAccount(
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

/// A [ReturnMerchandiseAuthorisation]'s `sale_invoice`.
class ReturnMerchandiseAuthorisationSaleInvoice extends Dto {
  const ReturnMerchandiseAuthorisationSaleInvoice({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static ReturnMerchandiseAuthorisationSaleInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnMerchandiseAuthorisationSaleInvoice(
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

/// A [ReturnMerchandiseAuthorisation]'s `created_by`.
class ReturnMerchandiseAuthorisationCreatedBy extends Dto {
  const ReturnMerchandiseAuthorisationCreatedBy({
    this.name,
    this.object,
  });

  static ReturnMerchandiseAuthorisationCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnMerchandiseAuthorisationCreatedBy(
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

/// A [ReturnMerchandiseAuthorisationReadReceiveRma]'s `created_by`.
class ReturnMerchandiseAuthorisationReadReceiveRmaCreatedBy extends Dto {
  const ReturnMerchandiseAuthorisationReadReceiveRmaCreatedBy({
    this.name,
    this.object,
  });

  static ReturnMerchandiseAuthorisationReadReceiveRmaCreatedBy? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReturnMerchandiseAuthorisationReadReceiveRmaCreatedBy(
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

/// A [InvoiceReturnMerchandiseAuthorisationReceiveEntry]'s `created_by`.
class InvoiceReturnMerchandiseAuthorisationReceiveEntryCreatedBy extends Dto {
  const InvoiceReturnMerchandiseAuthorisationReceiveEntryCreatedBy({
    this.name,
    this.object,
  });

  static InvoiceReturnMerchandiseAuthorisationReceiveEntryCreatedBy? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationReceiveEntryCreatedBy(
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
