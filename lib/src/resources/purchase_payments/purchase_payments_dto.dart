/// Typed views over the v4 purchase payments bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The purchase payment body.
class PurchasePayment extends Dto {
  const PurchasePayment({
    this.account,
    this.code,
    this.createdBy,
    this.createdOn,
    this.creditNoteApplications,
    this.creditNoteTotal,
    this.currency,
    this.customAttributes,
    this.customObjects,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.origin,
    this.paidTotal,
    this.paymentDate,
    this.paymentMethodApplications,
    this.paymentNote,
    this.paymentReference,
    this.purchaseCreditApplied,
    this.purchaseInvoiceApplications,
    this.purchaseInvoices,
    this.purchaseOrderId,
    this.purchasePaymentApplied,
    this.purchasePaymentDate,
    this.purchasePaymentNote,
    this.status,
    this.totalApplied,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_payments',
  ];

  static PurchasePayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePayment(
      account: PurchasePaymentAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNoteApplications: readList<PurchasePaymentCreditNoteApplication>(
          source['credit_note_applications'],
          PurchasePaymentCreditNoteApplication.fromMap),
      creditNoteTotal: readText(source['credit_note_total']),
      currency: PurchasePaymentCurrency.fromMap(source['currency']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      origin: readText(source['origin']),
      paidTotal: readText(source['paid_total']),
      paymentDate: readText(source['payment_date']),
      paymentMethodApplications:
          readList<PurchasePaymentPaymentMethodApplication>(
              source['payment_method_applications'],
              PurchasePaymentPaymentMethodApplication.fromMap),
      paymentNote: readText(source['payment_note']),
      paymentReference: readAny(source['payment_reference']),
      purchaseCreditApplied:
          readList<Object>(source['purchase_credit_applied'], readAny),
      purchaseInvoiceApplications:
          readList<PurchasePaymentPurchaseInvoiceApplication>(
              source['purchase_invoice_applications'],
              PurchasePaymentPurchaseInvoiceApplication.fromMap),
      purchaseInvoices: readList<Object>(source['purchase_invoices'], readAny),
      purchaseOrderId: readText(source['purchase_order_id']),
      purchasePaymentApplied:
          readList<Object>(source['purchase_payment_applied'], readAny),
      purchasePaymentDate: readText(source['purchase_payment_date']),
      purchasePaymentNote: readText(source['purchase_payment_note']),
      status: readText(source['status']),
      totalApplied: readText(source['total_applied']),
      uuid: readText(source['uuid']),
      version: readAny(source['version']),
    );
  }

  final PurchasePaymentAccount? account;

  final String? code;

  /// Untyped: a String on some records and a map on others.
  final Object? createdBy;

  final String? createdOn;

  final List<PurchasePaymentCreditNoteApplication?>? creditNoteApplications;

  final String? creditNoteTotal;

  final PurchasePaymentCurrency? currency;

  final List<Object?>? customAttributes;

  final List<Object?>? customObjects;

  final String? href;

  final String? id;

  /// Untyped: a String on some records and a map on others.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? origin;

  final String? paidTotal;

  final String? paymentDate;

  final List<PurchasePaymentPaymentMethodApplication?>?
      paymentMethodApplications;

  final String? paymentNote;

  /// Untyped: never populated in the records measured.
  final Object? paymentReference;

  final List<Object?>? purchaseCreditApplied;

  final List<PurchasePaymentPurchaseInvoiceApplication?>?
      purchaseInvoiceApplications;

  final List<Object?>? purchaseInvoices;

  final String? purchaseOrderId;

  final List<Object?>? purchasePaymentApplied;

  final String? purchasePaymentDate;

  final String? purchasePaymentNote;

  final String? status;

  final String? totalApplied;

  final String? uuid;

  /// Untyped: a String on some records and an int on others.
  final Object? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note_applications': creditNoteApplications,
        'credit_note_total': creditNoteTotal,
        'currency': currency,
        'custom_attributes': customAttributes,
        'custom_objects': customObjects,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'origin': origin,
        'paid_total': paidTotal,
        'payment_date': paymentDate,
        'payment_method_applications': paymentMethodApplications,
        'payment_note': paymentNote,
        'payment_reference': paymentReference,
        'purchase_credit_applied': purchaseCreditApplied,
        'purchase_invoice_applications': purchaseInvoiceApplications,
        'purchase_invoices': purchaseInvoices,
        'purchase_order_id': purchaseOrderId,
        'purchase_payment_applied': purchasePaymentApplied,
        'purchase_payment_date': purchasePaymentDate,
        'purchase_payment_note': purchasePaymentNote,
        'status': status,
        'total_applied': totalApplied,
        'uuid': uuid,
        'version': version,
      };
}

/// A page of PurchasePayment records.
class PurchasePaymentList extends Dto {
  const PurchasePaymentList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_payments',
  ];

  static PurchasePaymentList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentList(
      data: readList<PurchasePayment>(source['data'], PurchasePayment.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchasePayment?>? data;

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

/// The purchase payment read body.
class PurchasePaymentRead extends Dto {
  const PurchasePaymentRead({
    this.account,
    this.code,
    this.createdBy,
    this.createdOn,
    this.creditNoteApplications,
    this.creditNoteTotal,
    this.currency,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.origin,
    this.paidTotal,
    this.paymentDate,
    this.paymentMethodApplications,
    this.paymentNote,
    this.paymentReference,
    this.purchaseInvoiceApplications,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_payments',
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_payments',
    'GET /api/{api_version}/purchase_payments/{purchase_payment_id}',
  ];

  static PurchasePaymentRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_payment');
    if (source == null) return null;
    return PurchasePaymentRead(
      account: PurchasePaymentReadAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy: PurchasePaymentReadCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNoteApplications:
          readList<PurchasePaymentReadCreditNoteApplication>(
              source['credit_note_applications'],
              PurchasePaymentReadCreditNoteApplication.fromMap),
      creditNoteTotal: readText(source['credit_note_total']),
      currency: PurchasePaymentReadCurrency.fromMap(source['currency']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy:
          PurchasePaymentReadLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      origin: readText(source['origin']),
      paidTotal: readText(source['paid_total']),
      paymentDate: readText(source['payment_date']),
      paymentMethodApplications:
          readList<PurchasePaymentReadPaymentMethodApplication>(
              source['payment_method_applications'],
              PurchasePaymentReadPaymentMethodApplication.fromMap),
      paymentNote: readText(source['payment_note']),
      paymentReference: readAny(source['payment_reference']),
      purchaseInvoiceApplications:
          readList<PurchasePaymentReadPurchaseInvoiceApplication>(
              source['purchase_invoice_applications'],
              PurchasePaymentReadPurchaseInvoiceApplication.fromMap),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final PurchasePaymentReadAccount? account;

  final String? code;

  final PurchasePaymentReadCreatedBy? createdBy;

  final String? createdOn;

  final List<PurchasePaymentReadCreditNoteApplication?>? creditNoteApplications;

  final String? creditNoteTotal;

  final PurchasePaymentReadCurrency? currency;

  final String? href;

  final String? id;

  final PurchasePaymentReadLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? origin;

  final String? paidTotal;

  final String? paymentDate;

  final List<PurchasePaymentReadPaymentMethodApplication?>?
      paymentMethodApplications;

  final String? paymentNote;

  /// Untyped: never populated in the records measured.
  final Object? paymentReference;

  final List<PurchasePaymentReadPurchaseInvoiceApplication?>?
      purchaseInvoiceApplications;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'purchase_payment';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note_applications': creditNoteApplications,
        'credit_note_total': creditNoteTotal,
        'currency': currency,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'origin': origin,
        'paid_total': paidTotal,
        'payment_date': paymentDate,
        'payment_method_applications': paymentMethodApplications,
        'payment_note': paymentNote,
        'payment_reference': paymentReference,
        'purchase_invoice_applications': purchaseInvoiceApplications,
        'status': status,
        'version': version,
      };
}

/// The purchase payment note body.
class PurchasePaymentNote extends Dto {
  const PurchasePaymentNote({
    this.attachments,
    this.content,
    this.createdBy,
    this.createdOn,
    this.group,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.purchasePayment,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes',
  ];

  static PurchasePaymentNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNote(
      attachments: readList<PurchasePaymentNoteAttachment>(
          source['attachments'], PurchasePaymentNoteAttachment.fromMap),
      content: readText(source['content']),
      createdBy: PurchasePaymentNoteCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      purchasePayment: PurchasePaymentNotePurchasePayment.fromMap(
          source['purchase_payment']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<PurchasePaymentNoteWatcher>(
          source['watchers'], PurchasePaymentNoteWatcher.fromMap),
    );
  }

  final List<PurchasePaymentNoteAttachment?>? attachments;

  final String? content;

  final PurchasePaymentNoteCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped: never populated in the records measured.
  final Object? group;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedOn;

  final String? object;

  final PurchasePaymentNotePurchasePayment? purchasePayment;

  /// Untyped: never populated in the records measured.
  final Object? user;

  final int? version;

  final List<PurchasePaymentNoteWatcher?>? watchers;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'attachments': attachments,
        'content': content,
        'created_by': createdBy,
        'created_on': createdOn,
        'group': group,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'purchase_payment': purchasePayment,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// A page of PurchasePaymentNote records.
class PurchasePaymentNoteList extends Dto {
  const PurchasePaymentNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes',
  ];

  static PurchasePaymentNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNoteList(
      data: readList<PurchasePaymentNote>(
          source['data'], PurchasePaymentNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchasePaymentNote?>? data;

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

/// The purchase payment updated body.
class PurchasePaymentUpdated extends Dto {
  const PurchasePaymentUpdated({
    this.account,
    this.activityLogs,
    this.code,
    this.createdBy,
    this.createdOn,
    this.creditNoteApplications,
    this.creditNoteTotal,
    this.currency,
    this.customAttributes,
    this.customObjects,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.origin,
    this.paidTotal,
    this.paymentDate,
    this.paymentMethodApplications,
    this.paymentNote,
    this.paymentReference,
    this.purchaseCreditApplied,
    this.purchaseInvoiceApplications,
    this.purchaseInvoices,
    this.purchaseOrderId,
    this.purchasePaymentApplied,
    this.purchasePaymentDate,
    this.purchasePaymentNote,
    this.status,
    this.totalApplied,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/purchase_payments/{purchase_payment_id}',
  ];

  static PurchasePaymentUpdated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_payment');
    if (source == null) return null;
    return PurchasePaymentUpdated(
      account: PurchasePaymentUpdatedAccount.fromMap(source['account']),
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      code: readText(source['code']),
      createdBy: PurchasePaymentUpdatedCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNoteApplications:
          readList<Object>(source['credit_note_applications'], readAny),
      creditNoteTotal: readText(source['credit_note_total']),
      currency: PurchasePaymentUpdatedCurrency.fromMap(source['currency']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: PurchasePaymentUpdatedLastUpdatedBy.fromMap(
          source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      origin: readText(source['origin']),
      paidTotal: readText(source['paid_total']),
      paymentDate: readText(source['payment_date']),
      paymentMethodApplications:
          readList<PurchasePaymentUpdatedPaymentMethodApplication>(
              source['payment_method_applications'],
              PurchasePaymentUpdatedPaymentMethodApplication.fromMap),
      paymentNote: readText(source['payment_note']),
      paymentReference: readAny(source['payment_reference']),
      purchaseCreditApplied:
          readList<Object>(source['purchase_credit_applied'], readAny),
      purchaseInvoiceApplications:
          readList<PurchasePaymentUpdatedPurchaseInvoiceApplication>(
              source['purchase_invoice_applications'],
              PurchasePaymentUpdatedPurchaseInvoiceApplication.fromMap),
      purchaseInvoices: readList<Object>(source['purchase_invoices'], readAny),
      purchaseOrderId: readText(source['purchase_order_id']),
      purchasePaymentApplied:
          readList<Object>(source['purchase_payment_applied'], readAny),
      purchasePaymentDate: readText(source['purchase_payment_date']),
      purchasePaymentNote: readText(source['purchase_payment_note']),
      status: readText(source['status']),
      totalApplied: readText(source['total_applied']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final PurchasePaymentUpdatedAccount? account;

  final List<Object?>? activityLogs;

  final String? code;

  final PurchasePaymentUpdatedCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? creditNoteApplications;

  final String? creditNoteTotal;

  final PurchasePaymentUpdatedCurrency? currency;

  final List<Object?>? customAttributes;

  final List<Object?>? customObjects;

  final String? href;

  final String? id;

  final PurchasePaymentUpdatedLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? origin;

  final String? paidTotal;

  final String? paymentDate;

  final List<PurchasePaymentUpdatedPaymentMethodApplication?>?
      paymentMethodApplications;

  final String? paymentNote;

  /// Untyped: null in every record measured.
  final Object? paymentReference;

  final List<Object?>? purchaseCreditApplied;

  final List<PurchasePaymentUpdatedPurchaseInvoiceApplication?>?
      purchaseInvoiceApplications;

  final List<Object?>? purchaseInvoices;

  final String? purchaseOrderId;

  final List<Object?>? purchasePaymentApplied;

  final String? purchasePaymentDate;

  final String? purchasePaymentNote;

  final String? status;

  final String? totalApplied;

  final String? uuid;

  final int? version;

  @override
  String? get envelopeKey => 'purchase_payment';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'activity_logs': activityLogs,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note_applications': creditNoteApplications,
        'credit_note_total': creditNoteTotal,
        'currency': currency,
        'custom_attributes': customAttributes,
        'custom_objects': customObjects,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'origin': origin,
        'paid_total': paidTotal,
        'payment_date': paymentDate,
        'payment_method_applications': paymentMethodApplications,
        'payment_note': paymentNote,
        'payment_reference': paymentReference,
        'purchase_credit_applied': purchaseCreditApplied,
        'purchase_invoice_applications': purchaseInvoiceApplications,
        'purchase_invoices': purchaseInvoices,
        'purchase_order_id': purchaseOrderId,
        'purchase_payment_applied': purchasePaymentApplied,
        'purchase_payment_date': purchasePaymentDate,
        'purchase_payment_note': purchasePaymentNote,
        'status': status,
        'total_applied': totalApplied,
        'uuid': uuid,
        'version': version,
      };
}

/// The purchase payments body.
class PurchasePayments extends Dto {
  const PurchasePayments({
    this.account,
    this.activityLogs,
    this.code,
    this.createdBy,
    this.createdOn,
    this.creditNoteApplications,
    this.creditNoteTotal,
    this.currency,
    this.customAttributes,
    this.customObjects,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.origin,
    this.paidTotal,
    this.paymentDate,
    this.paymentMethodApplications,
    this.paymentNote,
    this.paymentReference,
    this.purchaseCreditApplied,
    this.purchaseInvoiceApplications,
    this.purchaseInvoices,
    this.purchaseOrderId,
    this.purchasePaymentApplied,
    this.purchasePaymentDate,
    this.purchasePaymentNote,
    this.status,
    this.totalApplied,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_payments',
    'POST /api/{api_version}/purchase_payments',
  ];

  static PurchasePayments? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_payment');
    if (source == null) return null;
    return PurchasePayments(
      account: PurchasePaymentsAccount.fromMap(source['account']),
      activityLogs: readList<PurchasePaymentsActivityLog>(
          source['activity_logs'], PurchasePaymentsActivityLog.fromMap),
      code: readText(source['code']),
      createdBy: PurchasePaymentsCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNoteApplications: readList<PurchasePaymentsCreditNoteApplication>(
          source['credit_note_applications'],
          PurchasePaymentsCreditNoteApplication.fromMap),
      creditNoteTotal: readText(source['credit_note_total']),
      currency: PurchasePaymentsCurrency.fromMap(source['currency']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      origin: readText(source['origin']),
      paidTotal: readText(source['paid_total']),
      paymentDate: readText(source['payment_date']),
      paymentMethodApplications:
          readList<PurchasePaymentsPaymentMethodApplication>(
              source['payment_method_applications'],
              PurchasePaymentsPaymentMethodApplication.fromMap),
      paymentNote: readText(source['payment_note']),
      paymentReference: readAny(source['payment_reference']),
      purchaseCreditApplied:
          readList<Object>(source['purchase_credit_applied'], readAny),
      purchaseInvoiceApplications:
          readList<PurchasePaymentsPurchaseInvoiceApplication>(
              source['purchase_invoice_applications'],
              PurchasePaymentsPurchaseInvoiceApplication.fromMap),
      purchaseInvoices: readList<Object>(source['purchase_invoices'], readAny),
      purchaseOrderId: readText(source['purchase_order_id']),
      purchasePaymentApplied:
          readList<Object>(source['purchase_payment_applied'], readAny),
      purchasePaymentDate: readText(source['purchase_payment_date']),
      purchasePaymentNote: readText(source['purchase_payment_note']),
      status: readText(source['status']),
      totalApplied: readText(source['total_applied']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final PurchasePaymentsAccount? account;

  final List<PurchasePaymentsActivityLog?>? activityLogs;

  final String? code;

  final PurchasePaymentsCreatedBy? createdBy;

  final String? createdOn;

  final List<PurchasePaymentsCreditNoteApplication?>? creditNoteApplications;

  final String? creditNoteTotal;

  final PurchasePaymentsCurrency? currency;

  final List<Object?>? customAttributes;

  final List<Object?>? customObjects;

  final String? href;

  final String? id;

  final String? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? origin;

  final String? paidTotal;

  final String? paymentDate;

  final List<PurchasePaymentsPaymentMethodApplication?>?
      paymentMethodApplications;

  final String? paymentNote;

  /// Untyped: null in every record measured.
  final Object? paymentReference;

  final List<Object?>? purchaseCreditApplied;

  final List<PurchasePaymentsPurchaseInvoiceApplication?>?
      purchaseInvoiceApplications;

  final List<Object?>? purchaseInvoices;

  final String? purchaseOrderId;

  final List<Object?>? purchasePaymentApplied;

  final String? purchasePaymentDate;

  final String? purchasePaymentNote;

  final String? status;

  final String? totalApplied;

  final String? uuid;

  final int? version;

  @override
  String? get envelopeKey => 'purchase_payment';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'activity_logs': activityLogs,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note_applications': creditNoteApplications,
        'credit_note_total': creditNoteTotal,
        'currency': currency,
        'custom_attributes': customAttributes,
        'custom_objects': customObjects,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'origin': origin,
        'paid_total': paidTotal,
        'payment_date': paymentDate,
        'payment_method_applications': paymentMethodApplications,
        'payment_note': paymentNote,
        'payment_reference': paymentReference,
        'purchase_credit_applied': purchaseCreditApplied,
        'purchase_invoice_applications': purchaseInvoiceApplications,
        'purchase_invoices': purchaseInvoices,
        'purchase_order_id': purchaseOrderId,
        'purchase_payment_applied': purchasePaymentApplied,
        'purchase_payment_date': purchasePaymentDate,
        'purchase_payment_note': purchasePaymentNote,
        'status': status,
        'total_applied': totalApplied,
        'uuid': uuid,
        'version': version,
      };
}

/// The account purchase payments body.
class AccountPurchasePayments extends Dto {
  const AccountPurchasePayments({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/purchase_payments',
  ];

  static AccountPurchasePayments? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchasePayments(
      data: readList<AccountPurchasePaymentsData>(
          source['data'], AccountPurchasePaymentsData.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<AccountPurchasePaymentsData?>? data;

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

/// The purchase payment notes body.
class PurchasePaymentNotes extends Dto {
  const PurchasePaymentNotes({
    this.attachments,
    this.content,
    this.createdBy,
    this.createdOn,
    this.group,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.link,
    this.name,
    this.object,
    this.purchasePayment,
    this.user,
    this.uuid,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/purchase_payments/{purchase_payment_id}/notes',
  ];

  static PurchasePaymentNotes? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return PurchasePaymentNotes(
      attachments: readList<PurchasePaymentNotesAttachment>(
          source['attachments'], PurchasePaymentNotesAttachment.fromMap),
      content: readText(source['content']),
      createdBy: PurchasePaymentNotesCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      link: readText(source['link']),
      name: readText(source['name']),
      object: readText(source['object']),
      purchasePayment: PurchasePaymentNotesPurchasePayment.fromMap(
          source['purchase_payment']),
      user: readAny(source['user']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
      watchers: readList<PurchasePaymentNotesWatcher>(
          source['watchers'], PurchasePaymentNotesWatcher.fromMap),
    );
  }

  final List<PurchasePaymentNotesAttachment?>? attachments;

  final String? content;

  final PurchasePaymentNotesCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? group;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final String? link;

  final String? name;

  final String? object;

  final PurchasePaymentNotesPurchasePayment? purchasePayment;

  /// Untyped: null in every record measured.
  final Object? user;

  final String? uuid;

  final int? version;

  final List<PurchasePaymentNotesWatcher?>? watchers;

  @override
  String? get envelopeKey => 'note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'attachments': attachments,
        'content': content,
        'created_by': createdBy,
        'created_on': createdOn,
        'group': group,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'link': link,
        'name': name,
        'object': object,
        'purchase_payment': purchasePayment,
        'user': user,
        'uuid': uuid,
        'version': version,
        'watchers': watchers,
      };
}

/// The purchase payment note read body.
class PurchasePaymentNoteRead extends Dto {
  const PurchasePaymentNoteRead({
    this.note,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}',
    'GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}/files',
  ];

  static PurchasePaymentNoteRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_payment');
    if (source == null) return null;
    return PurchasePaymentNoteRead(
      note: readAny(source['note']),
    );
  }

  final Object? note;

  @override
  String? get envelopeKey => 'purchase_payment';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'note': note,
      };
}

/// What `getPurchasePaymentNote` answers, under `note`.
class PurchasePaymentNoteView extends Dto {
  const PurchasePaymentNoteView({
    this.attachments,
    this.content,
    this.createdBy,
    this.createdOn,
    this.group,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.purchasePayment,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}',
  ];

  static PurchasePaymentNoteView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return PurchasePaymentNoteView(
      attachments: readList<PurchasePaymentNoteViewAttachment>(
          source['attachments'], PurchasePaymentNoteViewAttachment.fromMap),
      content: readText(source['content']),
      createdBy: PurchasePaymentNoteViewCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      purchasePayment: PurchasePaymentNoteViewPurchasePayment.fromMap(
          source['purchase_payment']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<PurchasePaymentNoteViewWatcher>(
          source['watchers'], PurchasePaymentNoteViewWatcher.fromMap),
    );
  }

  final List<PurchasePaymentNoteViewAttachment?>? attachments;

  final String? content;

  final PurchasePaymentNoteViewCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? group;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final String? object;

  final PurchasePaymentNoteViewPurchasePayment? purchasePayment;

  /// Untyped: null in every record measured.
  final Object? user;

  final int? version;

  final List<PurchasePaymentNoteViewWatcher?>? watchers;

  @override
  String? get envelopeKey => 'note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'attachments': attachments,
        'content': content,
        'created_by': createdBy,
        'created_on': createdOn,
        'group': group,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'purchase_payment': purchasePayment,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// One page of what `getPurchasePaymentNoteFiles` lists, under `data`.
class PurchasePaymentNoteFileList extends Dto {
  const PurchasePaymentNoteFileList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}/files',
  ];

  static PurchasePaymentNoteFileList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNoteFileList(
      data: readList<PurchasePaymentNoteFileEntry>(
          source['data'], PurchasePaymentNoteFileEntry.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchasePaymentNoteFileEntry?>? data;

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

/// What `getPurchasePaymentNoteFile` answers, under `file`.
class PurchasePaymentNoteFile extends Dto {
  const PurchasePaymentNoteFile({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}/files/{file_id}',
  ];

  static PurchasePaymentNoteFile? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'file');
    if (source == null) return null;
    return PurchasePaymentNoteFile(
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
  String? get envelopeKey => 'file';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'content_type': contentType,
        'filename': filename,
        'href': href,
        'size': size,
        'uuid': uuid,
      };
}

/// One entry of a [AccountPurchasePayments]'s `data`.
class AccountPurchasePaymentsData extends Dto {
  const AccountPurchasePaymentsData({
    this.account,
    this.code,
    this.createdBy,
    this.createdOn,
    this.creditNoteApplications,
    this.creditNoteTotal,
    this.currency,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.origin,
    this.paidTotal,
    this.paymentDate,
    this.paymentMethodApplications,
    this.paymentNote,
    this.paymentReference,
    this.purchaseInvoiceApplications,
    this.status,
    this.version,
  });

  static AccountPurchasePaymentsData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchasePaymentsData(
      account: AccountPurchasePaymentsDataAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy:
          AccountPurchasePaymentsDataCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNoteApplications:
          readList<AccountPurchasePaymentsDataCreditNoteApplication>(
              source['credit_note_applications'],
              AccountPurchasePaymentsDataCreditNoteApplication.fromMap),
      creditNoteTotal: readText(source['credit_note_total']),
      currency: AccountPurchasePaymentsDataCurrency.fromMap(source['currency']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: AccountPurchasePaymentsDataLastUpdatedBy.fromMap(
          source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      origin: readText(source['origin']),
      paidTotal: readText(source['paid_total']),
      paymentDate: readText(source['payment_date']),
      paymentMethodApplications:
          readList<AccountPurchasePaymentsDataPaymentMethodApplication>(
              source['payment_method_applications'],
              AccountPurchasePaymentsDataPaymentMethodApplication.fromMap),
      paymentNote: readText(source['payment_note']),
      paymentReference: readAny(source['payment_reference']),
      purchaseInvoiceApplications:
          readList<AccountPurchasePaymentsDataPurchaseInvoiceApplication>(
              source['purchase_invoice_applications'],
              AccountPurchasePaymentsDataPurchaseInvoiceApplication.fromMap),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final AccountPurchasePaymentsDataAccount? account;

  final String? code;

  final AccountPurchasePaymentsDataCreatedBy? createdBy;

  final String? createdOn;

  final List<AccountPurchasePaymentsDataCreditNoteApplication?>?
      creditNoteApplications;

  final String? creditNoteTotal;

  final AccountPurchasePaymentsDataCurrency? currency;

  final String? href;

  final String? id;

  final AccountPurchasePaymentsDataLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? origin;

  final String? paidTotal;

  final String? paymentDate;

  final List<AccountPurchasePaymentsDataPaymentMethodApplication?>?
      paymentMethodApplications;

  final String? paymentNote;

  /// Untyped: null in every record measured.
  final Object? paymentReference;

  final List<AccountPurchasePaymentsDataPurchaseInvoiceApplication?>?
      purchaseInvoiceApplications;

  final String? status;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note_applications': creditNoteApplications,
        'credit_note_total': creditNoteTotal,
        'currency': currency,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'origin': origin,
        'paid_total': paidTotal,
        'payment_date': paymentDate,
        'payment_method_applications': paymentMethodApplications,
        'payment_note': paymentNote,
        'payment_reference': paymentReference,
        'purchase_invoice_applications': purchaseInvoiceApplications,
        'status': status,
        'version': version,
      };
}

/// A [PurchasePaymentRead]'s `account`.
class PurchasePaymentReadAccount extends Dto {
  const PurchasePaymentReadAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentReadAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentReadAccount(
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

/// A [PurchasePaymentRead]'s `currency`.
class PurchasePaymentReadCurrency extends Dto {
  const PurchasePaymentReadCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentReadCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentReadCurrency(
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

/// One entry of a [PurchasePaymentRead]'s `payment_method_applications`.
class PurchasePaymentReadPaymentMethodApplication extends Dto {
  const PurchasePaymentReadPaymentMethodApplication({
    this.amount,
    this.paymentMethod,
    this.paymentProcessor,
    this.reference,
  });

  static PurchasePaymentReadPaymentMethodApplication? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentReadPaymentMethodApplication(
      amount: readText(source['amount']),
      paymentMethod:
          PurchasePaymentReadPaymentMethodApplicationPaymentMethod.fromMap(
              source['payment_method']),
      paymentProcessor:
          PurchasePaymentReadPaymentMethodApplicationPaymentProcessor.fromMap(
              source['payment_processor']),
      reference: readText(source['reference']),
    );
  }

  final String? amount;

  final PurchasePaymentReadPaymentMethodApplicationPaymentMethod? paymentMethod;

  final PurchasePaymentReadPaymentMethodApplicationPaymentProcessor?
      paymentProcessor;

  final String? reference;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'payment_method': paymentMethod,
        'payment_processor': paymentProcessor,
        'reference': reference,
      };
}

/// One entry of a [PurchasePaymentRead]'s `credit_note_applications`.
class PurchasePaymentReadCreditNoteApplication extends Dto {
  const PurchasePaymentReadCreditNoteApplication({
    this.amount,
    this.purchaseCreditNote,
  });

  static PurchasePaymentReadCreditNoteApplication? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentReadCreditNoteApplication(
      amount: readText(source['amount']),
      purchaseCreditNote:
          PurchasePaymentReadCreditNoteApplicationPurchaseCreditNote.fromMap(
              source['purchase_credit_note']),
    );
  }

  final String? amount;

  final PurchasePaymentReadCreditNoteApplicationPurchaseCreditNote?
      purchaseCreditNote;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'purchase_credit_note': purchaseCreditNote,
      };
}

/// One entry of a [PurchasePaymentRead]'s `purchase_invoice_applications`.
class PurchasePaymentReadPurchaseInvoiceApplication extends Dto {
  const PurchasePaymentReadPurchaseInvoiceApplication({
    this.applied,
    this.dueDate,
    this.issueDate,
    this.outstanding,
    this.purchaseInvoice,
    this.total,
  });

  static PurchasePaymentReadPurchaseInvoiceApplication? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentReadPurchaseInvoiceApplication(
      applied: readText(source['applied']),
      dueDate: readText(source['due_date']),
      issueDate: readText(source['issue_date']),
      outstanding: readText(source['outstanding']),
      purchaseInvoice:
          PurchasePaymentReadPurchaseInvoiceApplicationPurchaseInvoice.fromMap(
              source['purchase_invoice']),
      total: readText(source['total']),
    );
  }

  final String? applied;

  final String? dueDate;

  final String? issueDate;

  final String? outstanding;

  final PurchasePaymentReadPurchaseInvoiceApplicationPurchaseInvoice?
      purchaseInvoice;

  final String? total;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'applied': applied,
        'due_date': dueDate,
        'issue_date': issueDate,
        'outstanding': outstanding,
        'purchase_invoice': purchaseInvoice,
        'total': total,
      };
}

/// A [PurchasePaymentRead]'s `created_by`.
class PurchasePaymentReadCreatedBy extends Dto {
  const PurchasePaymentReadCreatedBy({
    this.name,
    this.object,
  });

  static PurchasePaymentReadCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentReadCreatedBy(
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

/// A [PurchasePaymentRead]'s `last_updated_by`.
class PurchasePaymentReadLastUpdatedBy extends Dto {
  const PurchasePaymentReadLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchasePaymentReadLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentReadLastUpdatedBy(
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

/// A [PurchasePayments]'s `account`.
class PurchasePaymentsAccount extends Dto {
  const PurchasePaymentsAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentsAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentsAccount(
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

/// A [PurchasePayments]'s `currency`.
class PurchasePaymentsCurrency extends Dto {
  const PurchasePaymentsCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentsCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentsCurrency(
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

/// One entry of a [PurchasePayments]'s `payment_method_applications`.
class PurchasePaymentsPaymentMethodApplication extends Dto {
  const PurchasePaymentsPaymentMethodApplication({
    this.amount,
    this.paymentMethod,
    this.paymentProcessor,
    this.reference,
  });

  static PurchasePaymentsPaymentMethodApplication? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentsPaymentMethodApplication(
      amount: readText(source['amount']),
      paymentMethod:
          PurchasePaymentsPaymentMethodApplicationPaymentMethod.fromMap(
              source['payment_method']),
      paymentProcessor:
          PurchasePaymentsPaymentMethodApplicationPaymentProcessor.fromMap(
              source['payment_processor']),
      reference: readText(source['reference']),
    );
  }

  final String? amount;

  final PurchasePaymentsPaymentMethodApplicationPaymentMethod? paymentMethod;

  final PurchasePaymentsPaymentMethodApplicationPaymentProcessor?
      paymentProcessor;

  final String? reference;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'payment_method': paymentMethod,
        'payment_processor': paymentProcessor,
        'reference': reference,
      };
}

/// One entry of a [PurchasePayments]'s `credit_note_applications`.
class PurchasePaymentsCreditNoteApplication extends Dto {
  const PurchasePaymentsCreditNoteApplication({
    this.amount,
    this.purchaseCreditNote,
  });

  static PurchasePaymentsCreditNoteApplication? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentsCreditNoteApplication(
      amount: readText(source['amount']),
      purchaseCreditNote:
          PurchasePaymentsCreditNoteApplicationPurchaseCreditNote.fromMap(
              source['purchase_credit_note']),
    );
  }

  final String? amount;

  final PurchasePaymentsCreditNoteApplicationPurchaseCreditNote?
      purchaseCreditNote;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'purchase_credit_note': purchaseCreditNote,
      };
}

/// One entry of a [PurchasePayments]'s `purchase_invoice_applications`.
class PurchasePaymentsPurchaseInvoiceApplication extends Dto {
  const PurchasePaymentsPurchaseInvoiceApplication({
    this.applied,
    this.dueDate,
    this.issueDate,
    this.outstanding,
    this.purchaseInvoice,
    this.total,
  });

  static PurchasePaymentsPurchaseInvoiceApplication? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentsPurchaseInvoiceApplication(
      applied: readText(source['applied']),
      dueDate: readText(source['due_date']),
      issueDate: readText(source['issue_date']),
      outstanding: readText(source['outstanding']),
      purchaseInvoice:
          PurchasePaymentsPurchaseInvoiceApplicationPurchaseInvoice.fromMap(
              source['purchase_invoice']),
      total: readText(source['total']),
    );
  }

  final String? applied;

  final String? dueDate;

  final String? issueDate;

  final String? outstanding;

  final PurchasePaymentsPurchaseInvoiceApplicationPurchaseInvoice?
      purchaseInvoice;

  final String? total;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'applied': applied,
        'due_date': dueDate,
        'issue_date': issueDate,
        'outstanding': outstanding,
        'purchase_invoice': purchaseInvoice,
        'total': total,
      };
}

/// A [PurchasePayments]'s `created_by`.
class PurchasePaymentsCreatedBy extends Dto {
  const PurchasePaymentsCreatedBy({
    this.name,
    this.object,
  });

  static PurchasePaymentsCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentsCreatedBy(
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

/// One entry of a [PurchasePayments]'s `activity_logs`.
class PurchasePaymentsActivityLog extends Dto {
  const PurchasePaymentsActivityLog({
    this.activity,
  });

  static PurchasePaymentsActivityLog? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentsActivityLog(
      activity: readText(source['activity']),
    );
  }

  final String? activity;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity': activity,
      };
}

/// A [PurchasePaymentUpdated]'s `account`.
class PurchasePaymentUpdatedAccount extends Dto {
  const PurchasePaymentUpdatedAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentUpdatedAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentUpdatedAccount(
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

/// A [PurchasePaymentUpdated]'s `currency`.
class PurchasePaymentUpdatedCurrency extends Dto {
  const PurchasePaymentUpdatedCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentUpdatedCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentUpdatedCurrency(
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

/// One entry of a [PurchasePaymentUpdated]'s `payment_method_applications`.
class PurchasePaymentUpdatedPaymentMethodApplication extends Dto {
  const PurchasePaymentUpdatedPaymentMethodApplication({
    this.amount,
    this.paymentMethod,
    this.paymentProcessor,
    this.reference,
  });

  static PurchasePaymentUpdatedPaymentMethodApplication? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentUpdatedPaymentMethodApplication(
      amount: readText(source['amount']),
      paymentMethod:
          PurchasePaymentUpdatedPaymentMethodApplicationPaymentMethod.fromMap(
              source['payment_method']),
      paymentProcessor:
          PurchasePaymentUpdatedPaymentMethodApplicationPaymentProcessor
              .fromMap(source['payment_processor']),
      reference: readAny(source['reference']),
    );
  }

  final String? amount;

  final PurchasePaymentUpdatedPaymentMethodApplicationPaymentMethod?
      paymentMethod;

  final PurchasePaymentUpdatedPaymentMethodApplicationPaymentProcessor?
      paymentProcessor;

  /// Untyped: null in every record measured.
  final Object? reference;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'payment_method': paymentMethod,
        'payment_processor': paymentProcessor,
        'reference': reference,
      };
}

/// One entry of a [PurchasePaymentUpdated]'s `purchase_invoice_applications`.
class PurchasePaymentUpdatedPurchaseInvoiceApplication extends Dto {
  const PurchasePaymentUpdatedPurchaseInvoiceApplication({
    this.applied,
    this.dueDate,
    this.issueDate,
    this.outstanding,
    this.purchaseInvoice,
    this.total,
  });

  static PurchasePaymentUpdatedPurchaseInvoiceApplication? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentUpdatedPurchaseInvoiceApplication(
      applied: readText(source['applied']),
      dueDate: readText(source['due_date']),
      issueDate: readText(source['issue_date']),
      outstanding: readText(source['outstanding']),
      purchaseInvoice:
          PurchasePaymentUpdatedPurchaseInvoiceApplicationPurchaseInvoice
              .fromMap(source['purchase_invoice']),
      total: readText(source['total']),
    );
  }

  final String? applied;

  final String? dueDate;

  final String? issueDate;

  final String? outstanding;

  final PurchasePaymentUpdatedPurchaseInvoiceApplicationPurchaseInvoice?
      purchaseInvoice;

  final String? total;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'applied': applied,
        'due_date': dueDate,
        'issue_date': issueDate,
        'outstanding': outstanding,
        'purchase_invoice': purchaseInvoice,
        'total': total,
      };
}

/// A [PurchasePaymentUpdated]'s `created_by`.
class PurchasePaymentUpdatedCreatedBy extends Dto {
  const PurchasePaymentUpdatedCreatedBy({
    this.name,
    this.object,
  });

  static PurchasePaymentUpdatedCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentUpdatedCreatedBy(
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

/// A [PurchasePaymentUpdated]'s `last_updated_by`.
class PurchasePaymentUpdatedLastUpdatedBy extends Dto {
  const PurchasePaymentUpdatedLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchasePaymentUpdatedLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentUpdatedLastUpdatedBy(
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

/// A [PurchasePaymentNotes]'s `purchase_payment`.
class PurchasePaymentNotesPurchasePayment extends Dto {
  const PurchasePaymentNotesPurchasePayment({
    this.href,
    this.id,
    this.object,
  });

  static PurchasePaymentNotesPurchasePayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNotesPurchasePayment(
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

/// One entry of a [PurchasePaymentNotes]'s `attachments`.
class PurchasePaymentNotesAttachment extends Dto {
  const PurchasePaymentNotesAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PurchasePaymentNotesAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNotesAttachment(
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

/// One entry of a [PurchasePaymentNotes]'s `watchers`.
class PurchasePaymentNotesWatcher extends Dto {
  const PurchasePaymentNotesWatcher({
    this.email,
    this.name,
    this.type,
  });

  static PurchasePaymentNotesWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNotesWatcher(
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

/// A [PurchasePaymentNotes]'s `created_by`.
class PurchasePaymentNotesCreatedBy extends Dto {
  const PurchasePaymentNotesCreatedBy({
    this.name,
    this.object,
  });

  static PurchasePaymentNotesCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNotesCreatedBy(
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

/// A [PurchasePaymentNoteView]'s `purchase_payment`.
class PurchasePaymentNoteViewPurchasePayment extends Dto {
  const PurchasePaymentNoteViewPurchasePayment({
    this.href,
    this.id,
    this.object,
  });

  static PurchasePaymentNoteViewPurchasePayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNoteViewPurchasePayment(
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

/// One entry of a [PurchasePaymentNoteView]'s `attachments`.
class PurchasePaymentNoteViewAttachment extends Dto {
  const PurchasePaymentNoteViewAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PurchasePaymentNoteViewAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNoteViewAttachment(
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

/// One entry of a [PurchasePaymentNoteView]'s `watchers`.
class PurchasePaymentNoteViewWatcher extends Dto {
  const PurchasePaymentNoteViewWatcher({
    this.email,
    this.name,
    this.type,
  });

  static PurchasePaymentNoteViewWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNoteViewWatcher(
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

/// A [PurchasePaymentNoteView]'s `created_by`.
class PurchasePaymentNoteViewCreatedBy extends Dto {
  const PurchasePaymentNoteViewCreatedBy({
    this.name,
    this.object,
  });

  static PurchasePaymentNoteViewCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNoteViewCreatedBy(
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

/// One entry of a [PurchasePaymentNoteFileList]'s `data`.
class PurchasePaymentNoteFileEntry extends Dto {
  const PurchasePaymentNoteFileEntry({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PurchasePaymentNoteFileEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNoteFileEntry(
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

/// A [PurchasePayment]'s `account`.
class PurchasePaymentAccount extends Dto {
  const PurchasePaymentAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentAccount(
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

/// A [PurchasePayment]'s `currency`.
class PurchasePaymentCurrency extends Dto {
  const PurchasePaymentCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentCurrency(
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

/// One entry of a [PurchasePayment]'s `payment_method_applications`.
class PurchasePaymentPaymentMethodApplication extends Dto {
  const PurchasePaymentPaymentMethodApplication({
    this.amount,
    this.paymentMethod,
    this.paymentProcessor,
    this.reference,
  });

  static PurchasePaymentPaymentMethodApplication? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentPaymentMethodApplication(
      amount: readText(source['amount']),
      paymentMethod:
          PurchasePaymentPaymentMethodApplicationPaymentMethod.fromMap(
              source['payment_method']),
      paymentProcessor:
          PurchasePaymentPaymentMethodApplicationPaymentProcessor.fromMap(
              source['payment_processor']),
      reference: readText(source['reference']),
    );
  }

  final String? amount;

  final PurchasePaymentPaymentMethodApplicationPaymentMethod? paymentMethod;

  final PurchasePaymentPaymentMethodApplicationPaymentProcessor?
      paymentProcessor;

  final String? reference;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'payment_method': paymentMethod,
        'payment_processor': paymentProcessor,
        'reference': reference,
      };
}

/// One entry of a [PurchasePayment]'s `credit_note_applications`.
class PurchasePaymentCreditNoteApplication extends Dto {
  const PurchasePaymentCreditNoteApplication({
    this.amount,
    this.purchaseCreditNote,
  });

  static PurchasePaymentCreditNoteApplication? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentCreditNoteApplication(
      amount: readText(source['amount']),
      purchaseCreditNote:
          PurchasePaymentCreditNoteApplicationPurchaseCreditNote.fromMap(
              source['purchase_credit_note']),
    );
  }

  final String? amount;

  final PurchasePaymentCreditNoteApplicationPurchaseCreditNote?
      purchaseCreditNote;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'purchase_credit_note': purchaseCreditNote,
      };
}

/// One entry of a [PurchasePayment]'s `purchase_invoice_applications`.
class PurchasePaymentPurchaseInvoiceApplication extends Dto {
  const PurchasePaymentPurchaseInvoiceApplication({
    this.applied,
    this.dueDate,
    this.issueDate,
    this.outstanding,
    this.purchaseInvoice,
    this.total,
  });

  static PurchasePaymentPurchaseInvoiceApplication? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentPurchaseInvoiceApplication(
      applied: readText(source['applied']),
      dueDate: readText(source['due_date']),
      issueDate: readText(source['issue_date']),
      outstanding: readText(source['outstanding']),
      purchaseInvoice:
          PurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice.fromMap(
              source['purchase_invoice']),
      total: readText(source['total']),
    );
  }

  final String? applied;

  final String? dueDate;

  final String? issueDate;

  final String? outstanding;

  final PurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice?
      purchaseInvoice;

  final String? total;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'applied': applied,
        'due_date': dueDate,
        'issue_date': issueDate,
        'outstanding': outstanding,
        'purchase_invoice': purchaseInvoice,
        'total': total,
      };
}

/// A [PurchasePaymentNote]'s `purchase_payment`.
class PurchasePaymentNotePurchasePayment extends Dto {
  const PurchasePaymentNotePurchasePayment({
    this.href,
    this.id,
    this.object,
  });

  static PurchasePaymentNotePurchasePayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNotePurchasePayment(
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

/// One entry of a [PurchasePaymentNote]'s `attachments`.
class PurchasePaymentNoteAttachment extends Dto {
  const PurchasePaymentNoteAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PurchasePaymentNoteAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNoteAttachment(
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

/// One entry of a [PurchasePaymentNote]'s `watchers`.
class PurchasePaymentNoteWatcher extends Dto {
  const PurchasePaymentNoteWatcher({
    this.email,
    this.name,
    this.type,
  });

  static PurchasePaymentNoteWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNoteWatcher(
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

/// A [PurchasePaymentNote]'s `created_by`.
class PurchasePaymentNoteCreatedBy extends Dto {
  const PurchasePaymentNoteCreatedBy({
    this.name,
    this.object,
  });

  static PurchasePaymentNoteCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNoteCreatedBy(
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

/// A [AccountPurchasePaymentsData]'s `account`.
class AccountPurchasePaymentsDataAccount extends Dto {
  const AccountPurchasePaymentsDataAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountPurchasePaymentsDataAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchasePaymentsDataAccount(
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

/// A [AccountPurchasePaymentsData]'s `currency`.
class AccountPurchasePaymentsDataCurrency extends Dto {
  const AccountPurchasePaymentsDataCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountPurchasePaymentsDataCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchasePaymentsDataCurrency(
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

/// One entry of a [AccountPurchasePaymentsData]'s `payment_method_applications`.
class AccountPurchasePaymentsDataPaymentMethodApplication extends Dto {
  const AccountPurchasePaymentsDataPaymentMethodApplication({
    this.amount,
    this.paymentMethod,
    this.paymentProcessor,
    this.reference,
  });

  static AccountPurchasePaymentsDataPaymentMethodApplication? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchasePaymentsDataPaymentMethodApplication(
      amount: readText(source['amount']),
      paymentMethod:
          AccountPurchasePaymentsDataPaymentMethodApplicationPaymentMethod
              .fromMap(source['payment_method']),
      paymentProcessor:
          AccountPurchasePaymentsDataPaymentMethodApplicationPaymentProcessor
              .fromMap(source['payment_processor']),
      reference: readText(source['reference']),
    );
  }

  final String? amount;

  final AccountPurchasePaymentsDataPaymentMethodApplicationPaymentMethod?
      paymentMethod;

  final AccountPurchasePaymentsDataPaymentMethodApplicationPaymentProcessor?
      paymentProcessor;

  final String? reference;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'payment_method': paymentMethod,
        'payment_processor': paymentProcessor,
        'reference': reference,
      };
}

/// One entry of a [AccountPurchasePaymentsData]'s `credit_note_applications`.
class AccountPurchasePaymentsDataCreditNoteApplication extends Dto {
  const AccountPurchasePaymentsDataCreditNoteApplication({
    this.amount,
    this.purchaseCreditNote,
  });

  static AccountPurchasePaymentsDataCreditNoteApplication? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchasePaymentsDataCreditNoteApplication(
      amount: readText(source['amount']),
      purchaseCreditNote:
          AccountPurchasePaymentsDataCreditNoteApplicationPurchaseCreditNote
              .fromMap(source['purchase_credit_note']),
    );
  }

  final String? amount;

  final AccountPurchasePaymentsDataCreditNoteApplicationPurchaseCreditNote?
      purchaseCreditNote;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'purchase_credit_note': purchaseCreditNote,
      };
}

/// One entry of a [AccountPurchasePaymentsData]'s `purchase_invoice_applications`.
class AccountPurchasePaymentsDataPurchaseInvoiceApplication extends Dto {
  const AccountPurchasePaymentsDataPurchaseInvoiceApplication({
    this.applied,
    this.dueDate,
    this.issueDate,
    this.outstanding,
    this.purchaseInvoice,
    this.total,
  });

  static AccountPurchasePaymentsDataPurchaseInvoiceApplication? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchasePaymentsDataPurchaseInvoiceApplication(
      applied: readText(source['applied']),
      dueDate: readText(source['due_date']),
      issueDate: readText(source['issue_date']),
      outstanding: readText(source['outstanding']),
      purchaseInvoice:
          AccountPurchasePaymentsDataPurchaseInvoiceApplicationPurchaseInvoice
              .fromMap(source['purchase_invoice']),
      total: readText(source['total']),
    );
  }

  final String? applied;

  final String? dueDate;

  final String? issueDate;

  final String? outstanding;

  final AccountPurchasePaymentsDataPurchaseInvoiceApplicationPurchaseInvoice?
      purchaseInvoice;

  final String? total;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'applied': applied,
        'due_date': dueDate,
        'issue_date': issueDate,
        'outstanding': outstanding,
        'purchase_invoice': purchaseInvoice,
        'total': total,
      };
}

/// A [AccountPurchasePaymentsData]'s `created_by`.
class AccountPurchasePaymentsDataCreatedBy extends Dto {
  const AccountPurchasePaymentsDataCreatedBy({
    this.name,
    this.object,
  });

  static AccountPurchasePaymentsDataCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchasePaymentsDataCreatedBy(
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

/// A [AccountPurchasePaymentsData]'s `last_updated_by`.
class AccountPurchasePaymentsDataLastUpdatedBy extends Dto {
  const AccountPurchasePaymentsDataLastUpdatedBy({
    this.name,
    this.object,
  });

  static AccountPurchasePaymentsDataLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchasePaymentsDataLastUpdatedBy(
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

/// A [PurchasePaymentReadPaymentMethodApplication]'s `payment_method`.
class PurchasePaymentReadPaymentMethodApplicationPaymentMethod extends Dto {
  const PurchasePaymentReadPaymentMethodApplicationPaymentMethod({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentReadPaymentMethodApplicationPaymentMethod? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentReadPaymentMethodApplicationPaymentMethod(
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

/// A [PurchasePaymentReadPaymentMethodApplication]'s `payment_processor`.
class PurchasePaymentReadPaymentMethodApplicationPaymentProcessor extends Dto {
  const PurchasePaymentReadPaymentMethodApplicationPaymentProcessor({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentReadPaymentMethodApplicationPaymentProcessor? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentReadPaymentMethodApplicationPaymentProcessor(
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

/// A [PurchasePaymentReadCreditNoteApplication]'s `purchase_credit_note`.
class PurchasePaymentReadCreditNoteApplicationPurchaseCreditNote extends Dto {
  const PurchasePaymentReadCreditNoteApplicationPurchaseCreditNote({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static PurchasePaymentReadCreditNoteApplicationPurchaseCreditNote? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentReadCreditNoteApplicationPurchaseCreditNote(
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

/// A [PurchasePaymentReadPurchaseInvoiceApplication]'s `purchase_invoice`.
class PurchasePaymentReadPurchaseInvoiceApplicationPurchaseInvoice extends Dto {
  const PurchasePaymentReadPurchaseInvoiceApplicationPurchaseInvoice({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static PurchasePaymentReadPurchaseInvoiceApplicationPurchaseInvoice? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentReadPurchaseInvoiceApplicationPurchaseInvoice(
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

/// A [PurchasePaymentsPaymentMethodApplication]'s `payment_method`.
class PurchasePaymentsPaymentMethodApplicationPaymentMethod extends Dto {
  const PurchasePaymentsPaymentMethodApplicationPaymentMethod({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentsPaymentMethodApplicationPaymentMethod? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentsPaymentMethodApplicationPaymentMethod(
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

/// A [PurchasePaymentsPaymentMethodApplication]'s `payment_processor`.
class PurchasePaymentsPaymentMethodApplicationPaymentProcessor extends Dto {
  const PurchasePaymentsPaymentMethodApplicationPaymentProcessor({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentsPaymentMethodApplicationPaymentProcessor? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentsPaymentMethodApplicationPaymentProcessor(
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

/// A [PurchasePaymentsCreditNoteApplication]'s `purchase_credit_note`.
class PurchasePaymentsCreditNoteApplicationPurchaseCreditNote extends Dto {
  const PurchasePaymentsCreditNoteApplicationPurchaseCreditNote({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static PurchasePaymentsCreditNoteApplicationPurchaseCreditNote? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentsCreditNoteApplicationPurchaseCreditNote(
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

/// A [PurchasePaymentsPurchaseInvoiceApplication]'s `purchase_invoice`.
class PurchasePaymentsPurchaseInvoiceApplicationPurchaseInvoice extends Dto {
  const PurchasePaymentsPurchaseInvoiceApplicationPurchaseInvoice({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static PurchasePaymentsPurchaseInvoiceApplicationPurchaseInvoice? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentsPurchaseInvoiceApplicationPurchaseInvoice(
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

/// A [PurchasePaymentUpdatedPaymentMethodApplication]'s `payment_method`.
class PurchasePaymentUpdatedPaymentMethodApplicationPaymentMethod extends Dto {
  const PurchasePaymentUpdatedPaymentMethodApplicationPaymentMethod({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentUpdatedPaymentMethodApplicationPaymentMethod? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentUpdatedPaymentMethodApplicationPaymentMethod(
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

/// A [PurchasePaymentUpdatedPaymentMethodApplication]'s `payment_processor`.
class PurchasePaymentUpdatedPaymentMethodApplicationPaymentProcessor
    extends Dto {
  const PurchasePaymentUpdatedPaymentMethodApplicationPaymentProcessor({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentUpdatedPaymentMethodApplicationPaymentProcessor?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentUpdatedPaymentMethodApplicationPaymentProcessor(
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

/// A [PurchasePaymentUpdatedPurchaseInvoiceApplication]'s `purchase_invoice`.
class PurchasePaymentUpdatedPurchaseInvoiceApplicationPurchaseInvoice
    extends Dto {
  const PurchasePaymentUpdatedPurchaseInvoiceApplicationPurchaseInvoice({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static PurchasePaymentUpdatedPurchaseInvoiceApplicationPurchaseInvoice?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentUpdatedPurchaseInvoiceApplicationPurchaseInvoice(
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

/// A [PurchasePaymentPaymentMethodApplication]'s `payment_method`.
class PurchasePaymentPaymentMethodApplicationPaymentMethod extends Dto {
  const PurchasePaymentPaymentMethodApplicationPaymentMethod({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentPaymentMethodApplicationPaymentMethod? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentPaymentMethodApplicationPaymentMethod(
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

/// A [PurchasePaymentPaymentMethodApplication]'s `payment_processor`.
class PurchasePaymentPaymentMethodApplicationPaymentProcessor extends Dto {
  const PurchasePaymentPaymentMethodApplicationPaymentProcessor({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchasePaymentPaymentMethodApplicationPaymentProcessor? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentPaymentMethodApplicationPaymentProcessor(
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

/// A [PurchasePaymentCreditNoteApplication]'s `purchase_credit_note`.
class PurchasePaymentCreditNoteApplicationPurchaseCreditNote extends Dto {
  const PurchasePaymentCreditNoteApplicationPurchaseCreditNote({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static PurchasePaymentCreditNoteApplicationPurchaseCreditNote? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentCreditNoteApplicationPurchaseCreditNote(
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

/// A [PurchasePaymentPurchaseInvoiceApplication]'s `purchase_invoice`.
class PurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice extends Dto {
  const PurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static PurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice(
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

/// A [AccountPurchasePaymentsDataPaymentMethodApplication]'s `payment_method`.
class AccountPurchasePaymentsDataPaymentMethodApplicationPaymentMethod
    extends Dto {
  const AccountPurchasePaymentsDataPaymentMethodApplicationPaymentMethod({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountPurchasePaymentsDataPaymentMethodApplicationPaymentMethod?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchasePaymentsDataPaymentMethodApplicationPaymentMethod(
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

/// A [AccountPurchasePaymentsDataPaymentMethodApplication]'s `payment_processor`.
class AccountPurchasePaymentsDataPaymentMethodApplicationPaymentProcessor
    extends Dto {
  const AccountPurchasePaymentsDataPaymentMethodApplicationPaymentProcessor({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountPurchasePaymentsDataPaymentMethodApplicationPaymentProcessor?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchasePaymentsDataPaymentMethodApplicationPaymentProcessor(
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

/// A [AccountPurchasePaymentsDataCreditNoteApplication]'s `purchase_credit_note`.
class AccountPurchasePaymentsDataCreditNoteApplicationPurchaseCreditNote
    extends Dto {
  const AccountPurchasePaymentsDataCreditNoteApplicationPurchaseCreditNote({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static AccountPurchasePaymentsDataCreditNoteApplicationPurchaseCreditNote?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchasePaymentsDataCreditNoteApplicationPurchaseCreditNote(
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

/// A [AccountPurchasePaymentsDataPurchaseInvoiceApplication]'s `purchase_invoice`.
class AccountPurchasePaymentsDataPurchaseInvoiceApplicationPurchaseInvoice
    extends Dto {
  const AccountPurchasePaymentsDataPurchaseInvoiceApplicationPurchaseInvoice({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static AccountPurchasePaymentsDataPurchaseInvoiceApplicationPurchaseInvoice?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchasePaymentsDataPurchaseInvoiceApplicationPurchaseInvoice(
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

/// What `updatePurchasePaymentNote` answers, under `note`.
class PurchasePaymentNoteUpdated extends Dto {
  const PurchasePaymentNoteUpdated({
    this.attachments,
    this.content,
    this.createdBy,
    this.createdOn,
    this.group,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.purchasePayment,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}',
  ];

  static PurchasePaymentNoteUpdated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return PurchasePaymentNoteUpdated(
      attachments: readList<PurchasePaymentNoteUpdatedAttachment>(
          source['attachments'], PurchasePaymentNoteUpdatedAttachment.fromMap),
      content: readText(source['content']),
      createdBy: PurchasePaymentNoteUpdatedUser.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy:
          PurchasePaymentNoteUpdatedUser.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      purchasePayment: PurchasePaymentNoteUpdatedPurchasePayment.fromMap(
          source['purchase_payment']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<Object>(source['watchers'], readAny),
    );
  }

  final List<PurchasePaymentNoteUpdatedAttachment?>? attachments;

  final String? content;

  final PurchasePaymentNoteUpdatedUser? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? group;

  final String? href;

  final String? id;

  final PurchasePaymentNoteUpdatedUser? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final PurchasePaymentNoteUpdatedPurchasePayment? purchasePayment;

  /// Null in every record measured, so untyped.
  final Object? user;

  final int? version;

  /// Empty in every record measured, so its entries are untyped.
  final List<Object?>? watchers;

  @override
  String? get envelopeKey => 'note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'attachments': attachments,
        'content': content,
        'created_by': createdBy,
        'created_on': createdOn,
        'group': group,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'purchase_payment': purchasePayment,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// One entry of a [PurchasePaymentNoteUpdated]'s `attachments`.
class PurchasePaymentNoteUpdatedAttachment extends Dto {
  const PurchasePaymentNoteUpdatedAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PurchasePaymentNoteUpdatedAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNoteUpdatedAttachment(
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

/// A [PurchasePaymentNoteUpdated]'s `purchase_payment`.
class PurchasePaymentNoteUpdatedPurchasePayment extends Dto {
  const PurchasePaymentNoteUpdatedPurchasePayment({
    this.href,
    this.id,
    this.object,
  });

  static PurchasePaymentNoteUpdatedPurchasePayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNoteUpdatedPurchasePayment(
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

/// A [PurchasePaymentNoteUpdated]'s `created_by` and `last_updated_by`.
class PurchasePaymentNoteUpdatedUser extends Dto {
  const PurchasePaymentNoteUpdatedUser({
    this.name,
    this.object,
  });

  static PurchasePaymentNoteUpdatedUser? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchasePaymentNoteUpdatedUser(
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
