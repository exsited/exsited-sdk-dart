/// Typed views over the v4 purchase orders bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The purchase order line body.
class PurchaseOrderLine extends Dto {
  const PurchaseOrderLine({
    this.createdOn,
    this.flatDiscount,
    this.href,
    this.id,
    this.isPriceTaxInclusive,
    this.isTaxExempt,
    this.item,
    this.itemAccountingCode,
    this.itemDiscountAmount,
    this.itemExpectedCompletionDate,
    this.itemInvoiceNote,
    this.itemPriceSnapshot,
    this.itemPriceTax,
    this.itemPriceTaxExempt,
    this.itemPurchaseAccountingCode,
    this.itemPurchaseTaxConfiguration,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.price,
    this.purchaseLineNote,
    this.quantity,
    this.sortIndex,
    this.status,
    this.subtotal,
    this.tax,
    this.taxTotal,
    this.total,
    this.uom,
    this.version,
    this.warehouse,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/lines',
  ];

  static PurchaseOrderLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLine(
      createdOn: readText(source['created_on']),
      flatDiscount: readDecimal(source['flat_discount']),
      href: readText(source['href']),
      id: readText(source['id']),
      isPriceTaxInclusive: readFlag(source['is_price_tax_inclusive']),
      isTaxExempt: readFlag(source['is_tax_exempt']),
      item: PurchaseOrderLineItem.fromMap(source['item']),
      itemAccountingCode: PurchaseOrderLineItemAccountingCode.fromMap(
          source['item_accounting_code']),
      itemDiscountAmount: readDecimal(source['item_discount_amount']),
      itemExpectedCompletionDate:
          readText(source['item_expected_completion_date']),
      itemInvoiceNote: readAny(source['item_invoice_note']),
      itemPriceSnapshot: PurchaseOrderLineItemPriceSnapshot.fromMap(
          source['item_price_snapshot']),
      itemPriceTax:
          PurchaseOrderLineItemPriceTax.fromMap(source['item_price_tax']),
      itemPriceTaxExempt: readFlag(source['item_price_tax_exempt']),
      itemPurchaseAccountingCode:
          PurchaseOrderLineItemPurchaseAccountingCode.fromMap(
              source['item_purchase_accounting_code']),
      itemPurchaseTaxConfiguration:
          PurchaseOrderLineItemPurchaseTaxConfiguration.fromMap(
              source['item_purchase_tax_configuration']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      price: readDecimal(source['price']),
      purchaseLineNote: readAny(source['purchase_line_note']),
      quantity: readInteger(source['quantity']),
      sortIndex: readInteger(source['sort_index']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      tax: PurchaseOrderLineTax.fromMap(source['tax']),
      taxTotal: readText(source['tax_total']),
      total: readText(source['total']),
      uom: PurchaseOrderLineUom.fromMap(source['uom']),
      version: readInteger(source['version']),
      warehouse: PurchaseOrderLineWarehouse.fromMap(source['warehouse']),
    );
  }

  final String? createdOn;

  final double? flatDiscount;

  final String? href;

  final String? id;

  final bool? isPriceTaxInclusive;

  final bool? isTaxExempt;

  final PurchaseOrderLineItem? item;

  final PurchaseOrderLineItemAccountingCode? itemAccountingCode;

  final double? itemDiscountAmount;

  final String? itemExpectedCompletionDate;

  /// Untyped: never populated in the records measured.
  final Object? itemInvoiceNote;

  final PurchaseOrderLineItemPriceSnapshot? itemPriceSnapshot;

  final PurchaseOrderLineItemPriceTax? itemPriceTax;

  final bool? itemPriceTaxExempt;

  final PurchaseOrderLineItemPurchaseAccountingCode? itemPurchaseAccountingCode;

  final PurchaseOrderLineItemPurchaseTaxConfiguration?
      itemPurchaseTaxConfiguration;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final double? price;

  /// Untyped: never populated in the records measured.
  final Object? purchaseLineNote;

  final int? quantity;

  final int? sortIndex;

  final String? status;

  final String? subtotal;

  final PurchaseOrderLineTax? tax;

  final String? taxTotal;

  final String? total;

  final PurchaseOrderLineUom? uom;

  final int? version;

  final PurchaseOrderLineWarehouse? warehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_on': createdOn,
        'flat_discount': flatDiscount,
        'href': href,
        'id': id,
        'is_price_tax_inclusive': isPriceTaxInclusive,
        'is_tax_exempt': isTaxExempt,
        'item': item,
        'item_accounting_code': itemAccountingCode,
        'item_discount_amount': itemDiscountAmount,
        'item_expected_completion_date': itemExpectedCompletionDate,
        'item_invoice_note': itemInvoiceNote,
        'item_price_snapshot': itemPriceSnapshot,
        'item_price_tax': itemPriceTax,
        'item_price_tax_exempt': itemPriceTaxExempt,
        'item_purchase_accounting_code': itemPurchaseAccountingCode,
        'item_purchase_tax_configuration': itemPurchaseTaxConfiguration,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'price': price,
        'purchase_line_note': purchaseLineNote,
        'quantity': quantity,
        'sort_index': sortIndex,
        'status': status,
        'subtotal': subtotal,
        'tax': tax,
        'tax_total': taxTotal,
        'total': total,
        'uom': uom,
        'version': version,
        'warehouse': warehouse,
      };
}

/// A page of PurchaseOrderLine records.
class PurchaseOrderLineList extends Dto {
  const PurchaseOrderLineList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/lines',
  ];

  static PurchaseOrderLineList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineList(
      data: readList<PurchaseOrderLine>(
          source['data'], PurchaseOrderLine.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchaseOrderLine?>? data;

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

/// The purchase order body.
class PurchaseOrder extends Dto {
  const PurchaseOrder({
    this.account,
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
    'GET /api/{api_version}/purchase_orders',
  ];

  static PurchaseOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrder(
      account: PurchaseOrderAccount.fromMap(source['account']),
      billTotal: readText(source['bill_total']),
      code: readText(source['code']),
      createdBy: PurchaseOrderCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: PurchaseOrderCurrency.fromMap(source['currency']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customForm: PurchaseOrderCustomForm.fromMap(source['custom_form']),
      dueDate: readText(source['due_date']),
      dueTotal: readText(source['due_total']),
      expectedCompletionDate: readText(source['expected_completion_date']),
      href: readText(source['href']),
      id: readText(source['id']),
      isPriceTaxInclusive: readFlag(source['is_price_tax_inclusive']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy:
          PurchaseOrderLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      operationalStatus: readText(source['operational_status']),
      origin: readText(source['origin']),
      paidAmount: readText(source['paid_amount']),
      purchaseOrderNote: readText(source['purchase_order_note']),
      saleOrder: readAny(source['sale_order']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      supplierInvoiceId: readText(source['supplier_invoice_id']),
      taxTotal: readText(source['tax_total']),
      total: readText(source['total']),
      version: readInteger(source['version']),
      warehouse: readAny(source['warehouse']),
    );
  }

  final PurchaseOrderAccount? account;

  final String? billTotal;

  final String? code;

  final PurchaseOrderCreatedBy? createdBy;

  final String? createdOn;

  final PurchaseOrderCurrency? currency;

  final List<Object?>? customAttributes;

  final PurchaseOrderCustomForm? customForm;

  final String? dueDate;

  final String? dueTotal;

  final String? expectedCompletionDate;

  final String? href;

  final String? id;

  final bool? isPriceTaxInclusive;

  final String? issueDate;

  final PurchaseOrderLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? operationalStatus;

  final String? origin;

  final String? paidAmount;

  final String? purchaseOrderNote;

  /// Untyped: never populated in the records measured.
  final Object? saleOrder;

  final String? status;

  final String? subtotal;

  final String? supplierInvoiceId;

  final String? taxTotal;

  final String? total;

  final int? version;

  /// Untyped: never populated in the records measured.
  final Object? warehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
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

/// A page of PurchaseOrder records.
class PurchaseOrderList extends Dto {
  const PurchaseOrderList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders',
  ];

  static PurchaseOrderList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderList(
      data: readList<PurchaseOrder>(source['data'], PurchaseOrder.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchaseOrder?>? data;

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

/// The purchase order purchase invoice body.
class PurchaseOrderPurchaseInvoice extends Dto {
  const PurchaseOrderPurchaseInvoice({
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
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_invoices',
  ];

  static PurchaseOrderPurchaseInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoice(
      account: PurchaseOrderPurchaseInvoiceAccount.fromMap(source['account']),
      alternateDueDate: readText(source['alternate_due_date']),
      alternateIssueDate: readText(source['alternate_issue_date']),
      createdBy:
          PurchaseOrderPurchaseInvoiceCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency:
          PurchaseOrderPurchaseInvoiceCurrency.fromMap(source['currency']),
      customForm: readAny(source['custom_form']),
      dueDate: readText(source['due_date']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: PurchaseOrderPurchaseInvoiceLastUpdatedBy.fromMap(
          source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      origin: readText(source['origin']),
      paymentStatus: readText(source['payment_status']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      purchaseOrder: PurchaseOrderPurchaseInvoicePurchaseOrder.fromMap(
          source['purchase_order']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      total: readText(source['total']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final PurchaseOrderPurchaseInvoiceAccount? account;

  final String? alternateDueDate;

  final String? alternateIssueDate;

  final PurchaseOrderPurchaseInvoiceCreatedBy? createdBy;

  final String? createdOn;

  final PurchaseOrderPurchaseInvoiceCurrency? currency;

  /// Untyped: never populated in the records measured.
  final Object? customForm;

  final String? dueDate;

  final String? id;

  final String? issueDate;

  final PurchaseOrderPurchaseInvoiceLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? origin;

  final String? paymentStatus;

  final bool? priceTaxInclusive;

  final PurchaseOrderPurchaseInvoicePurchaseOrder? purchaseOrder;

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

/// A page of PurchaseOrderPurchaseInvoice records.
class PurchaseOrderPurchaseInvoiceList extends Dto {
  const PurchaseOrderPurchaseInvoiceList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_invoices',
  ];

  static PurchaseOrderPurchaseInvoiceList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoiceList(
      data: readList<PurchaseOrderPurchaseInvoice>(
          source['data'], PurchaseOrderPurchaseInvoice.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchaseOrderPurchaseInvoice?>? data;

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

/// The purchase order purchase payment body.
class PurchaseOrderPurchasePayment extends Dto {
  const PurchaseOrderPurchasePayment({
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
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_payments',
  ];

  static PurchaseOrderPurchasePayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchasePayment(
      account: PurchaseOrderPurchasePaymentAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy:
          PurchaseOrderPurchasePaymentCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNoteApplications:
          readList<PurchaseOrderPurchasePaymentCreditNoteApplication>(
              source['credit_note_applications'],
              PurchaseOrderPurchasePaymentCreditNoteApplication.fromMap),
      creditNoteTotal: readText(source['credit_note_total']),
      currency:
          PurchaseOrderPurchasePaymentCurrency.fromMap(source['currency']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: PurchaseOrderPurchasePaymentLastUpdatedBy.fromMap(
          source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      origin: readText(source['origin']),
      paidTotal: readText(source['paid_total']),
      paymentDate: readText(source['payment_date']),
      paymentMethodApplications:
          readList<PurchaseOrderPurchasePaymentPaymentMethodApplication>(
              source['payment_method_applications'],
              PurchaseOrderPurchasePaymentPaymentMethodApplication.fromMap),
      paymentNote: readText(source['payment_note']),
      paymentReference: readAny(source['payment_reference']),
      purchaseInvoiceApplications:
          readList<PurchaseOrderPurchasePaymentPurchaseInvoiceApplication>(
              source['purchase_invoice_applications'],
              PurchaseOrderPurchasePaymentPurchaseInvoiceApplication.fromMap),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final PurchaseOrderPurchasePaymentAccount? account;

  final String? code;

  final PurchaseOrderPurchasePaymentCreatedBy? createdBy;

  final String? createdOn;

  final List<PurchaseOrderPurchasePaymentCreditNoteApplication?>?
      creditNoteApplications;

  final String? creditNoteTotal;

  final PurchaseOrderPurchasePaymentCurrency? currency;

  final String? href;

  final String? id;

  final PurchaseOrderPurchasePaymentLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? origin;

  final String? paidTotal;

  final String? paymentDate;

  final List<PurchaseOrderPurchasePaymentPaymentMethodApplication?>?
      paymentMethodApplications;

  final String? paymentNote;

  /// Untyped: never populated in the records measured.
  final Object? paymentReference;

  final List<PurchaseOrderPurchasePaymentPurchaseInvoiceApplication?>?
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

/// A page of PurchaseOrderPurchasePayment records.
class PurchaseOrderPurchasePaymentList extends Dto {
  const PurchaseOrderPurchasePaymentList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_payments',
  ];

  static PurchaseOrderPurchasePaymentList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchasePaymentList(
      data: readList<PurchaseOrderPurchasePayment>(
          source['data'], PurchaseOrderPurchasePayment.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchaseOrderPurchasePayment?>? data;

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

/// The purchase orders note body.
class PurchaseOrdersNote extends Dto {
  const PurchaseOrdersNote({
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
    'GET /api/{api_version}/purchase_orders/notes',
  ];

  static PurchaseOrdersNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrdersNote(
      attachments: readList<Object>(source['attachments'], readAny),
      content: readText(source['content']),
      createdBy: PurchaseOrdersNoteCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<PurchaseOrdersNoteWatcher>(
          source['watchers'], PurchaseOrdersNoteWatcher.fromMap),
    );
  }

  final List<Object?>? attachments;

  final String? content;

  final PurchaseOrdersNoteCreatedBy? createdBy;

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

  /// Untyped: never populated in the records measured.
  final Object? user;

  final int? version;

  final List<PurchaseOrdersNoteWatcher?>? watchers;

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

/// A page of PurchaseOrdersNote records.
class PurchaseOrdersNoteList extends Dto {
  const PurchaseOrdersNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders/notes',
  ];

  static PurchaseOrdersNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrdersNoteList(
      data: readList<PurchaseOrdersNote>(
          source['data'], PurchaseOrdersNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchaseOrdersNote?>? data;

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

/// The purchase order read body.
class PurchaseOrderRead extends Dto {
  const PurchaseOrderRead({
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
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}',
    'POST /api/{api_version}/purchase_orders/{purchase_order_id}/change',
    'POST /api/{api_version}/purchase_orders/{purchase_order_id}/cancel',
    'POST /api/{api_version}/purchase_orders/{purchase_order_id}/reactivate',
  ];

  static PurchaseOrderRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_order');
    if (source == null) return null;
    return PurchaseOrderRead(
      account: PurchaseOrderReadAccount.fromMap(source['account']),
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      billTotal: readText(source['bill_total']),
      code: readText(source['code']),
      createdBy: PurchaseOrderReadCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: PurchaseOrderReadCurrency.fromMap(source['currency']),
      customAttributes: readList<PurchaseOrderReadCustomAttribute>(
          source['custom_attributes'],
          PurchaseOrderReadCustomAttribute.fromMap),
      customForm: PurchaseOrderReadCustomForm.fromMap(source['custom_form']),
      dueDate: readText(source['due_date']),
      dueTotal: readText(source['due_total']),
      expectedCompletionDate: readText(source['expected_completion_date']),
      href: readText(source['href']),
      id: readText(source['id']),
      isPriceTaxInclusive: readFlag(source['is_price_tax_inclusive']),
      issueDate: readText(source['issue_date']),
      kpis: PurchaseOrderReadKpis.fromMap(source['kpis']),
      lastUpdatedBy:
          PurchaseOrderReadLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      operationalStatus: readText(source['operational_status']),
      origin: readText(source['origin']),
      paidAmount: readText(source['paid_amount']),
      purchaseOrderNote: readText(source['purchase_order_note']),
      saleOrder: readAny(source['sale_order']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      supplierInvoiceId: readText(source['supplier_invoice_id']),
      taxTotal: readText(source['tax_total']),
      total: readText(source['total']),
      version: readInteger(source['version']),
      warehouse: readAny(source['warehouse']),
    );
  }

  final PurchaseOrderReadAccount? account;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  final String? billTotal;

  final String? code;

  final PurchaseOrderReadCreatedBy? createdBy;

  final String? createdOn;

  final PurchaseOrderReadCurrency? currency;

  final List<PurchaseOrderReadCustomAttribute?>? customAttributes;

  final PurchaseOrderReadCustomForm? customForm;

  final String? dueDate;

  final String? dueTotal;

  final String? expectedCompletionDate;

  final String? href;

  final String? id;

  final bool? isPriceTaxInclusive;

  final String? issueDate;

  final PurchaseOrderReadKpis? kpis;

  final PurchaseOrderReadLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? operationalStatus;

  final String? origin;

  final String? paidAmount;

  final String? purchaseOrderNote;

  /// Untyped: never populated in the records measured.
  final Object? saleOrder;

  final String? status;

  final String? subtotal;

  final String? supplierInvoiceId;

  final String? taxTotal;

  final String? total;

  final int? version;

  /// Untyped: never populated in the records measured.
  final Object? warehouse;

  @override
  String? get envelopeKey => 'purchase_order';

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

/// The purchase order updated body.
class PurchaseOrderUpdated extends Dto {
  const PurchaseOrderUpdated({
    this.account,
    this.accountId,
    this.activityLogs,
    this.billTotal,
    this.code,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customAttributes,
    this.customForm,
    this.customObjects,
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
    this.lines,
    this.object,
    this.operationalStatus,
    this.origin,
    this.paidAmount,
    this.priceTaxInclusive,
    this.purchaseOrderNote,
    this.saleOrder,
    this.saleOrderId,
    this.status,
    this.subtotal,
    this.supplierInvoiceId,
    this.tax,
    this.taxTotal,
    this.total,
    this.uuid,
    this.version,
    this.warehouse,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/purchase_orders/{purchase_order_id}',
  ];

  static PurchaseOrderUpdated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_order');
    if (source == null) return null;
    return PurchaseOrderUpdated(
      account: PurchaseOrderUpdatedAccount.fromMap(source['account']),
      accountId: readText(source['account_id']),
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      billTotal: readText(source['bill_total']),
      code: readText(source['code']),
      createdBy: PurchaseOrderUpdatedCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: PurchaseOrderUpdatedCurrency.fromMap(source['currency']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customForm: PurchaseOrderUpdatedCustomForm.fromMap(source['custom_form']),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      dueDate: readText(source['due_date']),
      dueTotal: readText(source['due_total']),
      expectedCompletionDate: readText(source['expected_completion_date']),
      href: readText(source['href']),
      id: readText(source['id']),
      isPriceTaxInclusive: readAny(source['is_price_tax_inclusive']),
      issueDate: readText(source['issue_date']),
      kpis: PurchaseOrderUpdatedKpis.fromMap(source['kpis']),
      lastUpdatedBy:
          PurchaseOrderUpdatedLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lines: readList<Object>(source['lines'], readAny),
      object: readText(source['object']),
      operationalStatus: readText(source['operational_status']),
      origin: readText(source['origin']),
      paidAmount: readText(source['paid_amount']),
      priceTaxInclusive: readText(source['price_tax_inclusive']),
      purchaseOrderNote: readText(source['purchase_order_note']),
      saleOrder: readAny(source['sale_order']),
      saleOrderId: readText(source['sale_order_id']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      supplierInvoiceId: readText(source['supplier_invoice_id']),
      tax: readText(source['tax']),
      taxTotal: readText(source['tax_total']),
      total: readText(source['total']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
      warehouse: readAny(source['warehouse']),
    );
  }

  final PurchaseOrderUpdatedAccount? account;

  final String? accountId;

  final List<Object?>? activityLogs;

  final String? billTotal;

  final String? code;

  final PurchaseOrderUpdatedCreatedBy? createdBy;

  final String? createdOn;

  final PurchaseOrderUpdatedCurrency? currency;

  final List<Object?>? customAttributes;

  final PurchaseOrderUpdatedCustomForm? customForm;

  final List<Object?>? customObjects;

  final String? dueDate;

  final String? dueTotal;

  final String? expectedCompletionDate;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? isPriceTaxInclusive;

  final String? issueDate;

  final PurchaseOrderUpdatedKpis? kpis;

  final PurchaseOrderUpdatedLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final List<Object?>? lines;

  final String? object;

  final String? operationalStatus;

  final String? origin;

  final String? paidAmount;

  final String? priceTaxInclusive;

  final String? purchaseOrderNote;

  /// Untyped: null in every record measured.
  final Object? saleOrder;

  final String? saleOrderId;

  final String? status;

  final String? subtotal;

  final String? supplierInvoiceId;

  final String? tax;

  final String? taxTotal;

  final String? total;

  final String? uuid;

  final int? version;

  /// Untyped: null in every record measured.
  final Object? warehouse;

  @override
  String? get envelopeKey => 'purchase_order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'account_id': accountId,
        'activity_logs': activityLogs,
        'bill_total': billTotal,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_attributes': customAttributes,
        'custom_form': customForm,
        'custom_objects': customObjects,
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
        'lines': lines,
        'object': object,
        'operational_status': operationalStatus,
        'origin': origin,
        'paid_amount': paidAmount,
        'price_tax_inclusive': priceTaxInclusive,
        'purchase_order_note': purchaseOrderNote,
        'sale_order': saleOrder,
        'sale_order_id': saleOrderId,
        'status': status,
        'subtotal': subtotal,
        'supplier_invoice_id': supplierInvoiceId,
        'tax': tax,
        'tax_total': taxTotal,
        'total': total,
        'uuid': uuid,
        'version': version,
        'warehouse': warehouse,
      };
}

/// The purchase orders body.
class PurchaseOrders extends Dto {
  const PurchaseOrders({
    this.account,
    this.accountId,
    this.activityLogs,
    this.billTotal,
    this.code,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customAttributes,
    this.customForm,
    this.customObjects,
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
    this.lines,
    this.object,
    this.operationalStatus,
    this.origin,
    this.paidAmount,
    this.priceTaxInclusive,
    this.purchaseOrderNote,
    this.saleOrder,
    this.status,
    this.subtotal,
    this.supplierInvoiceId,
    this.tax,
    this.taxTotal,
    this.total,
    this.uuid,
    this.version,
    this.warehouse,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/purchase_orders',
  ];

  static PurchaseOrders? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_order');
    if (source == null) return null;
    return PurchaseOrders(
      account: PurchaseOrdersAccount.fromMap(source['account']),
      accountId: readText(source['account_id']),
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      billTotal: readText(source['bill_total']),
      code: readText(source['code']),
      createdBy: PurchaseOrdersCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: PurchaseOrdersCurrency.fromMap(source['currency']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customForm: PurchaseOrdersCustomForm.fromMap(source['custom_form']),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      dueDate: readText(source['due_date']),
      dueTotal: readText(source['due_total']),
      expectedCompletionDate: readText(source['expected_completion_date']),
      href: readText(source['href']),
      id: readText(source['id']),
      isPriceTaxInclusive: readAny(source['is_price_tax_inclusive']),
      issueDate: readText(source['issue_date']),
      kpis: PurchaseOrdersKpis.fromMap(source['kpis']),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lines: readList<Object>(source['lines'], readAny),
      object: readText(source['object']),
      operationalStatus: readText(source['operational_status']),
      origin: readText(source['origin']),
      paidAmount: readText(source['paid_amount']),
      priceTaxInclusive: readText(source['price_tax_inclusive']),
      purchaseOrderNote: readText(source['purchase_order_note']),
      saleOrder: readAny(source['sale_order']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      supplierInvoiceId: readText(source['supplier_invoice_id']),
      tax: readText(source['tax']),
      taxTotal: readText(source['tax_total']),
      total: readText(source['total']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
      warehouse: readAny(source['warehouse']),
    );
  }

  final PurchaseOrdersAccount? account;

  final String? accountId;

  final List<Object?>? activityLogs;

  final String? billTotal;

  final String? code;

  final PurchaseOrdersCreatedBy? createdBy;

  final String? createdOn;

  final PurchaseOrdersCurrency? currency;

  final List<Object?>? customAttributes;

  final PurchaseOrdersCustomForm? customForm;

  final List<Object?>? customObjects;

  final String? dueDate;

  final String? dueTotal;

  final String? expectedCompletionDate;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? isPriceTaxInclusive;

  final String? issueDate;

  final PurchaseOrdersKpis? kpis;

  final String? lastUpdatedBy;

  final String? lastUpdatedOn;

  final List<Object?>? lines;

  final String? object;

  final String? operationalStatus;

  final String? origin;

  final String? paidAmount;

  final String? priceTaxInclusive;

  final String? purchaseOrderNote;

  /// Untyped: null in every record measured.
  final Object? saleOrder;

  final String? status;

  final String? subtotal;

  final String? supplierInvoiceId;

  final String? tax;

  final String? taxTotal;

  final String? total;

  final String? uuid;

  final int? version;

  /// Untyped: null in every record measured.
  final Object? warehouse;

  @override
  String? get envelopeKey => 'purchase_order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'account_id': accountId,
        'activity_logs': activityLogs,
        'bill_total': billTotal,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_attributes': customAttributes,
        'custom_form': customForm,
        'custom_objects': customObjects,
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
        'lines': lines,
        'object': object,
        'operational_status': operationalStatus,
        'origin': origin,
        'paid_amount': paidAmount,
        'price_tax_inclusive': priceTaxInclusive,
        'purchase_order_note': purchaseOrderNote,
        'sale_order': saleOrder,
        'status': status,
        'subtotal': subtotal,
        'supplier_invoice_id': supplierInvoiceId,
        'tax': tax,
        'tax_total': taxTotal,
        'total': total,
        'uuid': uuid,
        'version': version,
        'warehouse': warehouse,
      };
}

/// The purchase order information body.
class PurchaseOrderInformation extends Dto {
  const PurchaseOrderInformation({
    this.billTotal,
    this.code,
    this.createdBy,
    this.createdOn,
    this.customAttributes,
    this.customForm,
    this.dueDate,
    this.dueTotal,
    this.expectedCompletionDate,
    this.href,
    this.id,
    this.isPriceTaxInclusive,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.operationalStatus,
    this.origin,
    this.paidAmount,
    this.purchaseOrderNote,
    this.status,
    this.subtotal,
    this.supplierInvoiceId,
    this.taxTotal,
    this.total,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/information',
  ];

  static PurchaseOrderInformation? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_order');
    if (source == null) return null;
    return PurchaseOrderInformation(
      billTotal: readText(source['bill_total']),
      code: readText(source['code']),
      createdBy:
          PurchaseOrderInformationCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      customAttributes: readList<PurchaseOrderInformationCustomAttribute>(
          source['custom_attributes'],
          PurchaseOrderInformationCustomAttribute.fromMap),
      customForm:
          PurchaseOrderInformationCustomForm.fromMap(source['custom_form']),
      dueDate: readText(source['due_date']),
      dueTotal: readText(source['due_total']),
      expectedCompletionDate: readText(source['expected_completion_date']),
      href: readText(source['href']),
      id: readText(source['id']),
      isPriceTaxInclusive: readFlag(source['is_price_tax_inclusive']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: PurchaseOrderInformationLastUpdatedBy.fromMap(
          source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      operationalStatus: readText(source['operational_status']),
      origin: readText(source['origin']),
      paidAmount: readText(source['paid_amount']),
      purchaseOrderNote: readText(source['purchase_order_note']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      supplierInvoiceId: readText(source['supplier_invoice_id']),
      taxTotal: readText(source['tax_total']),
      total: readText(source['total']),
      version: readInteger(source['version']),
    );
  }

  final String? billTotal;

  final String? code;

  final PurchaseOrderInformationCreatedBy? createdBy;

  final String? createdOn;

  final List<PurchaseOrderInformationCustomAttribute?>? customAttributes;

  final PurchaseOrderInformationCustomForm? customForm;

  final String? dueDate;

  final String? dueTotal;

  final String? expectedCompletionDate;

  final String? href;

  final String? id;

  final bool? isPriceTaxInclusive;

  final String? issueDate;

  final PurchaseOrderInformationLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? operationalStatus;

  final String? origin;

  final String? paidAmount;

  final String? purchaseOrderNote;

  final String? status;

  final String? subtotal;

  final String? supplierInvoiceId;

  final String? taxTotal;

  final String? total;

  final int? version;

  @override
  String? get envelopeKey => 'purchase_order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'bill_total': billTotal,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_attributes': customAttributes,
        'custom_form': customForm,
        'due_date': dueDate,
        'due_total': dueTotal,
        'expected_completion_date': expectedCompletionDate,
        'href': href,
        'id': id,
        'is_price_tax_inclusive': isPriceTaxInclusive,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'operational_status': operationalStatus,
        'origin': origin,
        'paid_amount': paidAmount,
        'purchase_order_note': purchaseOrderNote,
        'status': status,
        'subtotal': subtotal,
        'supplier_invoice_id': supplierInvoiceId,
        'tax_total': taxTotal,
        'total': total,
        'version': version,
      };
}

/// The account purchase orders body.
class AccountPurchaseOrders extends Dto {
  const AccountPurchaseOrders({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/purchase_orders',
  ];

  static AccountPurchaseOrders? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseOrders(
      data: readList<AccountPurchaseOrdersData>(
          source['data'], AccountPurchaseOrdersData.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<AccountPurchaseOrdersData?>? data;

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

/// The purchase order notes body.
class PurchaseOrderNotes extends Dto {
  const PurchaseOrderNotes({
    this.data,
    this.notes,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/notes',
  ];

  static PurchaseOrderNotes? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderNotes(
      data: readList<PurchaseOrderNotesData>(
          source['data'], PurchaseOrderNotesData.fromMap),
      notes: readList<Object>(source['notes'], readAny),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchaseOrderNotesData?>? data;

  final List<Object?>? notes;

  final String? object;

  final Pagination? pagination;

  final String? url;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'data': data,
        'notes': notes,
        'object': object,
        'pagination': pagination,
        'url': url,
      };
}

/// The purchase order note body.
class PurchaseOrderNote extends Dto {
  const PurchaseOrderNote({
    this.note,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}',
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}/files',
  ];

  static PurchaseOrderNote? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_order');
    if (source == null) return null;
    return PurchaseOrderNote(
      note: readAny(source['note']),
    );
  }

  final Object? note;

  @override
  String? get envelopeKey => 'purchase_order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'note': note,
      };
}

/// The purchase order line read body.
class PurchaseOrderLineRead extends Dto {
  const PurchaseOrderLineRead({
    this.createdOn,
    this.flatDiscount,
    this.href,
    this.id,
    this.isPriceTaxInclusive,
    this.isTaxExempt,
    this.item,
    this.itemAccountingCode,
    this.itemDiscountAmount,
    this.itemExpectedCompletionDate,
    this.itemInvoiceNote,
    this.itemPriceSnapshot,
    this.itemPriceTax,
    this.itemPriceTaxExempt,
    this.itemPurchaseAccountingCode,
    this.itemPurchaseTaxConfiguration,
    this.lastUpdatedOn,
    this.line,
    this.name,
    this.object,
    this.price,
    this.purchaseLineNote,
    this.quantity,
    this.sortIndex,
    this.status,
    this.subtotal,
    this.tax,
    this.taxTotal,
    this.total,
    this.uom,
    this.version,
    this.warehouse,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/lines/{purchase_order_line_uuid}',
  ];

  static PurchaseOrderLineRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_order_line');
    if (source == null) return null;
    return PurchaseOrderLineRead(
      createdOn: readText(source['created_on']),
      flatDiscount: readDecimal(source['flat_discount']),
      href: readText(source['href']),
      id: readText(source['id']),
      isPriceTaxInclusive: readFlag(source['is_price_tax_inclusive']),
      isTaxExempt: readFlag(source['is_tax_exempt']),
      item: PurchaseOrderLineReadItem.fromMap(source['item']),
      itemAccountingCode: PurchaseOrderLineReadItemAccountingCode.fromMap(
          source['item_accounting_code']),
      itemDiscountAmount: readDecimal(source['item_discount_amount']),
      itemExpectedCompletionDate:
          readText(source['item_expected_completion_date']),
      itemInvoiceNote: readAny(source['item_invoice_note']),
      itemPriceSnapshot: PurchaseOrderLineReadItemPriceSnapshot.fromMap(
          source['item_price_snapshot']),
      itemPriceTax:
          PurchaseOrderLineReadItemPriceTax.fromMap(source['item_price_tax']),
      itemPriceTaxExempt: readFlag(source['item_price_tax_exempt']),
      itemPurchaseAccountingCode:
          PurchaseOrderLineReadItemPurchaseAccountingCode.fromMap(
              source['item_purchase_accounting_code']),
      itemPurchaseTaxConfiguration:
          PurchaseOrderLineReadItemPurchaseTaxConfiguration.fromMap(
              source['item_purchase_tax_configuration']),
      lastUpdatedOn: readText(source['last_updated_on']),
      line: readAny(source['line']),
      name: readText(source['name']),
      object: readText(source['object']),
      price: readDecimal(source['price']),
      purchaseLineNote: readAny(source['purchase_line_note']),
      quantity: readInteger(source['quantity']),
      sortIndex: readInteger(source['sort_index']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      tax: PurchaseOrderLineReadTax.fromMap(source['tax']),
      taxTotal: readText(source['tax_total']),
      total: readText(source['total']),
      uom: PurchaseOrderLineReadUom.fromMap(source['uom']),
      version: readInteger(source['version']),
      warehouse: PurchaseOrderLineReadWarehouse.fromMap(source['warehouse']),
    );
  }

  final String? createdOn;

  final double? flatDiscount;

  final String? href;

  final String? id;

  final bool? isPriceTaxInclusive;

  final bool? isTaxExempt;

  final PurchaseOrderLineReadItem? item;

  final PurchaseOrderLineReadItemAccountingCode? itemAccountingCode;

  final double? itemDiscountAmount;

  final String? itemExpectedCompletionDate;

  /// Untyped: null in every record measured.
  final Object? itemInvoiceNote;

  final PurchaseOrderLineReadItemPriceSnapshot? itemPriceSnapshot;

  final PurchaseOrderLineReadItemPriceTax? itemPriceTax;

  final bool? itemPriceTaxExempt;

  final PurchaseOrderLineReadItemPurchaseAccountingCode?
      itemPurchaseAccountingCode;

  final PurchaseOrderLineReadItemPurchaseTaxConfiguration?
      itemPurchaseTaxConfiguration;

  final String? lastUpdatedOn;

  final Object? line;

  final String? name;

  final String? object;

  final double? price;

  /// Untyped: null in every record measured.
  final Object? purchaseLineNote;

  final int? quantity;

  final int? sortIndex;

  final String? status;

  final String? subtotal;

  final PurchaseOrderLineReadTax? tax;

  final String? taxTotal;

  final String? total;

  final PurchaseOrderLineReadUom? uom;

  final int? version;

  final PurchaseOrderLineReadWarehouse? warehouse;

  @override
  String? get envelopeKey => 'purchase_order_line';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_on': createdOn,
        'flat_discount': flatDiscount,
        'href': href,
        'id': id,
        'is_price_tax_inclusive': isPriceTaxInclusive,
        'is_tax_exempt': isTaxExempt,
        'item': item,
        'item_accounting_code': itemAccountingCode,
        'item_discount_amount': itemDiscountAmount,
        'item_expected_completion_date': itemExpectedCompletionDate,
        'item_invoice_note': itemInvoiceNote,
        'item_price_snapshot': itemPriceSnapshot,
        'item_price_tax': itemPriceTax,
        'item_price_tax_exempt': itemPriceTaxExempt,
        'item_purchase_accounting_code': itemPurchaseAccountingCode,
        'item_purchase_tax_configuration': itemPurchaseTaxConfiguration,
        'last_updated_on': lastUpdatedOn,
        'line': line,
        'name': name,
        'object': object,
        'price': price,
        'purchase_line_note': purchaseLineNote,
        'quantity': quantity,
        'sort_index': sortIndex,
        'status': status,
        'subtotal': subtotal,
        'tax': tax,
        'tax_total': taxTotal,
        'total': total,
        'uom': uom,
        'version': version,
        'warehouse': warehouse,
      };
}

/// What `getPurchaseOrderNote` answers, under `note`.
class PurchaseOrderNoteView extends Dto {
  const PurchaseOrderNoteView({
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
    this.purchaseOrder,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}',
    'POST /api/{api_version}/purchase_orders/{purchase_order_id}/notes',
  ];

  static PurchaseOrderNoteView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return PurchaseOrderNoteView(
      attachments: readList<PurchaseOrderNoteViewAttachment>(
          source['attachments'], PurchaseOrderNoteViewAttachment.fromMap),
      content: readText(source['content']),
      createdBy: PurchaseOrderNoteViewCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      purchaseOrder:
          PurchaseOrderNoteViewPurchaseOrder.fromMap(source['purchase_order']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<PurchaseOrderNoteViewWatcher>(
          source['watchers'], PurchaseOrderNoteViewWatcher.fromMap),
    );
  }

  final List<PurchaseOrderNoteViewAttachment?>? attachments;

  final String? content;

  final PurchaseOrderNoteViewCreatedBy? createdBy;

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

  final PurchaseOrderNoteViewPurchaseOrder? purchaseOrder;

  /// Untyped: null in every record measured.
  final Object? user;

  final int? version;

  final List<PurchaseOrderNoteViewWatcher?>? watchers;

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
        'purchase_order': purchaseOrder,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// One page of what `getPurchaseOrderNoteFiles` lists, under `data`.
class PurchaseOrderNoteFileList extends Dto {
  const PurchaseOrderNoteFileList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}/files',
  ];

  static PurchaseOrderNoteFileList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderNoteFileList(
      data: readList<PurchaseOrderNoteFileEntry>(
          source['data'], PurchaseOrderNoteFileEntry.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchaseOrderNoteFileEntry?>? data;

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

/// What `getPurchaseOrderNoteFile` answers, under `file`.
class PurchaseOrderNoteFile extends Dto {
  const PurchaseOrderNoteFile({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}/files/{purchase_order_file_id}',
  ];

  static PurchaseOrderNoteFile? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'file');
    if (source == null) return null;
    return PurchaseOrderNoteFile(
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

/// What `createPurchaseOrderPurchaseInvoice` answers, under `purchase_invoice`.
class PurchaseOrderPurchaseInvoices extends Dto {
  const PurchaseOrderPurchaseInvoices({
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
    'POST /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_invoices',
  ];

  static PurchaseOrderPurchaseInvoices? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_invoice');
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoices(
      account: PurchaseOrderPurchaseInvoicesAccount.fromMap(source['account']),
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      alternateDueDate: readText(source['alternate_due_date']),
      alternateIssueDate: readText(source['alternate_issue_date']),
      createdBy:
          PurchaseOrderPurchaseInvoicesCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency:
          PurchaseOrderPurchaseInvoicesCurrency.fromMap(source['currency']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customForm: readAny(source['custom_form']),
      dueDate: readText(source['due_date']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      kpis: PurchaseOrderPurchaseInvoicesKpis.fromMap(source['kpis']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      lines: readList<PurchaseOrderPurchaseInvoicesLine>(
          source['lines'], PurchaseOrderPurchaseInvoicesLine.fromMap),
      object: readText(source['object']),
      origin: readAny(source['origin']),
      paymentStatus: readText(source['payment_status']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      purchaseOrder: PurchaseOrderPurchaseInvoicesPurchaseOrder.fromMap(
          source['purchase_order']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      total: readText(source['total']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final PurchaseOrderPurchaseInvoicesAccount? account;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  final String? alternateDueDate;

  final String? alternateIssueDate;

  final PurchaseOrderPurchaseInvoicesCreatedBy? createdBy;

  final String? createdOn;

  final PurchaseOrderPurchaseInvoicesCurrency? currency;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? customAttributes;

  /// Untyped: null in every record measured.
  final Object? customForm;

  final String? dueDate;

  final String? id;

  final String? issueDate;

  final PurchaseOrderPurchaseInvoicesKpis? kpis;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final List<PurchaseOrderPurchaseInvoicesLine?>? lines;

  final String? object;

  /// Untyped: null in every record measured.
  final Object? origin;

  final String? paymentStatus;

  final bool? priceTaxInclusive;

  final PurchaseOrderPurchaseInvoicesPurchaseOrder? purchaseOrder;

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

/// One entry of a [AccountPurchaseOrders]'s `data`.
class AccountPurchaseOrdersData extends Dto {
  const AccountPurchaseOrdersData({
    this.account,
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

  static AccountPurchaseOrdersData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseOrdersData(
      account: AccountPurchaseOrdersDataAccount.fromMap(source['account']),
      billTotal: readText(source['bill_total']),
      code: readText(source['code']),
      createdBy:
          AccountPurchaseOrdersDataCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: AccountPurchaseOrdersDataCurrency.fromMap(source['currency']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customForm:
          AccountPurchaseOrdersDataCustomForm.fromMap(source['custom_form']),
      dueDate: readText(source['due_date']),
      dueTotal: readText(source['due_total']),
      expectedCompletionDate: readText(source['expected_completion_date']),
      href: readText(source['href']),
      id: readText(source['id']),
      isPriceTaxInclusive: readFlag(source['is_price_tax_inclusive']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: AccountPurchaseOrdersDataLastUpdatedBy.fromMap(
          source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      operationalStatus: readText(source['operational_status']),
      origin: readText(source['origin']),
      paidAmount: readText(source['paid_amount']),
      purchaseOrderNote: readText(source['purchase_order_note']),
      saleOrder: readAny(source['sale_order']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      supplierInvoiceId: readText(source['supplier_invoice_id']),
      taxTotal: readText(source['tax_total']),
      total: readText(source['total']),
      version: readInteger(source['version']),
      warehouse: readAny(source['warehouse']),
    );
  }

  final AccountPurchaseOrdersDataAccount? account;

  final String? billTotal;

  final String? code;

  final AccountPurchaseOrdersDataCreatedBy? createdBy;

  final String? createdOn;

  final AccountPurchaseOrdersDataCurrency? currency;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? customAttributes;

  final AccountPurchaseOrdersDataCustomForm? customForm;

  final String? dueDate;

  final String? dueTotal;

  final String? expectedCompletionDate;

  final String? href;

  final String? id;

  final bool? isPriceTaxInclusive;

  final String? issueDate;

  final AccountPurchaseOrdersDataLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? operationalStatus;

  final String? origin;

  final String? paidAmount;

  final String? purchaseOrderNote;

  /// Untyped: null in every record measured.
  final Object? saleOrder;

  final String? status;

  final String? subtotal;

  final String? supplierInvoiceId;

  final String? taxTotal;

  final String? total;

  final int? version;

  /// Untyped: null in every record measured.
  final Object? warehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
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

/// A [PurchaseOrderRead]'s `account`.
class PurchaseOrderReadAccount extends Dto {
  const PurchaseOrderReadAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderReadAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderReadAccount(
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

/// A [PurchaseOrderRead]'s `currency`.
class PurchaseOrderReadCurrency extends Dto {
  const PurchaseOrderReadCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderReadCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderReadCurrency(
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

/// One entry of a [PurchaseOrderRead]'s `custom_attributes`.
class PurchaseOrderReadCustomAttribute extends Dto {
  const PurchaseOrderReadCustomAttribute({
    this.href,
    this.id,
    this.name,
    this.object,
    this.type,
    this.value,
  });

  static PurchaseOrderReadCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderReadCustomAttribute(
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

/// A [PurchaseOrderRead]'s `custom_form`.
class PurchaseOrderReadCustomForm extends Dto {
  const PurchaseOrderReadCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderReadCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderReadCustomForm(
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

/// A [PurchaseOrderRead]'s `kpis`.
class PurchaseOrderReadKpis extends Dto {
  const PurchaseOrderReadKpis({
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

  static PurchaseOrderReadKpis? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderReadKpis(
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

  /// Untyped: null in every record measured.
  final Object? issueDate;

  /// Untyped: null in every record measured.
  final Object? lastCancelledOn;

  /// Untyped: null in every record measured.
  final Object? lastChangedOn;

  /// Untyped: null in every record measured.
  final Object? lastDeletedOn;

  /// Untyped: null in every record measured.
  final Object? lastInvoiceIssueDate;

  final String? lastInvoiceTotal;

  /// Untyped: null in every record measured.
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

/// A [PurchaseOrderRead]'s `created_by`.
class PurchaseOrderReadCreatedBy extends Dto {
  const PurchaseOrderReadCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderReadCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderReadCreatedBy(
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

/// A [PurchaseOrderRead]'s `last_updated_by`.
class PurchaseOrderReadLastUpdatedBy extends Dto {
  const PurchaseOrderReadLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderReadLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderReadLastUpdatedBy(
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

/// One entry of a [PurchaseOrderInformation]'s `custom_attributes`.
class PurchaseOrderInformationCustomAttribute extends Dto {
  const PurchaseOrderInformationCustomAttribute({
    this.href,
    this.id,
    this.name,
    this.object,
    this.type,
    this.value,
  });

  static PurchaseOrderInformationCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderInformationCustomAttribute(
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

/// A [PurchaseOrderInformation]'s `custom_form`.
class PurchaseOrderInformationCustomForm extends Dto {
  const PurchaseOrderInformationCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderInformationCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderInformationCustomForm(
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

/// A [PurchaseOrderInformation]'s `created_by`.
class PurchaseOrderInformationCreatedBy extends Dto {
  const PurchaseOrderInformationCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderInformationCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderInformationCreatedBy(
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

/// A [PurchaseOrderInformation]'s `last_updated_by`.
class PurchaseOrderInformationLastUpdatedBy extends Dto {
  const PurchaseOrderInformationLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderInformationLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderInformationLastUpdatedBy(
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

/// A [PurchaseOrderLineRead]'s `item`.
class PurchaseOrderLineReadItem extends Dto {
  const PurchaseOrderLineReadItem({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderLineReadItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineReadItem(
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

/// A [PurchaseOrderLineRead]'s `uom`.
class PurchaseOrderLineReadUom extends Dto {
  const PurchaseOrderLineReadUom({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderLineReadUom? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineReadUom(
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

/// A [PurchaseOrderLineRead]'s `warehouse`.
class PurchaseOrderLineReadWarehouse extends Dto {
  const PurchaseOrderLineReadWarehouse({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderLineReadWarehouse? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineReadWarehouse(
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

/// A [PurchaseOrderLineRead]'s `tax`.
class PurchaseOrderLineReadTax extends Dto {
  const PurchaseOrderLineReadTax({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderLineReadTax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineReadTax(
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

/// A [PurchaseOrderLineRead]'s `item_price_snapshot`.
class PurchaseOrderLineReadItemPriceSnapshot extends Dto {
  const PurchaseOrderLineReadItemPriceSnapshot({
    this.pricingRule,
  });

  static PurchaseOrderLineReadItemPriceSnapshot? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineReadItemPriceSnapshot(
      pricingRule: PurchaseOrderLineReadItemPriceSnapshotPricingRule.fromMap(
          source['pricing_rule']),
    );
  }

  final PurchaseOrderLineReadItemPriceSnapshotPricingRule? pricingRule;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'pricing_rule': pricingRule,
      };
}

/// A [PurchaseOrderLineRead]'s `item_price_tax`.
class PurchaseOrderLineReadItemPriceTax extends Dto {
  const PurchaseOrderLineReadItemPriceTax({
    this.href,
    this.id,
    this.name,
    this.object,
    this.rate,
  });

  static PurchaseOrderLineReadItemPriceTax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineReadItemPriceTax(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      rate: readDecimal(source['rate']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final double? rate;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'rate': rate,
      };
}

/// A [PurchaseOrderLineRead]'s `item_purchase_tax_configuration`.
class PurchaseOrderLineReadItemPurchaseTaxConfiguration extends Dto {
  const PurchaseOrderLineReadItemPurchaseTaxConfiguration({
    this.purchasePriceIsTaxInclusive,
    this.taxCode,
    this.taxExemptWhenPurchase,
  });

  static PurchaseOrderLineReadItemPurchaseTaxConfiguration? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineReadItemPurchaseTaxConfiguration(
      purchasePriceIsTaxInclusive:
          readFlag(source['purchase_price_is_tax_inclusive']),
      taxCode: PurchaseOrderLineReadItemPurchaseTaxConfigurationTaxCode.fromMap(
          source['tax_code']),
      taxExemptWhenPurchase: readFlag(source['tax_exempt_when_purchase']),
    );
  }

  final bool? purchasePriceIsTaxInclusive;

  final PurchaseOrderLineReadItemPurchaseTaxConfigurationTaxCode? taxCode;

  final bool? taxExemptWhenPurchase;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'purchase_price_is_tax_inclusive': purchasePriceIsTaxInclusive,
        'tax_code': taxCode,
        'tax_exempt_when_purchase': taxExemptWhenPurchase,
      };
}

/// A [PurchaseOrderLineRead]'s `item_accounting_code`.
class PurchaseOrderLineReadItemAccountingCode extends Dto {
  const PurchaseOrderLineReadItemAccountingCode({
    this.costOfGoodsSold,
  });

  static PurchaseOrderLineReadItemAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineReadItemAccountingCode(
      costOfGoodsSold: readText(source['cost_of_goods_sold']),
    );
  }

  final String? costOfGoodsSold;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'cost_of_goods_sold': costOfGoodsSold,
      };
}

/// A [PurchaseOrderLineRead]'s `item_purchase_accounting_code`.
class PurchaseOrderLineReadItemPurchaseAccountingCode extends Dto {
  const PurchaseOrderLineReadItemPurchaseAccountingCode({
    this.costOfGoodsSold,
  });

  static PurchaseOrderLineReadItemPurchaseAccountingCode? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineReadItemPurchaseAccountingCode(
      costOfGoodsSold: readText(source['cost_of_goods_sold']),
    );
  }

  final String? costOfGoodsSold;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'cost_of_goods_sold': costOfGoodsSold,
      };
}

/// One entry of a [PurchaseOrderNotes]'s `data`.
class PurchaseOrderNotesData extends Dto {
  const PurchaseOrderNotesData({
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
    this.purchaseOrder,
    this.user,
    this.version,
    this.watchers,
  });

  static PurchaseOrderNotesData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderNotesData(
      attachments: readList<PurchaseOrderNotesDataAttachment>(
          source['attachments'], PurchaseOrderNotesDataAttachment.fromMap),
      content: readText(source['content']),
      createdBy: PurchaseOrderNotesDataCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      purchaseOrder:
          PurchaseOrderNotesDataPurchaseOrder.fromMap(source['purchase_order']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<PurchaseOrderNotesDataWatcher>(
          source['watchers'], PurchaseOrderNotesDataWatcher.fromMap),
    );
  }

  final List<PurchaseOrderNotesDataAttachment?>? attachments;

  final String? content;

  final PurchaseOrderNotesDataCreatedBy? createdBy;

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

  final PurchaseOrderNotesDataPurchaseOrder? purchaseOrder;

  /// Untyped: null in every record measured.
  final Object? user;

  final int? version;

  final List<PurchaseOrderNotesDataWatcher?>? watchers;

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
        'purchase_order': purchaseOrder,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// A [PurchaseOrders]'s `account`.
class PurchaseOrdersAccount extends Dto {
  const PurchaseOrdersAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrdersAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrdersAccount(
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

/// A [PurchaseOrders]'s `currency`.
class PurchaseOrdersCurrency extends Dto {
  const PurchaseOrdersCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrdersCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrdersCurrency(
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

/// A [PurchaseOrders]'s `custom_form`.
class PurchaseOrdersCustomForm extends Dto {
  const PurchaseOrdersCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrdersCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrdersCustomForm(
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

/// A [PurchaseOrders]'s `kpis`.
class PurchaseOrdersKpis extends Dto {
  const PurchaseOrdersKpis({
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

  static PurchaseOrdersKpis? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrdersKpis(
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

  /// Untyped: null in every record measured.
  final Object? issueDate;

  /// Untyped: null in every record measured.
  final Object? lastCancelledOn;

  /// Untyped: null in every record measured.
  final Object? lastChangedOn;

  /// Untyped: null in every record measured.
  final Object? lastDeletedOn;

  /// Untyped: null in every record measured.
  final Object? lastInvoiceIssueDate;

  final String? lastInvoiceTotal;

  /// Untyped: null in every record measured.
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

/// A [PurchaseOrders]'s `created_by`.
class PurchaseOrdersCreatedBy extends Dto {
  const PurchaseOrdersCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrdersCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrdersCreatedBy(
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

/// A [PurchaseOrderUpdated]'s `account`.
class PurchaseOrderUpdatedAccount extends Dto {
  const PurchaseOrderUpdatedAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderUpdatedAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderUpdatedAccount(
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

/// A [PurchaseOrderUpdated]'s `currency`.
class PurchaseOrderUpdatedCurrency extends Dto {
  const PurchaseOrderUpdatedCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderUpdatedCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderUpdatedCurrency(
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

/// A [PurchaseOrderUpdated]'s `custom_form`.
class PurchaseOrderUpdatedCustomForm extends Dto {
  const PurchaseOrderUpdatedCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderUpdatedCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderUpdatedCustomForm(
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

/// A [PurchaseOrderUpdated]'s `kpis`.
class PurchaseOrderUpdatedKpis extends Dto {
  const PurchaseOrderUpdatedKpis({
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

  static PurchaseOrderUpdatedKpis? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderUpdatedKpis(
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

  /// Untyped: null in every record measured.
  final Object? issueDate;

  /// Untyped: null in every record measured.
  final Object? lastCancelledOn;

  /// Untyped: null in every record measured.
  final Object? lastChangedOn;

  /// Untyped: null in every record measured.
  final Object? lastDeletedOn;

  /// Untyped: null in every record measured.
  final Object? lastInvoiceIssueDate;

  final String? lastInvoiceTotal;

  /// Untyped: null in every record measured.
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

/// A [PurchaseOrderUpdated]'s `created_by`.
class PurchaseOrderUpdatedCreatedBy extends Dto {
  const PurchaseOrderUpdatedCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderUpdatedCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderUpdatedCreatedBy(
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

/// A [PurchaseOrderUpdated]'s `last_updated_by`.
class PurchaseOrderUpdatedLastUpdatedBy extends Dto {
  const PurchaseOrderUpdatedLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderUpdatedLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderUpdatedLastUpdatedBy(
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

/// A [PurchaseOrderNoteView]'s `purchase_order`.
class PurchaseOrderNoteViewPurchaseOrder extends Dto {
  const PurchaseOrderNoteViewPurchaseOrder({
    this.href,
    this.id,
    this.object,
  });

  static PurchaseOrderNoteViewPurchaseOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderNoteViewPurchaseOrder(
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

/// One entry of a [PurchaseOrderNoteView]'s `attachments`.
class PurchaseOrderNoteViewAttachment extends Dto {
  const PurchaseOrderNoteViewAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PurchaseOrderNoteViewAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderNoteViewAttachment(
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

/// One entry of a [PurchaseOrderNoteView]'s `watchers`.
class PurchaseOrderNoteViewWatcher extends Dto {
  const PurchaseOrderNoteViewWatcher({
    this.email,
    this.name,
    this.type,
  });

  static PurchaseOrderNoteViewWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderNoteViewWatcher(
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

/// A [PurchaseOrderNoteView]'s `created_by`.
class PurchaseOrderNoteViewCreatedBy extends Dto {
  const PurchaseOrderNoteViewCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderNoteViewCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderNoteViewCreatedBy(
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

/// One entry of a [PurchaseOrderNoteFileList]'s `data`.
class PurchaseOrderNoteFileEntry extends Dto {
  const PurchaseOrderNoteFileEntry({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PurchaseOrderNoteFileEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderNoteFileEntry(
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

/// A [PurchaseOrderLine]'s `item`.
class PurchaseOrderLineItem extends Dto {
  const PurchaseOrderLineItem({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineItem(
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

/// A [PurchaseOrderLine]'s `uom`.
class PurchaseOrderLineUom extends Dto {
  const PurchaseOrderLineUom({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderLineUom? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineUom(
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

/// A [PurchaseOrderLine]'s `warehouse`.
class PurchaseOrderLineWarehouse extends Dto {
  const PurchaseOrderLineWarehouse({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderLineWarehouse? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineWarehouse(
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

/// A [PurchaseOrderLine]'s `tax`.
class PurchaseOrderLineTax extends Dto {
  const PurchaseOrderLineTax({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderLineTax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineTax(
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

/// A [PurchaseOrderLine]'s `item_price_snapshot`.
class PurchaseOrderLineItemPriceSnapshot extends Dto {
  const PurchaseOrderLineItemPriceSnapshot({
    this.pricingRule,
  });

  static PurchaseOrderLineItemPriceSnapshot? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineItemPriceSnapshot(
      pricingRule: PurchaseOrderLineItemPriceSnapshotPricingRule.fromMap(
          source['pricing_rule']),
    );
  }

  final PurchaseOrderLineItemPriceSnapshotPricingRule? pricingRule;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'pricing_rule': pricingRule,
      };
}

/// A [PurchaseOrderLine]'s `item_price_tax`.
class PurchaseOrderLineItemPriceTax extends Dto {
  const PurchaseOrderLineItemPriceTax({
    this.href,
    this.id,
    this.name,
    this.object,
    this.rate,
  });

  static PurchaseOrderLineItemPriceTax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineItemPriceTax(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      rate: readDecimal(source['rate']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final double? rate;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'rate': rate,
      };
}

/// A [PurchaseOrderLine]'s `item_purchase_tax_configuration`.
class PurchaseOrderLineItemPurchaseTaxConfiguration extends Dto {
  const PurchaseOrderLineItemPurchaseTaxConfiguration({
    this.purchasePriceIsTaxInclusive,
    this.taxCode,
    this.taxExemptWhenPurchase,
  });

  static PurchaseOrderLineItemPurchaseTaxConfiguration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineItemPurchaseTaxConfiguration(
      purchasePriceIsTaxInclusive:
          readFlag(source['purchase_price_is_tax_inclusive']),
      taxCode: PurchaseOrderLineItemPurchaseTaxConfigurationTaxCode.fromMap(
          source['tax_code']),
      taxExemptWhenPurchase: readFlag(source['tax_exempt_when_purchase']),
    );
  }

  final bool? purchasePriceIsTaxInclusive;

  final PurchaseOrderLineItemPurchaseTaxConfigurationTaxCode? taxCode;

  final bool? taxExemptWhenPurchase;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'purchase_price_is_tax_inclusive': purchasePriceIsTaxInclusive,
        'tax_code': taxCode,
        'tax_exempt_when_purchase': taxExemptWhenPurchase,
      };
}

/// A [PurchaseOrderLine]'s `item_accounting_code`.
class PurchaseOrderLineItemAccountingCode extends Dto {
  const PurchaseOrderLineItemAccountingCode({
    this.costOfGoodsSold,
  });

  static PurchaseOrderLineItemAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineItemAccountingCode(
      costOfGoodsSold: readText(source['cost_of_goods_sold']),
    );
  }

  final String? costOfGoodsSold;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'cost_of_goods_sold': costOfGoodsSold,
      };
}

/// A [PurchaseOrderLine]'s `item_purchase_accounting_code`.
class PurchaseOrderLineItemPurchaseAccountingCode extends Dto {
  const PurchaseOrderLineItemPurchaseAccountingCode({
    this.costOfGoodsSold,
  });

  static PurchaseOrderLineItemPurchaseAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineItemPurchaseAccountingCode(
      costOfGoodsSold: readText(source['cost_of_goods_sold']),
    );
  }

  final String? costOfGoodsSold;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'cost_of_goods_sold': costOfGoodsSold,
      };
}

/// A [PurchaseOrder]'s `account`.
class PurchaseOrderAccount extends Dto {
  const PurchaseOrderAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderAccount(
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

/// A [PurchaseOrder]'s `currency`.
class PurchaseOrderCurrency extends Dto {
  const PurchaseOrderCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderCurrency(
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

/// A [PurchaseOrder]'s `custom_form`.
class PurchaseOrderCustomForm extends Dto {
  const PurchaseOrderCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderCustomForm(
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

/// A [PurchaseOrder]'s `created_by`.
class PurchaseOrderCreatedBy extends Dto {
  const PurchaseOrderCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderCreatedBy(
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

/// A [PurchaseOrder]'s `last_updated_by`.
class PurchaseOrderLastUpdatedBy extends Dto {
  const PurchaseOrderLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLastUpdatedBy(
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

/// A [PurchaseOrderPurchaseInvoice]'s `currency`.
class PurchaseOrderPurchaseInvoiceCurrency extends Dto {
  const PurchaseOrderPurchaseInvoiceCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderPurchaseInvoiceCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoiceCurrency(
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

/// A [PurchaseOrderPurchaseInvoice]'s `account`.
class PurchaseOrderPurchaseInvoiceAccount extends Dto {
  const PurchaseOrderPurchaseInvoiceAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderPurchaseInvoiceAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoiceAccount(
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

/// A [PurchaseOrderPurchaseInvoice]'s `purchase_order`.
class PurchaseOrderPurchaseInvoicePurchaseOrder extends Dto {
  const PurchaseOrderPurchaseInvoicePurchaseOrder({
    this.href,
    this.id,
    this.object,
  });

  static PurchaseOrderPurchaseInvoicePurchaseOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoicePurchaseOrder(
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

/// A [PurchaseOrderPurchaseInvoice]'s `created_by`.
class PurchaseOrderPurchaseInvoiceCreatedBy extends Dto {
  const PurchaseOrderPurchaseInvoiceCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderPurchaseInvoiceCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoiceCreatedBy(
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

/// A [PurchaseOrderPurchaseInvoice]'s `last_updated_by`.
class PurchaseOrderPurchaseInvoiceLastUpdatedBy extends Dto {
  const PurchaseOrderPurchaseInvoiceLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderPurchaseInvoiceLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoiceLastUpdatedBy(
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

/// A [PurchaseOrderPurchasePayment]'s `account`.
class PurchaseOrderPurchasePaymentAccount extends Dto {
  const PurchaseOrderPurchasePaymentAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderPurchasePaymentAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchasePaymentAccount(
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

/// A [PurchaseOrderPurchasePayment]'s `currency`.
class PurchaseOrderPurchasePaymentCurrency extends Dto {
  const PurchaseOrderPurchasePaymentCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderPurchasePaymentCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchasePaymentCurrency(
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

/// One entry of a [PurchaseOrderPurchasePayment]'s `payment_method_applications`.
class PurchaseOrderPurchasePaymentPaymentMethodApplication extends Dto {
  const PurchaseOrderPurchasePaymentPaymentMethodApplication({
    this.amount,
    this.paymentMethod,
    this.paymentProcessor,
    this.reference,
  });

  static PurchaseOrderPurchasePaymentPaymentMethodApplication? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchasePaymentPaymentMethodApplication(
      amount: readText(source['amount']),
      paymentMethod:
          PurchaseOrderPurchasePaymentPaymentMethodApplicationPaymentMethod
              .fromMap(source['payment_method']),
      paymentProcessor:
          PurchaseOrderPurchasePaymentPaymentMethodApplicationPaymentProcessor
              .fromMap(source['payment_processor']),
      reference: readText(source['reference']),
    );
  }

  final String? amount;

  final PurchaseOrderPurchasePaymentPaymentMethodApplicationPaymentMethod?
      paymentMethod;

  final PurchaseOrderPurchasePaymentPaymentMethodApplicationPaymentProcessor?
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

/// One entry of a [PurchaseOrderPurchasePayment]'s `credit_note_applications`.
class PurchaseOrderPurchasePaymentCreditNoteApplication extends Dto {
  const PurchaseOrderPurchasePaymentCreditNoteApplication({
    this.amount,
    this.purchaseCreditNote,
  });

  static PurchaseOrderPurchasePaymentCreditNoteApplication? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchasePaymentCreditNoteApplication(
      amount: readText(source['amount']),
      purchaseCreditNote:
          PurchaseOrderPurchasePaymentCreditNoteApplicationPurchaseCreditNote
              .fromMap(source['purchase_credit_note']),
    );
  }

  final String? amount;

  final PurchaseOrderPurchasePaymentCreditNoteApplicationPurchaseCreditNote?
      purchaseCreditNote;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'purchase_credit_note': purchaseCreditNote,
      };
}

/// One entry of a [PurchaseOrderPurchasePayment]'s `purchase_invoice_applications`.
class PurchaseOrderPurchasePaymentPurchaseInvoiceApplication extends Dto {
  const PurchaseOrderPurchasePaymentPurchaseInvoiceApplication({
    this.applied,
    this.dueDate,
    this.issueDate,
    this.outstanding,
    this.purchaseInvoice,
    this.total,
  });

  static PurchaseOrderPurchasePaymentPurchaseInvoiceApplication? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchasePaymentPurchaseInvoiceApplication(
      applied: readText(source['applied']),
      dueDate: readText(source['due_date']),
      issueDate: readText(source['issue_date']),
      outstanding: readText(source['outstanding']),
      purchaseInvoice:
          PurchaseOrderPurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice
              .fromMap(source['purchase_invoice']),
      total: readText(source['total']),
    );
  }

  final String? applied;

  final String? dueDate;

  final String? issueDate;

  final String? outstanding;

  final PurchaseOrderPurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice?
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

/// A [PurchaseOrderPurchasePayment]'s `created_by`.
class PurchaseOrderPurchasePaymentCreatedBy extends Dto {
  const PurchaseOrderPurchasePaymentCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderPurchasePaymentCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchasePaymentCreatedBy(
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

/// A [PurchaseOrderPurchasePayment]'s `last_updated_by`.
class PurchaseOrderPurchasePaymentLastUpdatedBy extends Dto {
  const PurchaseOrderPurchasePaymentLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderPurchasePaymentLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchasePaymentLastUpdatedBy(
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

/// One entry of a [PurchaseOrdersNote]'s `watchers`.
class PurchaseOrdersNoteWatcher extends Dto {
  const PurchaseOrdersNoteWatcher({
    this.email,
    this.name,
    this.type,
  });

  static PurchaseOrdersNoteWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrdersNoteWatcher(
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

/// A [PurchaseOrdersNote]'s `created_by`.
class PurchaseOrdersNoteCreatedBy extends Dto {
  const PurchaseOrdersNoteCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrdersNoteCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrdersNoteCreatedBy(
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

/// A [PurchaseOrderPurchaseInvoices]'s `currency`.
class PurchaseOrderPurchaseInvoicesCurrency extends Dto {
  const PurchaseOrderPurchaseInvoicesCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderPurchaseInvoicesCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoicesCurrency(
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

/// A [PurchaseOrderPurchaseInvoices]'s `account`.
class PurchaseOrderPurchaseInvoicesAccount extends Dto {
  const PurchaseOrderPurchaseInvoicesAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderPurchaseInvoicesAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoicesAccount(
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

/// A [PurchaseOrderPurchaseInvoices]'s `purchase_order`.
class PurchaseOrderPurchaseInvoicesPurchaseOrder extends Dto {
  const PurchaseOrderPurchaseInvoicesPurchaseOrder({
    this.href,
    this.id,
    this.object,
  });

  static PurchaseOrderPurchaseInvoicesPurchaseOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoicesPurchaseOrder(
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

/// A [PurchaseOrderPurchaseInvoices]'s `created_by`.
class PurchaseOrderPurchaseInvoicesCreatedBy extends Dto {
  const PurchaseOrderPurchaseInvoicesCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderPurchaseInvoicesCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoicesCreatedBy(
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

/// One entry of a [PurchaseOrderPurchaseInvoices]'s `lines`.
class PurchaseOrderPurchaseInvoicesLine extends Dto {
  const PurchaseOrderPurchaseInvoicesLine({
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

  static PurchaseOrderPurchaseInvoicesLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoicesLine(
      accountingCode: readText(source['accounting_code']),
      id: readText(source['id']),
      item: PurchaseOrderPurchaseInvoicesLineItem.fromMap(source['item']),
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

  final PurchaseOrderPurchaseInvoicesLineItem? item;

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

/// A [PurchaseOrderPurchaseInvoices]'s `kpis`.
class PurchaseOrderPurchaseInvoicesKpis extends Dto {
  const PurchaseOrderPurchaseInvoicesKpis({
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

  static PurchaseOrderPurchaseInvoicesKpis? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoicesKpis(
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

/// A [AccountPurchaseOrdersData]'s `account`.
class AccountPurchaseOrdersDataAccount extends Dto {
  const AccountPurchaseOrdersDataAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountPurchaseOrdersDataAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseOrdersDataAccount(
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

/// A [AccountPurchaseOrdersData]'s `currency`.
class AccountPurchaseOrdersDataCurrency extends Dto {
  const AccountPurchaseOrdersDataCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountPurchaseOrdersDataCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseOrdersDataCurrency(
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

/// A [AccountPurchaseOrdersData]'s `custom_form`.
class AccountPurchaseOrdersDataCustomForm extends Dto {
  const AccountPurchaseOrdersDataCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountPurchaseOrdersDataCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseOrdersDataCustomForm(
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

/// A [AccountPurchaseOrdersData]'s `created_by`.
class AccountPurchaseOrdersDataCreatedBy extends Dto {
  const AccountPurchaseOrdersDataCreatedBy({
    this.name,
    this.object,
  });

  static AccountPurchaseOrdersDataCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseOrdersDataCreatedBy(
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

/// A [AccountPurchaseOrdersData]'s `last_updated_by`.
class AccountPurchaseOrdersDataLastUpdatedBy extends Dto {
  const AccountPurchaseOrdersDataLastUpdatedBy({
    this.name,
    this.object,
  });

  static AccountPurchaseOrdersDataLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseOrdersDataLastUpdatedBy(
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

/// A [PurchaseOrderLineReadItemPriceSnapshot]'s `pricing_rule`.
class PurchaseOrderLineReadItemPriceSnapshotPricingRule extends Dto {
  const PurchaseOrderLineReadItemPriceSnapshotPricingRule({
    this.price,
    this.priceType,
    this.pricingVersion,
    this.uom,
    this.uuid,
    this.version,
  });

  static PurchaseOrderLineReadItemPriceSnapshotPricingRule? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineReadItemPriceSnapshotPricingRule(
      price: readDecimal(source['price']),
      priceType: readText(source['price_type']),
      pricingVersion: readText(source['pricing_version']),
      uom: readText(source['uom']),
      uuid: readText(source['uuid']),
      version: readText(source['version']),
    );
  }

  final double? price;

  final String? priceType;

  final String? pricingVersion;

  final String? uom;

  final String? uuid;

  final String? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'price': price,
        'price_type': priceType,
        'pricing_version': pricingVersion,
        'uom': uom,
        'uuid': uuid,
        'version': version,
      };
}

/// A [PurchaseOrderLineReadItemPurchaseTaxConfiguration]'s `tax_code`.
class PurchaseOrderLineReadItemPurchaseTaxConfigurationTaxCode extends Dto {
  const PurchaseOrderLineReadItemPurchaseTaxConfigurationTaxCode({
    this.href,
    this.id,
    this.name,
    this.object,
    this.rate,
  });

  static PurchaseOrderLineReadItemPurchaseTaxConfigurationTaxCode? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineReadItemPurchaseTaxConfigurationTaxCode(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      rate: readText(source['rate']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? rate;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'rate': rate,
      };
}

/// A [PurchaseOrderNotesData]'s `purchase_order`.
class PurchaseOrderNotesDataPurchaseOrder extends Dto {
  const PurchaseOrderNotesDataPurchaseOrder({
    this.href,
    this.id,
    this.object,
  });

  static PurchaseOrderNotesDataPurchaseOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderNotesDataPurchaseOrder(
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

/// One entry of a [PurchaseOrderNotesData]'s `attachments`.
class PurchaseOrderNotesDataAttachment extends Dto {
  const PurchaseOrderNotesDataAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PurchaseOrderNotesDataAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderNotesDataAttachment(
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

/// One entry of a [PurchaseOrderNotesData]'s `watchers`.
class PurchaseOrderNotesDataWatcher extends Dto {
  const PurchaseOrderNotesDataWatcher({
    this.email,
    this.name,
    this.type,
  });

  static PurchaseOrderNotesDataWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderNotesDataWatcher(
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

/// A [PurchaseOrderNotesData]'s `created_by`.
class PurchaseOrderNotesDataCreatedBy extends Dto {
  const PurchaseOrderNotesDataCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseOrderNotesDataCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderNotesDataCreatedBy(
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

/// A [PurchaseOrderLineItemPriceSnapshot]'s `pricing_rule`.
class PurchaseOrderLineItemPriceSnapshotPricingRule extends Dto {
  const PurchaseOrderLineItemPriceSnapshotPricingRule({
    this.price,
    this.priceType,
    this.pricingVersion,
    this.uom,
    this.uuid,
    this.version,
  });

  static PurchaseOrderLineItemPriceSnapshotPricingRule? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineItemPriceSnapshotPricingRule(
      price: readDecimal(source['price']),
      priceType: readText(source['price_type']),
      pricingVersion: readText(source['pricing_version']),
      uom: readText(source['uom']),
      uuid: readText(source['uuid']),
      version: readText(source['version']),
    );
  }

  final double? price;

  final String? priceType;

  final String? pricingVersion;

  final String? uom;

  final String? uuid;

  final String? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'price': price,
        'price_type': priceType,
        'pricing_version': pricingVersion,
        'uom': uom,
        'uuid': uuid,
        'version': version,
      };
}

/// A [PurchaseOrderLineItemPurchaseTaxConfiguration]'s `tax_code`.
class PurchaseOrderLineItemPurchaseTaxConfigurationTaxCode extends Dto {
  const PurchaseOrderLineItemPurchaseTaxConfigurationTaxCode({
    this.href,
    this.id,
    this.name,
    this.object,
    this.rate,
  });

  static PurchaseOrderLineItemPurchaseTaxConfigurationTaxCode? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderLineItemPurchaseTaxConfigurationTaxCode(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      rate: readText(source['rate']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? rate;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'rate': rate,
      };
}

/// A [PurchaseOrderPurchasePaymentPaymentMethodApplication]'s `payment_method`.
class PurchaseOrderPurchasePaymentPaymentMethodApplicationPaymentMethod
    extends Dto {
  const PurchaseOrderPurchasePaymentPaymentMethodApplicationPaymentMethod({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderPurchasePaymentPaymentMethodApplicationPaymentMethod?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchasePaymentPaymentMethodApplicationPaymentMethod(
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

/// A [PurchaseOrderPurchasePaymentPaymentMethodApplication]'s `payment_processor`.
class PurchaseOrderPurchasePaymentPaymentMethodApplicationPaymentProcessor
    extends Dto {
  const PurchaseOrderPurchasePaymentPaymentMethodApplicationPaymentProcessor({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderPurchasePaymentPaymentMethodApplicationPaymentProcessor?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchasePaymentPaymentMethodApplicationPaymentProcessor(
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

/// A [PurchaseOrderPurchasePaymentCreditNoteApplication]'s `purchase_credit_note`.
class PurchaseOrderPurchasePaymentCreditNoteApplicationPurchaseCreditNote
    extends Dto {
  const PurchaseOrderPurchasePaymentCreditNoteApplicationPurchaseCreditNote({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static PurchaseOrderPurchasePaymentCreditNoteApplicationPurchaseCreditNote?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchasePaymentCreditNoteApplicationPurchaseCreditNote(
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

/// A [PurchaseOrderPurchasePaymentPurchaseInvoiceApplication]'s `purchase_invoice`.
class PurchaseOrderPurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice
    extends Dto {
  const PurchaseOrderPurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static PurchaseOrderPurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchasePaymentPurchaseInvoiceApplicationPurchaseInvoice(
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

/// A [PurchaseOrderPurchaseInvoicesLine]'s `item`.
class PurchaseOrderPurchaseInvoicesLineItem extends Dto {
  const PurchaseOrderPurchaseInvoicesLineItem({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseOrderPurchaseInvoicesLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseOrderPurchaseInvoicesLineItem(
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

/// What `getPurchaseOrderKpis` answers, under `purchase_order_kpis`: the block
/// a purchase order carries as `kpis`.
class PurchaseOrderKpis extends Dto {
  const PurchaseOrderKpis({
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

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_orders/{purchase_order_id}/kpis',
  ];

  static PurchaseOrderKpis? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_order_kpis');
    if (source == null) return null;
    return PurchaseOrderKpis(
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
  String? get envelopeKey => 'purchase_order_kpis';

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
