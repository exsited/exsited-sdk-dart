/// Typed views over the v4 invoices bodies.
///
/// [Invoice] serves the listing entry, the detail read and several
/// sub-resources, so a field one of them does not send reads null.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// One invoice.
class Invoice extends Dto {
  const Invoice({
    this.accountId,
    this.accountName,
    this.activityLogs,
    this.alternateBillingEndDate,
    this.alternateBillingStartDate,
    this.alternateDueDate,
    this.alternateIssueDate,
    this.billingEndDate,
    this.billingStartDate,
    this.code,
    this.createdBy,
    this.createdOn,
    this.creditApplied,
    this.creditIssued,
    this.currency,
    this.customAttributes,
    this.customForm,
    this.customObjects,
    this.customerPurchaseOrderId,
    this.discountAmount,
    this.due,
    this.dueDate,
    this.id,
    this.invoiceNote,
    this.invoices,
    this.issueDate,
    this.itemFulfillment,
    this.itemFulfillments,
    this.kpis,
    this.lastPayment,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.lines,
    this.message,
    this.note,
    this.notes,
    this.orderId,
    this.origin,
    this.outstanding,
    this.pagination,
    this.paid,
    this.paymentApplied,
    this.paymentStatus,
    this.priceTaxInclusive,
    this.recurringRateCount,
    this.returnMerchandiseAuthorisation,
    this.returnMerchandiseAuthorisations,
    this.shippingCost,
    this.status,
    this.subtotal,
    this.tax,
    this.taxTotal,
    this.total,
    this.type,
    this.usageRateCount,
    this.uuid,
    this.version,
    this.object,
    this.account,
    this.order,
  });

  static Invoice? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'invoice');
    if (source == null) return null;
    return Invoice(
      accountId: readText(source['account_id']),
      accountName: readText(source['account_name']),
      activityLogs: readList<InvoiceActivityLog>(
          source['activity_logs'], InvoiceActivityLog.fromMap),
      alternateBillingEndDate: readText(source['alternate_billing_end_date']),
      alternateBillingStartDate:
          readText(source['alternate_billing_start_date']),
      alternateDueDate: readText(source['alternate_due_date']),
      alternateIssueDate: readText(source['alternate_issue_date']),
      billingEndDate: readText(source['billing_end_date']),
      billingStartDate: readText(source['billing_start_date']),
      code: readInteger(source['code']),
      createdBy: InvoiceCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditApplied: readText(source['credit_applied']),
      creditIssued: readText(source['credit_issued']),
      currency: InvoiceCurrency.fromMap(source['currency']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customForm: InvoiceCustomForm.fromMap(source['custom_form']),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      customerPurchaseOrderId: readText(source['customer_purchase_order_id']),
      discountAmount: readDecimal(source['discount_amount']),
      due: readText(source['due']),
      dueDate: readText(source['due_date']),
      id: readText(source['id']),
      invoiceNote: readText(source['invoice_note']),
      invoices: readList<Object>(source['invoices'], readAny),
      issueDate: readText(source['issue_date']),
      itemFulfillment: readAny(source['item_fulfillment']),
      itemFulfillments: readList<Object>(source['item_fulfillments'], readAny),
      kpis: readAny(source['kpis']),
      lastPayment: InvoiceLastPayment.fromMap(source['last_payment']),
      lastUpdatedBy: InvoiceLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lines: readList<InvoiceLine>(source['lines'], InvoiceLine.fromMap),
      message: readText(source['message']),
      note: readAny(source['note']),
      notes: readList<Object>(source['notes'], readAny),
      orderId: readText(source['order_id']),
      origin: readText(source['origin']),
      outstanding: readText(source['outstanding']),
      pagination: readAny(source['pagination']),
      paid: readText(source['paid']),
      paymentApplied: readText(source['payment_applied']),
      paymentStatus: readText(source['payment_status']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      recurringRateCount: readText(source['recurring_rate_count']),
      returnMerchandiseAuthorisation:
          readAny(source['return_merchandise_authorisation']),
      returnMerchandiseAuthorisations: readList<Object>(
          source['return_merchandise_authorisations'], readAny),
      shippingCost: readText(source['shipping_cost']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      taxTotal: readText(source['tax_total']),
      total: readText(source['total']),
      type: readText(source['type']),
      usageRateCount: readText(source['usage_rate_count']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
      object: readText(source['object']),
      account: InvoiceAccount.fromMap(source['account']),
      order: InvoiceOrder.fromMap(source['order']),
    );
  }

  final String? accountId;

  final String? accountName;

  final List<InvoiceActivityLog?>? activityLogs;

  final String? alternateBillingEndDate;

  final String? alternateBillingStartDate;

  final String? alternateDueDate;

  final String? alternateIssueDate;

  final String? billingEndDate;

  final String? billingStartDate;

  final int? code;

  final InvoiceCreatedBy? createdBy;

  final String? createdOn;

  final String? creditApplied;

  final String? creditIssued;

  final InvoiceCurrency? currency;

  final List<Object?>? customAttributes;

  final InvoiceCustomForm? customForm;

  final List<Object?>? customObjects;

  final String? customerPurchaseOrderId;

  final double? discountAmount;

  final String? due;

  final String? dueDate;

  final String? id;

  final String? invoiceNote;

  final List<Object?>? invoices;

  final String? issueDate;

  final Object? itemFulfillment;

  final List<Object?>? itemFulfillments;

  final Object? kpis;

  final InvoiceLastPayment? lastPayment;

  final InvoiceLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final List<InvoiceLine?>? lines;

  final String? message;

  final Object? note;

  final List<Object?>? notes;

  final String? orderId;

  final String? origin;

  final String? outstanding;

  final Object? pagination;

  final String? paid;

  final String? paymentApplied;

  final String? paymentStatus;

  final bool? priceTaxInclusive;

  final String? recurringRateCount;

  final Object? returnMerchandiseAuthorisation;

  final List<Object?>? returnMerchandiseAuthorisations;

  final String? shippingCost;

  final String? status;

  final String? subtotal;

  final String? tax;

  final String? taxTotal;

  final String? total;

  final String? type;

  final String? usageRateCount;

  final String? uuid;

  final int? version;

  final String? object;

  final InvoiceAccount? account;

  final InvoiceOrder? order;

  @override
  String? get envelopeKey => 'invoice';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account_id': accountId,
        'account_name': accountName,
        'activity_logs': activityLogs,
        'alternate_billing_end_date': alternateBillingEndDate,
        'alternate_billing_start_date': alternateBillingStartDate,
        'alternate_due_date': alternateDueDate,
        'alternate_issue_date': alternateIssueDate,
        'billing_end_date': billingEndDate,
        'billing_start_date': billingStartDate,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_applied': creditApplied,
        'credit_issued': creditIssued,
        'currency': currency,
        'custom_attributes': customAttributes,
        'custom_form': customForm,
        'custom_objects': customObjects,
        'customer_purchase_order_id': customerPurchaseOrderId,
        'discount_amount': discountAmount,
        'due': due,
        'due_date': dueDate,
        'id': id,
        'invoice_note': invoiceNote,
        'invoices': invoices,
        'issue_date': issueDate,
        'item_fulfillment': itemFulfillment,
        'item_fulfillments': itemFulfillments,
        'kpis': kpis,
        'last_payment': lastPayment,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'lines': lines,
        'message': message,
        'note': note,
        'notes': notes,
        'order_id': orderId,
        'origin': origin,
        'outstanding': outstanding,
        'pagination': pagination,
        'paid': paid,
        'payment_applied': paymentApplied,
        'payment_status': paymentStatus,
        'price_tax_inclusive': priceTaxInclusive,
        'recurring_rate_count': recurringRateCount,
        'return_merchandise_authorisation': returnMerchandiseAuthorisation,
        'return_merchandise_authorisations': returnMerchandiseAuthorisations,
        'shipping_cost': shippingCost,
        'status': status,
        'subtotal': subtotal,
        'tax': tax,
        'tax_total': taxTotal,
        'total': total,
        'type': type,
        'usage_rate_count': usageRateCount,
        'uuid': uuid,
        'version': version,
        'object': object,
        'account': account,
        'order': order,
      };
}

/// A page of invoices.
class InvoiceList extends Dto {
  const InvoiceList({
    this.data,
    this.pagination,
    this.object,
    this.url,
  });

  static InvoiceList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceList(
      data: readList<Invoice>(source['data'], Invoice.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
      object: readText(source['object']),
      url: readText(source['url']),
    );
  }

  final List<Invoice?>? data;

  final Pagination? pagination;

  final String? object;

  final String? url;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'data': data,
        'pagination': pagination,
        'object': object,
        'url': url,
      };
}

/// A page of an invoice's notes.
class InvoiceNoteList extends Dto {
  const InvoiceNoteList({
    this.data,
    this.pagination,
    this.object,
    this.url,
  });

  static InvoiceNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceNoteList(
      data:
          readList<InvoiceNoteEntry>(source['data'], InvoiceNoteEntry.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
      object: readText(source['object']),
      url: readText(source['url']),
    );
  }

  final List<InvoiceNoteEntry?>? data;

  final Pagination? pagination;

  final String? object;

  final String? url;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'data': data,
        'pagination': pagination,
        'object': object,
        'url': url,
      };
}

/// What `getInvoicePdf` answers, under `invoice`.
class InvoicePdf extends Dto {
  const InvoicePdf({
    this.pdf,
  });

  static InvoicePdf? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'invoice');
    if (source == null) return null;
    return InvoicePdf(
      pdf: InvoicePdfPdf.fromMap(source['pdf']),
    );
  }

  final InvoicePdfPdf? pdf;

  @override
  String? get envelopeKey => 'invoice';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'pdf': pdf,
      };
}

/// One page of what `getInvoiceItemFulfillments` lists, under `data`.
class InvoiceItemFulfillmentList extends Dto {
  const InvoiceItemFulfillmentList({
    this.object,
    this.url,
    this.data,
    this.pagination,
  });

  static InvoiceItemFulfillmentList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceItemFulfillmentList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<InvoiceItemFulfillmentEntry>(
          source['data'], InvoiceItemFulfillmentEntry.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<InvoiceItemFulfillmentEntry?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

/// What `getInvoiceItemFulfillment` answers, under `item_fulfillment`.
class InvoiceItemFulfillment extends Dto {
  const InvoiceItemFulfillment({
    this.object,
    this.id,
    this.code,
    this.status,
    this.fulfillmentStatus,
    this.deliveryStatus,
    this.fulfillmentDate,
    this.fulfillmentCompleted,
    this.trackingNumber,
    this.fulfillmentNote,
    this.account,
    this.order,
    this.invoice,
    this.fulfillments,
    this.customAttributes,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
    this.href,
  });

  static InvoiceItemFulfillment? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item_fulfillment');
    if (source == null) return null;
    return InvoiceItemFulfillment(
      object: readText(source['object']),
      id: readText(source['id']),
      code: readText(source['code']),
      status: readText(source['status']),
      fulfillmentStatus: readText(source['fulfillment_status']),
      deliveryStatus: readAny(source['delivery_status']),
      fulfillmentDate: readText(source['fulfillment_date']),
      fulfillmentCompleted: readFlag(source['fulfillment_completed']),
      trackingNumber: readText(source['tracking_number']),
      fulfillmentNote: readText(source['fulfillment_note']),
      account: InvoiceItemFulfillmentAccount.fromMap(source['account']),
      order: readAny(source['order']),
      invoice: InvoiceItemFulfillmentInvoice.fromMap(source['invoice']),
      fulfillments: readList<InvoiceItemFulfillmentFulfillment>(
          source['fulfillments'], InvoiceItemFulfillmentFulfillment.fromMap),
      customAttributes: readAny(source['custom_attributes']),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      createdBy: InvoiceItemFulfillmentCreatedBy.fromMap(source['created_by']),
      lastUpdatedBy: InvoiceItemFulfillmentLastUpdatedBy.fromMap(
          source['last_updated_by']),
      version: readInteger(source['version']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? code;

  final String? status;

  final String? fulfillmentStatus;

  /// Untyped: null in every record measured.
  final Object? deliveryStatus;

  final String? fulfillmentDate;

  final bool? fulfillmentCompleted;

  final String? trackingNumber;

  final String? fulfillmentNote;

  final InvoiceItemFulfillmentAccount? account;

  /// Untyped: null in every record measured.
  final Object? order;

  final InvoiceItemFulfillmentInvoice? invoice;

  final List<InvoiceItemFulfillmentFulfillment?>? fulfillments;

  /// Untyped: an object with no keys in every record measured.
  final Object? customAttributes;

  final String? createdOn;

  final String? lastUpdatedOn;

  final InvoiceItemFulfillmentCreatedBy? createdBy;

  final InvoiceItemFulfillmentLastUpdatedBy? lastUpdatedBy;

  final int? version;

  final String? href;

  @override
  String? get envelopeKey => 'item_fulfillment';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'code': code,
        'status': status,
        'fulfillment_status': fulfillmentStatus,
        'delivery_status': deliveryStatus,
        'fulfillment_date': fulfillmentDate,
        'fulfillment_completed': fulfillmentCompleted,
        'tracking_number': trackingNumber,
        'fulfillment_note': fulfillmentNote,
        'account': account,
        'order': order,
        'invoice': invoice,
        'fulfillments': fulfillments,
        'custom_attributes': customAttributes,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
        'href': href,
      };
}

/// One page of what `getInvoiceReturnMerchandiseAuthorisations` lists, under `data`.
class InvoiceReturnMerchandiseAuthorisationList extends Dto {
  const InvoiceReturnMerchandiseAuthorisationList({
    this.object,
    this.url,
    this.data,
    this.pagination,
  });

  static InvoiceReturnMerchandiseAuthorisationList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<InvoiceReturnMerchandiseAuthorisationEntry>(
          source['data'], InvoiceReturnMerchandiseAuthorisationEntry.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<InvoiceReturnMerchandiseAuthorisationEntry?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

/// What `getInvoiceReturnMerchandiseAuthorisation` answers, under `return_merchandise_authorisation`.
class InvoiceReturnMerchandiseAuthorisation extends Dto {
  const InvoiceReturnMerchandiseAuthorisation({
    this.object,
    this.id,
    this.code,
    this.status,
    this.returnStatus,
    this.rmaDate,
    this.itemCount,
    this.note,
    this.account,
    this.saleOrder,
    this.saleInvoice,
    this.warehouse,
    this.lines,
    this.receiveRmas,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
    this.href,
  });

  static InvoiceReturnMerchandiseAuthorisation? fromMap(Object? body) {
    final source =
        readRecord(body, envelopeKey: 'return_merchandise_authorisation');
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisation(
      object: readText(source['object']),
      id: readText(source['id']),
      code: readText(source['code']),
      status: readText(source['status']),
      returnStatus: readText(source['return_status']),
      rmaDate: readText(source['rma_date']),
      itemCount: readInteger(source['item_count']),
      note: readText(source['note']),
      account: InvoiceReturnMerchandiseAuthorisationAccount.fromMap(
          source['account']),
      saleOrder: readAny(source['sale_order']),
      saleInvoice: InvoiceReturnMerchandiseAuthorisationSaleInvoice.fromMap(
          source['sale_invoice']),
      warehouse: readAny(source['warehouse']),
      lines: readList<Object>(source['lines'], readAny),
      receiveRmas: readList<InvoiceReturnMerchandiseAuthorisationReceiveRma>(
          source['receive_rmas'],
          InvoiceReturnMerchandiseAuthorisationReceiveRma.fromMap),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      createdBy: InvoiceReturnMerchandiseAuthorisationCreatedBy.fromMap(
          source['created_by']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      version: readInteger(source['version']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? code;

  final String? status;

  final String? returnStatus;

  final String? rmaDate;

  final int? itemCount;

  final String? note;

  final InvoiceReturnMerchandiseAuthorisationAccount? account;

  /// Untyped: null in every record measured.
  final Object? saleOrder;

  final InvoiceReturnMerchandiseAuthorisationSaleInvoice? saleInvoice;

  /// Untyped: null in every record measured.
  final Object? warehouse;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? lines;

  final List<InvoiceReturnMerchandiseAuthorisationReceiveRma?>? receiveRmas;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final InvoiceReturnMerchandiseAuthorisationCreatedBy? createdBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final int? version;

  final String? href;

  @override
  String? get envelopeKey => 'return_merchandise_authorisation';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'code': code,
        'status': status,
        'return_status': returnStatus,
        'rma_date': rmaDate,
        'item_count': itemCount,
        'note': note,
        'account': account,
        'sale_order': saleOrder,
        'sale_invoice': saleInvoice,
        'warehouse': warehouse,
        'lines': lines,
        'receive_rmas': receiveRmas,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
        'href': href,
      };
}

/// What `getInvoiceNote` answers, under `note`.
class InvoiceNote extends Dto {
  const InvoiceNote({
    this.object,
    this.id,
    this.content,
    this.invoice,
    this.group,
    this.user,
    this.attachments,
    this.watchers,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
    this.href,
  });

  static InvoiceNote? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return InvoiceNote(
      object: readText(source['object']),
      id: readText(source['id']),
      content: readText(source['content']),
      invoice: InvoiceNoteInvoice.fromMap(source['invoice']),
      group: readAny(source['group']),
      user: readAny(source['user']),
      attachments: readList<InvoiceNoteAttachment>(
          source['attachments'], InvoiceNoteAttachment.fromMap),
      watchers: readList<InvoiceNoteWatcher>(
          source['watchers'], InvoiceNoteWatcher.fromMap),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      createdBy: InvoiceNoteCreatedBy.fromMap(source['created_by']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      version: readInteger(source['version']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? content;

  final InvoiceNoteInvoice? invoice;

  /// Untyped: null in every record measured.
  final Object? group;

  /// Untyped: null in every record measured.
  final Object? user;

  final List<InvoiceNoteAttachment?>? attachments;

  final List<InvoiceNoteWatcher?>? watchers;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final InvoiceNoteCreatedBy? createdBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final int? version;

  final String? href;

  @override
  String? get envelopeKey => 'note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'content': content,
        'invoice': invoice,
        'group': group,
        'user': user,
        'attachments': attachments,
        'watchers': watchers,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
        'href': href,
      };
}

/// One page of what `getInvoiceNoteFiles` lists, under `data`.
class InvoiceNoteFileList extends Dto {
  const InvoiceNoteFileList({
    this.object,
    this.url,
    this.data,
    this.pagination,
  });

  static InvoiceNoteFileList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceNoteFileList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<InvoiceNoteFileEntry>(
          source['data'], InvoiceNoteFileEntry.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<InvoiceNoteFileEntry?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

/// What `getInvoiceNoteFile` answers, under `file`.
class InvoiceNoteFile extends Dto {
  const InvoiceNoteFile({
    this.uuid,
    this.filename,
    this.contentType,
    this.size,
    this.href,
  });

  static InvoiceNoteFile? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'file');
    if (source == null) return null;
    return InvoiceNoteFile(
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

/// One page of what `getAccountInvoices` lists, under `data`.
class AccountInvoiceList extends Dto {
  const AccountInvoiceList({
    this.object,
    this.url,
    this.data,
    this.pagination,
  });

  static AccountInvoiceList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<AccountInvoice>(source['data'], AccountInvoice.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<AccountInvoice?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

/// One page of what `getOrderInvoices` lists, under `data`.
class OrderInvoiceList extends Dto {
  const OrderInvoiceList({
    this.object,
    this.url,
    this.data,
    this.pagination,
  });

  static OrderInvoiceList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInvoiceList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<OrderInvoice>(source['data'], OrderInvoice.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<OrderInvoice?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

/// A [Invoice]'s `custom_form`.
class InvoiceCustomForm extends Dto {
  const InvoiceCustomForm({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static InvoiceCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceCustomForm(
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

/// A [Invoice]'s `currency`.
class InvoiceCurrency extends Dto {
  const InvoiceCurrency({
    this.object,
    this.id,
    this.name,
    this.code,
    this.href,
  });

  static InvoiceCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceCurrency(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'code': code,
        'href': href,
      };
}

/// A [Invoice]'s `account`.
class InvoiceAccount extends Dto {
  const InvoiceAccount({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static InvoiceAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceAccount(
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

/// A [Invoice]'s `order`.
class InvoiceOrder extends Dto {
  const InvoiceOrder({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static InvoiceOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceOrder(
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

/// A [Invoice]'s `last_payment`.
class InvoiceLastPayment extends Dto {
  const InvoiceLastPayment({
    this.id,
    this.amount,
    this.createdOn,
  });

  static InvoiceLastPayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceLastPayment(
      id: readText(source['id']),
      amount: readText(source['amount']),
      createdOn: readText(source['created_on']),
    );
  }

  final String? id;

  final String? amount;

  final String? createdOn;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'amount': amount,
        'created_on': createdOn,
      };
}

/// A [Invoice]'s `created_by`.
class InvoiceCreatedBy extends Dto {
  const InvoiceCreatedBy({
    this.object,
    this.name,
  });

  static InvoiceCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceCreatedBy(
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

/// A [Invoice]'s `last_updated_by`.
class InvoiceLastUpdatedBy extends Dto {
  const InvoiceLastUpdatedBy({
    this.object,
    this.name,
  });

  static InvoiceLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceLastUpdatedBy(
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

/// One entry of a [Invoice]'s `lines`.
class InvoiceLine extends Dto {
  const InvoiceLine({
    this.object,
    this.id,
    this.item,
    this.tax,
    this.accountingCode,
    this.itemUuid,
    this.itemId,
    this.itemName,
    this.itemChargeType,
    this.itemOrderQuantity,
    this.itemUom,
    this.itemWarehouse,
    this.pricingSnapshotUuid,
    this.pricingSnapshotPrice,
    this.subtotal,
    this.total,
    this.itemCustomAttributes,
    this.version,
    this.itemSerialOrBatchNumber,
    this.chargingStartDate,
    this.alternateChargingStartDate,
    this.chargingEndDate,
    this.alternateChargingEndDate,
  });

  static InvoiceLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceLine(
      object: readText(source['object']),
      id: readText(source['id']),
      item: InvoiceLineItem.fromMap(source['item']),
      tax: InvoiceLineTax.fromMap(source['tax']),
      accountingCode:
          InvoiceLineAccountingCode.fromMap(source['accounting_code']),
      itemUuid: readText(source['item_uuid']),
      itemId: readText(source['item_id']),
      itemName: readText(source['item_name']),
      itemChargeType: readText(source['item_charge_type']),
      itemOrderQuantity: readInteger(source['item_order_quantity']),
      itemUom: readAny(source['item_uom']),
      itemWarehouse: readText(source['item_warehouse']),
      pricingSnapshotUuid: readText(source['pricing_snapshot_uuid']),
      pricingSnapshotPrice: readDecimal(source['pricing_snapshot_price']),
      subtotal: readText(source['subtotal']),
      total: readText(source['total']),
      itemCustomAttributes:
          readList<Object>(source['item_custom_attributes'], readAny),
      version: readInteger(source['version']),
      itemSerialOrBatchNumber: readText(source['item_serial_or_batch_number']),
      chargingStartDate: readText(source['charging_start_date']),
      alternateChargingStartDate:
          readText(source['alternate_charging_start_date']),
      chargingEndDate: readText(source['charging_end_date']),
      alternateChargingEndDate: readText(source['alternate_charging_end_date']),
    );
  }

  final String? object;

  final String? id;

  final InvoiceLineItem? item;

  final InvoiceLineTax? tax;

  final InvoiceLineAccountingCode? accountingCode;

  final String? itemUuid;

  final String? itemId;

  final String? itemName;

  final String? itemChargeType;

  final int? itemOrderQuantity;

  /// Untyped: null in every record measured.
  final Object? itemUom;

  final String? itemWarehouse;

  final String? pricingSnapshotUuid;

  final double? pricingSnapshotPrice;

  final String? subtotal;

  final String? total;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? itemCustomAttributes;

  final int? version;

  /// Not sent on a line without a serialised item, where it reads `null`.
  final String? itemSerialOrBatchNumber;

  final String? chargingStartDate;

  final String? alternateChargingStartDate;

  final String? chargingEndDate;

  final String? alternateChargingEndDate;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'item': item,
        'tax': tax,
        'accounting_code': accountingCode,
        'item_uuid': itemUuid,
        'item_id': itemId,
        'item_name': itemName,
        'item_charge_type': itemChargeType,
        'item_order_quantity': itemOrderQuantity,
        'item_uom': itemUom,
        'item_warehouse': itemWarehouse,
        'pricing_snapshot_uuid': pricingSnapshotUuid,
        'pricing_snapshot_price': pricingSnapshotPrice,
        'subtotal': subtotal,
        'total': total,
        'item_custom_attributes': itemCustomAttributes,
        'version': version,
        'item_serial_or_batch_number': itemSerialOrBatchNumber,
        'charging_start_date': chargingStartDate,
        'alternate_charging_start_date': alternateChargingStartDate,
        'charging_end_date': chargingEndDate,
        'alternate_charging_end_date': alternateChargingEndDate,
      };
}

/// One entry of a [Invoice]'s `activity_logs`.
class InvoiceActivityLog extends Dto {
  const InvoiceActivityLog({
    this.activity,
  });

  static InvoiceActivityLog? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceActivityLog(
      activity: readText(source['activity']),
    );
  }

  final String? activity;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity': activity,
      };
}

/// One entry of a [InvoiceNoteList]'s `data`.
class InvoiceNoteEntry extends Dto {
  const InvoiceNoteEntry({
    this.object,
    this.id,
    this.content,
    this.invoice,
    this.group,
    this.user,
    this.attachments,
    this.watchers,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
    this.href,
  });

  static InvoiceNoteEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceNoteEntry(
      object: readText(source['object']),
      id: readText(source['id']),
      content: readText(source['content']),
      invoice: InvoiceNoteEntryInvoice.fromMap(source['invoice']),
      group: readAny(source['group']),
      user: readAny(source['user']),
      attachments: readList<InvoiceNoteEntryAttachment>(
          source['attachments'], InvoiceNoteEntryAttachment.fromMap),
      watchers: readList<InvoiceNoteEntryWatcher>(
          source['watchers'], InvoiceNoteEntryWatcher.fromMap),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      createdBy: InvoiceNoteEntryCreatedBy.fromMap(source['created_by']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      version: readInteger(source['version']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? content;

  final InvoiceNoteEntryInvoice? invoice;

  /// Untyped: null in every record measured.
  final Object? group;

  /// Untyped: null in every record measured.
  final Object? user;

  final List<InvoiceNoteEntryAttachment?>? attachments;

  final List<InvoiceNoteEntryWatcher?>? watchers;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final InvoiceNoteEntryCreatedBy? createdBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final int? version;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'content': content,
        'invoice': invoice,
        'group': group,
        'user': user,
        'attachments': attachments,
        'watchers': watchers,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
        'href': href,
      };
}

/// A [InvoicePdf]'s `pdf`.
class InvoicePdfPdf extends Dto {
  const InvoicePdfPdf({
    this.object,
    this.id,
    this.previewUrl,
    this.downloadUrl,
    this.fileSize,
  });

  static InvoicePdfPdf? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoicePdfPdf(
      object: readText(source['object']),
      id: readText(source['id']),
      previewUrl: readText(source['preview_url']),
      downloadUrl: readText(source['download_url']),
      fileSize: readInteger(source['file_size']),
    );
  }

  final String? object;

  final String? id;

  final String? previewUrl;

  final String? downloadUrl;

  final int? fileSize;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'preview_url': previewUrl,
        'download_url': downloadUrl,
        'file_size': fileSize,
      };
}

/// One entry of a [InvoiceItemFulfillmentList]'s `data`.
class InvoiceItemFulfillmentEntry extends Dto {
  const InvoiceItemFulfillmentEntry({
    this.object,
    this.id,
    this.code,
    this.status,
    this.fulfillmentStatus,
    this.deliveryStatus,
    this.fulfillmentDate,
    this.fulfillmentCompleted,
    this.trackingNumber,
    this.fulfillmentNote,
    this.account,
    this.order,
    this.invoice,
    this.fulfillments,
    this.customAttributes,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
    this.href,
  });

  static InvoiceItemFulfillmentEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceItemFulfillmentEntry(
      object: readText(source['object']),
      id: readText(source['id']),
      code: readText(source['code']),
      status: readText(source['status']),
      fulfillmentStatus: readText(source['fulfillment_status']),
      deliveryStatus: readAny(source['delivery_status']),
      fulfillmentDate: readText(source['fulfillment_date']),
      fulfillmentCompleted: readFlag(source['fulfillment_completed']),
      trackingNumber: readText(source['tracking_number']),
      fulfillmentNote: readText(source['fulfillment_note']),
      account: InvoiceItemFulfillmentEntryAccount.fromMap(source['account']),
      order: readAny(source['order']),
      invoice: InvoiceItemFulfillmentEntryInvoice.fromMap(source['invoice']),
      fulfillments: readList<InvoiceItemFulfillmentEntryFulfillment>(
          source['fulfillments'],
          InvoiceItemFulfillmentEntryFulfillment.fromMap),
      customAttributes: readAny(source['custom_attributes']),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      createdBy:
          InvoiceItemFulfillmentEntryCreatedBy.fromMap(source['created_by']),
      lastUpdatedBy: InvoiceItemFulfillmentEntryLastUpdatedBy.fromMap(
          source['last_updated_by']),
      version: readInteger(source['version']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? code;

  final String? status;

  final String? fulfillmentStatus;

  /// Untyped: null in every record measured.
  final Object? deliveryStatus;

  final String? fulfillmentDate;

  final bool? fulfillmentCompleted;

  final String? trackingNumber;

  final String? fulfillmentNote;

  final InvoiceItemFulfillmentEntryAccount? account;

  /// Untyped: null in every record measured.
  final Object? order;

  final InvoiceItemFulfillmentEntryInvoice? invoice;

  final List<InvoiceItemFulfillmentEntryFulfillment?>? fulfillments;

  /// Untyped: an object with no keys in every record measured.
  final Object? customAttributes;

  final String? createdOn;

  final String? lastUpdatedOn;

  final InvoiceItemFulfillmentEntryCreatedBy? createdBy;

  final InvoiceItemFulfillmentEntryLastUpdatedBy? lastUpdatedBy;

  final int? version;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'code': code,
        'status': status,
        'fulfillment_status': fulfillmentStatus,
        'delivery_status': deliveryStatus,
        'fulfillment_date': fulfillmentDate,
        'fulfillment_completed': fulfillmentCompleted,
        'tracking_number': trackingNumber,
        'fulfillment_note': fulfillmentNote,
        'account': account,
        'order': order,
        'invoice': invoice,
        'fulfillments': fulfillments,
        'custom_attributes': customAttributes,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
        'href': href,
      };
}

/// A [InvoiceItemFulfillment]'s `account`.
class InvoiceItemFulfillmentAccount extends Dto {
  const InvoiceItemFulfillmentAccount({
    this.object,
    this.id,
    this.name,
    this.code,
    this.href,
  });

  static InvoiceItemFulfillmentAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceItemFulfillmentAccount(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'code': code,
        'href': href,
      };
}

/// A [InvoiceItemFulfillment]'s `invoice`.
class InvoiceItemFulfillmentInvoice extends Dto {
  const InvoiceItemFulfillmentInvoice({
    this.object,
    this.id,
    this.href,
  });

  static InvoiceItemFulfillmentInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceItemFulfillmentInvoice(
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

/// One entry of a [InvoiceItemFulfillment]'s `fulfillments`.
class InvoiceItemFulfillmentFulfillment extends Dto {
  const InvoiceItemFulfillmentFulfillment({
    this.object,
    this.id,
    this.fulfillmentIndex,
    this.servingStatus,
    this.inventoryTracking,
    this.fulfillmentQty,
    this.fulfillmentSentQty,
    this.pendingReturn,
    this.returned,
    this.item,
    this.uom,
    this.uomPrecision,
  });

  static InvoiceItemFulfillmentFulfillment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceItemFulfillmentFulfillment(
      object: readText(source['object']),
      id: readText(source['id']),
      fulfillmentIndex: readInteger(source['fulfillment_index']),
      servingStatus: readText(source['serving_status']),
      inventoryTracking: readAny(source['inventory_tracking']),
      fulfillmentQty: readDecimal(source['fulfillment_qty']),
      fulfillmentSentQty: readDecimal(source['fulfillment_sent_qty']),
      pendingReturn: readDecimal(source['pending_return']),
      returned: readDecimal(source['returned']),
      item: InvoiceItemFulfillmentFulfillmentItem.fromMap(source['item']),
      uom: readText(source['uom']),
      uomPrecision: readInteger(source['uom_precision']),
    );
  }

  final String? object;

  final String? id;

  final int? fulfillmentIndex;

  final String? servingStatus;

  /// Untyped: null in every record measured.
  final Object? inventoryTracking;

  final double? fulfillmentQty;

  final double? fulfillmentSentQty;

  final double? pendingReturn;

  final double? returned;

  final InvoiceItemFulfillmentFulfillmentItem? item;

  final String? uom;

  final int? uomPrecision;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'fulfillment_index': fulfillmentIndex,
        'serving_status': servingStatus,
        'inventory_tracking': inventoryTracking,
        'fulfillment_qty': fulfillmentQty,
        'fulfillment_sent_qty': fulfillmentSentQty,
        'pending_return': pendingReturn,
        'returned': returned,
        'item': item,
        'uom': uom,
        'uom_precision': uomPrecision,
      };
}

/// A [InvoiceItemFulfillment]'s `created_by`.
class InvoiceItemFulfillmentCreatedBy extends Dto {
  const InvoiceItemFulfillmentCreatedBy({
    this.object,
    this.name,
  });

  static InvoiceItemFulfillmentCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceItemFulfillmentCreatedBy(
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

/// A [InvoiceItemFulfillment]'s `last_updated_by`.
class InvoiceItemFulfillmentLastUpdatedBy extends Dto {
  const InvoiceItemFulfillmentLastUpdatedBy({
    this.object,
    this.name,
  });

  static InvoiceItemFulfillmentLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceItemFulfillmentLastUpdatedBy(
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

/// One entry of a [InvoiceReturnMerchandiseAuthorisationList]'s `data`.
class InvoiceReturnMerchandiseAuthorisationEntry extends Dto {
  const InvoiceReturnMerchandiseAuthorisationEntry({
    this.object,
    this.id,
    this.code,
    this.status,
    this.returnStatus,
    this.rmaDate,
    this.itemCount,
    this.note,
    this.account,
    this.saleOrder,
    this.saleInvoice,
    this.warehouse,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
    this.href,
  });

  static InvoiceReturnMerchandiseAuthorisationEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationEntry(
      object: readText(source['object']),
      id: readText(source['id']),
      code: readText(source['code']),
      status: readText(source['status']),
      returnStatus: readText(source['return_status']),
      rmaDate: readText(source['rma_date']),
      itemCount: readInteger(source['item_count']),
      note: readText(source['note']),
      account: InvoiceReturnMerchandiseAuthorisationEntryAccount.fromMap(
          source['account']),
      saleOrder: readAny(source['sale_order']),
      saleInvoice:
          InvoiceReturnMerchandiseAuthorisationEntrySaleInvoice.fromMap(
              source['sale_invoice']),
      warehouse: readAny(source['warehouse']),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      createdBy: InvoiceReturnMerchandiseAuthorisationEntryCreatedBy.fromMap(
          source['created_by']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      version: readInteger(source['version']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? code;

  final String? status;

  final String? returnStatus;

  final String? rmaDate;

  final int? itemCount;

  final String? note;

  final InvoiceReturnMerchandiseAuthorisationEntryAccount? account;

  /// Untyped: null in every record measured.
  final Object? saleOrder;

  final InvoiceReturnMerchandiseAuthorisationEntrySaleInvoice? saleInvoice;

  /// Untyped: null in every record measured.
  final Object? warehouse;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final InvoiceReturnMerchandiseAuthorisationEntryCreatedBy? createdBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final int? version;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'code': code,
        'status': status,
        'return_status': returnStatus,
        'rma_date': rmaDate,
        'item_count': itemCount,
        'note': note,
        'account': account,
        'sale_order': saleOrder,
        'sale_invoice': saleInvoice,
        'warehouse': warehouse,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
        'href': href,
      };
}

/// A [InvoiceReturnMerchandiseAuthorisation]'s `account`.
class InvoiceReturnMerchandiseAuthorisationAccount extends Dto {
  const InvoiceReturnMerchandiseAuthorisationAccount({
    this.object,
    this.id,
    this.name,
    this.code,
    this.href,
  });

  static InvoiceReturnMerchandiseAuthorisationAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationAccount(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'code': code,
        'href': href,
      };
}

/// A [InvoiceReturnMerchandiseAuthorisation]'s `sale_invoice`.
class InvoiceReturnMerchandiseAuthorisationSaleInvoice extends Dto {
  const InvoiceReturnMerchandiseAuthorisationSaleInvoice({
    this.object,
    this.id,
    this.code,
    this.href,
  });

  static InvoiceReturnMerchandiseAuthorisationSaleInvoice? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationSaleInvoice(
      object: readText(source['object']),
      id: readText(source['id']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'code': code,
        'href': href,
      };
}

/// One entry of a [InvoiceReturnMerchandiseAuthorisation]'s `receive_rmas`.
class InvoiceReturnMerchandiseAuthorisationReceiveRma extends Dto {
  const InvoiceReturnMerchandiseAuthorisationReceiveRma({
    this.object,
    this.id,
    this.code,
    this.status,
    this.quantityReceived,
    this.createdBy,
    this.lastUpdatedBy,
    this.createdOn,
    this.lastUpdatedOn,
    this.href,
  });

  static InvoiceReturnMerchandiseAuthorisationReceiveRma? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationReceiveRma(
      object: readText(source['object']),
      id: readText(source['id']),
      code: readText(source['code']),
      status: readText(source['status']),
      quantityReceived: readDecimal(source['quantity_received']),
      createdBy:
          InvoiceReturnMerchandiseAuthorisationReceiveRmaCreatedBy.fromMap(
              source['created_by']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? code;

  final String? status;

  final double? quantityReceived;

  final InvoiceReturnMerchandiseAuthorisationReceiveRmaCreatedBy? createdBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'code': code,
        'status': status,
        'quantity_received': quantityReceived,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'href': href,
      };
}

/// A [InvoiceReturnMerchandiseAuthorisation]'s `created_by`.
class InvoiceReturnMerchandiseAuthorisationCreatedBy extends Dto {
  const InvoiceReturnMerchandiseAuthorisationCreatedBy({
    this.object,
    this.name,
  });

  static InvoiceReturnMerchandiseAuthorisationCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationCreatedBy(
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

/// A [InvoiceNote]'s `invoice`.
class InvoiceNoteInvoice extends Dto {
  const InvoiceNoteInvoice({
    this.object,
    this.id,
    this.href,
  });

  static InvoiceNoteInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceNoteInvoice(
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

/// One entry of a [InvoiceNote]'s `attachments`.
class InvoiceNoteAttachment extends Dto {
  const InvoiceNoteAttachment({
    this.uuid,
    this.filename,
    this.contentType,
    this.size,
    this.href,
  });

  static InvoiceNoteAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceNoteAttachment(
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
  Map<String, Object?> get fields => <String, Object?>{
        'uuid': uuid,
        'filename': filename,
        'content_type': contentType,
        'size': size,
        'href': href,
      };
}

/// One entry of a [InvoiceNote]'s `watchers`.
class InvoiceNoteWatcher extends Dto {
  const InvoiceNoteWatcher({
    this.type,
    this.name,
    this.email,
  });

  static InvoiceNoteWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceNoteWatcher(
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

/// A [InvoiceNote]'s `created_by`.
class InvoiceNoteCreatedBy extends Dto {
  const InvoiceNoteCreatedBy({
    this.object,
    this.name,
  });

  static InvoiceNoteCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceNoteCreatedBy(
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

/// One entry of a [InvoiceNoteFileList]'s `data`.
class InvoiceNoteFileEntry extends Dto {
  const InvoiceNoteFileEntry({
    this.uuid,
    this.filename,
    this.contentType,
    this.size,
    this.href,
  });

  static InvoiceNoteFileEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceNoteFileEntry(
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
  Map<String, Object?> get fields => <String, Object?>{
        'uuid': uuid,
        'filename': filename,
        'content_type': contentType,
        'size': size,
        'href': href,
      };
}

/// One entry of a [AccountInvoiceList]'s `data`.
class AccountInvoice extends Dto {
  const AccountInvoice({
    this.object,
    this.id,
    this.status,
    this.type,
    this.customForm,
    this.currency,
    this.account,
    this.order,
    this.customerPurchaseOrderId,
    this.origin,
    this.invoiceNote,
    this.priceTaxInclusive,
    this.paymentStatus,
    this.billingStartDate,
    this.alternateBillingStartDate,
    this.billingEndDate,
    this.alternateBillingEndDate,
    this.issueDate,
    this.alternateIssueDate,
    this.dueDate,
    this.alternateDueDate,
    this.subtotal,
    this.tax,
    this.taxTotal,
    this.total,
    this.paid,
    this.due,
    this.discountAmount,
    this.lastPayment,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
  });

  static AccountInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoice(
      object: readText(source['object']),
      id: readText(source['id']),
      status: readText(source['status']),
      type: readText(source['type']),
      customForm: AccountInvoiceCustomForm.fromMap(source['custom_form']),
      currency: AccountInvoiceCurrency.fromMap(source['currency']),
      account: AccountInvoiceAccount.fromMap(source['account']),
      order: AccountInvoiceOrder.fromMap(source['order']),
      customerPurchaseOrderId: readText(source['customer_purchase_order_id']),
      origin: readText(source['origin']),
      invoiceNote: readText(source['invoice_note']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      paymentStatus: readText(source['payment_status']),
      billingStartDate: readText(source['billing_start_date']),
      alternateBillingStartDate:
          readText(source['alternate_billing_start_date']),
      billingEndDate: readText(source['billing_end_date']),
      alternateBillingEndDate: readText(source['alternate_billing_end_date']),
      issueDate: readText(source['issue_date']),
      alternateIssueDate: readText(source['alternate_issue_date']),
      dueDate: readText(source['due_date']),
      alternateDueDate: readText(source['alternate_due_date']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      taxTotal: readText(source['tax_total']),
      total: readText(source['total']),
      paid: readText(source['paid']),
      due: readText(source['due']),
      discountAmount: readDecimal(source['discount_amount']),
      lastPayment: AccountInvoiceLastPayment.fromMap(source['last_payment']),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      createdBy: AccountInvoiceCreatedBy.fromMap(source['created_by']),
      lastUpdatedBy:
          AccountInvoiceLastUpdatedBy.fromMap(source['last_updated_by']),
      version: readInteger(source['version']),
    );
  }

  final String? object;

  final String? id;

  final String? status;

  final String? type;

  final AccountInvoiceCustomForm? customForm;

  final AccountInvoiceCurrency? currency;

  final AccountInvoiceAccount? account;

  final AccountInvoiceOrder? order;

  final String? customerPurchaseOrderId;

  final String? origin;

  final String? invoiceNote;

  final bool? priceTaxInclusive;

  final String? paymentStatus;

  final String? billingStartDate;

  final String? alternateBillingStartDate;

  final String? billingEndDate;

  final String? alternateBillingEndDate;

  final String? issueDate;

  final String? alternateIssueDate;

  final String? dueDate;

  final String? alternateDueDate;

  final String? subtotal;

  final String? tax;

  final String? taxTotal;

  final String? total;

  final String? paid;

  final String? due;

  final double? discountAmount;

  final AccountInvoiceLastPayment? lastPayment;

  final String? createdOn;

  final String? lastUpdatedOn;

  final AccountInvoiceCreatedBy? createdBy;

  final AccountInvoiceLastUpdatedBy? lastUpdatedBy;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'status': status,
        'type': type,
        'custom_form': customForm,
        'currency': currency,
        'account': account,
        'order': order,
        'customer_purchase_order_id': customerPurchaseOrderId,
        'origin': origin,
        'invoice_note': invoiceNote,
        'price_tax_inclusive': priceTaxInclusive,
        'payment_status': paymentStatus,
        'billing_start_date': billingStartDate,
        'alternate_billing_start_date': alternateBillingStartDate,
        'billing_end_date': billingEndDate,
        'alternate_billing_end_date': alternateBillingEndDate,
        'issue_date': issueDate,
        'alternate_issue_date': alternateIssueDate,
        'due_date': dueDate,
        'alternate_due_date': alternateDueDate,
        'subtotal': subtotal,
        'tax': tax,
        'tax_total': taxTotal,
        'total': total,
        'paid': paid,
        'due': due,
        'discount_amount': discountAmount,
        'last_payment': lastPayment,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
      };
}

/// One entry of a [OrderInvoiceList]'s `data`.
class OrderInvoice extends Dto {
  const OrderInvoice({
    this.object,
    this.id,
    this.status,
    this.type,
    this.customForm,
    this.currency,
    this.account,
    this.order,
    this.customerPurchaseOrderId,
    this.origin,
    this.invoiceNote,
    this.priceTaxInclusive,
    this.paymentStatus,
    this.billingStartDate,
    this.alternateBillingStartDate,
    this.billingEndDate,
    this.alternateBillingEndDate,
    this.issueDate,
    this.alternateIssueDate,
    this.dueDate,
    this.alternateDueDate,
    this.subtotal,
    this.tax,
    this.taxTotal,
    this.total,
    this.paid,
    this.due,
    this.discountAmount,
    this.lastPayment,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
  });

  static OrderInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInvoice(
      object: readText(source['object']),
      id: readText(source['id']),
      status: readText(source['status']),
      type: readText(source['type']),
      customForm: OrderInvoiceCustomForm.fromMap(source['custom_form']),
      currency: OrderInvoiceCurrency.fromMap(source['currency']),
      account: OrderInvoiceAccount.fromMap(source['account']),
      order: OrderInvoiceOrder.fromMap(source['order']),
      customerPurchaseOrderId: readAny(source['customer_purchase_order_id']),
      origin: readAny(source['origin']),
      invoiceNote: readText(source['invoice_note']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      paymentStatus: readText(source['payment_status']),
      billingStartDate: readText(source['billing_start_date']),
      alternateBillingStartDate:
          readText(source['alternate_billing_start_date']),
      billingEndDate: readText(source['billing_end_date']),
      alternateBillingEndDate: readText(source['alternate_billing_end_date']),
      issueDate: readText(source['issue_date']),
      alternateIssueDate: readText(source['alternate_issue_date']),
      dueDate: readText(source['due_date']),
      alternateDueDate: readText(source['alternate_due_date']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      taxTotal: readText(source['tax_total']),
      total: readText(source['total']),
      paid: readText(source['paid']),
      due: readText(source['due']),
      discountAmount: readDecimal(source['discount_amount']),
      lastPayment: readAny(source['last_payment']),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      createdBy: OrderInvoiceCreatedBy.fromMap(source['created_by']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      version: readInteger(source['version']),
    );
  }

  final String? object;

  final String? id;

  final String? status;

  final String? type;

  final OrderInvoiceCustomForm? customForm;

  final OrderInvoiceCurrency? currency;

  final OrderInvoiceAccount? account;

  final OrderInvoiceOrder? order;

  /// Untyped: null in every record measured.
  final Object? customerPurchaseOrderId;

  /// Untyped: null in every record measured.
  final Object? origin;

  final String? invoiceNote;

  final bool? priceTaxInclusive;

  final String? paymentStatus;

  final String? billingStartDate;

  final String? alternateBillingStartDate;

  final String? billingEndDate;

  final String? alternateBillingEndDate;

  final String? issueDate;

  final String? alternateIssueDate;

  final String? dueDate;

  final String? alternateDueDate;

  final String? subtotal;

  final String? tax;

  final String? taxTotal;

  final String? total;

  final String? paid;

  final String? due;

  final double? discountAmount;

  /// Untyped: null in every record measured.
  final Object? lastPayment;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final OrderInvoiceCreatedBy? createdBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'status': status,
        'type': type,
        'custom_form': customForm,
        'currency': currency,
        'account': account,
        'order': order,
        'customer_purchase_order_id': customerPurchaseOrderId,
        'origin': origin,
        'invoice_note': invoiceNote,
        'price_tax_inclusive': priceTaxInclusive,
        'payment_status': paymentStatus,
        'billing_start_date': billingStartDate,
        'alternate_billing_start_date': alternateBillingStartDate,
        'billing_end_date': billingEndDate,
        'alternate_billing_end_date': alternateBillingEndDate,
        'issue_date': issueDate,
        'alternate_issue_date': alternateIssueDate,
        'due_date': dueDate,
        'alternate_due_date': alternateDueDate,
        'subtotal': subtotal,
        'tax': tax,
        'tax_total': taxTotal,
        'total': total,
        'paid': paid,
        'due': due,
        'discount_amount': discountAmount,
        'last_payment': lastPayment,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
      };
}

/// A [InvoiceLine]'s `item`.
class InvoiceLineItem extends Dto {
  const InvoiceLineItem({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static InvoiceLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceLineItem(
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

/// A [InvoiceLine]'s `tax`.
class InvoiceLineTax extends Dto {
  const InvoiceLineTax({
    this.object,
    this.id,
    this.name,
    this.rate,
    this.amount,
    this.href,
  });

  static InvoiceLineTax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceLineTax(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      rate: readDecimal(source['rate']),
      amount: readText(source['amount']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final double? rate;

  final String? amount;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'rate': rate,
        'amount': amount,
        'href': href,
      };
}

/// A [InvoiceLine]'s `accounting_code`.
class InvoiceLineAccountingCode extends Dto {
  const InvoiceLineAccountingCode({
    this.salesRevenue,
  });

  static InvoiceLineAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceLineAccountingCode(
      salesRevenue: readAny(source['sales_revenue']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? salesRevenue;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'sales_revenue': salesRevenue,
      };
}

/// A [InvoiceNoteEntry]'s `invoice`.
class InvoiceNoteEntryInvoice extends Dto {
  const InvoiceNoteEntryInvoice({
    this.object,
    this.id,
    this.href,
  });

  static InvoiceNoteEntryInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceNoteEntryInvoice(
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

/// One entry of a [InvoiceNoteEntry]'s `attachments`.
class InvoiceNoteEntryAttachment extends Dto {
  const InvoiceNoteEntryAttachment({
    this.uuid,
    this.filename,
    this.contentType,
    this.size,
    this.href,
  });

  static InvoiceNoteEntryAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceNoteEntryAttachment(
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
  Map<String, Object?> get fields => <String, Object?>{
        'uuid': uuid,
        'filename': filename,
        'content_type': contentType,
        'size': size,
        'href': href,
      };
}

/// One entry of a [InvoiceNoteEntry]'s `watchers`.
class InvoiceNoteEntryWatcher extends Dto {
  const InvoiceNoteEntryWatcher({
    this.type,
    this.name,
    this.email,
  });

  static InvoiceNoteEntryWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceNoteEntryWatcher(
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

/// A [InvoiceNoteEntry]'s `created_by`.
class InvoiceNoteEntryCreatedBy extends Dto {
  const InvoiceNoteEntryCreatedBy({
    this.object,
    this.name,
  });

  static InvoiceNoteEntryCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceNoteEntryCreatedBy(
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

/// A [InvoiceItemFulfillmentEntry]'s `account`.
class InvoiceItemFulfillmentEntryAccount extends Dto {
  const InvoiceItemFulfillmentEntryAccount({
    this.object,
    this.id,
    this.name,
    this.code,
    this.href,
  });

  static InvoiceItemFulfillmentEntryAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceItemFulfillmentEntryAccount(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'code': code,
        'href': href,
      };
}

/// A [InvoiceItemFulfillmentEntry]'s `invoice`.
class InvoiceItemFulfillmentEntryInvoice extends Dto {
  const InvoiceItemFulfillmentEntryInvoice({
    this.object,
    this.id,
    this.href,
  });

  static InvoiceItemFulfillmentEntryInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceItemFulfillmentEntryInvoice(
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

/// One entry of a [InvoiceItemFulfillmentEntry]'s `fulfillments`.
class InvoiceItemFulfillmentEntryFulfillment extends Dto {
  const InvoiceItemFulfillmentEntryFulfillment({
    this.object,
    this.id,
    this.fulfillmentIndex,
    this.servingStatus,
    this.inventoryTracking,
    this.fulfillmentQty,
    this.fulfillmentSentQty,
    this.pendingReturn,
    this.returned,
    this.item,
    this.uom,
    this.uomPrecision,
  });

  static InvoiceItemFulfillmentEntryFulfillment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceItemFulfillmentEntryFulfillment(
      object: readText(source['object']),
      id: readText(source['id']),
      fulfillmentIndex: readInteger(source['fulfillment_index']),
      servingStatus: readText(source['serving_status']),
      inventoryTracking: readAny(source['inventory_tracking']),
      fulfillmentQty: readDecimal(source['fulfillment_qty']),
      fulfillmentSentQty: readDecimal(source['fulfillment_sent_qty']),
      pendingReturn: readDecimal(source['pending_return']),
      returned: readDecimal(source['returned']),
      item: InvoiceItemFulfillmentEntryFulfillmentItem.fromMap(source['item']),
      uom: readText(source['uom']),
      uomPrecision: readInteger(source['uom_precision']),
    );
  }

  final String? object;

  final String? id;

  final int? fulfillmentIndex;

  final String? servingStatus;

  /// Untyped: null in every record measured.
  final Object? inventoryTracking;

  final double? fulfillmentQty;

  final double? fulfillmentSentQty;

  final double? pendingReturn;

  final double? returned;

  final InvoiceItemFulfillmentEntryFulfillmentItem? item;

  final String? uom;

  final int? uomPrecision;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'fulfillment_index': fulfillmentIndex,
        'serving_status': servingStatus,
        'inventory_tracking': inventoryTracking,
        'fulfillment_qty': fulfillmentQty,
        'fulfillment_sent_qty': fulfillmentSentQty,
        'pending_return': pendingReturn,
        'returned': returned,
        'item': item,
        'uom': uom,
        'uom_precision': uomPrecision,
      };
}

/// A [InvoiceItemFulfillmentEntry]'s `created_by`.
class InvoiceItemFulfillmentEntryCreatedBy extends Dto {
  const InvoiceItemFulfillmentEntryCreatedBy({
    this.object,
    this.name,
  });

  static InvoiceItemFulfillmentEntryCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceItemFulfillmentEntryCreatedBy(
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

/// A [InvoiceItemFulfillmentEntry]'s `last_updated_by`.
class InvoiceItemFulfillmentEntryLastUpdatedBy extends Dto {
  const InvoiceItemFulfillmentEntryLastUpdatedBy({
    this.object,
    this.name,
  });

  static InvoiceItemFulfillmentEntryLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceItemFulfillmentEntryLastUpdatedBy(
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

/// A [InvoiceItemFulfillmentFulfillment]'s `item`.
class InvoiceItemFulfillmentFulfillmentItem extends Dto {
  const InvoiceItemFulfillmentFulfillmentItem({
    this.object,
    this.id,
    this.name,
    this.code,
    this.href,
  });

  static InvoiceItemFulfillmentFulfillmentItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceItemFulfillmentFulfillmentItem(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'code': code,
        'href': href,
      };
}

/// A [InvoiceReturnMerchandiseAuthorisationEntry]'s `account`.
class InvoiceReturnMerchandiseAuthorisationEntryAccount extends Dto {
  const InvoiceReturnMerchandiseAuthorisationEntryAccount({
    this.object,
    this.id,
    this.name,
    this.code,
    this.href,
  });

  static InvoiceReturnMerchandiseAuthorisationEntryAccount? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationEntryAccount(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'code': code,
        'href': href,
      };
}

/// A [InvoiceReturnMerchandiseAuthorisationEntry]'s `sale_invoice`.
class InvoiceReturnMerchandiseAuthorisationEntrySaleInvoice extends Dto {
  const InvoiceReturnMerchandiseAuthorisationEntrySaleInvoice({
    this.object,
    this.id,
    this.code,
    this.href,
  });

  static InvoiceReturnMerchandiseAuthorisationEntrySaleInvoice? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationEntrySaleInvoice(
      object: readText(source['object']),
      id: readText(source['id']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'code': code,
        'href': href,
      };
}

/// A [InvoiceReturnMerchandiseAuthorisationEntry]'s `created_by`.
class InvoiceReturnMerchandiseAuthorisationEntryCreatedBy extends Dto {
  const InvoiceReturnMerchandiseAuthorisationEntryCreatedBy({
    this.object,
    this.name,
  });

  static InvoiceReturnMerchandiseAuthorisationEntryCreatedBy? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationEntryCreatedBy(
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

/// A [InvoiceReturnMerchandiseAuthorisationReceiveRma]'s `created_by`.
class InvoiceReturnMerchandiseAuthorisationReceiveRmaCreatedBy extends Dto {
  const InvoiceReturnMerchandiseAuthorisationReceiveRmaCreatedBy({
    this.object,
    this.name,
  });

  static InvoiceReturnMerchandiseAuthorisationReceiveRmaCreatedBy? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceReturnMerchandiseAuthorisationReceiveRmaCreatedBy(
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

/// A [AccountInvoice]'s `custom_form`.
class AccountInvoiceCustomForm extends Dto {
  const AccountInvoiceCustomForm({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static AccountInvoiceCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceCustomForm(
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

/// A [AccountInvoice]'s `currency`.
class AccountInvoiceCurrency extends Dto {
  const AccountInvoiceCurrency({
    this.object,
    this.id,
    this.name,
    this.code,
    this.href,
  });

  static AccountInvoiceCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceCurrency(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'code': code,
        'href': href,
      };
}

/// A [AccountInvoice]'s `account`.
class AccountInvoiceAccount extends Dto {
  const AccountInvoiceAccount({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static AccountInvoiceAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceAccount(
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

/// A [AccountInvoice]'s `order`.
class AccountInvoiceOrder extends Dto {
  const AccountInvoiceOrder({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static AccountInvoiceOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceOrder(
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

/// A [AccountInvoice]'s `last_payment`.
class AccountInvoiceLastPayment extends Dto {
  const AccountInvoiceLastPayment({
    this.id,
    this.amount,
    this.createdOn,
  });

  static AccountInvoiceLastPayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceLastPayment(
      id: readText(source['id']),
      amount: readText(source['amount']),
      createdOn: readText(source['created_on']),
    );
  }

  final String? id;

  final String? amount;

  final String? createdOn;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'amount': amount,
        'created_on': createdOn,
      };
}

/// A [AccountInvoice]'s `created_by`.
class AccountInvoiceCreatedBy extends Dto {
  const AccountInvoiceCreatedBy({
    this.object,
    this.name,
  });

  static AccountInvoiceCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceCreatedBy(
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

/// A [AccountInvoice]'s `last_updated_by`.
class AccountInvoiceLastUpdatedBy extends Dto {
  const AccountInvoiceLastUpdatedBy({
    this.object,
    this.name,
  });

  static AccountInvoiceLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceLastUpdatedBy(
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

/// A [OrderInvoice]'s `custom_form`.
class OrderInvoiceCustomForm extends Dto {
  const OrderInvoiceCustomForm({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static OrderInvoiceCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInvoiceCustomForm(
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

/// A [OrderInvoice]'s `currency`.
class OrderInvoiceCurrency extends Dto {
  const OrderInvoiceCurrency({
    this.object,
    this.id,
    this.name,
    this.code,
    this.href,
  });

  static OrderInvoiceCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInvoiceCurrency(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'code': code,
        'href': href,
      };
}

/// A [OrderInvoice]'s `account`.
class OrderInvoiceAccount extends Dto {
  const OrderInvoiceAccount({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static OrderInvoiceAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInvoiceAccount(
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

/// A [OrderInvoice]'s `order`.
class OrderInvoiceOrder extends Dto {
  const OrderInvoiceOrder({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static OrderInvoiceOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInvoiceOrder(
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

/// A [OrderInvoice]'s `created_by`.
class OrderInvoiceCreatedBy extends Dto {
  const OrderInvoiceCreatedBy({
    this.object,
    this.name,
  });

  static OrderInvoiceCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInvoiceCreatedBy(
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

/// A [InvoiceItemFulfillmentEntryFulfillment]'s `item`.
class InvoiceItemFulfillmentEntryFulfillmentItem extends Dto {
  const InvoiceItemFulfillmentEntryFulfillmentItem({
    this.object,
    this.id,
    this.name,
    this.code,
    this.href,
  });

  static InvoiceItemFulfillmentEntryFulfillmentItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceItemFulfillmentEntryFulfillmentItem(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'code': code,
        'href': href,
      };
}

/// What `getInvoiceKpis` answers, under `invoice_kpis`: the block an invoice
/// carries as `kpis`, with an `object` beside it.
class InvoiceKpisRead extends Dto {
  const InvoiceKpisRead({
    this.creditApplied,
    this.creditIssued,
    this.paymentApplied,
    this.lastPaymentDate,
    this.lastAmendedOn,
    this.lastCancelledOn,
    this.lastReactivatedOn,
    this.deletedOn,
    this.voidedOn,
    this.outstanding,
    this.overdue,
    this.object,
  });

  static InvoiceKpisRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'invoice_kpis');
    if (source == null) return null;
    return InvoiceKpisRead(
      creditApplied: readText(source['credit_applied']),
      creditIssued: readText(source['credit_issued']),
      paymentApplied: readText(source['payment_applied']),
      lastPaymentDate: readText(source['last_payment_date']),
      lastAmendedOn: readText(source['last_amended_on']),
      lastCancelledOn: readText(source['last_cancelled_on']),
      lastReactivatedOn: readText(source['last_reactivated_on']),
      deletedOn: readText(source['deleted_on']),
      voidedOn: readText(source['voided_on']),
      outstanding: readAny(source['outstanding']),
      overdue: readAny(source['overdue']),
      object: readText(source['object']),
    );
  }

  final String? creditApplied;

  final String? creditIssued;

  final String? paymentApplied;

  final String? lastPaymentDate;

  final String? lastAmendedOn;

  final String? lastCancelledOn;

  final String? lastReactivatedOn;

  final String? deletedOn;

  final String? voidedOn;

  /// Untyped: a String on some blocks and an int on others.
  final Object? outstanding;

  /// Untyped: an int on some blocks and a String on others.
  final Object? overdue;

  final String? object;

  @override
  String? get envelopeKey => 'invoice_kpis';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'credit_applied': creditApplied,
        'credit_issued': creditIssued,
        'payment_applied': paymentApplied,
        'last_payment_date': lastPaymentDate,
        'last_amended_on': lastAmendedOn,
        'last_cancelled_on': lastCancelledOn,
        'last_reactivated_on': lastReactivatedOn,
        'deleted_on': deletedOn,
        'voided_on': voidedOn,
        'outstanding': outstanding,
        'overdue': overdue,
        'object': object,
      };
}

/// What `getInvoiceLines` answers, under `invoice`: its `object` and `lines`,
/// and nothing else of the invoice.
class InvoiceLines extends Dto {
  const InvoiceLines({
    this.object,
    this.lines,
  });

  static InvoiceLines? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'invoice');
    if (source == null) return null;
    return InvoiceLines(
      object: readText(source['object']),
      lines: readList<InvoiceLine>(source['lines'], InvoiceLine.fromMap),
    );
  }

  final String? object;

  final List<InvoiceLine?>? lines;

  @override
  String? get envelopeKey => 'invoice';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'lines': lines,
      };
}

/// What `getInvoiceLine` answers, under `invoice`: its `object` and one `line`.
class InvoiceLineRead extends Dto {
  const InvoiceLineRead({
    this.object,
    this.line,
  });

  static InvoiceLineRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'invoice');
    if (source == null) return null;
    return InvoiceLineRead(
      object: readText(source['object']),
      line: InvoiceLine.fromMap(source['line']),
    );
  }

  final String? object;

  final InvoiceLine? line;

  @override
  String? get envelopeKey => 'invoice';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'line': line,
      };
}
