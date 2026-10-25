/// Typed views over the v4 quote orders bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// One page of a quote's invoices, under `data`.
class QuoteOrderInvoiceList extends Dto {
  const QuoteOrderInvoiceList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/quote_orders/{quote_order_id}/invoices',
  ];

  static QuoteOrderInvoiceList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return QuoteOrderInvoiceList(
      data: readList<QuoteOrderInvoice>(
          source['data'], QuoteOrderInvoice.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<QuoteOrderInvoice?>? data;

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

/// One entry of a [QuoteOrderInvoiceList]'s `data`.
class QuoteOrderInvoice extends Dto {
  const QuoteOrderInvoice({
    this.account,
    this.alternateBillingEndDate,
    this.alternateBillingStartDate,
    this.alternateDueDate,
    this.alternateIssueDate,
    this.billingEndDate,
    this.billingStartDate,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customForm,
    this.customerPurchaseOrderId,
    this.discountAmount,
    this.due,
    this.dueDate,
    this.id,
    this.invoiceNote,
    this.issueDate,
    this.lastPayment,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.order,
    this.origin,
    this.paid,
    this.paymentStatus,
    this.priceTaxInclusive,
    this.status,
    this.subtotal,
    this.tax,
    this.taxTotal,
    this.total,
    this.type,
    this.version,
  });

  static QuoteOrderInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return QuoteOrderInvoice(
      account: QuoteOrderInvoiceAccount.fromMap(source['account']),
      alternateBillingEndDate: readText(source['alternate_billing_end_date']),
      alternateBillingStartDate:
          readText(source['alternate_billing_start_date']),
      alternateDueDate: readText(source['alternate_due_date']),
      alternateIssueDate: readText(source['alternate_issue_date']),
      billingEndDate: readText(source['billing_end_date']),
      billingStartDate: readText(source['billing_start_date']),
      createdBy: QuoteOrderInvoiceCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: QuoteOrderInvoiceCurrency.fromMap(source['currency']),
      customForm: QuoteOrderInvoiceCustomForm.fromMap(source['custom_form']),
      customerPurchaseOrderId: readAny(source['customer_purchase_order_id']),
      discountAmount: readDecimal(source['discount_amount']),
      due: readText(source['due']),
      dueDate: readText(source['due_date']),
      id: readText(source['id']),
      invoiceNote: readAny(source['invoice_note']),
      issueDate: readText(source['issue_date']),
      lastPayment: readAny(source['last_payment']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      order: QuoteOrderInvoiceOrder.fromMap(source['order']),
      origin: readAny(source['origin']),
      paid: readText(source['paid']),
      paymentStatus: readText(source['payment_status']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      taxTotal: readText(source['tax_total']),
      total: readText(source['total']),
      type: readText(source['type']),
      version: readInteger(source['version']),
    );
  }

  final QuoteOrderInvoiceAccount? account;

  final String? alternateBillingEndDate;

  final String? alternateBillingStartDate;

  final String? alternateDueDate;

  final String? alternateIssueDate;

  final String? billingEndDate;

  final String? billingStartDate;

  final QuoteOrderInvoiceCreatedBy? createdBy;

  final String? createdOn;

  final QuoteOrderInvoiceCurrency? currency;

  final QuoteOrderInvoiceCustomForm? customForm;

  /// Null in every record measured, so untyped.
  final Object? customerPurchaseOrderId;

  final double? discountAmount;

  final String? due;

  final String? dueDate;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? invoiceNote;

  final String? issueDate;

  /// Null in every record measured, so untyped.
  final Object? lastPayment;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedOn;

  final String? object;

  final QuoteOrderInvoiceOrder? order;

  /// Null in every record measured, so untyped.
  final Object? origin;

  final String? paid;

  final String? paymentStatus;

  final bool? priceTaxInclusive;

  final String? status;

  final String? subtotal;

  final String? tax;

  final String? taxTotal;

  final String? total;

  final String? type;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'alternate_billing_end_date': alternateBillingEndDate,
        'alternate_billing_start_date': alternateBillingStartDate,
        'alternate_due_date': alternateDueDate,
        'alternate_issue_date': alternateIssueDate,
        'billing_end_date': billingEndDate,
        'billing_start_date': billingStartDate,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_form': customForm,
        'customer_purchase_order_id': customerPurchaseOrderId,
        'discount_amount': discountAmount,
        'due': due,
        'due_date': dueDate,
        'id': id,
        'invoice_note': invoiceNote,
        'issue_date': issueDate,
        'last_payment': lastPayment,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'order': order,
        'origin': origin,
        'paid': paid,
        'payment_status': paymentStatus,
        'price_tax_inclusive': priceTaxInclusive,
        'status': status,
        'subtotal': subtotal,
        'tax': tax,
        'tax_total': taxTotal,
        'total': total,
        'type': type,
        'version': version,
      };
}

/// A [QuoteOrderInvoice]'s `account`.
class QuoteOrderInvoiceAccount extends Dto {
  const QuoteOrderInvoiceAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static QuoteOrderInvoiceAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return QuoteOrderInvoiceAccount(
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

/// A [QuoteOrderInvoice]'s `created_by`.
class QuoteOrderInvoiceCreatedBy extends Dto {
  const QuoteOrderInvoiceCreatedBy({
    this.name,
    this.object,
  });

  static QuoteOrderInvoiceCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return QuoteOrderInvoiceCreatedBy(
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

/// A [QuoteOrderInvoice]'s `currency`.
class QuoteOrderInvoiceCurrency extends Dto {
  const QuoteOrderInvoiceCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static QuoteOrderInvoiceCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return QuoteOrderInvoiceCurrency(
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

/// A [QuoteOrderInvoice]'s `custom_form`.
class QuoteOrderInvoiceCustomForm extends Dto {
  const QuoteOrderInvoiceCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static QuoteOrderInvoiceCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return QuoteOrderInvoiceCustomForm(
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

/// A [QuoteOrderInvoice]'s `order`.
class QuoteOrderInvoiceOrder extends Dto {
  const QuoteOrderInvoiceOrder({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static QuoteOrderInvoiceOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return QuoteOrderInvoiceOrder(
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
