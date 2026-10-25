/// Typed views over the v4 orders bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The order body.
class Order extends Dto {
  const Order({
    this.account,
    this.allowContract,
    this.billingAddress,
    this.billingPreferences,
    this.billingStartDate,
    this.billingStartDayOfMonth,
    this.communicationPreferences,
    this.contractProperties,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customForm,
    this.customerPurchaseOrderId,
    this.description,
    this.discountProfile,
    this.displayName,
    this.id,
    this.invoiceNote,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.manager,
    this.name,
    this.nextBillingFromDate,
    this.nextBillingFromDateUtc,
    this.object,
    this.orderStartDate,
    this.orderType,
    this.origin,
    this.originalTotal,
    this.preOrder,
    this.priceTaxInclusive,
    this.quoteConverted,
    this.quoteOrder,
    this.referralAccount,
    this.salesRep,
    this.shippingAddress,
    this.shippingCost,
    this.shippingProfile,
    this.status,
    this.timeZone,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders',
  ];

  static Order? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return Order(
      account: OrderAccount.fromMap(source['account']),
      allowContract: readFlag(source['allow_contract']),
      billingAddress: OrderBillingAddress.fromMap(source['billing_address']),
      billingPreferences:
          OrderBillingPreferencesEntry.fromMap(source['billing_preferences']),
      billingStartDate: readText(source['billing_start_date']),
      billingStartDayOfMonth: readText(source['billing_start_day_of_month']),
      communicationPreferences: readList<OrderCommunicationPreference>(
          source['communication_preferences'],
          OrderCommunicationPreference.fromMap),
      contractProperties:
          OrderContractProperties.fromMap(source['contract_properties']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: OrderCurrency.fromMap(source['currency']),
      customForm: OrderCustomForm.fromMap(source['custom_form']),
      customerPurchaseOrderId: readText(source['customer_purchase_order_id']),
      description: readText(source['description']),
      discountProfile: OrderDiscountProfile.fromMap(source['discount_profile']),
      displayName: readText(source['display_name']),
      id: readText(source['id']),
      invoiceNote: readText(source['invoice_note']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      manager: OrderManager.fromMap(source['manager']),
      name: readText(source['name']),
      nextBillingFromDate: readText(source['next_billing_from_date']),
      nextBillingFromDateUtc: readText(source['next_billing_from_date_utc']),
      object: readText(source['object']),
      orderStartDate: readText(source['order_start_date']),
      orderType: readText(source['order_type']),
      origin: readText(source['origin']),
      originalTotal: readText(source['original_total']),
      preOrder: readFlag(source['pre_order']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      quoteConverted: readFlag(source['quote_converted']),
      quoteOrder: readFlag(source['quote_order']),
      referralAccount: OrderReferralAccount.fromMap(source['referral_account']),
      salesRep: OrderSalesRep.fromMap(source['sales_rep']),
      shippingAddress: OrderShippingAddress.fromMap(source['shipping_address']),
      shippingCost: readDecimal(source['shipping_cost']),
      shippingProfile: OrderShippingProfile.fromMap(source['shipping_profile']),
      status: readText(source['status']),
      timeZone: OrderTimeZone.fromMap(source['time_zone']),
      version: readInteger(source['version']),
    );
  }

  final OrderAccount? account;

  final bool? allowContract;

  final OrderBillingAddress? billingAddress;

  final OrderBillingPreferencesEntry? billingPreferences;

  final String? billingStartDate;

  final String? billingStartDayOfMonth;

  final List<OrderCommunicationPreference?>? communicationPreferences;

  final OrderContractProperties? contractProperties;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final OrderCurrency? currency;

  final OrderCustomForm? customForm;

  final String? customerPurchaseOrderId;

  final String? description;

  final OrderDiscountProfile? discountProfile;

  final String? displayName;

  final String? id;

  final String? invoiceNote;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final OrderManager? manager;

  final String? name;

  final String? nextBillingFromDate;

  final String? nextBillingFromDateUtc;

  final String? object;

  final String? orderStartDate;

  final String? orderType;

  final String? origin;

  final String? originalTotal;

  final bool? preOrder;

  final bool? priceTaxInclusive;

  final bool? quoteConverted;

  final bool? quoteOrder;

  final OrderReferralAccount? referralAccount;

  final OrderSalesRep? salesRep;

  final OrderShippingAddress? shippingAddress;

  final double? shippingCost;

  final OrderShippingProfile? shippingProfile;

  final String? status;

  final OrderTimeZone? timeZone;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'allow_contract': allowContract,
        'billing_address': billingAddress,
        'billing_preferences': billingPreferences,
        'billing_start_date': billingStartDate,
        'billing_start_day_of_month': billingStartDayOfMonth,
        'communication_preferences': communicationPreferences,
        'contract_properties': contractProperties,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_form': customForm,
        'customer_purchase_order_id': customerPurchaseOrderId,
        'description': description,
        'discount_profile': discountProfile,
        'display_name': displayName,
        'id': id,
        'invoice_note': invoiceNote,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'manager': manager,
        'name': name,
        'next_billing_from_date': nextBillingFromDate,
        'next_billing_from_date_utc': nextBillingFromDateUtc,
        'object': object,
        'order_start_date': orderStartDate,
        'order_type': orderType,
        'origin': origin,
        'original_total': originalTotal,
        'pre_order': preOrder,
        'price_tax_inclusive': priceTaxInclusive,
        'quote_converted': quoteConverted,
        'quote_order': quoteOrder,
        'referral_account': referralAccount,
        'sales_rep': salesRep,
        'shipping_address': shippingAddress,
        'shipping_cost': shippingCost,
        'shipping_profile': shippingProfile,
        'status': status,
        'time_zone': timeZone,
        'version': version,
      };
}

/// A page of Order records.
class OrderList extends Dto {
  const OrderList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders',
  ];

  static OrderList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderList(
      data: readList<Order>(source['data'], Order.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Order?>? data;

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

/// The order note body.
class OrderNote extends Dto {
  const OrderNote({
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
    this.order,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/notes',
  ];

  static OrderNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderNote(
      attachments: readList<OrderNoteAttachment>(
          source['attachments'], OrderNoteAttachment.fromMap),
      content: readText(source['content']),
      createdBy: OrderNoteCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: OrderNoteLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      order: OrderNoteOrder.fromMap(source['order']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<OrderNoteWatcher>(
          source['watchers'], OrderNoteWatcher.fromMap),
    );
  }

  final List<OrderNoteAttachment?>? attachments;

  final String? content;

  final OrderNoteCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped: never populated in the records measured.
  final Object? group;

  final String? href;

  final String? id;

  final OrderNoteLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final OrderNoteOrder? order;

  /// Untyped: never populated in the records measured.
  final Object? user;

  final int? version;

  final List<OrderNoteWatcher?>? watchers;

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
        'order': order,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// A page of OrderNote records.
class OrderNoteList extends Dto {
  const OrderNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/notes',
  ];

  static OrderNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderNoteList(
      data: readList<OrderNote>(source['data'], OrderNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<OrderNote?>? data;

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

/// The order read body.
class OrderRead extends Dto {
  const OrderRead({
    this.account,
    this.activityLogs,
    this.allowContract,
    this.billingAddress,
    this.billingPreferences,
    this.billingStartDate,
    this.billingStartDayOfMonth,
    this.communicationPreferences,
    this.contractProperties,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customAttributes,
    this.customForm,
    this.customerPurchaseOrderId,
    this.description,
    this.discountProfile,
    this.displayName,
    this.id,
    this.invoiceNote,
    this.kpis,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.lines,
    this.manager,
    this.name,
    this.nextBillingFromDate,
    this.nextBillingFromDateUtc,
    this.object,
    this.orderStartDate,
    this.orderType,
    this.origin,
    this.originalTotal,
    this.preOrder,
    this.priceTaxInclusive,
    this.quoteConverted,
    this.quoteOrder,
    this.referralAccount,
    this.salesRep,
    this.shippingAddress,
    this.shippingCost,
    this.shippingLineItems,
    this.shippingProfile,
    this.status,
    this.subtotal,
    this.tax,
    this.timeZone,
    this.total,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}',
    'POST /api/{api_version}/orders',
    'POST /api/{api_version}/orders/{order_id}/activate_draft',
    'PATCH /api/{api_version}/orders/{order_id}/billing_preferences',
    'PUT /api/{api_version}/orders/{order_id}/billing_preferences',
    'POST /api/{api_version}/orders/{order_id}/cancel',
    'POST /api/{api_version}/orders/{order_id}/change',
    'POST /api/{api_version}/orders/{order_id}/convert_to_order',
    'PATCH /api/{api_version}/orders/{order_id}/information',
    'POST /api/{api_version}/orders/{order_id}/reactivate',
    'POST /api/{api_version}/orders/{order_id}/relinquish',
    'PATCH /api/{api_version}/orders/{order_id}/lines/{line_uuid}',
    'PATCH /api/{api_version}/orders/{order_id}/lines/{line_uuid}/billing_preferences',
    'PUT /api/{api_version}/orders/{order_id}/lines/{line_uuid}/billing_preferences',
  ];

  static OrderRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return OrderRead(
      account: OrderReadAccount.fromMap(source['account']),
      activityLogs: readList<OrderReadActivityLog>(
          source['activity_logs'], OrderReadActivityLog.fromMap),
      allowContract: readFlag(source['allow_contract']),
      billingAddress:
          OrderReadBillingAddress.fromMap(source['billing_address']),
      billingPreferences:
          OrderReadBillingPreferences.fromMap(source['billing_preferences']),
      billingStartDate: readText(source['billing_start_date']),
      billingStartDayOfMonth: readText(source['billing_start_day_of_month']),
      communicationPreferences: readList<OrderReadCommunicationPreference>(
          source['communication_preferences'],
          OrderReadCommunicationPreference.fromMap),
      contractProperties:
          OrderReadContractProperties.fromMap(source['contract_properties']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: OrderReadCurrency.fromMap(source['currency']),
      customAttributes: readList<OrderReadCustomAttribute>(
          source['custom_attributes'], OrderReadCustomAttribute.fromMap),
      customForm: OrderReadCustomForm.fromMap(source['custom_form']),
      customerPurchaseOrderId: readText(source['customer_purchase_order_id']),
      description: readText(source['description']),
      discountProfile:
          OrderReadDiscountProfile.fromMap(source['discount_profile']),
      displayName: readText(source['display_name']),
      id: readText(source['id']),
      invoiceNote: readText(source['invoice_note']),
      kpis: OrderReadKpis.fromMap(source['kpis']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lines: readList<OrderReadLine>(source['lines'], OrderReadLine.fromMap),
      manager: OrderReadManager.fromMap(source['manager']),
      name: readText(source['name']),
      nextBillingFromDate: readText(source['next_billing_from_date']),
      nextBillingFromDateUtc: readText(source['next_billing_from_date_utc']),
      object: readText(source['object']),
      orderStartDate: readText(source['order_start_date']),
      orderType: readText(source['order_type']),
      origin: readText(source['origin']),
      originalTotal: readText(source['original_total']),
      preOrder: readFlag(source['pre_order']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      quoteConverted: readFlag(source['quote_converted']),
      quoteOrder: readFlag(source['quote_order']),
      referralAccount: readAny(source['referral_account']),
      salesRep: readAny(source['sales_rep']),
      shippingAddress:
          OrderReadShippingAddress.fromMap(source['shipping_address']),
      shippingCost: readDecimal(source['shipping_cost']),
      shippingLineItems:
          readList<Object>(source['shipping_line_items'], readAny),
      shippingProfile: readAny(source['shipping_profile']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      timeZone: OrderReadTimeZone.fromMap(source['time_zone']),
      total: readText(source['total']),
      version: readInteger(source['version']),
    );
  }

  final OrderReadAccount? account;

  final List<OrderReadActivityLog?>? activityLogs;

  final bool? allowContract;

  final OrderReadBillingAddress? billingAddress;

  final OrderReadBillingPreferences? billingPreferences;

  final String? billingStartDate;

  final String? billingStartDayOfMonth;

  final List<OrderReadCommunicationPreference?>? communicationPreferences;

  /// Sent for a contract order, on the create answer and on `getOrder`.
  final OrderReadContractProperties? contractProperties;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final OrderReadCurrency? currency;

  final List<OrderReadCustomAttribute?>? customAttributes;

  final OrderReadCustomForm? customForm;

  final String? customerPurchaseOrderId;

  final String? description;

  final OrderReadDiscountProfile? discountProfile;

  final String? displayName;

  final String? id;

  final String? invoiceNote;

  final OrderReadKpis? kpis;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final List<OrderReadLine?>? lines;

  final OrderReadManager? manager;

  final String? name;

  final String? nextBillingFromDate;

  final String? nextBillingFromDateUtc;

  final String? object;

  final String? orderStartDate;

  final String? orderType;

  final String? origin;

  final String? originalTotal;

  final bool? preOrder;

  final bool? priceTaxInclusive;

  final bool? quoteConverted;

  final bool? quoteOrder;

  /// Untyped: never populated in the records measured.
  final Object? referralAccount;

  /// Untyped: never populated in the records measured.
  final Object? salesRep;

  final OrderReadShippingAddress? shippingAddress;

  final double? shippingCost;

  final List<Object?>? shippingLineItems;

  /// Untyped: never populated in the records measured.
  final Object? shippingProfile;

  final String? status;

  final String? subtotal;

  final String? tax;

  final OrderReadTimeZone? timeZone;

  final String? total;

  final int? version;

  @override
  String? get envelopeKey => 'order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'activity_logs': activityLogs,
        'allow_contract': allowContract,
        'billing_address': billingAddress,
        'billing_preferences': billingPreferences,
        'billing_start_date': billingStartDate,
        'billing_start_day_of_month': billingStartDayOfMonth,
        'communication_preferences': communicationPreferences,
        'contract_properties': contractProperties,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_attributes': customAttributes,
        'custom_form': customForm,
        'customer_purchase_order_id': customerPurchaseOrderId,
        'description': description,
        'discount_profile': discountProfile,
        'display_name': displayName,
        'id': id,
        'invoice_note': invoiceNote,
        'kpis': kpis,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'lines': lines,
        'manager': manager,
        'name': name,
        'next_billing_from_date': nextBillingFromDate,
        'next_billing_from_date_utc': nextBillingFromDateUtc,
        'object': object,
        'order_start_date': orderStartDate,
        'order_type': orderType,
        'origin': origin,
        'original_total': originalTotal,
        'pre_order': preOrder,
        'price_tax_inclusive': priceTaxInclusive,
        'quote_converted': quoteConverted,
        'quote_order': quoteOrder,
        'referral_account': referralAccount,
        'sales_rep': salesRep,
        'shipping_address': shippingAddress,
        'shipping_cost': shippingCost,
        'shipping_line_items': shippingLineItems,
        'shipping_profile': shippingProfile,
        'status': status,
        'subtotal': subtotal,
        'tax': tax,
        'time_zone': timeZone,
        'total': total,
        'version': version,
      };
}

/// The order information body.
class OrderInformation extends Dto {
  const OrderInformation({
    this.account,
    this.allowContract,
    this.billingAddress,
    this.billingStartDate,
    this.billingStartDayOfMonth,
    this.communicationPreferences,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customForm,
    this.customerPurchaseOrderId,
    this.description,
    this.discountProfile,
    this.displayName,
    this.id,
    this.invoiceNote,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.manager,
    this.name,
    this.nextBillingFromDate,
    this.nextBillingFromDateUtc,
    this.object,
    this.orderStartDate,
    this.orderType,
    this.origin,
    this.originalTotal,
    this.preOrder,
    this.priceTaxInclusive,
    this.quoteConverted,
    this.quoteOrder,
    this.referralAccount,
    this.salesRep,
    this.shippingAddress,
    this.shippingCost,
    this.shippingProfile,
    this.status,
    this.timeZone,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/information',
  ];

  static OrderInformation? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return OrderInformation(
      account: OrderInformationAccount.fromMap(source['account']),
      allowContract: readFlag(source['allow_contract']),
      billingAddress:
          OrderInformationBillingAddress.fromMap(source['billing_address']),
      billingStartDate: readText(source['billing_start_date']),
      billingStartDayOfMonth: readText(source['billing_start_day_of_month']),
      communicationPreferences:
          readList<OrderInformationCommunicationPreference>(
              source['communication_preferences'],
              OrderInformationCommunicationPreference.fromMap),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: OrderInformationCurrency.fromMap(source['currency']),
      customForm: OrderInformationCustomForm.fromMap(source['custom_form']),
      customerPurchaseOrderId: readAny(source['customer_purchase_order_id']),
      description: readText(source['description']),
      discountProfile:
          OrderInformationDiscountProfile.fromMap(source['discount_profile']),
      displayName: readText(source['display_name']),
      id: readText(source['id']),
      invoiceNote: readText(source['invoice_note']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      manager: OrderInformationManager.fromMap(source['manager']),
      name: readText(source['name']),
      nextBillingFromDate: readText(source['next_billing_from_date']),
      nextBillingFromDateUtc: readText(source['next_billing_from_date_utc']),
      object: readText(source['object']),
      orderStartDate: readText(source['order_start_date']),
      orderType: readText(source['order_type']),
      origin: readText(source['origin']),
      originalTotal: readText(source['original_total']),
      preOrder: readFlag(source['pre_order']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      quoteConverted: readFlag(source['quote_converted']),
      quoteOrder: readFlag(source['quote_order']),
      referralAccount: readAny(source['referral_account']),
      salesRep: readAny(source['sales_rep']),
      shippingAddress:
          OrderInformationShippingAddress.fromMap(source['shipping_address']),
      shippingCost: readDecimal(source['shipping_cost']),
      shippingProfile: readAny(source['shipping_profile']),
      status: readText(source['status']),
      timeZone: OrderInformationTimeZone.fromMap(source['time_zone']),
      version: readInteger(source['version']),
    );
  }

  final OrderInformationAccount? account;

  final bool? allowContract;

  final OrderInformationBillingAddress? billingAddress;

  final String? billingStartDate;

  final String? billingStartDayOfMonth;

  final List<OrderInformationCommunicationPreference?>?
      communicationPreferences;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final OrderInformationCurrency? currency;

  final OrderInformationCustomForm? customForm;

  /// Untyped: never populated in the records measured.
  final Object? customerPurchaseOrderId;

  final String? description;

  final OrderInformationDiscountProfile? discountProfile;

  final String? displayName;

  final String? id;

  final String? invoiceNote;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final OrderInformationManager? manager;

  final String? name;

  final String? nextBillingFromDate;

  final String? nextBillingFromDateUtc;

  final String? object;

  final String? orderStartDate;

  final String? orderType;

  final String? origin;

  final String? originalTotal;

  final bool? preOrder;

  final bool? priceTaxInclusive;

  final bool? quoteConverted;

  final bool? quoteOrder;

  /// Untyped: never populated in the records measured.
  final Object? referralAccount;

  /// Untyped: never populated in the records measured.
  final Object? salesRep;

  final OrderInformationShippingAddress? shippingAddress;

  final double? shippingCost;

  /// Untyped: never populated in the records measured.
  final Object? shippingProfile;

  final String? status;

  final OrderInformationTimeZone? timeZone;

  final int? version;

  @override
  String? get envelopeKey => 'order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'allow_contract': allowContract,
        'billing_address': billingAddress,
        'billing_start_date': billingStartDate,
        'billing_start_day_of_month': billingStartDayOfMonth,
        'communication_preferences': communicationPreferences,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_form': customForm,
        'customer_purchase_order_id': customerPurchaseOrderId,
        'description': description,
        'discount_profile': discountProfile,
        'display_name': displayName,
        'id': id,
        'invoice_note': invoiceNote,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'manager': manager,
        'name': name,
        'next_billing_from_date': nextBillingFromDate,
        'next_billing_from_date_utc': nextBillingFromDateUtc,
        'object': object,
        'order_start_date': orderStartDate,
        'order_type': orderType,
        'origin': origin,
        'original_total': originalTotal,
        'pre_order': preOrder,
        'price_tax_inclusive': priceTaxInclusive,
        'quote_converted': quoteConverted,
        'quote_order': quoteOrder,
        'referral_account': referralAccount,
        'sales_rep': salesRep,
        'shipping_address': shippingAddress,
        'shipping_cost': shippingCost,
        'shipping_profile': shippingProfile,
        'status': status,
        'time_zone': timeZone,
        'version': version,
      };
}

/// The account orders body.
class AccountOrders extends Dto {
  const AccountOrders({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/orders',
    'GET /api/{api_version}/orders/{order_id}/custom_objects',
    'GET /api/{api_version}/orders/{order_id}/custom_objects_instances',
    'GET /api/{api_version}/orders/{order_id}/item_fulfillments',
  ];

  static AccountOrders? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountOrders(
      data: readList<AccountOrdersData>(
          source['data'], AccountOrdersData.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<AccountOrdersData?>? data;

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

/// The order billing preferences body.
class OrderBillingPreferences extends Dto {
  const OrderBillingPreferences({
    this.billingPreferences,
    this.object,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/billing_preferences',
  ];

  static OrderBillingPreferences? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return OrderBillingPreferences(
      billingPreferences: OrderBillingPreferencesBillingPreferences.fromMap(
          source['billing_preferences']),
      object: readText(source['object']),
    );
  }

  final OrderBillingPreferencesBillingPreferences? billingPreferences;

  final String? object;

  @override
  String? get envelopeKey => 'order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'billing_preferences': billingPreferences,
        'object': object,
      };
}

/// What `getOrderLines` answers, under `order`.
class OrderLines extends Dto {
  const OrderLines({
    this.lines,
    this.object,
    this.shippingLineItems,
    this.subtotal,
    this.tax,
    this.total,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/lines',
  ];

  static OrderLines? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return OrderLines(
      lines: readList<OrderLinesLine>(source['lines'], OrderLinesLine.fromMap),
      object: readText(source['object']),
      shippingLineItems:
          readList<Object>(source['shipping_line_items'], readAny),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      total: readText(source['total']),
    );
  }

  final List<OrderLinesLine?>? lines;

  final String? object;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? shippingLineItems;

  final String? subtotal;

  final String? tax;

  final String? total;

  @override
  String? get envelopeKey => 'order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'lines': lines,
        'object': object,
        'shipping_line_items': shippingLineItems,
        'subtotal': subtotal,
        'tax': tax,
        'total': total,
      };
}

/// What `getOrderPaymentMethods` answers, under `order`.
class OrderPaymentMethods extends Dto {
  const OrderPaymentMethods({
    this.paymentMethods,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/payment_methods',
  ];

  static OrderPaymentMethods? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return OrderPaymentMethods(
      paymentMethods: readList<OrderPaymentMethodsPaymentMethod>(
          source['payment_methods'], OrderPaymentMethodsPaymentMethod.fromMap),
    );
  }

  final List<OrderPaymentMethodsPaymentMethod?>? paymentMethods;

  @override
  String? get envelopeKey => 'order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'payment_methods': paymentMethods,
      };
}

/// What `getOrderPdf` answers, under `order`.
class OrderPdf extends Dto {
  const OrderPdf({
    this.pdf,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/pdf',
  ];

  static OrderPdf? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return OrderPdf(
      pdf: OrderPdfPdf.fromMap(source['pdf']),
    );
  }

  final OrderPdfPdf? pdf;

  @override
  String? get envelopeKey => 'order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'pdf': pdf,
      };
}

/// What `getOrderLine` answers, under `order_line`.
class OrderLine extends Dto {
  const OrderLine({
    this.chargeItemUuid,
    this.expectedDeliveryDate,
    this.id,
    this.item,
    this.itemAccountingCode,
    this.itemChargeType,
    this.itemCustomAttributes,
    this.itemDescription,
    this.itemInvoiceNote,
    this.itemOrderQuantity,
    this.itemPriceSnapshot,
    this.itemPriceTax,
    this.itemProperties,
    this.itemSaleTaxConfiguration,
    this.itemType,
    this.object,
    this.preOrderStockDetails,
    this.shippingCost,
    this.subtotal,
    this.tax,
    this.taxExemptWhenSold,
    this.total,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/lines/{line_uuid}',
  ];

  static OrderLine? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order_line');
    if (source == null) return null;
    return OrderLine(
      chargeItemUuid: readText(source['charge_item_uuid']),
      expectedDeliveryDate: readText(source['expected_delivery_date']),
      id: readText(source['id']),
      item: OrderLineItem.fromMap(source['item']),
      itemAccountingCode:
          OrderLineItemAccountingCode.fromMap(source['item_accounting_code']),
      itemChargeType: readText(source['item_charge_type']),
      itemCustomAttributes:
          readList<Object>(source['item_custom_attributes'], readAny),
      itemDescription: readText(source['item_description']),
      itemInvoiceNote: readText(source['item_invoice_note']),
      itemOrderQuantity: readInteger(source['item_order_quantity']),
      itemPriceSnapshot:
          OrderLineItemPriceSnapshot.fromMap(source['item_price_snapshot']),
      itemPriceTax: OrderLineItemPriceTax.fromMap(source['item_price_tax']),
      itemProperties:
          OrderLineItemProperties.fromMap(source['item_properties']),
      itemSaleTaxConfiguration: OrderLineItemSaleTaxConfiguration.fromMap(
          source['item_sale_tax_configuration']),
      itemType: readText(source['item_type']),
      object: readText(source['object']),
      preOrderStockDetails: OrderLinePreOrderStockDetails.fromMap(
          source['pre_order_stock_details']),
      shippingCost: readDecimal(source['shipping_cost']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      taxExemptWhenSold: readFlag(source['tax_exempt_when_sold']),
      total: readText(source['total']),
      version: readInteger(source['version']),
    );
  }

  final String? chargeItemUuid;

  final String? expectedDeliveryDate;

  final String? id;

  final OrderLineItem? item;

  final OrderLineItemAccountingCode? itemAccountingCode;

  final String? itemChargeType;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? itemCustomAttributes;

  final String? itemDescription;

  final String? itemInvoiceNote;

  final int? itemOrderQuantity;

  final OrderLineItemPriceSnapshot? itemPriceSnapshot;

  final OrderLineItemPriceTax? itemPriceTax;

  final OrderLineItemProperties? itemProperties;

  final OrderLineItemSaleTaxConfiguration? itemSaleTaxConfiguration;

  final String? itemType;

  final String? object;

  final OrderLinePreOrderStockDetails? preOrderStockDetails;

  final double? shippingCost;

  final String? subtotal;

  final String? tax;

  final bool? taxExemptWhenSold;

  final String? total;

  final int? version;

  @override
  String? get envelopeKey => 'order_line';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'charge_item_uuid': chargeItemUuid,
        'expected_delivery_date': expectedDeliveryDate,
        'id': id,
        'item': item,
        'item_accounting_code': itemAccountingCode,
        'item_charge_type': itemChargeType,
        'item_custom_attributes': itemCustomAttributes,
        'item_description': itemDescription,
        'item_invoice_note': itemInvoiceNote,
        'item_order_quantity': itemOrderQuantity,
        'item_price_snapshot': itemPriceSnapshot,
        'item_price_tax': itemPriceTax,
        'item_properties': itemProperties,
        'item_sale_tax_configuration': itemSaleTaxConfiguration,
        'item_type': itemType,
        'object': object,
        'pre_order_stock_details': preOrderStockDetails,
        'shipping_cost': shippingCost,
        'subtotal': subtotal,
        'tax': tax,
        'tax_exempt_when_sold': taxExemptWhenSold,
        'total': total,
        'version': version,
      };
}

/// What `getOrderNote` answers, under `note`.
class OrderNoteView extends Dto {
  const OrderNoteView({
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
    this.order,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/notes/{order_note_id}',
    'POST /api/{api_version}/orders/{order_id}/notes',
    'PATCH /api/{api_version}/orders/{order_id}/notes/{order_note_id}',
  ];

  static OrderNoteView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return OrderNoteView(
      attachments: readList<OrderNoteViewAttachment>(
          source['attachments'], OrderNoteViewAttachment.fromMap),
      content: readText(source['content']),
      createdBy: OrderNoteViewCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy:
          OrderNoteViewLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      order: OrderNoteViewOrder.fromMap(source['order']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<OrderNoteViewWatcher>(
          source['watchers'], OrderNoteViewWatcher.fromMap),
    );
  }

  final List<OrderNoteViewAttachment?>? attachments;

  final String? content;

  final OrderNoteViewCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? group;

  final String? href;

  final String? id;

  final OrderNoteViewLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final OrderNoteViewOrder? order;

  /// Untyped: null in every record measured.
  final Object? user;

  final int? version;

  final List<OrderNoteViewWatcher?>? watchers;

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
        'order': order,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// What `getOrderPaymentMethod` answers, under `order`.
class OrderPaymentMethod extends Dto {
  const OrderPaymentMethod({
    this.paymentMethod,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/payment_methods/{payment_method_ref}',
  ];

  static OrderPaymentMethod? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return OrderPaymentMethod(
      paymentMethod:
          OrderPaymentMethodPaymentMethod.fromMap(source['payment_method']),
    );
  }

  final OrderPaymentMethodPaymentMethod? paymentMethod;

  @override
  String? get envelopeKey => 'order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'payment_method': paymentMethod,
      };
}

/// One page of what `getOrderNoteFiles` lists, under `data`.
class OrderNoteFileList extends Dto {
  const OrderNoteFileList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/notes/{order_note_id}/files',
  ];

  static OrderNoteFileList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderNoteFileList(
      data: readList<OrderNoteFileEntry>(
          source['data'], OrderNoteFileEntry.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<OrderNoteFileEntry?>? data;

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

/// What `getOrderNoteFile` answers, under `file`.
class OrderNoteFile extends Dto {
  const OrderNoteFile({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/notes/{order_note_id}/files/{order_file_id}',
  ];

  static OrderNoteFile? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'file');
    if (source == null) return null;
    return OrderNoteFile(
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

/// What `createOrderDiscardDraft` answers, under `order`.
class OrderDiscardDraft extends Dto {
  const OrderDiscardDraft({
    this.message,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/orders/{order_id}/discard_draft',
  ];

  static OrderDiscardDraft? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return OrderDiscardDraft(
      message: readText(source['message']),
    );
  }

  final String? message;

  @override
  String? get envelopeKey => 'order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'message': message,
      };
}

/// What `createOrderExtendTrial` answers, under `order`.
class OrderExtendTrial extends Dto {
  const OrderExtendTrial({
    this.message,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/orders/{order_id}/extend_trial',
  ];

  static OrderExtendTrial? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return OrderExtendTrial(
      message: readText(source['message']),
    );
  }

  final String? message;

  @override
  String? get envelopeKey => 'order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'message': message,
      };
}

/// One entry of a [AccountOrders]'s `data`.
class AccountOrdersData extends Dto {
  const AccountOrdersData({
    this.account,
    this.allowContract,
    this.billingAddress,
    this.billingPreferences,
    this.billingStartDate,
    this.billingStartDayOfMonth,
    this.communicationPreferences,
    this.contractProperties,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customForm,
    this.customerPurchaseOrderId,
    this.description,
    this.discountProfile,
    this.displayName,
    this.id,
    this.invoiceNote,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.manager,
    this.name,
    this.nextBillingFromDate,
    this.nextBillingFromDateUtc,
    this.object,
    this.orderStartDate,
    this.orderType,
    this.origin,
    this.originalTotal,
    this.preOrder,
    this.priceTaxInclusive,
    this.quoteConverted,
    this.quoteOrder,
    this.referralAccount,
    this.salesRep,
    this.shippingAddress,
    this.shippingCost,
    this.shippingProfile,
    this.status,
    this.timeZone,
    this.version,
  });

  static AccountOrdersData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountOrdersData(
      account: AccountOrdersDataAccount.fromMap(source['account']),
      allowContract: readFlag(source['allow_contract']),
      billingAddress:
          AccountOrdersDataBillingAddress.fromMap(source['billing_address']),
      billingPreferences: AccountOrdersDataBillingPreferences.fromMap(
          source['billing_preferences']),
      billingStartDate: readText(source['billing_start_date']),
      billingStartDayOfMonth: readText(source['billing_start_day_of_month']),
      communicationPreferences:
          readList<AccountOrdersDataCommunicationPreference>(
              source['communication_preferences'],
              AccountOrdersDataCommunicationPreference.fromMap),
      contractProperties: AccountOrdersDataContractProperties.fromMap(
          source['contract_properties']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: AccountOrdersDataCurrency.fromMap(source['currency']),
      customForm: AccountOrdersDataCustomForm.fromMap(source['custom_form']),
      customerPurchaseOrderId: readText(source['customer_purchase_order_id']),
      description: readText(source['description']),
      discountProfile:
          AccountOrdersDataDiscountProfile.fromMap(source['discount_profile']),
      displayName: readText(source['display_name']),
      id: readText(source['id']),
      invoiceNote: readText(source['invoice_note']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      manager: AccountOrdersDataManager.fromMap(source['manager']),
      name: readText(source['name']),
      nextBillingFromDate: readText(source['next_billing_from_date']),
      nextBillingFromDateUtc: readText(source['next_billing_from_date_utc']),
      object: readText(source['object']),
      orderStartDate: readText(source['order_start_date']),
      orderType: readText(source['order_type']),
      origin: readText(source['origin']),
      originalTotal: readText(source['original_total']),
      preOrder: readFlag(source['pre_order']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      quoteConverted: readFlag(source['quote_converted']),
      quoteOrder: readFlag(source['quote_order']),
      referralAccount: readAny(source['referral_account']),
      salesRep: readAny(source['sales_rep']),
      shippingAddress:
          AccountOrdersDataShippingAddress.fromMap(source['shipping_address']),
      shippingCost: readDecimal(source['shipping_cost']),
      shippingProfile: readAny(source['shipping_profile']),
      status: readText(source['status']),
      timeZone: AccountOrdersDataTimeZone.fromMap(source['time_zone']),
      version: readInteger(source['version']),
    );
  }

  final AccountOrdersDataAccount? account;

  final bool? allowContract;

  final AccountOrdersDataBillingAddress? billingAddress;

  final AccountOrdersDataBillingPreferences? billingPreferences;

  final String? billingStartDate;

  final String? billingStartDayOfMonth;

  final List<AccountOrdersDataCommunicationPreference?>?
      communicationPreferences;

  final AccountOrdersDataContractProperties? contractProperties;

  /// Untyped: null in every record measured.
  final Object? createdBy;

  final String? createdOn;

  final AccountOrdersDataCurrency? currency;

  final AccountOrdersDataCustomForm? customForm;

  final String? customerPurchaseOrderId;

  final String? description;

  final AccountOrdersDataDiscountProfile? discountProfile;

  final String? displayName;

  final String? id;

  final String? invoiceNote;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final AccountOrdersDataManager? manager;

  final String? name;

  final String? nextBillingFromDate;

  final String? nextBillingFromDateUtc;

  final String? object;

  final String? orderStartDate;

  final String? orderType;

  final String? origin;

  final String? originalTotal;

  final bool? preOrder;

  final bool? priceTaxInclusive;

  final bool? quoteConverted;

  final bool? quoteOrder;

  /// Untyped: null in every record measured.
  final Object? referralAccount;

  /// Untyped: null in every record measured.
  final Object? salesRep;

  final AccountOrdersDataShippingAddress? shippingAddress;

  final double? shippingCost;

  /// Untyped: null in every record measured.
  final Object? shippingProfile;

  final String? status;

  final AccountOrdersDataTimeZone? timeZone;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'allow_contract': allowContract,
        'billing_address': billingAddress,
        'billing_preferences': billingPreferences,
        'billing_start_date': billingStartDate,
        'billing_start_day_of_month': billingStartDayOfMonth,
        'communication_preferences': communicationPreferences,
        'contract_properties': contractProperties,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_form': customForm,
        'customer_purchase_order_id': customerPurchaseOrderId,
        'description': description,
        'discount_profile': discountProfile,
        'display_name': displayName,
        'id': id,
        'invoice_note': invoiceNote,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'manager': manager,
        'name': name,
        'next_billing_from_date': nextBillingFromDate,
        'next_billing_from_date_utc': nextBillingFromDateUtc,
        'object': object,
        'order_start_date': orderStartDate,
        'order_type': orderType,
        'origin': origin,
        'original_total': originalTotal,
        'pre_order': preOrder,
        'price_tax_inclusive': priceTaxInclusive,
        'quote_converted': quoteConverted,
        'quote_order': quoteOrder,
        'referral_account': referralAccount,
        'sales_rep': salesRep,
        'shipping_address': shippingAddress,
        'shipping_cost': shippingCost,
        'shipping_profile': shippingProfile,
        'status': status,
        'time_zone': timeZone,
        'version': version,
      };
}

/// A [OrderRead]'s `currency`.
class OrderReadCurrency extends Dto {
  const OrderReadCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderReadCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadCurrency(
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

/// A [OrderRead]'s `time_zone`.
class OrderReadTimeZone extends Dto {
  const OrderReadTimeZone({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderReadTimeZone? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadTimeZone(
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

/// A [OrderRead]'s `custom_form`.
class OrderReadCustomForm extends Dto {
  const OrderReadCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderReadCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadCustomForm(
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

/// A [OrderRead]'s `manager`.
class OrderReadManager extends Dto {
  const OrderReadManager({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderReadManager? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadManager(
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

/// A [OrderRead]'s `account`.
class OrderReadAccount extends Dto {
  const OrderReadAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderReadAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadAccount(
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

/// A [OrderRead]'s `discount_profile`.
class OrderReadDiscountProfile extends Dto {
  const OrderReadDiscountProfile({
    this.amount,
    this.href,
    this.id,
    this.name,
    this.object,
    this.redemptionCode,
    this.type,
  });

  static OrderReadDiscountProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadDiscountProfile(
      amount: readText(source['amount']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      redemptionCode: readText(source['redemption_code']),
      type: readText(source['type']),
    );
  }

  final String? amount;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? redemptionCode;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'redemption_code': redemptionCode,
        'type': type,
      };
}

/// A [OrderRead]'s `billing_address`.
class OrderReadBillingAddress extends Dto {
  const OrderReadBillingAddress({
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    this.addressLine5,
    this.city,
    this.country,
    this.name,
    this.postalCode,
    this.state,
  });

  static OrderReadBillingAddress? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadBillingAddress(
      addressLine1: readText(source['address_line_1']),
      addressLine2: readText(source['address_line_2']),
      addressLine3: readText(source['address_line_3']),
      addressLine4: readText(source['address_line_4']),
      addressLine5: readText(source['address_line_5']),
      city: readText(source['city']),
      country: readText(source['country']),
      name: readText(source['name']),
      postalCode: readText(source['postal_code']),
      state: readText(source['state']),
    );
  }

  final String? addressLine1;

  final String? addressLine2;

  final String? addressLine3;

  final String? addressLine4;

  final String? addressLine5;

  final String? city;

  final String? country;

  final String? name;

  final String? postalCode;

  final String? state;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_line_3': addressLine3,
        'address_line_4': addressLine4,
        'address_line_5': addressLine5,
        'city': city,
        'country': country,
        'name': name,
        'postal_code': postalCode,
        'state': state,
      };
}

/// A [OrderRead]'s `shipping_address`.
class OrderReadShippingAddress extends Dto {
  const OrderReadShippingAddress({
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    this.addressLine5,
    this.city,
    this.country,
    this.name,
    this.postalCode,
    this.state,
  });

  static OrderReadShippingAddress? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadShippingAddress(
      addressLine1: readText(source['address_line_1']),
      addressLine2: readText(source['address_line_2']),
      addressLine3: readText(source['address_line_3']),
      addressLine4: readText(source['address_line_4']),
      addressLine5: readText(source['address_line_5']),
      city: readText(source['city']),
      country: readText(source['country']),
      name: readText(source['name']),
      postalCode: readText(source['postal_code']),
      state: readText(source['state']),
    );
  }

  final String? addressLine1;

  final String? addressLine2;

  final String? addressLine3;

  final String? addressLine4;

  final String? addressLine5;

  final String? city;

  final String? country;

  final String? name;

  final String? postalCode;

  final String? state;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_line_3': addressLine3,
        'address_line_4': addressLine4,
        'address_line_5': addressLine5,
        'city': city,
        'country': country,
        'name': name,
        'postal_code': postalCode,
        'state': state,
      };
}

/// One entry of a [OrderRead]'s `communication_preferences`.
class OrderReadCommunicationPreference extends Dto {
  const OrderReadCommunicationPreference({
    this.channel,
    this.enabled,
  });

  static OrderReadCommunicationPreference? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadCommunicationPreference(
      channel: readText(source['channel']),
      enabled: readFlag(source['enabled']),
    );
  }

  final String? channel;

  final bool? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'channel': channel,
        'enabled': enabled,
      };
}

/// A [OrderRead]'s `contract_properties`, sent for a contract order.
class OrderReadContractProperties extends Dto {
  const OrderReadContractProperties({
    this.allowDowngrade,
    this.allowEarlyTermination,
    this.allowPostponement,
    this.allowTrial,
    this.allowUpgrade,
    this.applyEarlyTerminationCharge,
    this.autoRenewalEndsOn,
    this.autoRenewalRequireCustomerAcceptance,
    this.autoRenewalTerm,
    this.earlyTerminationChargeType,
    this.earlyTerminationMinimumPeriod,
    this.initialContractTerm,
    this.renewAutomatically,
    this.requireCustomerAcceptance,
    this.requiresPaymentMethod,
    this.startContractAfterTrialEnds,
    this.terminationAccountingCode,
    this.terminationFixedCharge,
    this.terminationNoticePeriod,
    this.trialEndDate,
    this.trialPeriod,
    this.trialRequiresPaymentMethod,
  });

  static OrderReadContractProperties? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadContractProperties(
      allowDowngrade: readFlag(source['allow_downgrade']),
      allowEarlyTermination: readFlag(source['allow_early_termination']),
      allowPostponement: readFlag(source['allow_postponement']),
      allowTrial: readFlag(source['allow_trial']),
      allowUpgrade: readFlag(source['allow_upgrade']),
      applyEarlyTerminationCharge:
          readFlag(source['apply_early_termination_charge']),
      autoRenewalEndsOn: readText(source['auto_renewal_ends_on']),
      autoRenewalRequireCustomerAcceptance:
          readFlag(source['auto_renewal_require_customer_acceptance']),
      autoRenewalTerm: readText(source['auto_renewal_term']),
      earlyTerminationChargeType:
          readText(source['early_termination_charge_type']),
      earlyTerminationMinimumPeriod:
          readText(source['early_termination_minimum_period']),
      initialContractTerm: readText(source['initial_contract_term']),
      renewAutomatically: readText(source['renew_automatically']),
      requireCustomerAcceptance:
          readFlag(source['require_customer_acceptance']),
      requiresPaymentMethod: readFlag(source['requires_payment_method']),
      startContractAfterTrialEnds:
          readFlag(source['start_contract_after_trial_ends']),
      terminationAccountingCode:
          readText(source['termination_accounting_code']),
      terminationFixedCharge: readText(source['termination_fixed_charge']),
      terminationNoticePeriod: readText(source['termination_notice_period']),
      trialEndDate: readText(source['trial_end_date']),
      trialPeriod: readText(source['trial_period']),
      trialRequiresPaymentMethod:
          readFlag(source['trial_requires_payment_method']),
    );
  }

  final bool? allowDowngrade;

  final bool? allowEarlyTermination;

  final bool? allowPostponement;

  final bool? allowTrial;

  final bool? allowUpgrade;

  final bool? applyEarlyTerminationCharge;

  final String? autoRenewalEndsOn;

  final bool? autoRenewalRequireCustomerAcceptance;

  final String? autoRenewalTerm;

  final String? earlyTerminationChargeType;

  final String? earlyTerminationMinimumPeriod;

  final String? initialContractTerm;

  final String? renewAutomatically;

  final bool? requireCustomerAcceptance;

  final bool? requiresPaymentMethod;

  final bool? startContractAfterTrialEnds;

  final String? terminationAccountingCode;

  final String? terminationFixedCharge;

  final String? terminationNoticePeriod;

  final String? trialEndDate;

  final String? trialPeriod;

  final bool? trialRequiresPaymentMethod;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'allow_downgrade': allowDowngrade,
        'allow_early_termination': allowEarlyTermination,
        'allow_postponement': allowPostponement,
        'allow_trial': allowTrial,
        'allow_upgrade': allowUpgrade,
        'apply_early_termination_charge': applyEarlyTerminationCharge,
        'auto_renewal_ends_on': autoRenewalEndsOn,
        'auto_renewal_require_customer_acceptance':
            autoRenewalRequireCustomerAcceptance,
        'auto_renewal_term': autoRenewalTerm,
        'early_termination_charge_type': earlyTerminationChargeType,
        'early_termination_minimum_period': earlyTerminationMinimumPeriod,
        'initial_contract_term': initialContractTerm,
        'renew_automatically': renewAutomatically,
        'require_customer_acceptance': requireCustomerAcceptance,
        'requires_payment_method': requiresPaymentMethod,
        'start_contract_after_trial_ends': startContractAfterTrialEnds,
        'termination_accounting_code': terminationAccountingCode,
        'termination_fixed_charge': terminationFixedCharge,
        'termination_notice_period': terminationNoticePeriod,
        'trial_end_date': trialEndDate,
        'trial_period': trialPeriod,
        'trial_requires_payment_method': trialRequiresPaymentMethod,
      };
}

/// A [OrderRead]'s `billing_preferences`.
class OrderReadBillingPreferences extends Dto {
  const OrderReadBillingPreferences({
    this.billingPeriod,
    this.communicationProfile,
    this.consolidateInvoice,
    this.consolidateKey,
    this.fulfillmentMode,
    this.fulfillmentTerm,
    this.invoiceMode,
    this.invoiceTerm,
    this.paymentMode,
    this.paymentProcessor,
    this.paymentTerm,
    this.paymentTermAlignment,
    this.proformaProperties,
  });

  static OrderReadBillingPreferences? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadBillingPreferences(
      billingPeriod: readText(source['billing_period']),
      communicationProfile: readText(source['communication_profile']),
      consolidateInvoice: readFlag(source['consolidate_invoice']),
      consolidateKey: readText(source['consolidate_key']),
      fulfillmentMode: readText(source['fulfillment_mode']),
      fulfillmentTerm: readText(source['fulfillment_term']),
      invoiceMode: readText(source['invoice_mode']),
      invoiceTerm: readText(source['invoice_term']),
      paymentMode: readText(source['payment_mode']),
      paymentProcessor: readText(source['payment_processor']),
      paymentTerm: readText(source['payment_term']),
      paymentTermAlignment: readText(source['payment_term_alignment']),
      proformaProperties: OrderReadBillingPreferencesProformaProperties.fromMap(
          source['proforma_properties']),
    );
  }

  final String? billingPeriod;

  final String? communicationProfile;

  final bool? consolidateInvoice;

  final String? consolidateKey;

  final String? fulfillmentMode;

  final String? fulfillmentTerm;

  final String? invoiceMode;

  final String? invoiceTerm;

  final String? paymentMode;

  final String? paymentProcessor;

  final String? paymentTerm;

  final String? paymentTermAlignment;

  final OrderReadBillingPreferencesProformaProperties? proformaProperties;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'billing_period': billingPeriod,
        'communication_profile': communicationProfile,
        'consolidate_invoice': consolidateInvoice,
        'consolidate_key': consolidateKey,
        'fulfillment_mode': fulfillmentMode,
        'fulfillment_term': fulfillmentTerm,
        'invoice_mode': invoiceMode,
        'invoice_term': invoiceTerm,
        'payment_mode': paymentMode,
        'payment_processor': paymentProcessor,
        'payment_term': paymentTerm,
        'payment_term_alignment': paymentTermAlignment,
        'proforma_properties': proformaProperties,
      };
}

/// One entry of a [OrderRead]'s `custom_attributes`.
class OrderReadCustomAttribute extends Dto {
  const OrderReadCustomAttribute({
    this.href,
    this.id,
    this.name,
    this.object,
    this.type,
    this.value,
  });

  static OrderReadCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadCustomAttribute(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      type: readText(source['type']),
      value: readAny(source['value']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? type;

  /// Untyped: a string for a `STRING` attribute and a list of strings for others,
  /// so no single type reads them all.
  final Object? value;

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

/// One entry of a [OrderRead]'s `lines`.
class OrderReadLine extends Dto {
  const OrderReadLine({
    this.booking,
    this.chargeItemUuid,
    this.expectedDeliveryDate,
    this.id,
    this.item,
    this.itemAccountingCode,
    this.itemChargeType,
    this.itemCustomAttributes,
    this.itemDescription,
    this.itemInvoiceNote,
    this.itemOrderQuantity,
    this.itemPriceSnapshot,
    this.itemPriceTax,
    this.itemProperties,
    this.itemSaleTaxConfiguration,
    this.itemType,
    this.object,
    this.preOrderStockDetails,
    this.shippingCost,
    this.subtotal,
    this.tax,
    this.taxExemptWhenSold,
    this.total,
    this.version,
  });

  static OrderReadLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadLine(
      booking: OrderReadLineBooking.fromMap(source['booking']),
      chargeItemUuid: readText(source['charge_item_uuid']),
      expectedDeliveryDate: readText(source['expected_delivery_date']),
      id: readText(source['id']),
      item: OrderReadLineItem.fromMap(source['item']),
      itemAccountingCode: OrderReadLineItemAccountingCode.fromMap(
          source['item_accounting_code']),
      itemChargeType: readText(source['item_charge_type']),
      itemCustomAttributes: readList<OrderReadLineItemCustomAttribute>(
          source['item_custom_attributes'],
          OrderReadLineItemCustomAttribute.fromMap),
      itemDescription: readText(source['item_description']),
      itemInvoiceNote: readText(source['item_invoice_note']),
      itemOrderQuantity: readInteger(source['item_order_quantity']),
      itemPriceSnapshot:
          OrderReadLineItemPriceSnapshot.fromMap(source['item_price_snapshot']),
      itemPriceTax: OrderReadLineItemPriceTax.fromMap(source['item_price_tax']),
      itemProperties:
          OrderReadLineItemProperties.fromMap(source['item_properties']),
      itemSaleTaxConfiguration: OrderReadLineItemSaleTaxConfiguration.fromMap(
          source['item_sale_tax_configuration']),
      itemType: readText(source['item_type']),
      object: readText(source['object']),
      preOrderStockDetails: OrderReadLinePreOrderStockDetails.fromMap(
          source['pre_order_stock_details']),
      shippingCost: readDecimal(source['shipping_cost']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      taxExemptWhenSold: readFlag(source['tax_exempt_when_sold']),
      total: readText(source['total']),
      version: readInteger(source['version']),
    );
  }

  final OrderReadLineBooking? booking;

  final String? chargeItemUuid;

  final String? expectedDeliveryDate;

  final String? id;

  final OrderReadLineItem? item;

  final OrderReadLineItemAccountingCode? itemAccountingCode;

  final String? itemChargeType;

  final List<OrderReadLineItemCustomAttribute?>? itemCustomAttributes;

  final String? itemDescription;

  final String? itemInvoiceNote;

  final int? itemOrderQuantity;

  final OrderReadLineItemPriceSnapshot? itemPriceSnapshot;

  final OrderReadLineItemPriceTax? itemPriceTax;

  final OrderReadLineItemProperties? itemProperties;

  final OrderReadLineItemSaleTaxConfiguration? itemSaleTaxConfiguration;

  final String? itemType;

  final String? object;

  final OrderReadLinePreOrderStockDetails? preOrderStockDetails;

  final double? shippingCost;

  final String? subtotal;

  final String? tax;

  final bool? taxExemptWhenSold;

  final String? total;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'booking': booking,
        'charge_item_uuid': chargeItemUuid,
        'expected_delivery_date': expectedDeliveryDate,
        'id': id,
        'item': item,
        'item_accounting_code': itemAccountingCode,
        'item_charge_type': itemChargeType,
        'item_custom_attributes': itemCustomAttributes,
        'item_description': itemDescription,
        'item_invoice_note': itemInvoiceNote,
        'item_order_quantity': itemOrderQuantity,
        'item_price_snapshot': itemPriceSnapshot,
        'item_price_tax': itemPriceTax,
        'item_properties': itemProperties,
        'item_sale_tax_configuration': itemSaleTaxConfiguration,
        'item_type': itemType,
        'object': object,
        'pre_order_stock_details': preOrderStockDetails,
        'shipping_cost': shippingCost,
        'subtotal': subtotal,
        'tax': tax,
        'tax_exempt_when_sold': taxExemptWhenSold,
        'total': total,
        'version': version,
      };
}

/// A [OrderRead]'s `kpis`.
class OrderReadKpis extends Dto {
  const OrderReadKpis({
    this.createdOn,
    this.deletedAt,
    this.estimatedTotal,
    this.lastCancelledAt,
    this.lastChangedAt,
    this.lastInvoiceIssueDate,
    this.lastInvoiceTotal,
    this.lastReactivatedAt,
    this.lastUpdatedOn,
    this.monthlyRecurringRevenue,
    this.nextInvoiceIssueDate,
    this.object,
    this.startDate,
    this.totalCollected,
    this.totalDue,
    this.totalInvoice,
    this.totalOutstanding,
    this.totalRevenue,
  });

  static OrderReadKpis? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadKpis(
      createdOn: readAny(source['created_on']),
      deletedAt: readAny(source['deleted_at']),
      estimatedTotal: readText(source['estimated_total']),
      lastCancelledAt: readAny(source['last_cancelled_at']),
      lastChangedAt: readAny(source['last_changed_at']),
      lastInvoiceIssueDate: readAny(source['last_invoice_issue_date']),
      lastInvoiceTotal: readText(source['last_invoice_total']),
      lastReactivatedAt: readAny(source['last_reactivated_at']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      monthlyRecurringRevenue: readText(source['monthly_recurring_revenue']),
      nextInvoiceIssueDate: readAny(source['next_invoice_issue_date']),
      object: readText(source['object']),
      startDate: readAny(source['start_date']),
      totalCollected: readText(source['total_collected']),
      totalDue: readText(source['total_due']),
      totalInvoice: readInteger(source['total_invoice']),
      totalOutstanding: readText(source['total_outstanding']),
      totalRevenue: readText(source['total_revenue']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? createdOn;

  /// Untyped: null in every record measured.
  final Object? deletedAt;

  final String? estimatedTotal;

  /// Untyped: null in every record measured.
  final Object? lastCancelledAt;

  /// Untyped: null in every record measured.
  final Object? lastChangedAt;

  /// Untyped: null in every record measured.
  final Object? lastInvoiceIssueDate;

  final String? lastInvoiceTotal;

  /// Untyped: null in every record measured.
  final Object? lastReactivatedAt;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final String? monthlyRecurringRevenue;

  /// Untyped: null in every record measured.
  final Object? nextInvoiceIssueDate;

  final String? object;

  /// Untyped: null in every record measured.
  final Object? startDate;

  final String? totalCollected;

  final String? totalDue;

  final int? totalInvoice;

  final String? totalOutstanding;

  final String? totalRevenue;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_on': createdOn,
        'deleted_at': deletedAt,
        'estimated_total': estimatedTotal,
        'last_cancelled_at': lastCancelledAt,
        'last_changed_at': lastChangedAt,
        'last_invoice_issue_date': lastInvoiceIssueDate,
        'last_invoice_total': lastInvoiceTotal,
        'last_reactivated_at': lastReactivatedAt,
        'last_updated_on': lastUpdatedOn,
        'monthly_recurring_revenue': monthlyRecurringRevenue,
        'next_invoice_issue_date': nextInvoiceIssueDate,
        'object': object,
        'start_date': startDate,
        'total_collected': totalCollected,
        'total_due': totalDue,
        'total_invoice': totalInvoice,
        'total_outstanding': totalOutstanding,
        'total_revenue': totalRevenue,
      };
}

/// One entry of a [OrderRead]'s `activity_logs`.
class OrderReadActivityLog extends Dto {
  const OrderReadActivityLog({
    this.activity,
  });

  static OrderReadActivityLog? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadActivityLog(
      activity: readText(source['activity']),
    );
  }

  final String? activity;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity': activity,
      };
}

/// A [OrderBillingPreferences]'s `billing_preferences`.
class OrderBillingPreferencesBillingPreferences extends Dto {
  const OrderBillingPreferencesBillingPreferences({
    this.billingPeriod,
    this.communicationProfile,
    this.consolidateInvoice,
    this.consolidateKey,
    this.fulfillmentMode,
    this.fulfillmentTerm,
    this.invoiceMode,
    this.invoiceTerm,
    this.paymentMode,
    this.paymentProcessor,
    this.paymentTerm,
    this.paymentTermAlignment,
    this.proformaProperties,
  });

  static OrderBillingPreferencesBillingPreferences? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderBillingPreferencesBillingPreferences(
      billingPeriod: readText(source['billing_period']),
      communicationProfile: readText(source['communication_profile']),
      consolidateInvoice: readFlag(source['consolidate_invoice']),
      consolidateKey: readText(source['consolidate_key']),
      fulfillmentMode: readText(source['fulfillment_mode']),
      fulfillmentTerm: readText(source['fulfillment_term']),
      invoiceMode: readText(source['invoice_mode']),
      invoiceTerm: readText(source['invoice_term']),
      paymentMode: readText(source['payment_mode']),
      paymentProcessor: readText(source['payment_processor']),
      paymentTerm: readText(source['payment_term']),
      paymentTermAlignment: readText(source['payment_term_alignment']),
      proformaProperties:
          OrderBillingPreferencesBillingPreferencesProformaProperties.fromMap(
              source['proforma_properties']),
    );
  }

  final String? billingPeriod;

  final String? communicationProfile;

  final bool? consolidateInvoice;

  final String? consolidateKey;

  final String? fulfillmentMode;

  final String? fulfillmentTerm;

  final String? invoiceMode;

  final String? invoiceTerm;

  final String? paymentMode;

  final String? paymentProcessor;

  final String? paymentTerm;

  final String? paymentTermAlignment;

  final OrderBillingPreferencesBillingPreferencesProformaProperties?
      proformaProperties;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'billing_period': billingPeriod,
        'communication_profile': communicationProfile,
        'consolidate_invoice': consolidateInvoice,
        'consolidate_key': consolidateKey,
        'fulfillment_mode': fulfillmentMode,
        'fulfillment_term': fulfillmentTerm,
        'invoice_mode': invoiceMode,
        'invoice_term': invoiceTerm,
        'payment_mode': paymentMode,
        'payment_processor': paymentProcessor,
        'payment_term': paymentTerm,
        'payment_term_alignment': paymentTermAlignment,
        'proforma_properties': proformaProperties,
      };
}

/// A [OrderInformation]'s `currency`.
class OrderInformationCurrency extends Dto {
  const OrderInformationCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderInformationCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInformationCurrency(
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

/// A [OrderInformation]'s `time_zone`.
class OrderInformationTimeZone extends Dto {
  const OrderInformationTimeZone({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderInformationTimeZone? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInformationTimeZone(
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

/// A [OrderInformation]'s `custom_form`.
class OrderInformationCustomForm extends Dto {
  const OrderInformationCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderInformationCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInformationCustomForm(
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

/// A [OrderInformation]'s `manager`.
class OrderInformationManager extends Dto {
  const OrderInformationManager({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderInformationManager? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInformationManager(
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

/// A [OrderInformation]'s `account`.
class OrderInformationAccount extends Dto {
  const OrderInformationAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderInformationAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInformationAccount(
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

/// A [OrderInformation]'s `discount_profile`.
class OrderInformationDiscountProfile extends Dto {
  const OrderInformationDiscountProfile({
    this.amount,
    this.href,
    this.id,
    this.name,
    this.object,
    this.redemptionCode,
    this.type,
  });

  static OrderInformationDiscountProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInformationDiscountProfile(
      amount: readText(source['amount']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      redemptionCode: readText(source['redemption_code']),
      type: readText(source['type']),
    );
  }

  final String? amount;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? redemptionCode;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'redemption_code': redemptionCode,
        'type': type,
      };
}

/// A [OrderInformation]'s `billing_address`.
class OrderInformationBillingAddress extends Dto {
  const OrderInformationBillingAddress({
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    this.addressLine5,
    this.city,
    this.country,
    this.name,
    this.postalCode,
    this.state,
  });

  static OrderInformationBillingAddress? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInformationBillingAddress(
      addressLine1: readText(source['address_line_1']),
      addressLine2: readText(source['address_line_2']),
      addressLine3: readText(source['address_line_3']),
      addressLine4: readText(source['address_line_4']),
      addressLine5: readText(source['address_line_5']),
      city: readText(source['city']),
      country: readText(source['country']),
      name: readText(source['name']),
      postalCode: readText(source['postal_code']),
      state: readText(source['state']),
    );
  }

  final String? addressLine1;

  final String? addressLine2;

  final String? addressLine3;

  final String? addressLine4;

  final String? addressLine5;

  final String? city;

  final String? country;

  final String? name;

  final String? postalCode;

  final String? state;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_line_3': addressLine3,
        'address_line_4': addressLine4,
        'address_line_5': addressLine5,
        'city': city,
        'country': country,
        'name': name,
        'postal_code': postalCode,
        'state': state,
      };
}

/// A [OrderInformation]'s `shipping_address`.
class OrderInformationShippingAddress extends Dto {
  const OrderInformationShippingAddress({
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    this.addressLine5,
    this.city,
    this.country,
    this.name,
    this.postalCode,
    this.state,
  });

  static OrderInformationShippingAddress? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInformationShippingAddress(
      addressLine1: readText(source['address_line_1']),
      addressLine2: readText(source['address_line_2']),
      addressLine3: readText(source['address_line_3']),
      addressLine4: readText(source['address_line_4']),
      addressLine5: readText(source['address_line_5']),
      city: readText(source['city']),
      country: readText(source['country']),
      name: readText(source['name']),
      postalCode: readText(source['postal_code']),
      state: readText(source['state']),
    );
  }

  final String? addressLine1;

  final String? addressLine2;

  final String? addressLine3;

  final String? addressLine4;

  final String? addressLine5;

  final String? city;

  final String? country;

  final String? name;

  final String? postalCode;

  final String? state;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_line_3': addressLine3,
        'address_line_4': addressLine4,
        'address_line_5': addressLine5,
        'city': city,
        'country': country,
        'name': name,
        'postal_code': postalCode,
        'state': state,
      };
}

/// One entry of a [OrderInformation]'s `communication_preferences`.
class OrderInformationCommunicationPreference extends Dto {
  const OrderInformationCommunicationPreference({
    this.channel,
    this.enabled,
  });

  static OrderInformationCommunicationPreference? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderInformationCommunicationPreference(
      channel: readText(source['channel']),
      enabled: readFlag(source['enabled']),
    );
  }

  final String? channel;

  final bool? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'channel': channel,
        'enabled': enabled,
      };
}

/// A [Order]'s `currency`.
class OrderCurrency extends Dto {
  const OrderCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderCurrency(
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

/// A [Order]'s `time_zone`.
class OrderTimeZone extends Dto {
  const OrderTimeZone({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderTimeZone? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderTimeZone(
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

/// A [Order]'s `custom_form`.
class OrderCustomForm extends Dto {
  const OrderCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderCustomForm(
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

/// A [Order]'s `manager`.
class OrderManager extends Dto {
  const OrderManager({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderManager? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderManager(
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

/// A [Order]'s `sales_rep`.
class OrderSalesRep extends Dto {
  const OrderSalesRep({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderSalesRep? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderSalesRep(
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

/// A [Order]'s `shipping_profile`.
class OrderShippingProfile extends Dto {
  const OrderShippingProfile({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderShippingProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderShippingProfile(
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

/// A [Order]'s `account`.
class OrderAccount extends Dto {
  const OrderAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderAccount(
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

/// A [Order]'s `referral_account`.
class OrderReferralAccount extends Dto {
  const OrderReferralAccount({
    this.href,
    this.id,
    this.object,
  });

  static OrderReferralAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReferralAccount(
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

/// A [Order]'s `discount_profile`.
class OrderDiscountProfile extends Dto {
  const OrderDiscountProfile({
    this.amount,
    this.href,
    this.id,
    this.name,
    this.object,
    this.redemptionCode,
    this.type,
  });

  static OrderDiscountProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderDiscountProfile(
      amount: readText(source['amount']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      redemptionCode: readText(source['redemption_code']),
      type: readText(source['type']),
    );
  }

  final String? amount;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? redemptionCode;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'redemption_code': redemptionCode,
        'type': type,
      };
}

/// A [Order]'s `billing_address`.
class OrderBillingAddress extends Dto {
  const OrderBillingAddress({
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    this.addressLine5,
    this.city,
    this.country,
    this.name,
    this.postalCode,
    this.state,
  });

  static OrderBillingAddress? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderBillingAddress(
      addressLine1: readText(source['address_line_1']),
      addressLine2: readText(source['address_line_2']),
      addressLine3: readText(source['address_line_3']),
      addressLine4: readText(source['address_line_4']),
      addressLine5: readText(source['address_line_5']),
      city: readText(source['city']),
      country: readText(source['country']),
      name: readText(source['name']),
      postalCode: readText(source['postal_code']),
      state: readText(source['state']),
    );
  }

  final String? addressLine1;

  final String? addressLine2;

  final String? addressLine3;

  final String? addressLine4;

  final String? addressLine5;

  final String? city;

  final String? country;

  final String? name;

  final String? postalCode;

  final String? state;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_line_3': addressLine3,
        'address_line_4': addressLine4,
        'address_line_5': addressLine5,
        'city': city,
        'country': country,
        'name': name,
        'postal_code': postalCode,
        'state': state,
      };
}

/// A [Order]'s `shipping_address`.
class OrderShippingAddress extends Dto {
  const OrderShippingAddress({
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    this.addressLine5,
    this.city,
    this.country,
    this.name,
    this.postalCode,
    this.state,
  });

  static OrderShippingAddress? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderShippingAddress(
      addressLine1: readText(source['address_line_1']),
      addressLine2: readText(source['address_line_2']),
      addressLine3: readText(source['address_line_3']),
      addressLine4: readText(source['address_line_4']),
      addressLine5: readText(source['address_line_5']),
      city: readText(source['city']),
      country: readText(source['country']),
      name: readText(source['name']),
      postalCode: readText(source['postal_code']),
      state: readText(source['state']),
    );
  }

  final String? addressLine1;

  final String? addressLine2;

  final String? addressLine3;

  final String? addressLine4;

  final String? addressLine5;

  final String? city;

  final String? country;

  final String? name;

  final String? postalCode;

  final String? state;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_line_3': addressLine3,
        'address_line_4': addressLine4,
        'address_line_5': addressLine5,
        'city': city,
        'country': country,
        'name': name,
        'postal_code': postalCode,
        'state': state,
      };
}

/// One entry of a [Order]'s `communication_preferences`.
class OrderCommunicationPreference extends Dto {
  const OrderCommunicationPreference({
    this.channel,
    this.enabled,
  });

  static OrderCommunicationPreference? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderCommunicationPreference(
      channel: readText(source['channel']),
      enabled: readFlag(source['enabled']),
    );
  }

  final String? channel;

  final bool? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'channel': channel,
        'enabled': enabled,
      };
}

/// A [Order]'s `billing_preferences`.
class OrderBillingPreferencesEntry extends Dto {
  const OrderBillingPreferencesEntry({
    this.billingPeriod,
    this.communicationProfile,
    this.consolidateInvoice,
    this.consolidateKey,
    this.fulfillmentMode,
    this.fulfillmentTerm,
    this.invoiceMode,
    this.invoiceTerm,
    this.paymentMode,
    this.paymentProcessor,
    this.paymentTerm,
    this.paymentTermAlignment,
    this.proformaProperties,
  });

  static OrderBillingPreferencesEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderBillingPreferencesEntry(
      billingPeriod: readText(source['billing_period']),
      communicationProfile: readText(source['communication_profile']),
      consolidateInvoice: readFlag(source['consolidate_invoice']),
      consolidateKey: readText(source['consolidate_key']),
      fulfillmentMode: readText(source['fulfillment_mode']),
      fulfillmentTerm: readText(source['fulfillment_term']),
      invoiceMode: readText(source['invoice_mode']),
      invoiceTerm: readText(source['invoice_term']),
      paymentMode: readText(source['payment_mode']),
      paymentProcessor: readText(source['payment_processor']),
      paymentTerm: readText(source['payment_term']),
      paymentTermAlignment: readText(source['payment_term_alignment']),
      proformaProperties:
          OrderBillingPreferencesEntryProformaProperties.fromMap(
              source['proforma_properties']),
    );
  }

  final String? billingPeriod;

  final String? communicationProfile;

  final bool? consolidateInvoice;

  final String? consolidateKey;

  final String? fulfillmentMode;

  final String? fulfillmentTerm;

  final String? invoiceMode;

  final String? invoiceTerm;

  final String? paymentMode;

  final String? paymentProcessor;

  final String? paymentTerm;

  final String? paymentTermAlignment;

  final OrderBillingPreferencesEntryProformaProperties? proformaProperties;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'billing_period': billingPeriod,
        'communication_profile': communicationProfile,
        'consolidate_invoice': consolidateInvoice,
        'consolidate_key': consolidateKey,
        'fulfillment_mode': fulfillmentMode,
        'fulfillment_term': fulfillmentTerm,
        'invoice_mode': invoiceMode,
        'invoice_term': invoiceTerm,
        'payment_mode': paymentMode,
        'payment_processor': paymentProcessor,
        'payment_term': paymentTerm,
        'payment_term_alignment': paymentTermAlignment,
        'proforma_properties': proformaProperties,
      };
}

/// A [Order]'s `contract_properties`.
class OrderContractProperties extends Dto {
  const OrderContractProperties({
    this.allowDowngrade,
    this.allowDowngradeCharge,
    this.allowEarlyTermination,
    this.allowPostponement,
    this.allowTrial,
    this.allowUpgrade,
    this.autoRenewalEndsOn,
    this.autoRenewalRequireCustomerAcceptance,
    this.autoRenewalTerm,
    this.downgradeChargeFixed,
    this.downgradeChargeType,
    this.initialContractTerm,
    this.periodBeforeDowngrade,
    this.renewAutomatically,
    this.requireCustomerAcceptance,
    this.requiresPaymentMethod,
    this.terminationAccountingCode,
    this.terminationNoticePeriod,
  });

  static OrderContractProperties? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderContractProperties(
      allowDowngrade: readFlag(source['allow_downgrade']),
      allowDowngradeCharge: readFlag(source['allow_downgrade_charge']),
      allowEarlyTermination: readFlag(source['allow_early_termination']),
      allowPostponement: readFlag(source['allow_postponement']),
      allowTrial: readFlag(source['allow_trial']),
      allowUpgrade: readFlag(source['allow_upgrade']),
      autoRenewalEndsOn: readText(source['auto_renewal_ends_on']),
      autoRenewalRequireCustomerAcceptance:
          readFlag(source['auto_renewal_require_customer_acceptance']),
      autoRenewalTerm: readText(source['auto_renewal_term']),
      downgradeChargeFixed: readText(source['downgrade_charge_fixed']),
      downgradeChargeType: readText(source['downgrade_charge_type']),
      initialContractTerm: readText(source['initial_contract_term']),
      periodBeforeDowngrade: readText(source['period_before_downgrade']),
      renewAutomatically: readText(source['renew_automatically']),
      requireCustomerAcceptance:
          readFlag(source['require_customer_acceptance']),
      requiresPaymentMethod: readFlag(source['requires_payment_method']),
      terminationAccountingCode:
          readText(source['termination_accounting_code']),
      terminationNoticePeriod: readText(source['termination_notice_period']),
    );
  }

  final bool? allowDowngrade;

  final bool? allowDowngradeCharge;

  final bool? allowEarlyTermination;

  final bool? allowPostponement;

  final bool? allowTrial;

  final bool? allowUpgrade;

  final String? autoRenewalEndsOn;

  final bool? autoRenewalRequireCustomerAcceptance;

  final String? autoRenewalTerm;

  final String? downgradeChargeFixed;

  final String? downgradeChargeType;

  final String? initialContractTerm;

  final String? periodBeforeDowngrade;

  final String? renewAutomatically;

  final bool? requireCustomerAcceptance;

  final bool? requiresPaymentMethod;

  final String? terminationAccountingCode;

  final String? terminationNoticePeriod;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'allow_downgrade': allowDowngrade,
        'allow_downgrade_charge': allowDowngradeCharge,
        'allow_early_termination': allowEarlyTermination,
        'allow_postponement': allowPostponement,
        'allow_trial': allowTrial,
        'allow_upgrade': allowUpgrade,
        'auto_renewal_ends_on': autoRenewalEndsOn,
        'auto_renewal_require_customer_acceptance':
            autoRenewalRequireCustomerAcceptance,
        'auto_renewal_term': autoRenewalTerm,
        'downgrade_charge_fixed': downgradeChargeFixed,
        'downgrade_charge_type': downgradeChargeType,
        'initial_contract_term': initialContractTerm,
        'period_before_downgrade': periodBeforeDowngrade,
        'renew_automatically': renewAutomatically,
        'require_customer_acceptance': requireCustomerAcceptance,
        'requires_payment_method': requiresPaymentMethod,
        'termination_accounting_code': terminationAccountingCode,
        'termination_notice_period': terminationNoticePeriod,
      };
}

/// A [OrderNote]'s `order`.
class OrderNoteOrder extends Dto {
  const OrderNoteOrder({
    this.href,
    this.id,
    this.object,
  });

  static OrderNoteOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderNoteOrder(
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

/// One entry of a [OrderNote]'s `attachments`.
class OrderNoteAttachment extends Dto {
  const OrderNoteAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static OrderNoteAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderNoteAttachment(
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

/// One entry of a [OrderNote]'s `watchers`.
class OrderNoteWatcher extends Dto {
  const OrderNoteWatcher({
    this.email,
    this.name,
    this.type,
  });

  static OrderNoteWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderNoteWatcher(
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

/// A [OrderNote]'s `created_by`.
class OrderNoteCreatedBy extends Dto {
  const OrderNoteCreatedBy({
    this.name,
    this.object,
  });

  static OrderNoteCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderNoteCreatedBy(
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

/// A [OrderNote]'s `last_updated_by`.
class OrderNoteLastUpdatedBy extends Dto {
  const OrderNoteLastUpdatedBy({
    this.name,
    this.object,
  });

  static OrderNoteLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderNoteLastUpdatedBy(
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

/// One entry of a [OrderLines]'s `lines`.
class OrderLinesLine extends Dto {
  const OrderLinesLine({
    this.chargeItemUuid,
    this.expectedDeliveryDate,
    this.id,
    this.item,
    this.itemAccountingCode,
    this.itemChargeType,
    this.itemCustomAttributes,
    this.itemDescription,
    this.itemInvoiceNote,
    this.itemOrderQuantity,
    this.itemPriceSnapshot,
    this.itemPriceTax,
    this.itemProperties,
    this.itemSaleTaxConfiguration,
    this.itemType,
    this.object,
    this.preOrderStockDetails,
    this.shippingCost,
    this.subtotal,
    this.tax,
    this.taxExemptWhenSold,
    this.total,
    this.version,
  });

  static OrderLinesLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLinesLine(
      chargeItemUuid: readText(source['charge_item_uuid']),
      expectedDeliveryDate: readText(source['expected_delivery_date']),
      id: readText(source['id']),
      item: OrderLinesLineItem.fromMap(source['item']),
      itemAccountingCode: OrderLinesLineItemAccountingCode.fromMap(
          source['item_accounting_code']),
      itemChargeType: readText(source['item_charge_type']),
      itemCustomAttributes: readList<OrderLinesLineItemCustomAttribute>(
          source['item_custom_attributes'],
          OrderLinesLineItemCustomAttribute.fromMap),
      itemDescription: readText(source['item_description']),
      itemInvoiceNote: readText(source['item_invoice_note']),
      itemOrderQuantity: readInteger(source['item_order_quantity']),
      itemPriceSnapshot: OrderLinesLineItemPriceSnapshot.fromMap(
          source['item_price_snapshot']),
      itemPriceTax:
          OrderLinesLineItemPriceTax.fromMap(source['item_price_tax']),
      itemProperties:
          OrderLinesLineItemProperties.fromMap(source['item_properties']),
      itemSaleTaxConfiguration: OrderLinesLineItemSaleTaxConfiguration.fromMap(
          source['item_sale_tax_configuration']),
      itemType: readText(source['item_type']),
      object: readText(source['object']),
      preOrderStockDetails: OrderLinesLinePreOrderStockDetails.fromMap(
          source['pre_order_stock_details']),
      shippingCost: readDecimal(source['shipping_cost']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      taxExemptWhenSold: readFlag(source['tax_exempt_when_sold']),
      total: readText(source['total']),
      version: readInteger(source['version']),
    );
  }

  final String? chargeItemUuid;

  final String? expectedDeliveryDate;

  final String? id;

  final OrderLinesLineItem? item;

  final OrderLinesLineItemAccountingCode? itemAccountingCode;

  final String? itemChargeType;

  final List<OrderLinesLineItemCustomAttribute?>? itemCustomAttributes;

  final String? itemDescription;

  final String? itemInvoiceNote;

  final int? itemOrderQuantity;

  final OrderLinesLineItemPriceSnapshot? itemPriceSnapshot;

  final OrderLinesLineItemPriceTax? itemPriceTax;

  final OrderLinesLineItemProperties? itemProperties;

  final OrderLinesLineItemSaleTaxConfiguration? itemSaleTaxConfiguration;

  final String? itemType;

  final String? object;

  final OrderLinesLinePreOrderStockDetails? preOrderStockDetails;

  final double? shippingCost;

  final String? subtotal;

  final String? tax;

  final bool? taxExemptWhenSold;

  final String? total;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'charge_item_uuid': chargeItemUuid,
        'expected_delivery_date': expectedDeliveryDate,
        'id': id,
        'item': item,
        'item_accounting_code': itemAccountingCode,
        'item_charge_type': itemChargeType,
        'item_custom_attributes': itemCustomAttributes,
        'item_description': itemDescription,
        'item_invoice_note': itemInvoiceNote,
        'item_order_quantity': itemOrderQuantity,
        'item_price_snapshot': itemPriceSnapshot,
        'item_price_tax': itemPriceTax,
        'item_properties': itemProperties,
        'item_sale_tax_configuration': itemSaleTaxConfiguration,
        'item_type': itemType,
        'object': object,
        'pre_order_stock_details': preOrderStockDetails,
        'shipping_cost': shippingCost,
        'subtotal': subtotal,
        'tax': tax,
        'tax_exempt_when_sold': taxExemptWhenSold,
        'total': total,
        'version': version,
      };
}

/// One entry of a [OrderPaymentMethods]'s `payment_methods`.
class OrderPaymentMethodsPaymentMethod extends Dto {
  const OrderPaymentMethodsPaymentMethod({
    this.createdBy,
    this.createdOn,
    this.isDefault,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.lastUsedAt,
    this.object,
    this.paymentCount,
    this.processor,
    this.processorType,
    this.reference,
    this.restrictedToOrders,
    this.specifiedOrderIds,
    this.status,
    this.version,
  });

  static OrderPaymentMethodsPaymentMethod? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderPaymentMethodsPaymentMethod(
      createdBy: readText(source['created_by']),
      createdOn: readText(source['created_on']),
      isDefault: readFlag(source['default']),
      id: readText(source['id']),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lastUsedAt: readAny(source['last_used_at']),
      object: readText(source['object']),
      paymentCount: readInteger(source['payment_count']),
      processor: OrderPaymentMethodsPaymentMethodProcessor.fromMap(
          source['processor']),
      processorType: readText(source['processor_type']),
      reference: readText(source['reference']),
      restrictedToOrders: readFlag(source['restricted_to_orders']),
      specifiedOrderIds: readText(source['specified_order_ids']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final String? createdBy;

  final String? createdOn;

  final bool? isDefault;

  final String? id;

  final String? lastUpdatedBy;

  final String? lastUpdatedOn;

  /// Untyped: null in every record measured.
  final Object? lastUsedAt;

  final String? object;

  final int? paymentCount;

  final OrderPaymentMethodsPaymentMethodProcessor? processor;

  final String? processorType;

  final String? reference;

  final bool? restrictedToOrders;

  final String? specifiedOrderIds;

  final String? status;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'default': isDefault,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'last_used_at': lastUsedAt,
        'object': object,
        'payment_count': paymentCount,
        'processor': processor,
        'processor_type': processorType,
        'reference': reference,
        'restricted_to_orders': restrictedToOrders,
        'specified_order_ids': specifiedOrderIds,
        'status': status,
        'version': version,
      };
}

/// A [OrderPdf]'s `pdf`.
class OrderPdfPdf extends Dto {
  const OrderPdfPdf({
    this.downloadUrl,
    this.fileSize,
    this.id,
    this.object,
    this.previewUrl,
  });

  static OrderPdfPdf? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderPdfPdf(
      downloadUrl: readText(source['download_url']),
      fileSize: readInteger(source['file_size']),
      id: readText(source['id']),
      object: readText(source['object']),
      previewUrl: readText(source['preview_url']),
    );
  }

  final String? downloadUrl;

  final int? fileSize;

  final String? id;

  final String? object;

  final String? previewUrl;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'download_url': downloadUrl,
        'file_size': fileSize,
        'id': id,
        'object': object,
        'preview_url': previewUrl,
      };
}

/// A [OrderLine]'s `item`.
class OrderLineItem extends Dto {
  const OrderLineItem({
    this.href,
    this.id,
    this.name,
    this.object,
    this.uuid,
  });

  static OrderLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLineItem(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      uuid: readText(source['uuid']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'uuid': uuid,
      };
}

/// A [OrderLine]'s `item_price_snapshot`.
class OrderLineItemPriceSnapshot extends Dto {
  const OrderLineItemPriceSnapshot({
    this.pricingRule,
  });

  static OrderLineItemPriceSnapshot? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLineItemPriceSnapshot(
      pricingRule:
          OrderLineItemPriceSnapshotPricingRule.fromMap(source['pricing_rule']),
    );
  }

  final OrderLineItemPriceSnapshotPricingRule? pricingRule;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'pricing_rule': pricingRule,
      };
}

/// A [OrderLine]'s `item_price_tax`.
class OrderLineItemPriceTax extends Dto {
  const OrderLineItemPriceTax({
    this.href,
    this.id,
    this.name,
    this.object,
    this.rate,
  });

  static OrderLineItemPriceTax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLineItemPriceTax(
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

/// A [OrderLine]'s `item_sale_tax_configuration`.
class OrderLineItemSaleTaxConfiguration extends Dto {
  const OrderLineItemSaleTaxConfiguration({
    this.salePriceIsBasedOn,
    this.taxCode,
  });

  static OrderLineItemSaleTaxConfiguration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLineItemSaleTaxConfiguration(
      salePriceIsBasedOn: readText(source['sale_price_is_based_on']),
      taxCode:
          OrderLineItemSaleTaxConfigurationTaxCode.fromMap(source['tax_code']),
    );
  }

  final String? salePriceIsBasedOn;

  final OrderLineItemSaleTaxConfigurationTaxCode? taxCode;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'sale_price_is_based_on': salePriceIsBasedOn,
        'tax_code': taxCode,
      };
}

/// A [OrderLine]'s `item_accounting_code`.
class OrderLineItemAccountingCode extends Dto {
  const OrderLineItemAccountingCode({
    this.salesRevenue,
  });

  static OrderLineItemAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLineItemAccountingCode(
      salesRevenue: readText(source['sales_revenue']),
    );
  }

  final String? salesRevenue;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'sales_revenue': salesRevenue,
      };
}

/// A [OrderLine]'s `pre_order_stock_details`.
class OrderLinePreOrderStockDetails extends Dto {
  const OrderLinePreOrderStockDetails({
    this.pendingReserve,
    this.reserved,
    this.sold,
  });

  static OrderLinePreOrderStockDetails? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLinePreOrderStockDetails(
      pendingReserve: readText(source['pending_reserve']),
      reserved: readText(source['reserved']),
      sold: readText(source['sold']),
    );
  }

  final String? pendingReserve;

  final String? reserved;

  final String? sold;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'pending_reserve': pendingReserve,
        'reserved': reserved,
        'sold': sold,
      };
}

/// A [OrderLine]'s `item_properties`.
class OrderLineItemProperties extends Dto {
  const OrderLineItemProperties({
    this.chargingAndBillingAlignment,
    this.chargingStartDate,
    this.proRataPartialPricingPeriod,
  });

  static OrderLineItemProperties? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLineItemProperties(
      chargingAndBillingAlignment:
          readText(source['charging_and_billing_alignment']),
      chargingStartDate: readText(source['charging_start_date']),
      proRataPartialPricingPeriod:
          readText(source['pro_rata_partial_pricing_period']),
    );
  }

  final String? chargingAndBillingAlignment;

  final String? chargingStartDate;

  final String? proRataPartialPricingPeriod;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'charging_and_billing_alignment': chargingAndBillingAlignment,
        'charging_start_date': chargingStartDate,
        'pro_rata_partial_pricing_period': proRataPartialPricingPeriod,
      };
}

/// A [OrderNoteView]'s `order`.
class OrderNoteViewOrder extends Dto {
  const OrderNoteViewOrder({
    this.href,
    this.id,
    this.object,
  });

  static OrderNoteViewOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderNoteViewOrder(
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

/// One entry of a [OrderNoteView]'s `attachments`.
class OrderNoteViewAttachment extends Dto {
  const OrderNoteViewAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static OrderNoteViewAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderNoteViewAttachment(
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

/// One entry of a [OrderNoteView]'s `watchers`.
class OrderNoteViewWatcher extends Dto {
  const OrderNoteViewWatcher({
    this.email,
    this.name,
    this.type,
  });

  static OrderNoteViewWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderNoteViewWatcher(
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

/// A [OrderNoteView]'s `created_by`.
class OrderNoteViewCreatedBy extends Dto {
  const OrderNoteViewCreatedBy({
    this.name,
    this.object,
  });

  static OrderNoteViewCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderNoteViewCreatedBy(
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

/// A [OrderNoteView]'s `last_updated_by`.
class OrderNoteViewLastUpdatedBy extends Dto {
  const OrderNoteViewLastUpdatedBy({
    this.name,
    this.object,
  });

  static OrderNoteViewLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderNoteViewLastUpdatedBy(
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

/// A [OrderPaymentMethod]'s `payment_method`.
class OrderPaymentMethodPaymentMethod extends Dto {
  const OrderPaymentMethodPaymentMethod({
    this.createdBy,
    this.createdOn,
    this.isDefault,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.lastUsedAt,
    this.object,
    this.paymentCount,
    this.processor,
    this.processorType,
    this.reference,
    this.restrictedToOrders,
    this.specifiedOrderIds,
    this.status,
    this.version,
  });

  static OrderPaymentMethodPaymentMethod? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderPaymentMethodPaymentMethod(
      createdBy: readText(source['created_by']),
      createdOn: readText(source['created_on']),
      isDefault: readFlag(source['default']),
      id: readText(source['id']),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lastUsedAt: readAny(source['last_used_at']),
      object: readText(source['object']),
      paymentCount: readInteger(source['payment_count']),
      processor:
          OrderPaymentMethodPaymentMethodProcessor.fromMap(source['processor']),
      processorType: readText(source['processor_type']),
      reference: readText(source['reference']),
      restrictedToOrders: readFlag(source['restricted_to_orders']),
      specifiedOrderIds: readText(source['specified_order_ids']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final String? createdBy;

  final String? createdOn;

  final bool? isDefault;

  final String? id;

  final String? lastUpdatedBy;

  final String? lastUpdatedOn;

  /// Untyped: null in every record measured.
  final Object? lastUsedAt;

  final String? object;

  final int? paymentCount;

  final OrderPaymentMethodPaymentMethodProcessor? processor;

  final String? processorType;

  final String? reference;

  final bool? restrictedToOrders;

  final String? specifiedOrderIds;

  final String? status;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'default': isDefault,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'last_used_at': lastUsedAt,
        'object': object,
        'payment_count': paymentCount,
        'processor': processor,
        'processor_type': processorType,
        'reference': reference,
        'restricted_to_orders': restrictedToOrders,
        'specified_order_ids': specifiedOrderIds,
        'status': status,
        'version': version,
      };
}

/// One entry of a [OrderNoteFileList]'s `data`.
class OrderNoteFileEntry extends Dto {
  const OrderNoteFileEntry({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static OrderNoteFileEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderNoteFileEntry(
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

/// A [AccountOrdersData]'s `currency`.
class AccountOrdersDataCurrency extends Dto {
  const AccountOrdersDataCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountOrdersDataCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountOrdersDataCurrency(
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

/// A [AccountOrdersData]'s `time_zone`.
class AccountOrdersDataTimeZone extends Dto {
  const AccountOrdersDataTimeZone({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountOrdersDataTimeZone? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountOrdersDataTimeZone(
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

/// A [AccountOrdersData]'s `custom_form`.
class AccountOrdersDataCustomForm extends Dto {
  const AccountOrdersDataCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountOrdersDataCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountOrdersDataCustomForm(
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

/// A [AccountOrdersData]'s `manager`.
class AccountOrdersDataManager extends Dto {
  const AccountOrdersDataManager({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountOrdersDataManager? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountOrdersDataManager(
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

/// A [AccountOrdersData]'s `account`.
class AccountOrdersDataAccount extends Dto {
  const AccountOrdersDataAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountOrdersDataAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountOrdersDataAccount(
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

/// A [AccountOrdersData]'s `discount_profile`.
class AccountOrdersDataDiscountProfile extends Dto {
  const AccountOrdersDataDiscountProfile({
    this.amount,
    this.href,
    this.id,
    this.name,
    this.object,
    this.redemptionCode,
    this.type,
  });

  static AccountOrdersDataDiscountProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountOrdersDataDiscountProfile(
      amount: readText(source['amount']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      redemptionCode: readText(source['redemption_code']),
      type: readText(source['type']),
    );
  }

  final String? amount;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? redemptionCode;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'redemption_code': redemptionCode,
        'type': type,
      };
}

/// A [AccountOrdersData]'s `billing_address`.
class AccountOrdersDataBillingAddress extends Dto {
  const AccountOrdersDataBillingAddress({
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    this.addressLine5,
    this.city,
    this.country,
    this.name,
    this.postalCode,
    this.state,
  });

  static AccountOrdersDataBillingAddress? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountOrdersDataBillingAddress(
      addressLine1: readText(source['address_line_1']),
      addressLine2: readText(source['address_line_2']),
      addressLine3: readText(source['address_line_3']),
      addressLine4: readText(source['address_line_4']),
      addressLine5: readText(source['address_line_5']),
      city: readText(source['city']),
      country: readText(source['country']),
      name: readText(source['name']),
      postalCode: readText(source['postal_code']),
      state: readText(source['state']),
    );
  }

  final String? addressLine1;

  final String? addressLine2;

  final String? addressLine3;

  final String? addressLine4;

  final String? addressLine5;

  final String? city;

  final String? country;

  final String? name;

  final String? postalCode;

  final String? state;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_line_3': addressLine3,
        'address_line_4': addressLine4,
        'address_line_5': addressLine5,
        'city': city,
        'country': country,
        'name': name,
        'postal_code': postalCode,
        'state': state,
      };
}

/// A [AccountOrdersData]'s `shipping_address`.
class AccountOrdersDataShippingAddress extends Dto {
  const AccountOrdersDataShippingAddress({
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    this.addressLine5,
    this.city,
    this.country,
    this.name,
    this.postalCode,
    this.state,
  });

  static AccountOrdersDataShippingAddress? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountOrdersDataShippingAddress(
      addressLine1: readText(source['address_line_1']),
      addressLine2: readText(source['address_line_2']),
      addressLine3: readText(source['address_line_3']),
      addressLine4: readText(source['address_line_4']),
      addressLine5: readText(source['address_line_5']),
      city: readText(source['city']),
      country: readText(source['country']),
      name: readText(source['name']),
      postalCode: readText(source['postal_code']),
      state: readText(source['state']),
    );
  }

  final String? addressLine1;

  final String? addressLine2;

  final String? addressLine3;

  final String? addressLine4;

  final String? addressLine5;

  final String? city;

  final String? country;

  final String? name;

  final String? postalCode;

  final String? state;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_line_3': addressLine3,
        'address_line_4': addressLine4,
        'address_line_5': addressLine5,
        'city': city,
        'country': country,
        'name': name,
        'postal_code': postalCode,
        'state': state,
      };
}

/// One entry of a [AccountOrdersData]'s `communication_preferences`.
class AccountOrdersDataCommunicationPreference extends Dto {
  const AccountOrdersDataCommunicationPreference({
    this.channel,
    this.enabled,
  });

  static AccountOrdersDataCommunicationPreference? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountOrdersDataCommunicationPreference(
      channel: readText(source['channel']),
      enabled: readFlag(source['enabled']),
    );
  }

  final String? channel;

  final bool? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'channel': channel,
        'enabled': enabled,
      };
}

/// A [AccountOrdersData]'s `billing_preferences`.
class AccountOrdersDataBillingPreferences extends Dto {
  const AccountOrdersDataBillingPreferences({
    this.billingPeriod,
    this.communicationProfile,
    this.consolidateInvoice,
    this.consolidateKey,
    this.fulfillmentMode,
    this.fulfillmentTerm,
    this.invoiceMode,
    this.invoiceTerm,
    this.paymentMode,
    this.paymentProcessor,
    this.paymentTerm,
    this.paymentTermAlignment,
    this.proformaProperties,
  });

  static AccountOrdersDataBillingPreferences? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountOrdersDataBillingPreferences(
      billingPeriod: readText(source['billing_period']),
      communicationProfile: readText(source['communication_profile']),
      consolidateInvoice: readFlag(source['consolidate_invoice']),
      consolidateKey: readText(source['consolidate_key']),
      fulfillmentMode: readText(source['fulfillment_mode']),
      fulfillmentTerm: readText(source['fulfillment_term']),
      invoiceMode: readText(source['invoice_mode']),
      invoiceTerm: readText(source['invoice_term']),
      paymentMode: readText(source['payment_mode']),
      paymentProcessor: readText(source['payment_processor']),
      paymentTerm: readText(source['payment_term']),
      paymentTermAlignment: readText(source['payment_term_alignment']),
      proformaProperties:
          AccountOrdersDataBillingPreferencesProformaProperties.fromMap(
              source['proforma_properties']),
    );
  }

  final String? billingPeriod;

  final String? communicationProfile;

  final bool? consolidateInvoice;

  final String? consolidateKey;

  final String? fulfillmentMode;

  final String? fulfillmentTerm;

  final String? invoiceMode;

  final String? invoiceTerm;

  final String? paymentMode;

  final String? paymentProcessor;

  final String? paymentTerm;

  final String? paymentTermAlignment;

  final AccountOrdersDataBillingPreferencesProformaProperties?
      proformaProperties;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'billing_period': billingPeriod,
        'communication_profile': communicationProfile,
        'consolidate_invoice': consolidateInvoice,
        'consolidate_key': consolidateKey,
        'fulfillment_mode': fulfillmentMode,
        'fulfillment_term': fulfillmentTerm,
        'invoice_mode': invoiceMode,
        'invoice_term': invoiceTerm,
        'payment_mode': paymentMode,
        'payment_processor': paymentProcessor,
        'payment_term': paymentTerm,
        'payment_term_alignment': paymentTermAlignment,
        'proforma_properties': proformaProperties,
      };
}

/// A [AccountOrdersData]'s `contract_properties`.
class AccountOrdersDataContractProperties extends Dto {
  const AccountOrdersDataContractProperties({
    this.allowDowngrade,
    this.allowDowngradeCharge,
    this.allowEarlyTermination,
    this.allowPostponement,
    this.allowTrial,
    this.allowUpgrade,
    this.autoRenewalEndsOn,
    this.autoRenewalRequireCustomerAcceptance,
    this.autoRenewalTerm,
    this.downgradeChargeFixed,
    this.downgradeChargeType,
    this.initialContractTerm,
    this.periodBeforeDowngrade,
    this.renewAutomatically,
    this.requireCustomerAcceptance,
    this.requiresPaymentMethod,
    this.terminationAccountingCode,
    this.terminationNoticePeriod,
  });

  static AccountOrdersDataContractProperties? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountOrdersDataContractProperties(
      allowDowngrade: readFlag(source['allow_downgrade']),
      allowDowngradeCharge: readFlag(source['allow_downgrade_charge']),
      allowEarlyTermination: readFlag(source['allow_early_termination']),
      allowPostponement: readFlag(source['allow_postponement']),
      allowTrial: readFlag(source['allow_trial']),
      allowUpgrade: readFlag(source['allow_upgrade']),
      autoRenewalEndsOn: readText(source['auto_renewal_ends_on']),
      autoRenewalRequireCustomerAcceptance:
          readFlag(source['auto_renewal_require_customer_acceptance']),
      autoRenewalTerm: readText(source['auto_renewal_term']),
      downgradeChargeFixed: readText(source['downgrade_charge_fixed']),
      downgradeChargeType: readText(source['downgrade_charge_type']),
      initialContractTerm: readText(source['initial_contract_term']),
      periodBeforeDowngrade: readText(source['period_before_downgrade']),
      renewAutomatically: readText(source['renew_automatically']),
      requireCustomerAcceptance:
          readFlag(source['require_customer_acceptance']),
      requiresPaymentMethod: readFlag(source['requires_payment_method']),
      terminationAccountingCode:
          readText(source['termination_accounting_code']),
      terminationNoticePeriod: readText(source['termination_notice_period']),
    );
  }

  final bool? allowDowngrade;

  final bool? allowDowngradeCharge;

  final bool? allowEarlyTermination;

  final bool? allowPostponement;

  final bool? allowTrial;

  final bool? allowUpgrade;

  final String? autoRenewalEndsOn;

  final bool? autoRenewalRequireCustomerAcceptance;

  final String? autoRenewalTerm;

  final String? downgradeChargeFixed;

  final String? downgradeChargeType;

  final String? initialContractTerm;

  final String? periodBeforeDowngrade;

  final String? renewAutomatically;

  final bool? requireCustomerAcceptance;

  final bool? requiresPaymentMethod;

  final String? terminationAccountingCode;

  final String? terminationNoticePeriod;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'allow_downgrade': allowDowngrade,
        'allow_downgrade_charge': allowDowngradeCharge,
        'allow_early_termination': allowEarlyTermination,
        'allow_postponement': allowPostponement,
        'allow_trial': allowTrial,
        'allow_upgrade': allowUpgrade,
        'auto_renewal_ends_on': autoRenewalEndsOn,
        'auto_renewal_require_customer_acceptance':
            autoRenewalRequireCustomerAcceptance,
        'auto_renewal_term': autoRenewalTerm,
        'downgrade_charge_fixed': downgradeChargeFixed,
        'downgrade_charge_type': downgradeChargeType,
        'initial_contract_term': initialContractTerm,
        'period_before_downgrade': periodBeforeDowngrade,
        'renew_automatically': renewAutomatically,
        'require_customer_acceptance': requireCustomerAcceptance,
        'requires_payment_method': requiresPaymentMethod,
        'termination_accounting_code': terminationAccountingCode,
        'termination_notice_period': terminationNoticePeriod,
      };
}

/// A [OrderReadBillingPreferences]'s `proforma_properties`.
class OrderReadBillingPreferencesProformaProperties extends Dto {
  const OrderReadBillingPreferencesProformaProperties({
    this.acceptanceDate,
    this.acceptanceRequired,
    this.acceptanceTerm,
    this.paymentRequired,
    this.termsAndConditions,
  });

  static OrderReadBillingPreferencesProformaProperties? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadBillingPreferencesProformaProperties(
      acceptanceDate: readAny(source['acceptance_date']),
      acceptanceRequired: readFlag(source['acceptance_required']),
      acceptanceTerm: readAny(source['acceptance_term']),
      paymentRequired: readFlag(source['payment_required']),
      termsAndConditions: readAny(source['terms_and_conditions']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? acceptanceDate;

  final bool? acceptanceRequired;

  /// Untyped: null in every record measured.
  final Object? acceptanceTerm;

  final bool? paymentRequired;

  /// Untyped: null in every record measured.
  final Object? termsAndConditions;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'acceptance_date': acceptanceDate,
        'acceptance_required': acceptanceRequired,
        'acceptance_term': acceptanceTerm,
        'payment_required': paymentRequired,
        'terms_and_conditions': termsAndConditions,
      };
}

/// A [OrderReadLine]'s `item`.
class OrderReadLineItem extends Dto {
  const OrderReadLineItem({
    this.href,
    this.id,
    this.name,
    this.object,
    this.uuid,
  });

  static OrderReadLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadLineItem(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      uuid: readText(source['uuid']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'uuid': uuid,
      };
}

/// A [OrderReadLine]'s `item_price_snapshot`.
class OrderReadLineItemPriceSnapshot extends Dto {
  const OrderReadLineItemPriceSnapshot({
    this.pricingRule,
  });

  static OrderReadLineItemPriceSnapshot? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadLineItemPriceSnapshot(
      pricingRule: OrderReadLineItemPriceSnapshotPricingRule.fromMap(
          source['pricing_rule']),
    );
  }

  final OrderReadLineItemPriceSnapshotPricingRule? pricingRule;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'pricing_rule': pricingRule,
      };
}

/// A [OrderReadLine]'s `item_price_tax`.
class OrderReadLineItemPriceTax extends Dto {
  const OrderReadLineItemPriceTax({
    this.href,
    this.id,
    this.name,
    this.object,
    this.rate,
  });

  static OrderReadLineItemPriceTax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadLineItemPriceTax(
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

/// A [OrderReadLine]'s `item_sale_tax_configuration`.
class OrderReadLineItemSaleTaxConfiguration extends Dto {
  const OrderReadLineItemSaleTaxConfiguration({
    this.salePriceIsBasedOn,
    this.taxCode,
  });

  static OrderReadLineItemSaleTaxConfiguration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadLineItemSaleTaxConfiguration(
      salePriceIsBasedOn: readText(source['sale_price_is_based_on']),
      taxCode: OrderReadLineItemSaleTaxConfigurationTaxCode.fromMap(
          source['tax_code']),
    );
  }

  final String? salePriceIsBasedOn;

  final OrderReadLineItemSaleTaxConfigurationTaxCode? taxCode;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'sale_price_is_based_on': salePriceIsBasedOn,
        'tax_code': taxCode,
      };
}

/// A [OrderReadLine]'s `item_accounting_code`.
class OrderReadLineItemAccountingCode extends Dto {
  const OrderReadLineItemAccountingCode({
    this.salesRevenue,
  });

  static OrderReadLineItemAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadLineItemAccountingCode(
      salesRevenue: readAny(source['sales_revenue']),
    );
  }

  /// Untyped: the records measured disagree on its type.
  final Object? salesRevenue;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'sales_revenue': salesRevenue,
      };
}

/// One entry of a [OrderReadLine]'s `item_custom_attributes`.
class OrderReadLineItemCustomAttribute extends Dto {
  const OrderReadLineItemCustomAttribute({
    this.name,
    this.value,
  });

  static OrderReadLineItemCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadLineItemCustomAttribute(
      name: readText(source['name']),
      value: readAny(source['value']),
    );
  }

  final String? name;

  /// Untyped: a string for a `STRING` attribute and a list of strings for others,
  /// so no single type reads them all.
  final Object? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'value': value,
      };
}

/// A [OrderReadLine]'s `pre_order_stock_details`.
class OrderReadLinePreOrderStockDetails extends Dto {
  const OrderReadLinePreOrderStockDetails({
    this.pendingReserve,
    this.reserved,
    this.sold,
  });

  static OrderReadLinePreOrderStockDetails? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadLinePreOrderStockDetails(
      pendingReserve: readText(source['pending_reserve']),
      reserved: readText(source['reserved']),
      sold: readText(source['sold']),
    );
  }

  final String? pendingReserve;

  final String? reserved;

  final String? sold;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'pending_reserve': pendingReserve,
        'reserved': reserved,
        'sold': sold,
      };
}

/// A [OrderReadLine]'s `item_properties`.
class OrderReadLineItemProperties extends Dto {
  const OrderReadLineItemProperties({
    this.billingMode,
    this.chargingAndBillingAlignment,
    this.chargingPeriod,
    this.chargingStartDate,
    this.proRataPartialChargingPeriod,
    this.proRataPartialPricingPeriod,
  });

  static OrderReadLineItemProperties? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadLineItemProperties(
      billingMode: readText(source['billing_mode']),
      chargingAndBillingAlignment:
          readText(source['charging_and_billing_alignment']),
      chargingPeriod: readText(source['charging_period']),
      chargingStartDate: readText(source['charging_start_date']),
      proRataPartialChargingPeriod:
          readText(source['pro_rata_partial_charging_period']),
      proRataPartialPricingPeriod:
          readText(source['pro_rata_partial_pricing_period']),
    );
  }

  final String? billingMode;

  final String? chargingAndBillingAlignment;

  final String? chargingPeriod;

  final String? chargingStartDate;

  final String? proRataPartialChargingPeriod;

  final String? proRataPartialPricingPeriod;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'billing_mode': billingMode,
        'charging_and_billing_alignment': chargingAndBillingAlignment,
        'charging_period': chargingPeriod,
        'charging_start_date': chargingStartDate,
        'pro_rata_partial_charging_period': proRataPartialChargingPeriod,
        'pro_rata_partial_pricing_period': proRataPartialPricingPeriod,
      };
}

/// A [OrderReadLine]'s `booking`.
class OrderReadLineBooking extends Dto {
  const OrderReadLineBooking({
    this.bookingEndTime,
    this.bookingStartTime,
    this.labourUuid,
  });

  static OrderReadLineBooking? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadLineBooking(
      bookingEndTime: readText(source['booking_end_time']),
      bookingStartTime: readText(source['booking_start_time']),
      labourUuid: readText(source['labour_uuid']),
    );
  }

  final String? bookingEndTime;

  final String? bookingStartTime;

  final String? labourUuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'booking_end_time': bookingEndTime,
        'booking_start_time': bookingStartTime,
        'labour_uuid': labourUuid,
      };
}

/// A [OrderBillingPreferencesBillingPreferences]'s `proforma_properties`.
class OrderBillingPreferencesBillingPreferencesProformaProperties extends Dto {
  const OrderBillingPreferencesBillingPreferencesProformaProperties({
    this.acceptanceDate,
    this.acceptanceRequired,
    this.acceptanceTerm,
    this.paymentRequired,
    this.termsAndConditions,
  });

  static OrderBillingPreferencesBillingPreferencesProformaProperties? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderBillingPreferencesBillingPreferencesProformaProperties(
      acceptanceDate: readAny(source['acceptance_date']),
      acceptanceRequired: readFlag(source['acceptance_required']),
      acceptanceTerm: readAny(source['acceptance_term']),
      paymentRequired: readFlag(source['payment_required']),
      termsAndConditions: readAny(source['terms_and_conditions']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? acceptanceDate;

  final bool? acceptanceRequired;

  /// Untyped: null in every record measured.
  final Object? acceptanceTerm;

  final bool? paymentRequired;

  /// Untyped: null in every record measured.
  final Object? termsAndConditions;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'acceptance_date': acceptanceDate,
        'acceptance_required': acceptanceRequired,
        'acceptance_term': acceptanceTerm,
        'payment_required': paymentRequired,
        'terms_and_conditions': termsAndConditions,
      };
}

/// A [OrderBillingPreferencesEntry]'s `proforma_properties`.
class OrderBillingPreferencesEntryProformaProperties extends Dto {
  const OrderBillingPreferencesEntryProformaProperties({
    this.acceptanceDate,
    this.acceptanceRequired,
    this.acceptanceTerm,
    this.paymentRequired,
    this.termsAndConditions,
  });

  static OrderBillingPreferencesEntryProformaProperties? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderBillingPreferencesEntryProformaProperties(
      acceptanceDate: readAny(source['acceptance_date']),
      acceptanceRequired: readFlag(source['acceptance_required']),
      acceptanceTerm: readText(source['acceptance_term']),
      paymentRequired: readFlag(source['payment_required']),
      termsAndConditions: readAny(source['terms_and_conditions']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? acceptanceDate;

  final bool? acceptanceRequired;

  final String? acceptanceTerm;

  final bool? paymentRequired;

  /// Untyped: null in every record measured.
  final Object? termsAndConditions;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'acceptance_date': acceptanceDate,
        'acceptance_required': acceptanceRequired,
        'acceptance_term': acceptanceTerm,
        'payment_required': paymentRequired,
        'terms_and_conditions': termsAndConditions,
      };
}

/// A [OrderLinesLine]'s `item`.
class OrderLinesLineItem extends Dto {
  const OrderLinesLineItem({
    this.href,
    this.id,
    this.name,
    this.object,
    this.uuid,
  });

  static OrderLinesLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLinesLineItem(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      uuid: readText(source['uuid']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'uuid': uuid,
      };
}

/// A [OrderLinesLine]'s `item_price_snapshot`.
class OrderLinesLineItemPriceSnapshot extends Dto {
  const OrderLinesLineItemPriceSnapshot({
    this.pricingRule,
  });

  static OrderLinesLineItemPriceSnapshot? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLinesLineItemPriceSnapshot(
      pricingRule: OrderLinesLineItemPriceSnapshotPricingRule.fromMap(
          source['pricing_rule']),
    );
  }

  final OrderLinesLineItemPriceSnapshotPricingRule? pricingRule;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'pricing_rule': pricingRule,
      };
}

/// A [OrderLinesLine]'s `item_price_tax`.
class OrderLinesLineItemPriceTax extends Dto {
  const OrderLinesLineItemPriceTax({
    this.href,
    this.id,
    this.name,
    this.object,
    this.rate,
  });

  static OrderLinesLineItemPriceTax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLinesLineItemPriceTax(
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

/// A [OrderLinesLine]'s `item_sale_tax_configuration`.
class OrderLinesLineItemSaleTaxConfiguration extends Dto {
  const OrderLinesLineItemSaleTaxConfiguration({
    this.salePriceIsBasedOn,
    this.taxCode,
  });

  static OrderLinesLineItemSaleTaxConfiguration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLinesLineItemSaleTaxConfiguration(
      salePriceIsBasedOn: readText(source['sale_price_is_based_on']),
      taxCode: OrderLinesLineItemSaleTaxConfigurationTaxCode.fromMap(
          source['tax_code']),
    );
  }

  final String? salePriceIsBasedOn;

  final OrderLinesLineItemSaleTaxConfigurationTaxCode? taxCode;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'sale_price_is_based_on': salePriceIsBasedOn,
        'tax_code': taxCode,
      };
}

/// A [OrderLinesLine]'s `item_accounting_code`.
class OrderLinesLineItemAccountingCode extends Dto {
  const OrderLinesLineItemAccountingCode({
    this.salesRevenue,
  });

  static OrderLinesLineItemAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLinesLineItemAccountingCode(
      salesRevenue: OrderLinesLineItemAccountingCodeSalesRevenue.fromMap(
          source['sales_revenue']),
    );
  }

  final OrderLinesLineItemAccountingCodeSalesRevenue? salesRevenue;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'sales_revenue': salesRevenue,
      };
}

/// One entry of a [OrderLinesLine]'s `item_custom_attributes`.
class OrderLinesLineItemCustomAttribute extends Dto {
  const OrderLinesLineItemCustomAttribute({
    this.name,
    this.value,
  });

  static OrderLinesLineItemCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLinesLineItemCustomAttribute(
      name: readText(source['name']),
      value: readList<String>(source['value'], readText),
    );
  }

  final String? name;

  final List<String?>? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'value': value,
      };
}

/// A [OrderLinesLine]'s `pre_order_stock_details`.
class OrderLinesLinePreOrderStockDetails extends Dto {
  const OrderLinesLinePreOrderStockDetails({
    this.pendingReserve,
    this.reserved,
    this.sold,
  });

  static OrderLinesLinePreOrderStockDetails? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLinesLinePreOrderStockDetails(
      pendingReserve: readText(source['pending_reserve']),
      reserved: readText(source['reserved']),
      sold: readText(source['sold']),
    );
  }

  final String? pendingReserve;

  final String? reserved;

  final String? sold;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'pending_reserve': pendingReserve,
        'reserved': reserved,
        'sold': sold,
      };
}

/// A [OrderLinesLine]'s `item_properties`.
class OrderLinesLineItemProperties extends Dto {
  const OrderLinesLineItemProperties({
    this.billingMode,
    this.chargingAndBillingAlignment,
    this.chargingPeriod,
    this.chargingStartDate,
    this.proRataPartialChargingPeriod,
    this.proRataPartialPricingPeriod,
  });

  static OrderLinesLineItemProperties? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLinesLineItemProperties(
      billingMode: readText(source['billing_mode']),
      chargingAndBillingAlignment:
          readText(source['charging_and_billing_alignment']),
      chargingPeriod: readText(source['charging_period']),
      chargingStartDate: readText(source['charging_start_date']),
      proRataPartialChargingPeriod:
          readText(source['pro_rata_partial_charging_period']),
      proRataPartialPricingPeriod:
          readText(source['pro_rata_partial_pricing_period']),
    );
  }

  final String? billingMode;

  final String? chargingAndBillingAlignment;

  final String? chargingPeriod;

  final String? chargingStartDate;

  final String? proRataPartialChargingPeriod;

  final String? proRataPartialPricingPeriod;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'billing_mode': billingMode,
        'charging_and_billing_alignment': chargingAndBillingAlignment,
        'charging_period': chargingPeriod,
        'charging_start_date': chargingStartDate,
        'pro_rata_partial_charging_period': proRataPartialChargingPeriod,
        'pro_rata_partial_pricing_period': proRataPartialPricingPeriod,
      };
}

/// A [OrderPaymentMethodsPaymentMethod]'s `processor`.
class OrderPaymentMethodsPaymentMethodProcessor extends Dto {
  const OrderPaymentMethodsPaymentMethodProcessor({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderPaymentMethodsPaymentMethodProcessor? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderPaymentMethodsPaymentMethodProcessor(
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

/// A [OrderLineItemPriceSnapshot]'s `pricing_rule`.
class OrderLineItemPriceSnapshotPricingRule extends Dto {
  const OrderLineItemPriceSnapshotPricingRule({
    this.price,
    this.pricePeriod,
    this.priceType,
    this.pricingLevel,
    this.pricingMethod,
    this.pricingSchedule,
    this.uom,
    this.uuid,
    this.version,
    this.warehouse,
  });

  static OrderLineItemPriceSnapshotPricingRule? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLineItemPriceSnapshotPricingRule(
      price: readDecimal(source['price']),
      pricePeriod: readText(source['price_period']),
      priceType: readText(source['price_type']),
      pricingLevel: readText(source['pricing_level']),
      pricingMethod: readText(source['pricing_method']),
      pricingSchedule: readText(source['pricing_schedule']),
      uom: readText(source['uom']),
      uuid: readText(source['uuid']),
      version: readText(source['version']),
      warehouse: readText(source['warehouse']),
    );
  }

  final double? price;

  final String? pricePeriod;

  final String? priceType;

  final String? pricingLevel;

  final String? pricingMethod;

  final String? pricingSchedule;

  final String? uom;

  final String? uuid;

  final String? version;

  final String? warehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'price': price,
        'price_period': pricePeriod,
        'price_type': priceType,
        'pricing_level': pricingLevel,
        'pricing_method': pricingMethod,
        'pricing_schedule': pricingSchedule,
        'uom': uom,
        'uuid': uuid,
        'version': version,
        'warehouse': warehouse,
      };
}

/// A [OrderLineItemSaleTaxConfiguration]'s `tax_code`.
class OrderLineItemSaleTaxConfigurationTaxCode extends Dto {
  const OrderLineItemSaleTaxConfigurationTaxCode({
    this.code,
    this.link,
    this.rate,
    this.uuid,
  });

  static OrderLineItemSaleTaxConfigurationTaxCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLineItemSaleTaxConfigurationTaxCode(
      code: readText(source['code']),
      link: readText(source['link']),
      rate: readText(source['rate']),
      uuid: readText(source['uuid']),
    );
  }

  final String? code;

  final String? link;

  final String? rate;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'link': link,
        'rate': rate,
        'uuid': uuid,
      };
}

/// A [OrderPaymentMethodPaymentMethod]'s `processor`.
class OrderPaymentMethodPaymentMethodProcessor extends Dto {
  const OrderPaymentMethodPaymentMethodProcessor({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderPaymentMethodPaymentMethodProcessor? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderPaymentMethodPaymentMethodProcessor(
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

/// A [AccountOrdersDataBillingPreferences]'s `proforma_properties`.
class AccountOrdersDataBillingPreferencesProformaProperties extends Dto {
  const AccountOrdersDataBillingPreferencesProformaProperties({
    this.acceptanceDate,
    this.acceptanceRequired,
    this.acceptanceTerm,
    this.paymentRequired,
    this.termsAndConditions,
  });

  static AccountOrdersDataBillingPreferencesProformaProperties? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountOrdersDataBillingPreferencesProformaProperties(
      acceptanceDate: readAny(source['acceptance_date']),
      acceptanceRequired: readFlag(source['acceptance_required']),
      acceptanceTerm: readAny(source['acceptance_term']),
      paymentRequired: readFlag(source['payment_required']),
      termsAndConditions: readAny(source['terms_and_conditions']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? acceptanceDate;

  final bool? acceptanceRequired;

  /// Untyped: null in every record measured.
  final Object? acceptanceTerm;

  final bool? paymentRequired;

  /// Untyped: null in every record measured.
  final Object? termsAndConditions;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'acceptance_date': acceptanceDate,
        'acceptance_required': acceptanceRequired,
        'acceptance_term': acceptanceTerm,
        'payment_required': paymentRequired,
        'terms_and_conditions': termsAndConditions,
      };
}

/// A [OrderReadLineItemPriceSnapshot]'s `pricing_rule`.
class OrderReadLineItemPriceSnapshotPricingRule extends Dto {
  const OrderReadLineItemPriceSnapshotPricingRule({
    this.price,
    this.pricePeriod,
    this.priceType,
    this.pricingLevel,
    this.pricingMethod,
    this.pricingSchedule,
    this.uom,
    this.uuid,
    this.version,
    this.warehouse,
  });

  static OrderReadLineItemPriceSnapshotPricingRule? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadLineItemPriceSnapshotPricingRule(
      price: readDecimal(source['price']),
      pricePeriod: readText(source['price_period']),
      priceType: readText(source['price_type']),
      pricingLevel: readText(source['pricing_level']),
      pricingMethod: readText(source['pricing_method']),
      pricingSchedule: readText(source['pricing_schedule']),
      uom: readText(source['uom']),
      uuid: readText(source['uuid']),
      version: readText(source['version']),
      warehouse: readText(source['warehouse']),
    );
  }

  final double? price;

  final String? pricePeriod;

  final String? priceType;

  final String? pricingLevel;

  final String? pricingMethod;

  final String? pricingSchedule;

  final String? uom;

  final String? uuid;

  final String? version;

  final String? warehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'price': price,
        'price_period': pricePeriod,
        'price_type': priceType,
        'pricing_level': pricingLevel,
        'pricing_method': pricingMethod,
        'pricing_schedule': pricingSchedule,
        'uom': uom,
        'uuid': uuid,
        'version': version,
        'warehouse': warehouse,
      };
}

/// A [OrderReadLineItemSaleTaxConfiguration]'s `tax_code`.
class OrderReadLineItemSaleTaxConfigurationTaxCode extends Dto {
  const OrderReadLineItemSaleTaxConfigurationTaxCode({
    this.code,
    this.link,
    this.rate,
    this.uuid,
  });

  static OrderReadLineItemSaleTaxConfigurationTaxCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderReadLineItemSaleTaxConfigurationTaxCode(
      code: readText(source['code']),
      link: readText(source['link']),
      rate: readAny(source['rate']),
      uuid: readText(source['uuid']),
    );
  }

  final String? code;

  final String? link;

  /// Untyped: the records measured disagree on its type.
  final Object? rate;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'link': link,
        'rate': rate,
        'uuid': uuid,
      };
}

/// A [OrderLinesLineItemPriceSnapshot]'s `pricing_rule`.
class OrderLinesLineItemPriceSnapshotPricingRule extends Dto {
  const OrderLinesLineItemPriceSnapshotPricingRule({
    this.price,
    this.pricePeriod,
    this.priceType,
    this.pricingLevel,
    this.pricingMethod,
    this.pricingSchedule,
    this.uom,
    this.uuid,
    this.version,
    this.warehouse,
  });

  static OrderLinesLineItemPriceSnapshotPricingRule? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLinesLineItemPriceSnapshotPricingRule(
      price: readDecimal(source['price']),
      pricePeriod: readText(source['price_period']),
      priceType: readText(source['price_type']),
      pricingLevel: readText(source['pricing_level']),
      pricingMethod: readText(source['pricing_method']),
      pricingSchedule: readText(source['pricing_schedule']),
      uom: readText(source['uom']),
      uuid: readText(source['uuid']),
      version: readText(source['version']),
      warehouse: readText(source['warehouse']),
    );
  }

  final double? price;

  final String? pricePeriod;

  final String? priceType;

  final String? pricingLevel;

  final String? pricingMethod;

  final String? pricingSchedule;

  final String? uom;

  final String? uuid;

  final String? version;

  final String? warehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'price': price,
        'price_period': pricePeriod,
        'price_type': priceType,
        'pricing_level': pricingLevel,
        'pricing_method': pricingMethod,
        'pricing_schedule': pricingSchedule,
        'uom': uom,
        'uuid': uuid,
        'version': version,
        'warehouse': warehouse,
      };
}

/// A [OrderLinesLineItemSaleTaxConfiguration]'s `tax_code`.
class OrderLinesLineItemSaleTaxConfigurationTaxCode extends Dto {
  const OrderLinesLineItemSaleTaxConfigurationTaxCode({
    this.code,
    this.link,
    this.rate,
    this.uuid,
  });

  static OrderLinesLineItemSaleTaxConfigurationTaxCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLinesLineItemSaleTaxConfigurationTaxCode(
      code: readText(source['code']),
      link: readText(source['link']),
      rate: readAny(source['rate']),
      uuid: readText(source['uuid']),
    );
  }

  final String? code;

  final String? link;

  /// Untyped: the records measured disagree on its type.
  final Object? rate;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'link': link,
        'rate': rate,
        'uuid': uuid,
      };
}

/// A [OrderLinesLineItemAccountingCode]'s `sales_revenue`.
class OrderLinesLineItemAccountingCodeSalesRevenue extends Dto {
  const OrderLinesLineItemAccountingCodeSalesRevenue({
    this.name,
  });

  static OrderLinesLineItemAccountingCodeSalesRevenue? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderLinesLineItemAccountingCodeSalesRevenue(
      name: readText(source['name']),
    );
  }

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
      };
}

/// What `getOrderKpis` answers, under `order_kpis`.
class OrderKpis extends Dto {
  const OrderKpis({
    this.deletedAt,
    this.estimatedTotal,
    this.lastCancelledAt,
    this.lastChangedAt,
    this.lastInvoiceIssueDate,
    this.lastInvoiceTotal,
    this.lastReactivatedAt,
    this.monthlyRecurringRevenue,
    this.nextInvoiceIssueDate,
    this.object,
    this.startDate,
    this.totalCollected,
    this.totalDue,
    this.totalInvoice,
    this.totalOutstanding,
    this.totalRevenue,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/kpis',
  ];

  static OrderKpis? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order_kpis');
    if (source == null) return null;
    return OrderKpis(
      deletedAt: readAny(source['deleted_at']),
      estimatedTotal: readText(source['estimated_total']),
      lastCancelledAt: readAny(source['last_cancelled_at']),
      lastChangedAt: readAny(source['last_changed_at']),
      lastInvoiceIssueDate: readAny(source['last_invoice_issue_date']),
      lastInvoiceTotal: readText(source['last_invoice_total']),
      lastReactivatedAt: readAny(source['last_reactivated_at']),
      monthlyRecurringRevenue: readText(source['monthly_recurring_revenue']),
      nextInvoiceIssueDate: readAny(source['next_invoice_issue_date']),
      object: readText(source['object']),
      startDate: readAny(source['start_date']),
      totalCollected: readText(source['total_collected']),
      totalDue: readText(source['total_due']),
      totalInvoice: readInteger(source['total_invoice']),
      totalOutstanding: readText(source['total_outstanding']),
      totalRevenue: readText(source['total_revenue']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? deletedAt;

  final String? estimatedTotal;

  /// Null in every record measured, so untyped.
  final Object? lastCancelledAt;

  /// Null in every record measured, so untyped.
  final Object? lastChangedAt;

  /// Null in every record measured, so untyped.
  final Object? lastInvoiceIssueDate;

  final String? lastInvoiceTotal;

  /// Null in every record measured, so untyped.
  final Object? lastReactivatedAt;

  final String? monthlyRecurringRevenue;

  /// Null in every record measured, so untyped.
  final Object? nextInvoiceIssueDate;

  final String? object;

  /// Null in every record measured, so untyped.
  final Object? startDate;

  final String? totalCollected;

  final String? totalDue;

  final int? totalInvoice;

  final String? totalOutstanding;

  final String? totalRevenue;

  @override
  String? get envelopeKey => 'order_kpis';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'deleted_at': deletedAt,
        'estimated_total': estimatedTotal,
        'last_cancelled_at': lastCancelledAt,
        'last_changed_at': lastChangedAt,
        'last_invoice_issue_date': lastInvoiceIssueDate,
        'last_invoice_total': lastInvoiceTotal,
        'last_reactivated_at': lastReactivatedAt,
        'monthly_recurring_revenue': monthlyRecurringRevenue,
        'next_invoice_issue_date': nextInvoiceIssueDate,
        'object': object,
        'start_date': startDate,
        'total_collected': totalCollected,
        'total_due': totalDue,
        'total_invoice': totalInvoice,
        'total_outstanding': totalOutstanding,
        'total_revenue': totalRevenue,
      };
}

/// One custom object with the order's instances of it, under `custom_object`.
class OrderCustomObject extends Dto {
  const OrderCustomObject({
    this.createdBy,
    this.createdOn,
    this.customComponent,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.instances,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.pagination,
    this.relation,
    this.useIn,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/custom_objects/{custom_object_id}',
    'GET /api/{api_version}/orders/{order_id}/custom_objects_instances/{custom_object_id}',
  ];

  static OrderCustomObject? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_object');
    if (source == null) return null;
    return OrderCustomObject(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      customComponent: readAny(source['custom_component']),
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      instances: readList<Object>(source['instances'], readAny),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      relation: readText(source['relation']),
      useIn: readText(source['use_in']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? customComponent;

  /// Null in every record measured, so untyped.
  final Object? description;

  final String? displayName;

  final String? href;

  final String? id;

  final List<Object?>? instances;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final Pagination? pagination;

  final String? relation;

  final String? useIn;

  @override
  String? get envelopeKey => 'custom_object';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_component': customComponent,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'instances': instances,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'pagination': pagination,
        'relation': relation,
        'use_in': useIn,
      };
}

/// What `getOrderItemFulfillment` answers, under `item_fulfillment`.
class OrderItemFulfillment extends Dto {
  const OrderItemFulfillment({
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
    'GET /api/{api_version}/orders/{order_id}/item_fulfillments/{fulfillment_id}',
  ];

  static OrderItemFulfillment? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item_fulfillment');
    if (source == null) return null;
    return OrderItemFulfillment(
      account: OrderItemFulfillmentAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy: OrderItemFulfillmentCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      customAttributes: readAny(source['custom_attributes']),
      deliveryStatus: readAny(source['delivery_status']),
      fulfillmentCompleted: readFlag(source['fulfillment_completed']),
      fulfillmentDate: readText(source['fulfillment_date']),
      fulfillmentNote: readAny(source['fulfillment_note']),
      fulfillmentStatus: readText(source['fulfillment_status']),
      fulfillments: readList<OrderItemFulfillmentFulfillment>(
          source['fulfillments'], OrderItemFulfillmentFulfillment.fromMap),
      href: readText(source['href']),
      id: readText(source['id']),
      invoice: OrderItemFulfillmentInvoice.fromMap(source['invoice']),
      lastUpdatedBy:
          OrderItemFulfillmentLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      order: readAny(source['order']),
      status: readText(source['status']),
      trackingNumber: readText(source['tracking_number']),
      version: readInteger(source['version']),
    );
  }

  final OrderItemFulfillmentAccount? account;

  final String? code;

  final OrderItemFulfillmentCreatedBy? createdBy;

  final String? createdOn;

  final Object? customAttributes;

  /// Null in every record measured, so untyped.
  final Object? deliveryStatus;

  final bool? fulfillmentCompleted;

  final String? fulfillmentDate;

  /// Null in every record measured, so untyped.
  final Object? fulfillmentNote;

  final String? fulfillmentStatus;

  final List<OrderItemFulfillmentFulfillment?>? fulfillments;

  final String? href;

  final String? id;

  final OrderItemFulfillmentInvoice? invoice;

  final OrderItemFulfillmentLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  /// Null in every record measured, so untyped.
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

/// What `getOrderPayment` answers, under `payment`.
class OrderPayment extends Dto {
  const OrderPayment({
    this.account,
    this.createdBy,
    this.createdOn,
    this.creditApplied,
    this.customAttributes,
    this.giftCertificateApplied,
    this.id,
    this.invoices,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.origin,
    this.paymentApplied,
    this.paymentNote,
    this.reconcileStatus,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/payments/{payment_id}',
  ];

  static OrderPayment? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'payment');
    if (source == null) return null;
    return OrderPayment(
      account: OrderPaymentAccount.fromMap(source['account']),
      createdBy: OrderPaymentCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditApplied: readList<Object>(source['credit_applied'], readAny),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      giftCertificateApplied:
          readList<Object>(source['gift_certificate_applied'], readAny),
      id: readText(source['id']),
      invoices: readList<OrderPaymentInvoice>(
          source['invoices'], OrderPaymentInvoice.fromMap),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      origin: readAny(source['origin']),
      paymentApplied: readList<OrderPaymentPaymentApplied>(
          source['payment_applied'], OrderPaymentPaymentApplied.fromMap),
      paymentNote: readText(source['payment_note']),
      reconcileStatus: readText(source['reconcile_status']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final OrderPaymentAccount? account;

  final OrderPaymentCreatedBy? createdBy;

  final String? createdOn;

  final List<Object?>? creditApplied;

  final List<Object?>? customAttributes;

  final List<Object?>? giftCertificateApplied;

  final String? id;

  final List<OrderPaymentInvoice?>? invoices;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedOn;

  final String? object;

  /// Null in every record measured, so untyped.
  final Object? origin;

  final List<OrderPaymentPaymentApplied?>? paymentApplied;

  final String? paymentNote;

  final String? reconcileStatus;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'payment';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_applied': creditApplied,
        'custom_attributes': customAttributes,
        'gift_certificate_applied': giftCertificateApplied,
        'id': id,
        'invoices': invoices,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'origin': origin,
        'payment_applied': paymentApplied,
        'payment_note': paymentNote,
        'reconcile_status': reconcileStatus,
        'status': status,
        'version': version,
      };
}

/// What `getOrderQuotePartialInvoices` answers, under `order`.
class OrderQuotePartialInvoices extends Dto {
  const OrderQuotePartialInvoices({
    this.partialInvoices,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/orders/{order_id}/quote_partial_invoices',
  ];

  static OrderQuotePartialInvoices? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return OrderQuotePartialInvoices(
      partialInvoices: readList<Object>(source['partial_invoices'], readAny),
    );
  }

  final List<Object?>? partialInvoices;

  @override
  String? get envelopeKey => 'order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'partial_invoices': partialInvoices,
      };
}

/// A [OrderItemFulfillment]'s `account`.
class OrderItemFulfillmentAccount extends Dto {
  const OrderItemFulfillmentAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderItemFulfillmentAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderItemFulfillmentAccount(
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

/// A [OrderItemFulfillment]'s `created_by`.
class OrderItemFulfillmentCreatedBy extends Dto {
  const OrderItemFulfillmentCreatedBy({
    this.name,
    this.object,
  });

  static OrderItemFulfillmentCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderItemFulfillmentCreatedBy(
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

/// One entry of a [OrderItemFulfillment]'s `fulfillments`.
class OrderItemFulfillmentFulfillment extends Dto {
  const OrderItemFulfillmentFulfillment({
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

  static OrderItemFulfillmentFulfillment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderItemFulfillmentFulfillment(
      fulfillmentIndex: readInteger(source['fulfillment_index']),
      fulfillmentQty: readDecimal(source['fulfillment_qty']),
      fulfillmentSentQty: readDecimal(source['fulfillment_sent_qty']),
      id: readText(source['id']),
      inventoryTracking: readAny(source['inventory_tracking']),
      item: OrderItemFulfillmentFulfillmentItem.fromMap(source['item']),
      object: readText(source['object']),
      pendingReturn: readDecimal(source['pending_return']),
      returned: readAny(source['returned']),
      servingStatus: readText(source['serving_status']),
      uom: readAny(source['uom']),
      uomPrecision: readAny(source['uom_precision']),
    );
  }

  final int? fulfillmentIndex;

  final double? fulfillmentQty;

  final double? fulfillmentSentQty;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? inventoryTracking;

  final OrderItemFulfillmentFulfillmentItem? item;

  final String? object;

  final double? pendingReturn;

  /// Null in every record measured, so untyped.
  final Object? returned;

  final String? servingStatus;

  /// Null in every record measured, so untyped.
  final Object? uom;

  /// Null in every record measured, so untyped.
  final Object? uomPrecision;

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

/// A [OrderItemFulfillmentFulfillment]'s `item`.
class OrderItemFulfillmentFulfillmentItem extends Dto {
  const OrderItemFulfillmentFulfillmentItem({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderItemFulfillmentFulfillmentItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderItemFulfillmentFulfillmentItem(
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

/// A [OrderItemFulfillment]'s `invoice`.
class OrderItemFulfillmentInvoice extends Dto {
  const OrderItemFulfillmentInvoice({
    this.href,
    this.id,
    this.object,
  });

  static OrderItemFulfillmentInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderItemFulfillmentInvoice(
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

/// A [OrderItemFulfillment]'s `last_updated_by`.
class OrderItemFulfillmentLastUpdatedBy extends Dto {
  const OrderItemFulfillmentLastUpdatedBy({
    this.name,
    this.object,
  });

  static OrderItemFulfillmentLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderItemFulfillmentLastUpdatedBy(
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

/// A [OrderPayment]'s `account`.
class OrderPaymentAccount extends Dto {
  const OrderPaymentAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static OrderPaymentAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderPaymentAccount(
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

/// A [OrderPayment]'s `created_by`.
class OrderPaymentCreatedBy extends Dto {
  const OrderPaymentCreatedBy({
    this.name,
    this.object,
  });

  static OrderPaymentCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderPaymentCreatedBy(
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

/// One entry of a [OrderPayment]'s `invoices`.
class OrderPaymentInvoice extends Dto {
  const OrderPaymentInvoice({
    this.applied,
    this.dueDate,
    this.id,
    this.issueDate,
    this.outstanding,
    this.total,
  });

  static OrderPaymentInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderPaymentInvoice(
      applied: readText(source['applied']),
      dueDate: readText(source['due_date']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      outstanding: readText(source['outstanding']),
      total: readText(source['total']),
    );
  }

  final String? applied;

  final String? dueDate;

  final String? id;

  final String? issueDate;

  final String? outstanding;

  final String? total;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'applied': applied,
        'due_date': dueDate,
        'id': id,
        'issue_date': issueDate,
        'outstanding': outstanding,
        'total': total,
      };
}

/// One entry of a [OrderPayment]'s `payment_applied`.
class OrderPaymentPaymentApplied extends Dto {
  const OrderPaymentPaymentApplied({
    this.amount,
    this.gatewayResponse,
    this.method,
    this.processor,
    this.reference,
  });

  static OrderPaymentPaymentApplied? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return OrderPaymentPaymentApplied(
      amount: readText(source['amount']),
      gatewayResponse: readAny(source['gateway_response']),
      method: readText(source['method']),
      processor: readText(source['processor']),
      reference: readText(source['reference']),
    );
  }

  final String? amount;

  /// Null in every record measured, so untyped.
  final Object? gatewayResponse;

  final String? method;

  final String? processor;

  final String? reference;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'gateway_response': gatewayResponse,
        'method': method,
        'processor': processor,
        'reference': reference,
      };
}
