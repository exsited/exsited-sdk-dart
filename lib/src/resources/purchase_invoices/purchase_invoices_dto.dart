/// Typed views over the v4 purchase invoices bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The purchase invoice body.
class PurchaseInvoice extends Dto {
  const PurchaseInvoice({
    this.account,
    this.alternateDueDate,
    this.alternateIssueDate,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customForm,
    this.dueDate,
    this.id,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.origin,
    this.paymentStatus,
    this.priceTaxInclusive,
    this.purchaseOrder,
    this.status,
    this.subtotal,
    this.tax,
    this.total,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices',
    'GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/information',
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_invoices',
  ];

  static PurchaseInvoice? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_invoice');
    if (source == null) return null;
    return PurchaseInvoice(
      account: PurchaseInvoiceAccount.fromMap(source['account']),
      alternateDueDate: readText(source['alternate_due_date']),
      alternateIssueDate: readText(source['alternate_issue_date']),
      createdBy: PurchaseInvoiceCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: PurchaseInvoiceCurrency.fromMap(source['currency']),
      customForm: readAny(source['custom_form']),
      dueDate: readText(source['due_date']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy:
          PurchaseInvoiceLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      origin: readText(source['origin']),
      paymentStatus: readText(source['payment_status']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      purchaseOrder:
          PurchaseInvoicePurchaseOrder.fromMap(source['purchase_order']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      total: readText(source['total']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final PurchaseInvoiceAccount? account;

  final String? alternateDueDate;

  final String? alternateIssueDate;

  final PurchaseInvoiceCreatedBy? createdBy;

  final String? createdOn;

  final PurchaseInvoiceCurrency? currency;

  /// Untyped: never populated in the records measured.
  final Object? customForm;

  final String? dueDate;

  final String? id;

  final String? issueDate;

  final PurchaseInvoiceLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? origin;

  final String? paymentStatus;

  final bool? priceTaxInclusive;

  final PurchaseInvoicePurchaseOrder? purchaseOrder;

  final String? status;

  final String? subtotal;

  final String? tax;

  final String? total;

  final String? uuid;

  final int? version;

  @override
  String? get envelopeKey => 'purchase_invoice';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'alternate_due_date': alternateDueDate,
        'alternate_issue_date': alternateIssueDate,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_form': customForm,
        'due_date': dueDate,
        'id': id,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'origin': origin,
        'payment_status': paymentStatus,
        'price_tax_inclusive': priceTaxInclusive,
        'purchase_order': purchaseOrder,
        'status': status,
        'subtotal': subtotal,
        'tax': tax,
        'total': total,
        'uuid': uuid,
        'version': version,
      };
}

/// A page of PurchaseInvoice records.
class PurchaseInvoiceList extends Dto {
  const PurchaseInvoiceList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices',
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_invoices',
  ];

  static PurchaseInvoiceList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceList(
      data: readList<PurchaseInvoice>(source['data'], PurchaseInvoice.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchaseInvoice?>? data;

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

/// The purchase invoice purchase payment body.
class PurchaseInvoicePurchasePayment extends Dto {
  const PurchaseInvoicePurchasePayment({
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
  ];

  static PurchaseInvoicePurchasePayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicePurchasePayment(
      account: PurchaseInvoicePurchasePaymentAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy:
          PurchaseInvoicePurchasePaymentCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNoteApplications:
          readList<PurchaseInvoicePurchasePaymentCreditNoteApplication>(
              source['credit_note_applications'],
              PurchaseInvoicePurchasePaymentCreditNoteApplication.fromMap),
      creditNoteTotal: readText(source['credit_note_total']),
      currency:
          PurchaseInvoicePurchasePaymentCurrency.fromMap(source['currency']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: PurchaseInvoicePurchasePaymentLastUpdatedBy.fromMap(
          source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      origin: readText(source['origin']),
      paidTotal: readText(source['paid_total']),
      paymentDate: readText(source['payment_date']),
      paymentMethodApplications:
          readList<PurchaseInvoicePurchasePaymentPaymentMethodApplication>(
              source['payment_method_applications'],
              PurchaseInvoicePurchasePaymentPaymentMethodApplication.fromMap),
      paymentNote: readText(source['payment_note']),
      paymentReference: readAny(source['payment_reference']),
      purchaseInvoiceApplications:
          readList<PurchaseInvoicePurchasePaymentPurchaseInvoiceApplication>(
              source['purchase_invoice_applications'],
              PurchaseInvoicePurchasePaymentPurchaseInvoiceApplication.fromMap),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final PurchaseInvoicePurchasePaymentAccount? account;

  final String? code;

  final PurchaseInvoicePurchasePaymentCreatedBy? createdBy;

  final String? createdOn;

  final List<PurchaseInvoicePurchasePaymentCreditNoteApplication?>?
      creditNoteApplications;

  final String? creditNoteTotal;

  final PurchaseInvoicePurchasePaymentCurrency? currency;

  final String? href;

  final String? id;

  final PurchaseInvoicePurchasePaymentLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? origin;

  final String? paidTotal;

  final String? paymentDate;

  final List<PurchaseInvoicePurchasePaymentPaymentMethodApplication?>?
      paymentMethodApplications;

  final String? paymentNote;

  /// Untyped: never populated in the records measured.
  final Object? paymentReference;

  final List<PurchaseInvoicePurchasePaymentPurchaseInvoiceApplication?>?
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

/// A page of PurchaseInvoicePurchasePayment records.
class PurchaseInvoicePurchasePaymentList extends Dto {
  const PurchaseInvoicePurchasePaymentList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_payments',
  ];

  static PurchaseInvoicePurchasePaymentList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicePurchasePaymentList(
      data: readList<PurchaseInvoicePurchasePayment>(
          source['data'], PurchaseInvoicePurchasePayment.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchaseInvoicePurchasePayment?>? data;

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

/// The purchase invoice note body.
class PurchaseInvoiceNote extends Dto {
  const PurchaseInvoiceNote({
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
    this.purchaseInvoice,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes',
  ];

  static PurchaseInvoiceNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNote(
      attachments: readList<PurchaseInvoiceNoteAttachment>(
          source['attachments'], PurchaseInvoiceNoteAttachment.fromMap),
      content: readText(source['content']),
      createdBy: PurchaseInvoiceNoteCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy:
          PurchaseInvoiceNoteLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      purchaseInvoice: PurchaseInvoiceNotePurchaseInvoice.fromMap(
          source['purchase_invoice']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<PurchaseInvoiceNoteWatcher>(
          source['watchers'], PurchaseInvoiceNoteWatcher.fromMap),
    );
  }

  final List<PurchaseInvoiceNoteAttachment?>? attachments;

  final String? content;

  final PurchaseInvoiceNoteCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped: never populated in the records measured.
  final Object? group;

  final String? href;

  final String? id;

  final PurchaseInvoiceNoteLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final PurchaseInvoiceNotePurchaseInvoice? purchaseInvoice;

  /// Untyped: never populated in the records measured.
  final Object? user;

  final int? version;

  final List<PurchaseInvoiceNoteWatcher?>? watchers;

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
        'purchase_invoice': purchaseInvoice,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// A page of PurchaseInvoiceNote records.
class PurchaseInvoiceNoteList extends Dto {
  const PurchaseInvoiceNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes',
  ];

  static PurchaseInvoiceNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNoteList(
      data: readList<PurchaseInvoiceNote>(
          source['data'], PurchaseInvoiceNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchaseInvoiceNote?>? data;

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

/// The purchase invoices note body.
class PurchaseInvoicesNote extends Dto {
  const PurchaseInvoicesNote({
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
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices/notes',
  ];

  static PurchaseInvoicesNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicesNote(
      attachments: readList<Object>(source['attachments'], readAny),
      content: readText(source['content']),
      createdBy: PurchaseInvoicesNoteCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy:
          PurchaseInvoicesNoteLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<PurchaseInvoicesNoteWatcher>(
          source['watchers'], PurchaseInvoicesNoteWatcher.fromMap),
    );
  }

  final List<Object?>? attachments;

  final String? content;

  final PurchaseInvoicesNoteCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped: never populated in the records measured.
  final Object? group;

  final String? href;

  final String? id;

  final PurchaseInvoicesNoteLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  /// Untyped: never populated in the records measured.
  final Object? user;

  final int? version;

  final List<PurchaseInvoicesNoteWatcher?>? watchers;

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
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// A page of PurchaseInvoicesNote records.
class PurchaseInvoicesNoteList extends Dto {
  const PurchaseInvoicesNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices/notes',
  ];

  static PurchaseInvoicesNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicesNoteList(
      data: readList<PurchaseInvoicesNote>(
          source['data'], PurchaseInvoicesNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchaseInvoicesNote?>? data;

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

/// The purchase invoice read body.
class PurchaseInvoiceRead extends Dto {
  const PurchaseInvoiceRead({
    this.account,
    this.activityLogs,
    this.alternateDueDate,
    this.alternateIssueDate,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customAttributes,
    this.customForm,
    this.dueDate,
    this.id,
    this.issueDate,
    this.kpis,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.lines,
    this.object,
    this.origin,
    this.paymentStatus,
    this.priceTaxInclusive,
    this.purchaseOrder,
    this.status,
    this.subtotal,
    this.tax,
    this.total,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}',
    'POST /api/{api_version}/purchase_invoices',
    'POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/amend',
    'POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/reactivate',
    'POST /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_invoices',
  ];

  static PurchaseInvoiceRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_invoice');
    if (source == null) return null;
    return PurchaseInvoiceRead(
      account: PurchaseInvoiceReadAccount.fromMap(source['account']),
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      alternateDueDate: readText(source['alternate_due_date']),
      alternateIssueDate: readText(source['alternate_issue_date']),
      createdBy: PurchaseInvoiceReadCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: PurchaseInvoiceReadCurrency.fromMap(source['currency']),
      customAttributes: readList<PurchaseInvoiceReadCustomAttribute>(
          source['custom_attributes'],
          PurchaseInvoiceReadCustomAttribute.fromMap),
      customForm: readAny(source['custom_form']),
      dueDate: readText(source['due_date']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      kpis: PurchaseInvoiceReadKpis.fromMap(source['kpis']),
      lastUpdatedBy:
          PurchaseInvoiceReadLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lines: readList<PurchaseInvoiceReadLine>(
          source['lines'], PurchaseInvoiceReadLine.fromMap),
      object: readText(source['object']),
      origin: readText(source['origin']),
      paymentStatus: readText(source['payment_status']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      purchaseOrder:
          PurchaseInvoiceReadPurchaseOrder.fromMap(source['purchase_order']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      total: readText(source['total']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final PurchaseInvoiceReadAccount? account;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  final String? alternateDueDate;

  final String? alternateIssueDate;

  final PurchaseInvoiceReadCreatedBy? createdBy;

  final String? createdOn;

  final PurchaseInvoiceReadCurrency? currency;

  final List<PurchaseInvoiceReadCustomAttribute?>? customAttributes;

  /// Untyped: never populated in the records measured.
  final Object? customForm;

  final String? dueDate;

  final String? id;

  final String? issueDate;

  final PurchaseInvoiceReadKpis? kpis;

  final PurchaseInvoiceReadLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final List<PurchaseInvoiceReadLine?>? lines;

  final String? object;

  final String? origin;

  final String? paymentStatus;

  final bool? priceTaxInclusive;

  final PurchaseInvoiceReadPurchaseOrder? purchaseOrder;

  final String? status;

  final String? subtotal;

  final String? tax;

  final String? total;

  final String? uuid;

  final int? version;

  @override
  String? get envelopeKey => 'purchase_invoice';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'activity_logs': activityLogs,
        'alternate_due_date': alternateDueDate,
        'alternate_issue_date': alternateIssueDate,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_attributes': customAttributes,
        'custom_form': customForm,
        'due_date': dueDate,
        'id': id,
        'issue_date': issueDate,
        'kpis': kpis,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'lines': lines,
        'object': object,
        'origin': origin,
        'payment_status': paymentStatus,
        'price_tax_inclusive': priceTaxInclusive,
        'purchase_order': purchaseOrder,
        'status': status,
        'subtotal': subtotal,
        'tax': tax,
        'total': total,
        'uuid': uuid,
        'version': version,
      };
}

/// The account purchase invoices body.
class AccountPurchaseInvoices extends Dto {
  const AccountPurchaseInvoices({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/purchase_invoices',
    'GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_credit_note_applications',
  ];

  static AccountPurchaseInvoices? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseInvoices(
      data: readList<AccountPurchaseInvoicesData>(
          source['data'], AccountPurchaseInvoicesData.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<AccountPurchaseInvoicesData?>? data;

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

/// The purchase invoice information body.
class PurchaseInvoiceInformation extends Dto {
  const PurchaseInvoiceInformation({
    this.account,
    this.activityLogs,
    this.alternateDueDate,
    this.alternateIssueDate,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customAttributes,
    this.customForm,
    this.dueDate,
    this.id,
    this.invoiceNote,
    this.issueDate,
    this.kpis,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.lines,
    this.object,
    this.origin,
    this.paymentStatus,
    this.priceTaxInclusive,
    this.purchaseOrder,
    this.status,
    this.subtotal,
    this.tax,
    this.total,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/purchase_invoices/{purchase_invoice_id}/information',
  ];

  static PurchaseInvoiceInformation? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_invoice');
    if (source == null) return null;
    return PurchaseInvoiceInformation(
      account: PurchaseInvoiceInformationAccount.fromMap(source['account']),
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      alternateDueDate: readText(source['alternate_due_date']),
      alternateIssueDate: readText(source['alternate_issue_date']),
      createdBy:
          PurchaseInvoiceInformationCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: PurchaseInvoiceInformationCurrency.fromMap(source['currency']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customForm: readAny(source['custom_form']),
      dueDate: readText(source['due_date']),
      id: readText(source['id']),
      invoiceNote: readText(source['invoice_note']),
      issueDate: readText(source['issue_date']),
      kpis: PurchaseInvoiceInformationKpis.fromMap(source['kpis']),
      lastUpdatedBy: PurchaseInvoiceInformationLastUpdatedBy.fromMap(
          source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lines: readList<PurchaseInvoiceInformationLine>(
          source['lines'], PurchaseInvoiceInformationLine.fromMap),
      object: readText(source['object']),
      origin: readText(source['origin']),
      paymentStatus: readText(source['payment_status']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      purchaseOrder: readAny(source['purchase_order']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      total: readText(source['total']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final PurchaseInvoiceInformationAccount? account;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  final String? alternateDueDate;

  final String? alternateIssueDate;

  final PurchaseInvoiceInformationCreatedBy? createdBy;

  final String? createdOn;

  final PurchaseInvoiceInformationCurrency? currency;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? customAttributes;

  /// Untyped: null in every record measured.
  final Object? customForm;

  final String? dueDate;

  final String? id;

  final String? invoiceNote;

  final String? issueDate;

  final PurchaseInvoiceInformationKpis? kpis;

  final PurchaseInvoiceInformationLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final List<PurchaseInvoiceInformationLine?>? lines;

  final String? object;

  final String? origin;

  final String? paymentStatus;

  final bool? priceTaxInclusive;

  /// Untyped: null in every record measured.
  final Object? purchaseOrder;

  final String? status;

  final String? subtotal;

  final String? tax;

  final String? total;

  final String? uuid;

  final int? version;

  @override
  String? get envelopeKey => 'purchase_invoice';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'activity_logs': activityLogs,
        'alternate_due_date': alternateDueDate,
        'alternate_issue_date': alternateIssueDate,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_attributes': customAttributes,
        'custom_form': customForm,
        'due_date': dueDate,
        'id': id,
        'invoice_note': invoiceNote,
        'issue_date': issueDate,
        'kpis': kpis,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'lines': lines,
        'object': object,
        'origin': origin,
        'payment_status': paymentStatus,
        'price_tax_inclusive': priceTaxInclusive,
        'purchase_order': purchaseOrder,
        'status': status,
        'subtotal': subtotal,
        'tax': tax,
        'total': total,
        'uuid': uuid,
        'version': version,
      };
}

/// The purchase invoice cancel body.
class PurchaseInvoiceCancel extends Dto {
  const PurchaseInvoiceCancel({
    this.account,
    this.activityLogs,
    this.alternateDueDate,
    this.alternateIssueDate,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customAttributes,
    this.customForm,
    this.dueDate,
    this.eventUuid,
    this.id,
    this.issueDate,
    this.kpis,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.lines,
    this.object,
    this.origin,
    this.paymentStatus,
    this.priceTaxInclusive,
    this.purchaseOrder,
    this.status,
    this.subtotal,
    this.tax,
    this.total,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/cancel',
  ];

  static PurchaseInvoiceCancel? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_invoice');
    if (source == null) return null;
    return PurchaseInvoiceCancel(
      account: PurchaseInvoiceCancelAccount.fromMap(source['account']),
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      alternateDueDate: readText(source['alternate_due_date']),
      alternateIssueDate: readText(source['alternate_issue_date']),
      createdBy: PurchaseInvoiceCancelCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: PurchaseInvoiceCancelCurrency.fromMap(source['currency']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customForm: readAny(source['custom_form']),
      dueDate: readText(source['due_date']),
      eventUuid: readText(source['event_uuid']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      kpis: PurchaseInvoiceCancelKpis.fromMap(source['kpis']),
      lastUpdatedBy:
          PurchaseInvoiceCancelLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lines: readList<PurchaseInvoiceCancelLine>(
          source['lines'], PurchaseInvoiceCancelLine.fromMap),
      object: readText(source['object']),
      origin: readText(source['origin']),
      paymentStatus: readText(source['payment_status']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      purchaseOrder: readAny(source['purchase_order']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      total: readText(source['total']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final PurchaseInvoiceCancelAccount? account;

  final List<Object?>? activityLogs;

  final String? alternateDueDate;

  final String? alternateIssueDate;

  final PurchaseInvoiceCancelCreatedBy? createdBy;

  final String? createdOn;

  final PurchaseInvoiceCancelCurrency? currency;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? customAttributes;

  /// Untyped: null in every record measured.
  final Object? customForm;

  final String? dueDate;

  final String? eventUuid;

  final String? id;

  final String? issueDate;

  final PurchaseInvoiceCancelKpis? kpis;

  final PurchaseInvoiceCancelLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final List<PurchaseInvoiceCancelLine?>? lines;

  final String? object;

  final String? origin;

  final String? paymentStatus;

  final bool? priceTaxInclusive;

  /// Untyped: null in every record measured.
  final Object? purchaseOrder;

  final String? status;

  final String? subtotal;

  final String? tax;

  final String? total;

  final String? uuid;

  final int? version;

  @override
  String? get envelopeKey => 'purchase_invoice';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'activity_logs': activityLogs,
        'alternate_due_date': alternateDueDate,
        'alternate_issue_date': alternateIssueDate,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_attributes': customAttributes,
        'custom_form': customForm,
        'due_date': dueDate,
        'event_uuid': eventUuid,
        'id': id,
        'issue_date': issueDate,
        'kpis': kpis,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'lines': lines,
        'object': object,
        'origin': origin,
        'payment_status': paymentStatus,
        'price_tax_inclusive': priceTaxInclusive,
        'purchase_order': purchaseOrder,
        'status': status,
        'subtotal': subtotal,
        'tax': tax,
        'total': total,
        'uuid': uuid,
        'version': version,
      };
}

/// The purchase invoice notes body.
class PurchaseInvoiceNotes extends Dto {
  const PurchaseInvoiceNotes({
    this.attachments,
    this.content,
    this.createdBy,
    this.createdOn,
    this.externalWatchers,
    this.group,
    this.href,
    this.id,
    this.internalWatchers,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.purchaseInvoice,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes',
  ];

  static PurchaseInvoiceNotes? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return PurchaseInvoiceNotes(
      attachments: readList<PurchaseInvoiceNotesAttachment>(
          source['attachments'], PurchaseInvoiceNotesAttachment.fromMap),
      content: readText(source['content']),
      createdBy: PurchaseInvoiceNotesCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      externalWatchers: readList<Object>(source['external_watchers'], readAny),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      internalWatchers: readList<Object>(source['internal_watchers'], readAny),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      purchaseInvoice: PurchaseInvoiceNotesPurchaseInvoice.fromMap(
          source['purchase_invoice']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<PurchaseInvoiceNotesWatcher>(
          source['watchers'], PurchaseInvoiceNotesWatcher.fromMap),
    );
  }

  final List<PurchaseInvoiceNotesAttachment?>? attachments;

  final String? content;

  final PurchaseInvoiceNotesCreatedBy? createdBy;

  final String? createdOn;

  final List<Object?>? externalWatchers;

  /// Untyped: null in every record measured.
  final Object? group;

  final String? href;

  final String? id;

  final List<Object?>? internalWatchers;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final String? object;

  final PurchaseInvoiceNotesPurchaseInvoice? purchaseInvoice;

  /// Untyped: null in every record measured.
  final Object? user;

  final int? version;

  final List<PurchaseInvoiceNotesWatcher?>? watchers;

  @override
  String? get envelopeKey => 'note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'attachments': attachments,
        'content': content,
        'created_by': createdBy,
        'created_on': createdOn,
        'external_watchers': externalWatchers,
        'group': group,
        'href': href,
        'id': id,
        'internal_watchers': internalWatchers,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'purchase_invoice': purchaseInvoice,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// The purchase invoice lines body.
class PurchaseInvoiceLines extends Dto {
  const PurchaseInvoiceLines({
    this.lines,
    this.object,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/lines',
  ];

  static PurchaseInvoiceLines? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_invoice');
    if (source == null) return null;
    return PurchaseInvoiceLines(
      lines: readList<PurchaseInvoiceLinesLine>(
          source['lines'], PurchaseInvoiceLinesLine.fromMap),
      object: readText(source['object']),
    );
  }

  final List<PurchaseInvoiceLinesLine?>? lines;

  final String? object;

  @override
  String? get envelopeKey => 'purchase_invoice';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'lines': lines,
        'object': object,
      };
}

/// The purchase invoice line body.
class PurchaseInvoiceLine extends Dto {
  const PurchaseInvoiceLine({
    this.line,
    this.object,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/lines/{purchase_invoice_line_uuid}',
  ];

  static PurchaseInvoiceLine? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_invoice');
    if (source == null) return null;
    return PurchaseInvoiceLine(
      line: PurchaseInvoiceLineLine.fromMap(source['line']),
      object: readText(source['object']),
    );
  }

  final PurchaseInvoiceLineLine? line;

  final String? object;

  @override
  String? get envelopeKey => 'purchase_invoice';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'line': line,
        'object': object,
      };
}

/// The purchase invoice note read body.
class PurchaseInvoiceNoteRead extends Dto {
  const PurchaseInvoiceNoteRead({
    this.note,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}',
    'GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}/files',
  ];

  static PurchaseInvoiceNoteRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_invoice');
    if (source == null) return null;
    return PurchaseInvoiceNoteRead(
      note: readAny(source['note']),
    );
  }

  final Object? note;

  @override
  String? get envelopeKey => 'purchase_invoice';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'note': note,
      };
}

/// What `getPurchaseInvoiceNote` answers, under `note`.
class PurchaseInvoiceNoteView extends Dto {
  const PurchaseInvoiceNoteView({
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
    this.purchaseInvoice,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}',
    'PATCH /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}',
  ];

  static PurchaseInvoiceNoteView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return PurchaseInvoiceNoteView(
      attachments: readList<PurchaseInvoiceNoteViewAttachment>(
          source['attachments'], PurchaseInvoiceNoteViewAttachment.fromMap),
      content: readText(source['content']),
      createdBy: PurchaseInvoiceNoteViewCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: PurchaseInvoiceNoteViewLastUpdatedBy.fromMap(
          source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      purchaseInvoice: PurchaseInvoiceNoteViewPurchaseInvoice.fromMap(
          source['purchase_invoice']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<PurchaseInvoiceNoteViewWatcher>(
          source['watchers'], PurchaseInvoiceNoteViewWatcher.fromMap),
    );
  }

  final List<PurchaseInvoiceNoteViewAttachment?>? attachments;

  final String? content;

  final PurchaseInvoiceNoteViewCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? group;

  final String? href;

  final String? id;

  final PurchaseInvoiceNoteViewLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final PurchaseInvoiceNoteViewPurchaseInvoice? purchaseInvoice;

  /// Untyped: null in every record measured.
  final Object? user;

  final int? version;

  final List<PurchaseInvoiceNoteViewWatcher?>? watchers;

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
        'purchase_invoice': purchaseInvoice,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// One page of what `getPurchaseInvoiceNoteFiles` lists, under `data`.
class PurchaseInvoiceNoteFileList extends Dto {
  const PurchaseInvoiceNoteFileList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}/files',
  ];

  static PurchaseInvoiceNoteFileList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNoteFileList(
      data: readList<PurchaseInvoiceNoteFileEntry>(
          source['data'], PurchaseInvoiceNoteFileEntry.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchaseInvoiceNoteFileEntry?>? data;

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

/// What `getPurchaseInvoiceNoteFile` answers, under `file`.
class PurchaseInvoiceNoteFile extends Dto {
  const PurchaseInvoiceNoteFile({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}/files/{file_id}',
  ];

  static PurchaseInvoiceNoteFile? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'file');
    if (source == null) return null;
    return PurchaseInvoiceNoteFile(
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

/// One entry of a [AccountPurchaseInvoices]'s `data`.
class AccountPurchaseInvoicesData extends Dto {
  const AccountPurchaseInvoicesData({
    this.account,
    this.alternateDueDate,
    this.alternateIssueDate,
    this.amount,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customForm,
    this.dueDate,
    this.href,
    this.id,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.origin,
    this.paymentStatus,
    this.priceTaxInclusive,
    this.purchaseCreditNote,
    this.purchaseOrder,
    this.purchasePayment,
    this.remainingBalance,
    this.status,
    this.subtotal,
    this.tax,
    this.total,
    this.uuid,
    this.version,
  });

  static AccountPurchaseInvoicesData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseInvoicesData(
      account: AccountPurchaseInvoicesDataAccount.fromMap(source['account']),
      alternateDueDate: readText(source['alternate_due_date']),
      alternateIssueDate: readText(source['alternate_issue_date']),
      amount: readText(source['amount']),
      createdBy:
          AccountPurchaseInvoicesDataCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: AccountPurchaseInvoicesDataCurrency.fromMap(source['currency']),
      customForm: readAny(source['custom_form']),
      dueDate: readText(source['due_date']),
      href: readText(source['href']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      origin: readAny(source['origin']),
      paymentStatus: readText(source['payment_status']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      purchaseCreditNote: AccountPurchaseInvoicesDataPurchaseCreditNote.fromMap(
          source['purchase_credit_note']),
      purchaseOrder: AccountPurchaseInvoicesDataPurchaseOrder.fromMap(
          source['purchase_order']),
      purchasePayment: AccountPurchaseInvoicesDataPurchasePayment.fromMap(
          source['purchase_payment']),
      remainingBalance: readText(source['remaining_balance']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      total: readText(source['total']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final AccountPurchaseInvoicesDataAccount? account;

  final String? alternateDueDate;

  final String? alternateIssueDate;

  final String? amount;

  final AccountPurchaseInvoicesDataCreatedBy? createdBy;

  final String? createdOn;

  final AccountPurchaseInvoicesDataCurrency? currency;

  /// Untyped: null in every record measured.
  final Object? customForm;

  final String? dueDate;

  final String? href;

  final String? id;

  final String? issueDate;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  /// Untyped: null in every record measured.
  final Object? origin;

  final String? paymentStatus;

  final bool? priceTaxInclusive;

  final AccountPurchaseInvoicesDataPurchaseCreditNote? purchaseCreditNote;

  final AccountPurchaseInvoicesDataPurchaseOrder? purchaseOrder;

  final AccountPurchaseInvoicesDataPurchasePayment? purchasePayment;

  final String? remainingBalance;

  final String? status;

  final String? subtotal;

  final String? tax;

  final String? total;

  final String? uuid;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'alternate_due_date': alternateDueDate,
        'alternate_issue_date': alternateIssueDate,
        'amount': amount,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_form': customForm,
        'due_date': dueDate,
        'href': href,
        'id': id,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'origin': origin,
        'payment_status': paymentStatus,
        'price_tax_inclusive': priceTaxInclusive,
        'purchase_credit_note': purchaseCreditNote,
        'purchase_order': purchaseOrder,
        'purchase_payment': purchasePayment,
        'remaining_balance': remainingBalance,
        'status': status,
        'subtotal': subtotal,
        'tax': tax,
        'total': total,
        'uuid': uuid,
        'version': version,
      };
}

/// A [PurchaseInvoiceRead]'s `currency`.
class PurchaseInvoiceReadCurrency extends Dto {
  const PurchaseInvoiceReadCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoiceReadCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceReadCurrency(
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

/// A [PurchaseInvoiceRead]'s `account`.
class PurchaseInvoiceReadAccount extends Dto {
  const PurchaseInvoiceReadAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoiceReadAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceReadAccount(
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

/// A [PurchaseInvoiceRead]'s `purchase_order`.
class PurchaseInvoiceReadPurchaseOrder extends Dto {
  const PurchaseInvoiceReadPurchaseOrder({
    this.href,
    this.id,
    this.object,
  });

  static PurchaseInvoiceReadPurchaseOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceReadPurchaseOrder(
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

/// A [PurchaseInvoiceRead]'s `created_by`.
class PurchaseInvoiceReadCreatedBy extends Dto {
  const PurchaseInvoiceReadCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoiceReadCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceReadCreatedBy(
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

/// A [PurchaseInvoiceRead]'s `last_updated_by`.
class PurchaseInvoiceReadLastUpdatedBy extends Dto {
  const PurchaseInvoiceReadLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoiceReadLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceReadLastUpdatedBy(
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

/// One entry of a [PurchaseInvoiceRead]'s `custom_attributes`.
class PurchaseInvoiceReadCustomAttribute extends Dto {
  const PurchaseInvoiceReadCustomAttribute({
    this.href,
    this.id,
    this.name,
    this.object,
    this.type,
    this.value,
  });

  static PurchaseInvoiceReadCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceReadCustomAttribute(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      type: readText(source['type']),
      value: readText(source['value']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? type;

  final String? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'type': type,
        'value': value,
      };
}

/// One entry of a [PurchaseInvoiceRead]'s `lines`.
class PurchaseInvoiceReadLine extends Dto {
  const PurchaseInvoiceReadLine({
    this.accountingCode,
    this.id,
    this.item,
    this.object,
    this.quantity,
    this.subtotal,
    this.tax,
    this.total,
    this.uom,
    this.version,
    this.warehouse,
  });

  static PurchaseInvoiceReadLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceReadLine(
      accountingCode: readText(source['accounting_code']),
      id: readText(source['id']),
      item: PurchaseInvoiceReadLineItem.fromMap(source['item']),
      object: readText(source['object']),
      quantity: readInteger(source['quantity']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      total: readText(source['total']),
      uom: readText(source['uom']),
      version: readInteger(source['version']),
      warehouse: readText(source['warehouse']),
    );
  }

  final String? accountingCode;

  final String? id;

  final PurchaseInvoiceReadLineItem? item;

  final String? object;

  final int? quantity;

  final String? subtotal;

  final String? tax;

  final String? total;

  final String? uom;

  final int? version;

  final String? warehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'id': id,
        'item': item,
        'object': object,
        'quantity': quantity,
        'subtotal': subtotal,
        'tax': tax,
        'total': total,
        'uom': uom,
        'version': version,
        'warehouse': warehouse,
      };
}

/// A [PurchaseInvoiceRead]'s `kpis`.
class PurchaseInvoiceReadKpis extends Dto {
  const PurchaseInvoiceReadKpis({
    this.creditApplied,
    this.creditIssued,
    this.deletedOn,
    this.lastAmendedOn,
    this.lastCancelledOn,
    this.lastPaymentDate,
    this.lastReactivatedOn,
    this.object,
    this.outstanding,
    this.overdue,
    this.paymentApplied,
    this.voidedOn,
  });

  static PurchaseInvoiceReadKpis? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceReadKpis(
      creditApplied: readText(source['credit_applied']),
      creditIssued: readText(source['credit_issued']),
      deletedOn: readAny(source['deleted_on']),
      lastAmendedOn: readAny(source['last_amended_on']),
      lastCancelledOn: readAny(source['last_cancelled_on']),
      lastPaymentDate: readAny(source['last_payment_date']),
      lastReactivatedOn: readAny(source['last_reactivated_on']),
      object: readText(source['object']),
      outstanding: readText(source['outstanding']),
      overdue: readText(source['overdue']),
      paymentApplied: readText(source['payment_applied']),
      voidedOn: readAny(source['voided_on']),
    );
  }

  final String? creditApplied;

  final String? creditIssued;

  /// Untyped: null in every record measured.
  final Object? deletedOn;

  /// Untyped: null in every record measured.
  final Object? lastAmendedOn;

  /// Untyped: null in every record measured.
  final Object? lastCancelledOn;

  /// Untyped: null in every record measured.
  final Object? lastPaymentDate;

  /// Untyped: null in every record measured.
  final Object? lastReactivatedOn;

  final String? object;

  final String? outstanding;

  final String? overdue;

  final String? paymentApplied;

  /// Untyped: null in every record measured.
  final Object? voidedOn;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'credit_applied': creditApplied,
        'credit_issued': creditIssued,
        'deleted_on': deletedOn,
        'last_amended_on': lastAmendedOn,
        'last_cancelled_on': lastCancelledOn,
        'last_payment_date': lastPaymentDate,
        'last_reactivated_on': lastReactivatedOn,
        'object': object,
        'outstanding': outstanding,
        'overdue': overdue,
        'payment_applied': paymentApplied,
        'voided_on': voidedOn,
      };
}

/// A [PurchaseInvoice]'s `currency`.
class PurchaseInvoiceCurrency extends Dto {
  const PurchaseInvoiceCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoiceCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceCurrency(
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

/// A [PurchaseInvoice]'s `account`.
class PurchaseInvoiceAccount extends Dto {
  const PurchaseInvoiceAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoiceAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceAccount(
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

/// A [PurchaseInvoice]'s `purchase_order`.
class PurchaseInvoicePurchaseOrder extends Dto {
  const PurchaseInvoicePurchaseOrder({
    this.href,
    this.id,
    this.object,
  });

  static PurchaseInvoicePurchaseOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicePurchaseOrder(
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

/// A [PurchaseInvoice]'s `created_by`.
class PurchaseInvoiceCreatedBy extends Dto {
  const PurchaseInvoiceCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoiceCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceCreatedBy(
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

/// A [PurchaseInvoice]'s `last_updated_by`.
class PurchaseInvoiceLastUpdatedBy extends Dto {
  const PurchaseInvoiceLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoiceLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceLastUpdatedBy(
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

/// One entry of a [PurchaseInvoiceLines]'s `lines`.
class PurchaseInvoiceLinesLine extends Dto {
  const PurchaseInvoiceLinesLine({
    this.accountingCode,
    this.id,
    this.item,
    this.object,
    this.quantity,
    this.subtotal,
    this.tax,
    this.total,
    this.uom,
    this.version,
    this.warehouse,
  });

  static PurchaseInvoiceLinesLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceLinesLine(
      accountingCode: readText(source['accounting_code']),
      id: readText(source['id']),
      item: PurchaseInvoiceLinesLineItem.fromMap(source['item']),
      object: readText(source['object']),
      quantity: readInteger(source['quantity']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      total: readText(source['total']),
      uom: readText(source['uom']),
      version: readInteger(source['version']),
      warehouse: readText(source['warehouse']),
    );
  }

  final String? accountingCode;

  final String? id;

  final PurchaseInvoiceLinesLineItem? item;

  final String? object;

  final int? quantity;

  final String? subtotal;

  final String? tax;

  final String? total;

  final String? uom;

  final int? version;

  final String? warehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'id': id,
        'item': item,
        'object': object,
        'quantity': quantity,
        'subtotal': subtotal,
        'tax': tax,
        'total': total,
        'uom': uom,
        'version': version,
        'warehouse': warehouse,
      };
}

/// A [PurchaseInvoiceLine]'s `line`.
class PurchaseInvoiceLineLine extends Dto {
  const PurchaseInvoiceLineLine({
    this.accountingCode,
    this.id,
    this.item,
    this.object,
    this.quantity,
    this.subtotal,
    this.tax,
    this.total,
    this.uom,
    this.version,
    this.warehouse,
  });

  static PurchaseInvoiceLineLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceLineLine(
      accountingCode: readText(source['accounting_code']),
      id: readText(source['id']),
      item: PurchaseInvoiceLineLineItem.fromMap(source['item']),
      object: readText(source['object']),
      quantity: readInteger(source['quantity']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      total: readText(source['total']),
      uom: readText(source['uom']),
      version: readInteger(source['version']),
      warehouse: readText(source['warehouse']),
    );
  }

  final String? accountingCode;

  final String? id;

  final PurchaseInvoiceLineLineItem? item;

  final String? object;

  final int? quantity;

  final String? subtotal;

  final String? tax;

  final String? total;

  final String? uom;

  final int? version;

  final String? warehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'id': id,
        'item': item,
        'object': object,
        'quantity': quantity,
        'subtotal': subtotal,
        'tax': tax,
        'total': total,
        'uom': uom,
        'version': version,
        'warehouse': warehouse,
      };
}

/// A [PurchaseInvoiceInformation]'s `currency`.
class PurchaseInvoiceInformationCurrency extends Dto {
  const PurchaseInvoiceInformationCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoiceInformationCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceInformationCurrency(
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

/// A [PurchaseInvoiceInformation]'s `account`.
class PurchaseInvoiceInformationAccount extends Dto {
  const PurchaseInvoiceInformationAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoiceInformationAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceInformationAccount(
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

/// A [PurchaseInvoiceInformation]'s `created_by`.
class PurchaseInvoiceInformationCreatedBy extends Dto {
  const PurchaseInvoiceInformationCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoiceInformationCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceInformationCreatedBy(
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

/// A [PurchaseInvoiceInformation]'s `last_updated_by`.
class PurchaseInvoiceInformationLastUpdatedBy extends Dto {
  const PurchaseInvoiceInformationLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoiceInformationLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceInformationLastUpdatedBy(
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

/// One entry of a [PurchaseInvoiceInformation]'s `lines`.
class PurchaseInvoiceInformationLine extends Dto {
  const PurchaseInvoiceInformationLine({
    this.accountingCode,
    this.id,
    this.item,
    this.object,
    this.quantity,
    this.subtotal,
    this.tax,
    this.total,
    this.uom,
    this.version,
    this.warehouse,
  });

  static PurchaseInvoiceInformationLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceInformationLine(
      accountingCode: readText(source['accounting_code']),
      id: readText(source['id']),
      item: PurchaseInvoiceInformationLineItem.fromMap(source['item']),
      object: readText(source['object']),
      quantity: readInteger(source['quantity']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      total: readText(source['total']),
      uom: readText(source['uom']),
      version: readInteger(source['version']),
      warehouse: readText(source['warehouse']),
    );
  }

  final String? accountingCode;

  final String? id;

  final PurchaseInvoiceInformationLineItem? item;

  final String? object;

  final int? quantity;

  final String? subtotal;

  final String? tax;

  final String? total;

  final String? uom;

  final int? version;

  final String? warehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'id': id,
        'item': item,
        'object': object,
        'quantity': quantity,
        'subtotal': subtotal,
        'tax': tax,
        'total': total,
        'uom': uom,
        'version': version,
        'warehouse': warehouse,
      };
}

/// A [PurchaseInvoiceInformation]'s `kpis`.
class PurchaseInvoiceInformationKpis extends Dto {
  const PurchaseInvoiceInformationKpis({
    this.creditApplied,
    this.creditIssued,
    this.deletedOn,
    this.lastAmendedOn,
    this.lastCancelledOn,
    this.lastPaymentDate,
    this.lastReactivatedOn,
    this.object,
    this.outstanding,
    this.overdue,
    this.paymentApplied,
    this.voidedOn,
  });

  static PurchaseInvoiceInformationKpis? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceInformationKpis(
      creditApplied: readText(source['credit_applied']),
      creditIssued: readText(source['credit_issued']),
      deletedOn: readAny(source['deleted_on']),
      lastAmendedOn: readAny(source['last_amended_on']),
      lastCancelledOn: readAny(source['last_cancelled_on']),
      lastPaymentDate: readAny(source['last_payment_date']),
      lastReactivatedOn: readAny(source['last_reactivated_on']),
      object: readText(source['object']),
      outstanding: readText(source['outstanding']),
      overdue: readText(source['overdue']),
      paymentApplied: readText(source['payment_applied']),
      voidedOn: readAny(source['voided_on']),
    );
  }

  final String? creditApplied;

  final String? creditIssued;

  /// Untyped: null in every record measured.
  final Object? deletedOn;

  /// Untyped: null in every record measured.
  final Object? lastAmendedOn;

  /// Untyped: null in every record measured.
  final Object? lastCancelledOn;

  /// Untyped: null in every record measured.
  final Object? lastPaymentDate;

  /// Untyped: null in every record measured.
  final Object? lastReactivatedOn;

  final String? object;

  final String? outstanding;

  final String? overdue;

  final String? paymentApplied;

  /// Untyped: null in every record measured.
  final Object? voidedOn;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'credit_applied': creditApplied,
        'credit_issued': creditIssued,
        'deleted_on': deletedOn,
        'last_amended_on': lastAmendedOn,
        'last_cancelled_on': lastCancelledOn,
        'last_payment_date': lastPaymentDate,
        'last_reactivated_on': lastReactivatedOn,
        'object': object,
        'outstanding': outstanding,
        'overdue': overdue,
        'payment_applied': paymentApplied,
        'voided_on': voidedOn,
      };
}

/// A [PurchaseInvoiceCancel]'s `currency`.
class PurchaseInvoiceCancelCurrency extends Dto {
  const PurchaseInvoiceCancelCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoiceCancelCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceCancelCurrency(
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

/// A [PurchaseInvoiceCancel]'s `account`.
class PurchaseInvoiceCancelAccount extends Dto {
  const PurchaseInvoiceCancelAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoiceCancelAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceCancelAccount(
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

/// A [PurchaseInvoiceCancel]'s `created_by`.
class PurchaseInvoiceCancelCreatedBy extends Dto {
  const PurchaseInvoiceCancelCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoiceCancelCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceCancelCreatedBy(
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

/// A [PurchaseInvoiceCancel]'s `last_updated_by`.
class PurchaseInvoiceCancelLastUpdatedBy extends Dto {
  const PurchaseInvoiceCancelLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoiceCancelLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceCancelLastUpdatedBy(
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

/// One entry of a [PurchaseInvoiceCancel]'s `lines`.
class PurchaseInvoiceCancelLine extends Dto {
  const PurchaseInvoiceCancelLine({
    this.accountingCode,
    this.id,
    this.item,
    this.object,
    this.quantity,
    this.subtotal,
    this.tax,
    this.total,
    this.uom,
    this.version,
    this.warehouse,
  });

  static PurchaseInvoiceCancelLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceCancelLine(
      accountingCode: readText(source['accounting_code']),
      id: readText(source['id']),
      item: PurchaseInvoiceCancelLineItem.fromMap(source['item']),
      object: readText(source['object']),
      quantity: readInteger(source['quantity']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      total: readText(source['total']),
      uom: readText(source['uom']),
      version: readInteger(source['version']),
      warehouse: readText(source['warehouse']),
    );
  }

  final String? accountingCode;

  final String? id;

  final PurchaseInvoiceCancelLineItem? item;

  final String? object;

  final int? quantity;

  final String? subtotal;

  final String? tax;

  final String? total;

  final String? uom;

  final int? version;

  final String? warehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'id': id,
        'item': item,
        'object': object,
        'quantity': quantity,
        'subtotal': subtotal,
        'tax': tax,
        'total': total,
        'uom': uom,
        'version': version,
        'warehouse': warehouse,
      };
}

/// A [PurchaseInvoiceCancel]'s `kpis`.
class PurchaseInvoiceCancelKpis extends Dto {
  const PurchaseInvoiceCancelKpis({
    this.creditApplied,
    this.creditIssued,
    this.deletedOn,
    this.lastAmendedOn,
    this.lastCancelledOn,
    this.lastPaymentDate,
    this.lastReactivatedOn,
    this.object,
    this.outstanding,
    this.overdue,
    this.paymentApplied,
    this.voidedOn,
  });

  static PurchaseInvoiceCancelKpis? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceCancelKpis(
      creditApplied: readText(source['credit_applied']),
      creditIssued: readText(source['credit_issued']),
      deletedOn: readAny(source['deleted_on']),
      lastAmendedOn: readAny(source['last_amended_on']),
      lastCancelledOn: readAny(source['last_cancelled_on']),
      lastPaymentDate: readAny(source['last_payment_date']),
      lastReactivatedOn: readAny(source['last_reactivated_on']),
      object: readText(source['object']),
      outstanding: readText(source['outstanding']),
      overdue: readText(source['overdue']),
      paymentApplied: readText(source['payment_applied']),
      voidedOn: readAny(source['voided_on']),
    );
  }

  final String? creditApplied;

  final String? creditIssued;

  /// Untyped: null in every record measured.
  final Object? deletedOn;

  /// Untyped: null in every record measured.
  final Object? lastAmendedOn;

  /// Untyped: null in every record measured.
  final Object? lastCancelledOn;

  /// Untyped: null in every record measured.
  final Object? lastPaymentDate;

  /// Untyped: null in every record measured.
  final Object? lastReactivatedOn;

  final String? object;

  final String? outstanding;

  final String? overdue;

  final String? paymentApplied;

  /// Untyped: null in every record measured.
  final Object? voidedOn;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'credit_applied': creditApplied,
        'credit_issued': creditIssued,
        'deleted_on': deletedOn,
        'last_amended_on': lastAmendedOn,
        'last_cancelled_on': lastCancelledOn,
        'last_payment_date': lastPaymentDate,
        'last_reactivated_on': lastReactivatedOn,
        'object': object,
        'outstanding': outstanding,
        'overdue': overdue,
        'payment_applied': paymentApplied,
        'voided_on': voidedOn,
      };
}

/// A [PurchaseInvoiceNotes]'s `purchase_invoice`.
class PurchaseInvoiceNotesPurchaseInvoice extends Dto {
  const PurchaseInvoiceNotesPurchaseInvoice({
    this.href,
    this.id,
    this.object,
  });

  static PurchaseInvoiceNotesPurchaseInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNotesPurchaseInvoice(
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

/// One entry of a [PurchaseInvoiceNotes]'s `attachments`.
class PurchaseInvoiceNotesAttachment extends Dto {
  const PurchaseInvoiceNotesAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PurchaseInvoiceNotesAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNotesAttachment(
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

/// One entry of a [PurchaseInvoiceNotes]'s `watchers`.
class PurchaseInvoiceNotesWatcher extends Dto {
  const PurchaseInvoiceNotesWatcher({
    this.email,
    this.name,
    this.type,
  });

  static PurchaseInvoiceNotesWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNotesWatcher(
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

/// A [PurchaseInvoiceNotes]'s `created_by`.
class PurchaseInvoiceNotesCreatedBy extends Dto {
  const PurchaseInvoiceNotesCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoiceNotesCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNotesCreatedBy(
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

/// A [PurchaseInvoiceNoteView]'s `purchase_invoice`.
class PurchaseInvoiceNoteViewPurchaseInvoice extends Dto {
  const PurchaseInvoiceNoteViewPurchaseInvoice({
    this.href,
    this.id,
    this.object,
  });

  static PurchaseInvoiceNoteViewPurchaseInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNoteViewPurchaseInvoice(
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

/// One entry of a [PurchaseInvoiceNoteView]'s `attachments`.
class PurchaseInvoiceNoteViewAttachment extends Dto {
  const PurchaseInvoiceNoteViewAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PurchaseInvoiceNoteViewAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNoteViewAttachment(
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

/// One entry of a [PurchaseInvoiceNoteView]'s `watchers`.
class PurchaseInvoiceNoteViewWatcher extends Dto {
  const PurchaseInvoiceNoteViewWatcher({
    this.email,
    this.name,
    this.type,
  });

  static PurchaseInvoiceNoteViewWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNoteViewWatcher(
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

/// A [PurchaseInvoiceNoteView]'s `created_by`.
class PurchaseInvoiceNoteViewCreatedBy extends Dto {
  const PurchaseInvoiceNoteViewCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoiceNoteViewCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNoteViewCreatedBy(
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

/// A [PurchaseInvoiceNoteView]'s `last_updated_by`.
class PurchaseInvoiceNoteViewLastUpdatedBy extends Dto {
  const PurchaseInvoiceNoteViewLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoiceNoteViewLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNoteViewLastUpdatedBy(
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

/// One entry of a [PurchaseInvoiceNoteFileList]'s `data`.
class PurchaseInvoiceNoteFileEntry extends Dto {
  const PurchaseInvoiceNoteFileEntry({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PurchaseInvoiceNoteFileEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNoteFileEntry(
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

/// A [PurchaseInvoicePurchasePayment]'s `account`.
class PurchaseInvoicePurchasePaymentAccount extends Dto {
  const PurchaseInvoicePurchasePaymentAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoicePurchasePaymentAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicePurchasePaymentAccount(
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

/// A [PurchaseInvoicePurchasePayment]'s `currency`.
class PurchaseInvoicePurchasePaymentCurrency extends Dto {
  const PurchaseInvoicePurchasePaymentCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoicePurchasePaymentCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicePurchasePaymentCurrency(
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

/// One entry of a [PurchaseInvoicePurchasePayment]'s `payment_method_applications`.
class PurchaseInvoicePurchasePaymentPaymentMethodApplication extends Dto {
  const PurchaseInvoicePurchasePaymentPaymentMethodApplication({
    this.amount,
    this.paymentMethod,
    this.paymentProcessor,
    this.reference,
  });

  static PurchaseInvoicePurchasePaymentPaymentMethodApplication? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicePurchasePaymentPaymentMethodApplication(
      amount: readText(source['amount']),
      paymentMethod:
          PurchaseInvoicePurchasePaymentPaymentMethodApplicationPaymentMethod
              .fromMap(source['payment_method']),
      paymentProcessor:
          PurchaseInvoicePurchasePaymentPaymentMethodApplicationPaymentProcessor
              .fromMap(source['payment_processor']),
      reference: readText(source['reference']),
    );
  }

  final String? amount;

  final PurchaseInvoicePurchasePaymentPaymentMethodApplicationPaymentMethod?
      paymentMethod;

  final PurchaseInvoicePurchasePaymentPaymentMethodApplicationPaymentProcessor?
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

/// One entry of a [PurchaseInvoicePurchasePayment]'s `credit_note_applications`.
class PurchaseInvoicePurchasePaymentCreditNoteApplication extends Dto {
  const PurchaseInvoicePurchasePaymentCreditNoteApplication({
    this.amount,
    this.purchaseCreditNote,
  });

  static PurchaseInvoicePurchasePaymentCreditNoteApplication? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicePurchasePaymentCreditNoteApplication(
      amount: readText(source['amount']),
      purchaseCreditNote:
          PurchaseInvoicePurchasePaymentCreditNoteApplicationPurchaseCreditNote
              .fromMap(source['purchase_credit_note']),
    );
  }

  final String? amount;

  final PurchaseInvoicePurchasePaymentCreditNoteApplicationPurchaseCreditNote?
      purchaseCreditNote;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'purchase_credit_note': purchaseCreditNote,
      };
}

/// One entry of a [PurchaseInvoicePurchasePayment]'s `purchase_invoice_applications`.
class PurchaseInvoicePurchasePaymentPurchaseInvoiceApplication extends Dto {
  const PurchaseInvoicePurchasePaymentPurchaseInvoiceApplication({
    this.applied,
    this.dueDate,
    this.issueDate,
    this.outstanding,
    this.purchaseInvoice,
    this.total,
  });

  static PurchaseInvoicePurchasePaymentPurchaseInvoiceApplication? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicePurchasePaymentPurchaseInvoiceApplication(
      applied: readText(source['applied']),
      dueDate: readText(source['due_date']),
      issueDate: readText(source['issue_date']),
      outstanding: readText(source['outstanding']),
      purchaseInvoice:
          PurchaseInvoicePurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice
              .fromMap(source['purchase_invoice']),
      total: readText(source['total']),
    );
  }

  final String? applied;

  final String? dueDate;

  final String? issueDate;

  final String? outstanding;

  final PurchaseInvoicePurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice?
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

/// A [PurchaseInvoicePurchasePayment]'s `created_by`.
class PurchaseInvoicePurchasePaymentCreatedBy extends Dto {
  const PurchaseInvoicePurchasePaymentCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoicePurchasePaymentCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicePurchasePaymentCreatedBy(
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

/// A [PurchaseInvoicePurchasePayment]'s `last_updated_by`.
class PurchaseInvoicePurchasePaymentLastUpdatedBy extends Dto {
  const PurchaseInvoicePurchasePaymentLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoicePurchasePaymentLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicePurchasePaymentLastUpdatedBy(
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

/// A [PurchaseInvoiceNote]'s `purchase_invoice`.
class PurchaseInvoiceNotePurchaseInvoice extends Dto {
  const PurchaseInvoiceNotePurchaseInvoice({
    this.href,
    this.id,
    this.object,
  });

  static PurchaseInvoiceNotePurchaseInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNotePurchaseInvoice(
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

/// One entry of a [PurchaseInvoiceNote]'s `attachments`.
class PurchaseInvoiceNoteAttachment extends Dto {
  const PurchaseInvoiceNoteAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PurchaseInvoiceNoteAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNoteAttachment(
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

/// One entry of a [PurchaseInvoiceNote]'s `watchers`.
class PurchaseInvoiceNoteWatcher extends Dto {
  const PurchaseInvoiceNoteWatcher({
    this.email,
    this.name,
    this.type,
  });

  static PurchaseInvoiceNoteWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNoteWatcher(
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

/// A [PurchaseInvoiceNote]'s `created_by`.
class PurchaseInvoiceNoteCreatedBy extends Dto {
  const PurchaseInvoiceNoteCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoiceNoteCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNoteCreatedBy(
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

/// A [PurchaseInvoiceNote]'s `last_updated_by`.
class PurchaseInvoiceNoteLastUpdatedBy extends Dto {
  const PurchaseInvoiceNoteLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoiceNoteLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceNoteLastUpdatedBy(
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

/// One entry of a [PurchaseInvoicesNote]'s `watchers`.
class PurchaseInvoicesNoteWatcher extends Dto {
  const PurchaseInvoicesNoteWatcher({
    this.email,
    this.name,
    this.type,
  });

  static PurchaseInvoicesNoteWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicesNoteWatcher(
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

/// A [PurchaseInvoicesNote]'s `created_by`.
class PurchaseInvoicesNoteCreatedBy extends Dto {
  const PurchaseInvoicesNoteCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoicesNoteCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicesNoteCreatedBy(
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

/// A [PurchaseInvoicesNote]'s `last_updated_by`.
class PurchaseInvoicesNoteLastUpdatedBy extends Dto {
  const PurchaseInvoicesNoteLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseInvoicesNoteLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicesNoteLastUpdatedBy(
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

/// A [AccountPurchaseInvoicesData]'s `currency`.
class AccountPurchaseInvoicesDataCurrency extends Dto {
  const AccountPurchaseInvoicesDataCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountPurchaseInvoicesDataCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseInvoicesDataCurrency(
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

/// A [AccountPurchaseInvoicesData]'s `account`.
class AccountPurchaseInvoicesDataAccount extends Dto {
  const AccountPurchaseInvoicesDataAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountPurchaseInvoicesDataAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseInvoicesDataAccount(
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

/// A [AccountPurchaseInvoicesData]'s `purchase_order`.
class AccountPurchaseInvoicesDataPurchaseOrder extends Dto {
  const AccountPurchaseInvoicesDataPurchaseOrder({
    this.href,
    this.id,
    this.object,
  });

  static AccountPurchaseInvoicesDataPurchaseOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseInvoicesDataPurchaseOrder(
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

/// A [AccountPurchaseInvoicesData]'s `created_by`.
class AccountPurchaseInvoicesDataCreatedBy extends Dto {
  const AccountPurchaseInvoicesDataCreatedBy({
    this.name,
    this.object,
  });

  static AccountPurchaseInvoicesDataCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseInvoicesDataCreatedBy(
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

/// A [AccountPurchaseInvoicesData]'s `purchase_credit_note`.
class AccountPurchaseInvoicesDataPurchaseCreditNote extends Dto {
  const AccountPurchaseInvoicesDataPurchaseCreditNote({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountPurchaseInvoicesDataPurchaseCreditNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseInvoicesDataPurchaseCreditNote(
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

/// A [AccountPurchaseInvoicesData]'s `purchase_payment`.
class AccountPurchaseInvoicesDataPurchasePayment extends Dto {
  const AccountPurchaseInvoicesDataPurchasePayment({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountPurchaseInvoicesDataPurchasePayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseInvoicesDataPurchasePayment(
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

/// A [PurchaseInvoiceReadLine]'s `item`.
class PurchaseInvoiceReadLineItem extends Dto {
  const PurchaseInvoiceReadLineItem({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoiceReadLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceReadLineItem(
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

/// A [PurchaseInvoiceLinesLine]'s `item`.
class PurchaseInvoiceLinesLineItem extends Dto {
  const PurchaseInvoiceLinesLineItem({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoiceLinesLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceLinesLineItem(
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

/// A [PurchaseInvoiceLineLine]'s `item`.
class PurchaseInvoiceLineLineItem extends Dto {
  const PurchaseInvoiceLineLineItem({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoiceLineLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceLineLineItem(
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

/// A [PurchaseInvoiceInformationLine]'s `item`.
class PurchaseInvoiceInformationLineItem extends Dto {
  const PurchaseInvoiceInformationLineItem({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoiceInformationLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceInformationLineItem(
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

/// A [PurchaseInvoiceCancelLine]'s `item`.
class PurchaseInvoiceCancelLineItem extends Dto {
  const PurchaseInvoiceCancelLineItem({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoiceCancelLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoiceCancelLineItem(
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

/// A [PurchaseInvoicePurchasePaymentPaymentMethodApplication]'s `payment_method`.
class PurchaseInvoicePurchasePaymentPaymentMethodApplicationPaymentMethod
    extends Dto {
  const PurchaseInvoicePurchasePaymentPaymentMethodApplicationPaymentMethod({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoicePurchasePaymentPaymentMethodApplicationPaymentMethod?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicePurchasePaymentPaymentMethodApplicationPaymentMethod(
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

/// A [PurchaseInvoicePurchasePaymentPaymentMethodApplication]'s `payment_processor`.
class PurchaseInvoicePurchasePaymentPaymentMethodApplicationPaymentProcessor
    extends Dto {
  const PurchaseInvoicePurchasePaymentPaymentMethodApplicationPaymentProcessor({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseInvoicePurchasePaymentPaymentMethodApplicationPaymentProcessor?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicePurchasePaymentPaymentMethodApplicationPaymentProcessor(
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

/// A [PurchaseInvoicePurchasePaymentCreditNoteApplication]'s `purchase_credit_note`.
class PurchaseInvoicePurchasePaymentCreditNoteApplicationPurchaseCreditNote
    extends Dto {
  const PurchaseInvoicePurchasePaymentCreditNoteApplicationPurchaseCreditNote({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static PurchaseInvoicePurchasePaymentCreditNoteApplicationPurchaseCreditNote?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicePurchasePaymentCreditNoteApplicationPurchaseCreditNote(
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

/// A [PurchaseInvoicePurchasePaymentPurchaseInvoiceApplication]'s `purchase_invoice`.
class PurchaseInvoicePurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice
    extends Dto {
  const PurchaseInvoicePurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static PurchaseInvoicePurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseInvoicePurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice(
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
