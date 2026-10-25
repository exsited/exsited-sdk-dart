/// Typed views over the v4 purchase express bodies.
library;

import '../../client/dto.dart';

/// What `createPurchaseExpress` answers, under `purchase_express`.
class PurchaseExpress extends Dto {
  const PurchaseExpress({
    this.account,
    this.activityLogs,
    this.billTotal,
    this.code,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customAttributes,
    this.customForm,
    this.dueDate,
    this.dueTotal,
    this.expectedCompletionDate,
    this.href,
    this.id,
    this.isPriceTaxInclusive,
    this.issueDate,
    this.kpis,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.operationalStatus,
    this.origin,
    this.paidAmount,
    this.purchaseOrderNote,
    this.saleOrder,
    this.status,
    this.subtotal,
    this.supplierInvoiceId,
    this.taxTotal,
    this.total,
    this.version,
    this.warehouse,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/purchase_express',
  ];

  static PurchaseExpress? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_express');
    if (source == null) return null;
    return PurchaseExpress(
      account: PurchaseExpressAccount.fromMap(source['account']),
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      billTotal: readText(source['bill_total']),
      code: readText(source['code']),
      createdBy: PurchaseExpressCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: PurchaseExpressCurrency.fromMap(source['currency']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customForm: PurchaseExpressCustomForm.fromMap(source['custom_form']),
      dueDate: readText(source['due_date']),
      dueTotal: readText(source['due_total']),
      expectedCompletionDate: readAny(source['expected_completion_date']),
      href: readText(source['href']),
      id: readText(source['id']),
      isPriceTaxInclusive: readAny(source['is_price_tax_inclusive']),
      issueDate: readText(source['issue_date']),
      kpis: PurchaseExpressKpis.fromMap(source['kpis']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      operationalStatus: readText(source['operational_status']),
      origin: readAny(source['origin']),
      paidAmount: readText(source['paid_amount']),
      purchaseOrderNote: readAny(source['purchase_order_note']),
      saleOrder: readAny(source['sale_order']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      supplierInvoiceId: readAny(source['supplier_invoice_id']),
      taxTotal: readText(source['tax_total']),
      total: readText(source['total']),
      version: readInteger(source['version']),
      warehouse: readAny(source['warehouse']),
    );
  }

  final PurchaseExpressAccount? account;

  final List<Object?>? activityLogs;

  final String? billTotal;

  final String? code;

  final PurchaseExpressCreatedBy? createdBy;

  final String? createdOn;

  final PurchaseExpressCurrency? currency;

  final List<Object?>? customAttributes;

  final PurchaseExpressCustomForm? customForm;

  final String? dueDate;

  final String? dueTotal;

  /// Null in every record measured, so untyped.
  final Object? expectedCompletionDate;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? isPriceTaxInclusive;

  final String? issueDate;

  final PurchaseExpressKpis? kpis;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? operationalStatus;

  /// Null in every record measured, so untyped.
  final Object? origin;

  final String? paidAmount;

  /// Null in every record measured, so untyped.
  final Object? purchaseOrderNote;

  /// Null in every record measured, so untyped.
  final Object? saleOrder;

  final String? status;

  final String? subtotal;

  /// Null in every record measured, so untyped.
  final Object? supplierInvoiceId;

  final String? taxTotal;

  final String? total;

  final int? version;

  /// Null in every record measured, so untyped.
  final Object? warehouse;

  @override
  String? get envelopeKey => 'purchase_express';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'activity_logs': activityLogs,
        'bill_total': billTotal,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_attributes': customAttributes,
        'custom_form': customForm,
        'due_date': dueDate,
        'due_total': dueTotal,
        'expected_completion_date': expectedCompletionDate,
        'href': href,
        'id': id,
        'is_price_tax_inclusive': isPriceTaxInclusive,
        'issue_date': issueDate,
        'kpis': kpis,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'operational_status': operationalStatus,
        'origin': origin,
        'paid_amount': paidAmount,
        'purchase_order_note': purchaseOrderNote,
        'sale_order': saleOrder,
        'status': status,
        'subtotal': subtotal,
        'supplier_invoice_id': supplierInvoiceId,
        'tax_total': taxTotal,
        'total': total,
        'version': version,
        'warehouse': warehouse,
      };
}

/// A [PurchaseExpress]'s `account`.
class PurchaseExpressAccount extends Dto {
  const PurchaseExpressAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseExpressAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseExpressAccount(
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

/// A [PurchaseExpress]'s `created_by`.
class PurchaseExpressCreatedBy extends Dto {
  const PurchaseExpressCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseExpressCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseExpressCreatedBy(
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

/// A [PurchaseExpress]'s `currency`.
class PurchaseExpressCurrency extends Dto {
  const PurchaseExpressCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseExpressCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseExpressCurrency(
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

/// A [PurchaseExpress]'s `custom_form`.
class PurchaseExpressCustomForm extends Dto {
  const PurchaseExpressCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseExpressCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseExpressCustomForm(
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

/// A [PurchaseExpress]'s `kpis`.
class PurchaseExpressKpis extends Dto {
  const PurchaseExpressKpis({
    this.estimatedTotal,
    this.issueDate,
    this.lastCancelledOn,
    this.lastChangedOn,
    this.lastDeletedOn,
    this.lastInvoiceIssueDate,
    this.lastInvoiceTotal,
    this.lastReactivatedOn,
    this.object,
    this.totalExpense,
    this.totalOutstanding,
    this.totalOverdue,
    this.totalPurchaseInvoice,
  });

  static PurchaseExpressKpis? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseExpressKpis(
      estimatedTotal: readText(source['estimated_total']),
      issueDate: readAny(source['issue_date']),
      lastCancelledOn: readAny(source['last_cancelled_on']),
      lastChangedOn: readAny(source['last_changed_on']),
      lastDeletedOn: readAny(source['last_deleted_on']),
      lastInvoiceIssueDate: readAny(source['last_invoice_issue_date']),
      lastInvoiceTotal: readText(source['last_invoice_total']),
      lastReactivatedOn: readAny(source['last_reactivated_on']),
      object: readText(source['object']),
      totalExpense: readText(source['total_expense']),
      totalOutstanding: readText(source['total_outstanding']),
      totalOverdue: readText(source['total_overdue']),
      totalPurchaseInvoice: readInteger(source['total_purchase_invoice']),
    );
  }

  final String? estimatedTotal;

  /// Null in every record measured, so untyped.
  final Object? issueDate;

  /// Null in every record measured, so untyped.
  final Object? lastCancelledOn;

  /// Null in every record measured, so untyped.
  final Object? lastChangedOn;

  /// Null in every record measured, so untyped.
  final Object? lastDeletedOn;

  /// Null in every record measured, so untyped.
  final Object? lastInvoiceIssueDate;

  final String? lastInvoiceTotal;

  /// Null in every record measured, so untyped.
  final Object? lastReactivatedOn;

  final String? object;

  final String? totalExpense;

  final String? totalOutstanding;

  final String? totalOverdue;

  final int? totalPurchaseInvoice;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'estimated_total': estimatedTotal,
        'issue_date': issueDate,
        'last_cancelled_on': lastCancelledOn,
        'last_changed_on': lastChangedOn,
        'last_deleted_on': lastDeletedOn,
        'last_invoice_issue_date': lastInvoiceIssueDate,
        'last_invoice_total': lastInvoiceTotal,
        'last_reactivated_on': lastReactivatedOn,
        'object': object,
        'total_expense': totalExpense,
        'total_outstanding': totalOutstanding,
        'total_overdue': totalOverdue,
        'total_purchase_invoice': totalPurchaseInvoice,
      };
}
