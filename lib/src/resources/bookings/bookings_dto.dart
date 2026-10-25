/// Typed views over the v4 bookings bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The booking body.
class Booking extends Dto {
  const Booking({
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
    'GET /api/{api_version}/booking',
  ];

  static Booking? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return Booking(
      account: BookingAccount.fromMap(source['account']),
      allowContract: readFlag(source['allow_contract']),
      billingAddress: BookingBillingAddress.fromMap(source['billing_address']),
      billingPreferences:
          BookingBillingPreferences.fromMap(source['billing_preferences']),
      billingStartDate: readText(source['billing_start_date']),
      billingStartDayOfMonth: readText(source['billing_start_day_of_month']),
      communicationPreferences: readList<BookingCommunicationPreference>(
          source['communication_preferences'],
          BookingCommunicationPreference.fromMap),
      contractProperties:
          BookingContractProperties.fromMap(source['contract_properties']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: BookingCurrency.fromMap(source['currency']),
      customForm: BookingCustomForm.fromMap(source['custom_form']),
      customerPurchaseOrderId: readText(source['customer_purchase_order_id']),
      description: readText(source['description']),
      discountProfile:
          BookingDiscountProfile.fromMap(source['discount_profile']),
      displayName: readText(source['display_name']),
      id: readText(source['id']),
      invoiceNote: readText(source['invoice_note']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      manager: BookingManager.fromMap(source['manager']),
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
      referralAccount:
          BookingReferralAccount.fromMap(source['referral_account']),
      salesRep: BookingSalesRep.fromMap(source['sales_rep']),
      shippingAddress:
          BookingShippingAddress.fromMap(source['shipping_address']),
      shippingCost: readDecimal(source['shipping_cost']),
      shippingProfile:
          BookingShippingProfile.fromMap(source['shipping_profile']),
      status: readText(source['status']),
      timeZone: BookingTimeZone.fromMap(source['time_zone']),
      version: readInteger(source['version']),
    );
  }

  final BookingAccount? account;

  final bool? allowContract;

  final BookingBillingAddress? billingAddress;

  final BookingBillingPreferences? billingPreferences;

  final String? billingStartDate;

  final String? billingStartDayOfMonth;

  final List<BookingCommunicationPreference?>? communicationPreferences;

  final BookingContractProperties? contractProperties;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final BookingCurrency? currency;

  final BookingCustomForm? customForm;

  final String? customerPurchaseOrderId;

  final String? description;

  final BookingDiscountProfile? discountProfile;

  final String? displayName;

  final String? id;

  final String? invoiceNote;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final BookingManager? manager;

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

  final BookingReferralAccount? referralAccount;

  final BookingSalesRep? salesRep;

  final BookingShippingAddress? shippingAddress;

  final double? shippingCost;

  final BookingShippingProfile? shippingProfile;

  final String? status;

  final BookingTimeZone? timeZone;

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

/// A page of Booking records.
class BookingList extends Dto {
  const BookingList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/booking',
  ];

  static BookingList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingList(
      data: readList<Booking>(source['data'], Booking.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Booking?>? data;

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

/// The booking by id body.
class BookingById extends Dto {
  const BookingById({
    this.account,
    this.activityLogs,
    this.allowContract,
    this.billingAddress,
    this.billingPreferences,
    this.billingStartDate,
    this.communicationPreferences,
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
    'GET /api/{api_version}/booking/{booking_id}',
  ];

  static BookingById? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return BookingById(
      account: BookingByIdAccount.fromMap(source['account']),
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      allowContract: readFlag(source['allow_contract']),
      billingAddress:
          BookingByIdBillingAddress.fromMap(source['billing_address']),
      billingPreferences:
          BookingByIdBillingPreferences.fromMap(source['billing_preferences']),
      billingStartDate: readText(source['billing_start_date']),
      communicationPreferences: readList<BookingByIdCommunicationPreference>(
          source['communication_preferences'],
          BookingByIdCommunicationPreference.fromMap),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: BookingByIdCurrency.fromMap(source['currency']),
      customAttributes: readList<BookingByIdCustomAttribute>(
          source['custom_attributes'], BookingByIdCustomAttribute.fromMap),
      customForm: BookingByIdCustomForm.fromMap(source['custom_form']),
      customerPurchaseOrderId: readText(source['customer_purchase_order_id']),
      description: readText(source['description']),
      discountProfile: readAny(source['discount_profile']),
      displayName: readText(source['display_name']),
      id: readText(source['id']),
      invoiceNote: readText(source['invoice_note']),
      kpis: BookingByIdKpis.fromMap(source['kpis']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lines:
          readList<BookingByIdLine>(source['lines'], BookingByIdLine.fromMap),
      manager: BookingByIdManager.fromMap(source['manager']),
      name: readText(source['name']),
      nextBillingFromDate: readText(source['next_billing_from_date']),
      nextBillingFromDateUtc: readText(source['next_billing_from_date_utc']),
      object: readText(source['object']),
      orderStartDate: readText(source['order_start_date']),
      orderType: readText(source['order_type']),
      origin: readText(source['origin']),
      originalTotal: readAny(source['original_total']),
      preOrder: readFlag(source['pre_order']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      quoteConverted: readFlag(source['quote_converted']),
      quoteOrder: readFlag(source['quote_order']),
      referralAccount: readAny(source['referral_account']),
      salesRep: readAny(source['sales_rep']),
      shippingAddress: readAny(source['shipping_address']),
      shippingCost: readDecimal(source['shipping_cost']),
      shippingLineItems:
          readList<Object>(source['shipping_line_items'], readAny),
      shippingProfile: readAny(source['shipping_profile']),
      status: readText(source['status']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      timeZone: BookingByIdTimeZone.fromMap(source['time_zone']),
      total: readText(source['total']),
      version: readInteger(source['version']),
    );
  }

  final BookingByIdAccount? account;

  /// Empty in every record measured; sent by the writes, not by the reads.
  final List<Object?>? activityLogs;

  final bool? allowContract;

  final BookingByIdBillingAddress? billingAddress;

  final BookingByIdBillingPreferences? billingPreferences;

  final String? billingStartDate;

  final List<BookingByIdCommunicationPreference?>? communicationPreferences;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final BookingByIdCurrency? currency;

  final List<BookingByIdCustomAttribute?>? customAttributes;

  final BookingByIdCustomForm? customForm;

  final String? customerPurchaseOrderId;

  final String? description;

  /// Untyped: never populated in the records measured.
  final Object? discountProfile;

  final String? displayName;

  final String? id;

  final String? invoiceNote;

  final BookingByIdKpis? kpis;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final List<BookingByIdLine?>? lines;

  final BookingByIdManager? manager;

  final String? name;

  final String? nextBillingFromDate;

  final String? nextBillingFromDateUtc;

  final String? object;

  final String? orderStartDate;

  final String? orderType;

  final String? origin;

  /// Untyped: never populated in the records measured.
  final Object? originalTotal;

  final bool? preOrder;

  final bool? priceTaxInclusive;

  final bool? quoteConverted;

  final bool? quoteOrder;

  /// Untyped: never populated in the records measured.
  final Object? referralAccount;

  /// Untyped: never populated in the records measured.
  final Object? salesRep;

  /// Untyped: never populated in the records measured.
  final Object? shippingAddress;

  final double? shippingCost;

  final List<Object?>? shippingLineItems;

  /// Untyped: never populated in the records measured.
  final Object? shippingProfile;

  final String? status;

  final String? subtotal;

  final String? tax;

  final BookingByIdTimeZone? timeZone;

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
        'communication_preferences': communicationPreferences,
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

/// A [BookingById]'s `currency`.
class BookingByIdCurrency extends Dto {
  const BookingByIdCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingByIdCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdCurrency(
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

/// A [BookingById]'s `time_zone`.
class BookingByIdTimeZone extends Dto {
  const BookingByIdTimeZone({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingByIdTimeZone? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdTimeZone(
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

/// A [BookingById]'s `custom_form`.
class BookingByIdCustomForm extends Dto {
  const BookingByIdCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingByIdCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdCustomForm(
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

/// A [BookingById]'s `manager`.
class BookingByIdManager extends Dto {
  const BookingByIdManager({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingByIdManager? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdManager(
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

/// A [BookingById]'s `account`.
class BookingByIdAccount extends Dto {
  const BookingByIdAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingByIdAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdAccount(
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

/// A [BookingById]'s `billing_address`.
class BookingByIdBillingAddress extends Dto {
  const BookingByIdBillingAddress({
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

  static BookingByIdBillingAddress? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdBillingAddress(
      addressLine1: readText(source['address_line_1']),
      addressLine2: readText(source['address_line_2']),
      addressLine3: readAny(source['address_line_3']),
      addressLine4: readAny(source['address_line_4']),
      addressLine5: readAny(source['address_line_5']),
      city: readText(source['city']),
      country: readText(source['country']),
      name: readText(source['name']),
      postalCode: readText(source['postal_code']),
      state: readText(source['state']),
    );
  }

  final String? addressLine1;

  final String? addressLine2;

  /// Untyped: null in every record measured.
  final Object? addressLine3;

  /// Untyped: null in every record measured.
  final Object? addressLine4;

  /// Untyped: null in every record measured.
  final Object? addressLine5;

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

/// One entry of a [BookingById]'s `communication_preferences`.
class BookingByIdCommunicationPreference extends Dto {
  const BookingByIdCommunicationPreference({
    this.channel,
    this.enabled,
  });

  static BookingByIdCommunicationPreference? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdCommunicationPreference(
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

/// A [BookingById]'s `billing_preferences`.
class BookingByIdBillingPreferences extends Dto {
  const BookingByIdBillingPreferences({
    this.billingPeriod,
    this.communicationProfile,
    this.consolidateInvoice,
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

  static BookingByIdBillingPreferences? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdBillingPreferences(
      billingPeriod: readText(source['billing_period']),
      communicationProfile: readText(source['communication_profile']),
      consolidateInvoice: readFlag(source['consolidate_invoice']),
      fulfillmentMode: readText(source['fulfillment_mode']),
      fulfillmentTerm: readText(source['fulfillment_term']),
      invoiceMode: readText(source['invoice_mode']),
      invoiceTerm: readText(source['invoice_term']),
      paymentMode: readText(source['payment_mode']),
      paymentProcessor: readText(source['payment_processor']),
      paymentTerm: readText(source['payment_term']),
      paymentTermAlignment: readText(source['payment_term_alignment']),
      proformaProperties:
          BookingByIdBillingPreferencesProformaProperties.fromMap(
              source['proforma_properties']),
    );
  }

  final String? billingPeriod;

  final String? communicationProfile;

  final bool? consolidateInvoice;

  final String? fulfillmentMode;

  final String? fulfillmentTerm;

  final String? invoiceMode;

  final String? invoiceTerm;

  final String? paymentMode;

  final String? paymentProcessor;

  final String? paymentTerm;

  final String? paymentTermAlignment;

  final BookingByIdBillingPreferencesProformaProperties? proformaProperties;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'billing_period': billingPeriod,
        'communication_profile': communicationProfile,
        'consolidate_invoice': consolidateInvoice,
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

/// One entry of a [BookingById]'s `custom_attributes`.
class BookingByIdCustomAttribute extends Dto {
  const BookingByIdCustomAttribute({
    this.href,
    this.id,
    this.name,
    this.object,
    this.type,
    this.value,
  });

  static BookingByIdCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdCustomAttribute(
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

  /// Untyped: the records measured disagree on its type.
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

/// One entry of a [BookingById]'s `lines`.
class BookingByIdLine extends Dto {
  const BookingByIdLine({
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

  static BookingByIdLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdLine(
      chargeItemUuid: readText(source['charge_item_uuid']),
      expectedDeliveryDate: readText(source['expected_delivery_date']),
      id: readText(source['id']),
      item: BookingByIdLineItem.fromMap(source['item']),
      itemAccountingCode: BookingByIdLineItemAccountingCode.fromMap(
          source['item_accounting_code']),
      itemChargeType: readText(source['item_charge_type']),
      itemCustomAttributes:
          readList<Object>(source['item_custom_attributes'], readAny),
      itemDescription: readText(source['item_description']),
      itemInvoiceNote: readText(source['item_invoice_note']),
      itemOrderQuantity: readInteger(source['item_order_quantity']),
      itemPriceSnapshot: BookingByIdLineItemPriceSnapshot.fromMap(
          source['item_price_snapshot']),
      itemPriceTax:
          BookingByIdLineItemPriceTax.fromMap(source['item_price_tax']),
      itemProperties:
          BookingByIdLineItemProperties.fromMap(source['item_properties']),
      itemSaleTaxConfiguration: BookingByIdLineItemSaleTaxConfiguration.fromMap(
          source['item_sale_tax_configuration']),
      itemType: readText(source['item_type']),
      object: readText(source['object']),
      preOrderStockDetails: BookingByIdLinePreOrderStockDetails.fromMap(
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

  final BookingByIdLineItem? item;

  final BookingByIdLineItemAccountingCode? itemAccountingCode;

  final String? itemChargeType;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? itemCustomAttributes;

  final String? itemDescription;

  final String? itemInvoiceNote;

  final int? itemOrderQuantity;

  final BookingByIdLineItemPriceSnapshot? itemPriceSnapshot;

  final BookingByIdLineItemPriceTax? itemPriceTax;

  final BookingByIdLineItemProperties? itemProperties;

  final BookingByIdLineItemSaleTaxConfiguration? itemSaleTaxConfiguration;

  final String? itemType;

  final String? object;

  final BookingByIdLinePreOrderStockDetails? preOrderStockDetails;

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

/// A [BookingById]'s `kpis`.
class BookingByIdKpis extends Dto {
  const BookingByIdKpis({
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

  static BookingByIdKpis? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdKpis(
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

/// A [Booking]'s `currency`.
class BookingCurrency extends Dto {
  const BookingCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingCurrency(
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

/// A [Booking]'s `time_zone`.
class BookingTimeZone extends Dto {
  const BookingTimeZone({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingTimeZone? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingTimeZone(
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

/// A [Booking]'s `custom_form`.
class BookingCustomForm extends Dto {
  const BookingCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingCustomForm(
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

/// A [Booking]'s `manager`.
class BookingManager extends Dto {
  const BookingManager({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingManager? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingManager(
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

/// A [Booking]'s `sales_rep`.
class BookingSalesRep extends Dto {
  const BookingSalesRep({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingSalesRep? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingSalesRep(
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

/// A [Booking]'s `shipping_profile`.
class BookingShippingProfile extends Dto {
  const BookingShippingProfile({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingShippingProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingShippingProfile(
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

/// A [Booking]'s `account`.
class BookingAccount extends Dto {
  const BookingAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingAccount(
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

/// A [Booking]'s `referral_account`.
class BookingReferralAccount extends Dto {
  const BookingReferralAccount({
    this.href,
    this.id,
    this.object,
  });

  static BookingReferralAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingReferralAccount(
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

/// A [Booking]'s `discount_profile`.
class BookingDiscountProfile extends Dto {
  const BookingDiscountProfile({
    this.amount,
    this.href,
    this.id,
    this.name,
    this.object,
    this.redemptionCode,
    this.type,
  });

  static BookingDiscountProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingDiscountProfile(
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

/// A [Booking]'s `billing_address`.
class BookingBillingAddress extends Dto {
  const BookingBillingAddress({
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

  static BookingBillingAddress? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingBillingAddress(
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

/// A [Booking]'s `shipping_address`.
class BookingShippingAddress extends Dto {
  const BookingShippingAddress({
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

  static BookingShippingAddress? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingShippingAddress(
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

/// One entry of a [Booking]'s `communication_preferences`.
class BookingCommunicationPreference extends Dto {
  const BookingCommunicationPreference({
    this.channel,
    this.enabled,
  });

  static BookingCommunicationPreference? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingCommunicationPreference(
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

/// A [Booking]'s `billing_preferences`.
class BookingBillingPreferences extends Dto {
  const BookingBillingPreferences({
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

  static BookingBillingPreferences? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingBillingPreferences(
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
      proformaProperties: BookingBillingPreferencesProformaProperties.fromMap(
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

  final BookingBillingPreferencesProformaProperties? proformaProperties;

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

/// A [Booking]'s `contract_properties`.
class BookingContractProperties extends Dto {
  const BookingContractProperties({
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

  static BookingContractProperties? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingContractProperties(
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

/// A [BookingByIdBillingPreferences]'s `proforma_properties`.
class BookingByIdBillingPreferencesProformaProperties extends Dto {
  const BookingByIdBillingPreferencesProformaProperties({
    this.acceptanceDate,
    this.acceptanceRequired,
    this.acceptanceTerm,
    this.paymentRequired,
    this.termsAndConditions,
  });

  static BookingByIdBillingPreferencesProformaProperties? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdBillingPreferencesProformaProperties(
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

/// A [BookingByIdLine]'s `item`.
class BookingByIdLineItem extends Dto {
  const BookingByIdLineItem({
    this.href,
    this.id,
    this.name,
    this.object,
    this.uuid,
  });

  static BookingByIdLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdLineItem(
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

/// A [BookingByIdLine]'s `item_price_snapshot`.
class BookingByIdLineItemPriceSnapshot extends Dto {
  const BookingByIdLineItemPriceSnapshot({
    this.pricingRule,
  });

  static BookingByIdLineItemPriceSnapshot? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdLineItemPriceSnapshot(
      pricingRule: BookingByIdLineItemPriceSnapshotPricingRule.fromMap(
          source['pricing_rule']),
    );
  }

  final BookingByIdLineItemPriceSnapshotPricingRule? pricingRule;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'pricing_rule': pricingRule,
      };
}

/// A [BookingByIdLine]'s `item_price_tax`.
class BookingByIdLineItemPriceTax extends Dto {
  const BookingByIdLineItemPriceTax({
    this.href,
    this.id,
    this.name,
    this.object,
    this.rate,
  });

  static BookingByIdLineItemPriceTax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdLineItemPriceTax(
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

/// A [BookingByIdLine]'s `item_sale_tax_configuration`.
class BookingByIdLineItemSaleTaxConfiguration extends Dto {
  const BookingByIdLineItemSaleTaxConfiguration({
    this.salePriceIsBasedOn,
    this.taxCode,
  });

  static BookingByIdLineItemSaleTaxConfiguration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdLineItemSaleTaxConfiguration(
      salePriceIsBasedOn: readText(source['sale_price_is_based_on']),
      taxCode: BookingByIdLineItemSaleTaxConfigurationTaxCode.fromMap(
          source['tax_code']),
    );
  }

  final String? salePriceIsBasedOn;

  final BookingByIdLineItemSaleTaxConfigurationTaxCode? taxCode;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'sale_price_is_based_on': salePriceIsBasedOn,
        'tax_code': taxCode,
      };
}

/// A [BookingByIdLine]'s `item_accounting_code`.
class BookingByIdLineItemAccountingCode extends Dto {
  const BookingByIdLineItemAccountingCode({
    this.salesRevenue,
  });

  static BookingByIdLineItemAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdLineItemAccountingCode(
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

/// A [BookingByIdLine]'s `pre_order_stock_details`.
class BookingByIdLinePreOrderStockDetails extends Dto {
  const BookingByIdLinePreOrderStockDetails({
    this.pendingReserve,
    this.reserved,
    this.sold,
  });

  static BookingByIdLinePreOrderStockDetails? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdLinePreOrderStockDetails(
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

/// A [BookingByIdLine]'s `item_properties`.
class BookingByIdLineItemProperties extends Dto {
  const BookingByIdLineItemProperties({
    this.billingMode,
    this.chargingAndBillingAlignment,
    this.chargingStartDate,
    this.proRataPartialPricingPeriod,
  });

  static BookingByIdLineItemProperties? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdLineItemProperties(
      billingMode: readText(source['billing_mode']),
      chargingAndBillingAlignment:
          readText(source['charging_and_billing_alignment']),
      chargingStartDate: readText(source['charging_start_date']),
      proRataPartialPricingPeriod:
          readText(source['pro_rata_partial_pricing_period']),
    );
  }

  final String? billingMode;

  final String? chargingAndBillingAlignment;

  final String? chargingStartDate;

  final String? proRataPartialPricingPeriod;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'billing_mode': billingMode,
        'charging_and_billing_alignment': chargingAndBillingAlignment,
        'charging_start_date': chargingStartDate,
        'pro_rata_partial_pricing_period': proRataPartialPricingPeriod,
      };
}

/// A [BookingBillingPreferences]'s `proforma_properties`.
class BookingBillingPreferencesProformaProperties extends Dto {
  const BookingBillingPreferencesProformaProperties({
    this.acceptanceDate,
    this.acceptanceRequired,
    this.acceptanceTerm,
    this.paymentRequired,
    this.termsAndConditions,
  });

  static BookingBillingPreferencesProformaProperties? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingBillingPreferencesProformaProperties(
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

/// A [BookingByIdLineItemPriceSnapshot]'s `pricing_rule`.
class BookingByIdLineItemPriceSnapshotPricingRule extends Dto {
  const BookingByIdLineItemPriceSnapshotPricingRule({
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

  static BookingByIdLineItemPriceSnapshotPricingRule? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdLineItemPriceSnapshotPricingRule(
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

/// A [BookingByIdLineItemSaleTaxConfiguration]'s `tax_code`.
class BookingByIdLineItemSaleTaxConfigurationTaxCode extends Dto {
  const BookingByIdLineItemSaleTaxConfigurationTaxCode({
    this.code,
    this.link,
    this.rate,
    this.uuid,
  });

  static BookingByIdLineItemSaleTaxConfigurationTaxCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingByIdLineItemSaleTaxConfigurationTaxCode(
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

/// One page of every order's notes, under `data`.
class BookingNoteList extends Dto {
  const BookingNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/booking/notes',
  ];

  static BookingNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingNoteList(
      data: readList<BookingNote>(source['data'], BookingNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<BookingNote?>? data;

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

/// What `getBookingBillingPreferences` answers, under `order`.
class BookingBillingPreferencesView extends Dto {
  const BookingBillingPreferencesView({
    this.billingPreferences,
    this.object,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/booking/{booking_id}/billing_preferences',
  ];

  static BookingBillingPreferencesView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return BookingBillingPreferencesView(
      billingPreferences: BookingBillingPreferencesDetail.fromMap(
          source['billing_preferences']),
      object: readText(source['object']),
    );
  }

  final BookingBillingPreferencesDetail? billingPreferences;

  final String? object;

  @override
  String? get envelopeKey => 'order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'billing_preferences': billingPreferences,
        'object': object,
      };
}

/// One page of the custom objects orders use, under `data`.
class BookingCustomObjectList extends Dto {
  const BookingCustomObjectList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/booking/{booking_id}/custom_objects',
    'GET /api/{api_version}/booking/{booking_id}/custom_objects_instances',
  ];

  static BookingCustomObjectList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingCustomObjectList(
      data: readList<BookingCustomObjectEntry>(
          source['data'], BookingCustomObjectEntry.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<BookingCustomObjectEntry?>? data;

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

/// One custom object with the booking's instances of it, under `custom_object`.
class BookingCustomObject extends Dto {
  const BookingCustomObject({
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
    'GET /api/{api_version}/booking/{booking_id}/custom_objects/{custom_object_id}',
    'GET /api/{api_version}/booking/{booking_id}/custom_objects_instances/{custom_object_id}',
  ];

  static BookingCustomObject? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_object');
    if (source == null) return null;
    return BookingCustomObject(
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

/// One page of a booking's invoices, under `data`.
class BookingInvoiceList extends Dto {
  const BookingInvoiceList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/booking/{booking_id}/invoices',
  ];

  static BookingInvoiceList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingInvoiceList(
      data: readList<BookingInvoice>(source['data'], BookingInvoice.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<BookingInvoice?>? data;

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

/// What `getBookingItemFulfillment` answers, under `item_fulfillment`.
class BookingItemFulfillment extends Dto {
  const BookingItemFulfillment({
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
    'GET /api/{api_version}/booking/{booking_id}/item_fulfillments/{fulfillment_id}',
  ];

  static BookingItemFulfillment? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item_fulfillment');
    if (source == null) return null;
    return BookingItemFulfillment(
      account: BookingItemFulfillmentAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy: BookingItemFulfillmentCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      customAttributes: readAny(source['custom_attributes']),
      deliveryStatus: readAny(source['delivery_status']),
      fulfillmentCompleted: readFlag(source['fulfillment_completed']),
      fulfillmentDate: readText(source['fulfillment_date']),
      fulfillmentNote: readAny(source['fulfillment_note']),
      fulfillmentStatus: readText(source['fulfillment_status']),
      fulfillments: readList<BookingItemFulfillmentFulfillment>(
          source['fulfillments'], BookingItemFulfillmentFulfillment.fromMap),
      href: readText(source['href']),
      id: readText(source['id']),
      invoice: BookingItemFulfillmentInvoice.fromMap(source['invoice']),
      lastUpdatedBy: BookingItemFulfillmentLastUpdatedBy.fromMap(
          source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      order: readAny(source['order']),
      status: readText(source['status']),
      trackingNumber: readText(source['tracking_number']),
      version: readInteger(source['version']),
    );
  }

  final BookingItemFulfillmentAccount? account;

  final String? code;

  final BookingItemFulfillmentCreatedBy? createdBy;

  final String? createdOn;

  final Object? customAttributes;

  /// Null in every record measured, so untyped.
  final Object? deliveryStatus;

  final bool? fulfillmentCompleted;

  final String? fulfillmentDate;

  /// Null in every record measured, so untyped.
  final Object? fulfillmentNote;

  final String? fulfillmentStatus;

  final List<BookingItemFulfillmentFulfillment?>? fulfillments;

  final String? href;

  final String? id;

  final BookingItemFulfillmentInvoice? invoice;

  final BookingItemFulfillmentLastUpdatedBy? lastUpdatedBy;

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

/// What `getBookingKpis` answers, under `order_kpis`.
class BookingKpis extends Dto {
  const BookingKpis({
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
    'GET /api/{api_version}/booking/{booking_id}/kpis',
  ];

  static BookingKpis? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order_kpis');
    if (source == null) return null;
    return BookingKpis(
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

/// What `getBookingPaymentMethods` answers, under `order`.
class BookingPaymentMethods extends Dto {
  const BookingPaymentMethods({
    this.paymentMethods,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/booking/{booking_id}/payment_methods',
  ];

  static BookingPaymentMethods? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return BookingPaymentMethods(
      paymentMethods: readList<BookingPaymentMethodsPaymentMethod>(
          source['payment_methods'],
          BookingPaymentMethodsPaymentMethod.fromMap),
    );
  }

  final List<BookingPaymentMethodsPaymentMethod?>? paymentMethods;

  @override
  String? get envelopeKey => 'order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'payment_methods': paymentMethods,
      };
}

/// What `getBookingPaymentMethod` answers, under `order`.
class BookingPaymentMethod extends Dto {
  const BookingPaymentMethod({
    this.paymentMethod,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/booking/{booking_id}/payment_methods/{payment_method_ref}',
  ];

  static BookingPaymentMethod? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return BookingPaymentMethod(
      paymentMethod:
          BookingPaymentMethodPaymentMethod.fromMap(source['payment_method']),
    );
  }

  final BookingPaymentMethodPaymentMethod? paymentMethod;

  @override
  String? get envelopeKey => 'order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'payment_method': paymentMethod,
      };
}

/// One page of a booking's payments, under `data`.
class BookingPaymentList extends Dto {
  const BookingPaymentList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/booking/{booking_id}/payments',
  ];

  static BookingPaymentList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPaymentList(
      data: readList<BookingPayment>(source['data'], BookingPayment.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<BookingPayment?>? data;

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

/// What `getBookingPayment` answers, under `payment`.
class BookingPaymentView extends Dto {
  const BookingPaymentView({
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
    'GET /api/{api_version}/booking/{booking_id}/payments/{payment_id}',
  ];

  static BookingPaymentView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'payment');
    if (source == null) return null;
    return BookingPaymentView(
      account: BookingPaymentViewAccount.fromMap(source['account']),
      createdBy: BookingPaymentViewCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditApplied: readList<Object>(source['credit_applied'], readAny),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      giftCertificateApplied:
          readList<Object>(source['gift_certificate_applied'], readAny),
      id: readText(source['id']),
      invoices: readList<BookingPaymentViewInvoice>(
          source['invoices'], BookingPaymentViewInvoice.fromMap),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      origin: readAny(source['origin']),
      paymentApplied: readList<BookingPaymentViewPaymentApplied>(
          source['payment_applied'], BookingPaymentViewPaymentApplied.fromMap),
      paymentNote: readText(source['payment_note']),
      reconcileStatus: readText(source['reconcile_status']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final BookingPaymentViewAccount? account;

  final BookingPaymentViewCreatedBy? createdBy;

  final String? createdOn;

  final List<Object?>? creditApplied;

  final List<Object?>? customAttributes;

  final List<Object?>? giftCertificateApplied;

  final String? id;

  final List<BookingPaymentViewInvoice?>? invoices;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedOn;

  final String? object;

  /// Null in every record measured, so untyped.
  final Object? origin;

  final List<BookingPaymentViewPaymentApplied?>? paymentApplied;

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

/// What `getBookingPdf` answers, under `order`.
class BookingPdf extends Dto {
  const BookingPdf({
    this.pdf,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/booking/{booking_id}/pdf',
  ];

  static BookingPdf? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return BookingPdf(
      pdf: BookingPdfPdf.fromMap(source['pdf']),
    );
  }

  final BookingPdfPdf? pdf;

  @override
  String? get envelopeKey => 'order';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'pdf': pdf,
      };
}

/// What `getBookingQuotePartialInvoices` answers, under `order`.
class BookingQuotePartialInvoices extends Dto {
  const BookingQuotePartialInvoices({
    this.partialInvoices,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/booking/{booking_id}/quote_partial_invoices',
  ];

  static BookingQuotePartialInvoices? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order');
    if (source == null) return null;
    return BookingQuotePartialInvoices(
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

/// One entry of a [BookingNoteList]'s `data`.
class BookingNote extends Dto {
  const BookingNote({
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

  static BookingNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingNote(
      attachments: readList<BookingNoteAttachment>(
          source['attachments'], BookingNoteAttachment.fromMap),
      content: readText(source['content']),
      createdBy: BookingNoteCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy:
          BookingNoteLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<BookingNoteWatcher>(
          source['watchers'], BookingNoteWatcher.fromMap),
    );
  }

  final List<BookingNoteAttachment?>? attachments;

  final String? content;

  final BookingNoteCreatedBy? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? group;

  final String? href;

  final String? id;

  final BookingNoteLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  /// Null in every record measured, so untyped.
  final Object? user;

  final int? version;

  final List<BookingNoteWatcher?>? watchers;

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

/// One entry of a [BookingNote]'s `attachments`.
class BookingNoteAttachment extends Dto {
  const BookingNoteAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static BookingNoteAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingNoteAttachment(
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

/// A [BookingNote]'s `created_by`.
class BookingNoteCreatedBy extends Dto {
  const BookingNoteCreatedBy({
    this.name,
    this.object,
  });

  static BookingNoteCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingNoteCreatedBy(
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

/// A [BookingNote]'s `last_updated_by`.
class BookingNoteLastUpdatedBy extends Dto {
  const BookingNoteLastUpdatedBy({
    this.name,
    this.object,
  });

  static BookingNoteLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingNoteLastUpdatedBy(
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

/// One entry of a [BookingNote]'s `watchers`.
class BookingNoteWatcher extends Dto {
  const BookingNoteWatcher({
    this.email,
    this.name,
    this.type,
  });

  static BookingNoteWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingNoteWatcher(
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

/// A [BookingBillingPreferencesView]'s `billing_preferences`.
class BookingBillingPreferencesDetail extends Dto {
  const BookingBillingPreferencesDetail({
    this.billingPeriod,
    this.communicationProfile,
    this.consolidateInvoice,
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

  static BookingBillingPreferencesDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingBillingPreferencesDetail(
      billingPeriod: readText(source['billing_period']),
      communicationProfile: readText(source['communication_profile']),
      consolidateInvoice: readFlag(source['consolidate_invoice']),
      fulfillmentMode: readText(source['fulfillment_mode']),
      fulfillmentTerm: readText(source['fulfillment_term']),
      invoiceMode: readText(source['invoice_mode']),
      invoiceTerm: readText(source['invoice_term']),
      paymentMode: readText(source['payment_mode']),
      paymentProcessor: readText(source['payment_processor']),
      paymentTerm: readText(source['payment_term']),
      paymentTermAlignment: readText(source['payment_term_alignment']),
      proformaProperties:
          BookingBillingPreferencesDetailProformaProperties.fromMap(
              source['proforma_properties']),
    );
  }

  final String? billingPeriod;

  final String? communicationProfile;

  final bool? consolidateInvoice;

  final String? fulfillmentMode;

  final String? fulfillmentTerm;

  final String? invoiceMode;

  final String? invoiceTerm;

  final String? paymentMode;

  final String? paymentProcessor;

  final String? paymentTerm;

  final String? paymentTermAlignment;

  final BookingBillingPreferencesDetailProformaProperties? proformaProperties;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'billing_period': billingPeriod,
        'communication_profile': communicationProfile,
        'consolidate_invoice': consolidateInvoice,
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

/// A [BookingBillingPreferencesDetail]'s `proforma_properties`.
class BookingBillingPreferencesDetailProformaProperties extends Dto {
  const BookingBillingPreferencesDetailProformaProperties({
    this.acceptanceDate,
    this.acceptanceRequired,
    this.acceptanceTerm,
    this.paymentRequired,
    this.termsAndConditions,
  });

  static BookingBillingPreferencesDetailProformaProperties? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingBillingPreferencesDetailProformaProperties(
      acceptanceDate: readAny(source['acceptance_date']),
      acceptanceRequired: readFlag(source['acceptance_required']),
      acceptanceTerm: readAny(source['acceptance_term']),
      paymentRequired: readFlag(source['payment_required']),
      termsAndConditions: readAny(source['terms_and_conditions']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? acceptanceDate;

  final bool? acceptanceRequired;

  /// Null in every record measured, so untyped.
  final Object? acceptanceTerm;

  final bool? paymentRequired;

  /// Null in every record measured, so untyped.
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

/// One entry of a [BookingCustomObjectList]'s `data`.
class BookingCustomObjectEntry extends Dto {
  const BookingCustomObjectEntry({
    this.createdBy,
    this.createdOn,
    this.customComponent,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.relation,
    this.useIn,
  });

  static BookingCustomObjectEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingCustomObjectEntry(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      customComponent: readAny(source['custom_component']),
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
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

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? relation;

  final String? useIn;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_component': customComponent,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'relation': relation,
        'use_in': useIn,
      };
}

/// One entry of a [BookingInvoiceList]'s `data`.
class BookingInvoice extends Dto {
  const BookingInvoice({
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

  static BookingInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingInvoice(
      account: BookingInvoiceAccount.fromMap(source['account']),
      alternateBillingEndDate: readText(source['alternate_billing_end_date']),
      alternateBillingStartDate:
          readText(source['alternate_billing_start_date']),
      alternateDueDate: readText(source['alternate_due_date']),
      alternateIssueDate: readText(source['alternate_issue_date']),
      billingEndDate: readText(source['billing_end_date']),
      billingStartDate: readText(source['billing_start_date']),
      createdBy: BookingInvoiceCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: BookingInvoiceCurrency.fromMap(source['currency']),
      customForm: BookingInvoiceCustomForm.fromMap(source['custom_form']),
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
      order: BookingInvoiceOrder.fromMap(source['order']),
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

  final BookingInvoiceAccount? account;

  final String? alternateBillingEndDate;

  final String? alternateBillingStartDate;

  final String? alternateDueDate;

  final String? alternateIssueDate;

  final String? billingEndDate;

  final String? billingStartDate;

  final BookingInvoiceCreatedBy? createdBy;

  final String? createdOn;

  final BookingInvoiceCurrency? currency;

  final BookingInvoiceCustomForm? customForm;

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

  final BookingInvoiceOrder? order;

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

/// A [BookingInvoice]'s `account`.
class BookingInvoiceAccount extends Dto {
  const BookingInvoiceAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingInvoiceAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingInvoiceAccount(
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

/// A [BookingInvoice]'s `created_by`.
class BookingInvoiceCreatedBy extends Dto {
  const BookingInvoiceCreatedBy({
    this.name,
    this.object,
  });

  static BookingInvoiceCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingInvoiceCreatedBy(
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

/// A [BookingInvoice]'s `currency`.
class BookingInvoiceCurrency extends Dto {
  const BookingInvoiceCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingInvoiceCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingInvoiceCurrency(
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

/// A [BookingInvoice]'s `custom_form`.
class BookingInvoiceCustomForm extends Dto {
  const BookingInvoiceCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingInvoiceCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingInvoiceCustomForm(
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

/// A [BookingInvoice]'s `order`.
class BookingInvoiceOrder extends Dto {
  const BookingInvoiceOrder({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingInvoiceOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingInvoiceOrder(
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

/// A [BookingItemFulfillment]'s `account`.
class BookingItemFulfillmentAccount extends Dto {
  const BookingItemFulfillmentAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingItemFulfillmentAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingItemFulfillmentAccount(
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

/// A [BookingItemFulfillment]'s `created_by`.
class BookingItemFulfillmentCreatedBy extends Dto {
  const BookingItemFulfillmentCreatedBy({
    this.name,
    this.object,
  });

  static BookingItemFulfillmentCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingItemFulfillmentCreatedBy(
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

/// One entry of a [BookingItemFulfillment]'s `fulfillments`.
class BookingItemFulfillmentFulfillment extends Dto {
  const BookingItemFulfillmentFulfillment({
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

  static BookingItemFulfillmentFulfillment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingItemFulfillmentFulfillment(
      fulfillmentIndex: readInteger(source['fulfillment_index']),
      fulfillmentQty: readDecimal(source['fulfillment_qty']),
      fulfillmentSentQty: readDecimal(source['fulfillment_sent_qty']),
      id: readText(source['id']),
      inventoryTracking: readAny(source['inventory_tracking']),
      item: BookingItemFulfillmentFulfillmentItem.fromMap(source['item']),
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

  final BookingItemFulfillmentFulfillmentItem? item;

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

/// A [BookingItemFulfillmentFulfillment]'s `item`.
class BookingItemFulfillmentFulfillmentItem extends Dto {
  const BookingItemFulfillmentFulfillmentItem({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingItemFulfillmentFulfillmentItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingItemFulfillmentFulfillmentItem(
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

/// A [BookingItemFulfillment]'s `invoice`.
class BookingItemFulfillmentInvoice extends Dto {
  const BookingItemFulfillmentInvoice({
    this.href,
    this.id,
    this.object,
  });

  static BookingItemFulfillmentInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingItemFulfillmentInvoice(
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

/// A [BookingItemFulfillment]'s `last_updated_by`.
class BookingItemFulfillmentLastUpdatedBy extends Dto {
  const BookingItemFulfillmentLastUpdatedBy({
    this.name,
    this.object,
  });

  static BookingItemFulfillmentLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingItemFulfillmentLastUpdatedBy(
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

/// One entry of a [BookingPaymentMethods]'s `payment_methods`.
class BookingPaymentMethodsPaymentMethod extends Dto {
  const BookingPaymentMethodsPaymentMethod({
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

  static BookingPaymentMethodsPaymentMethod? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPaymentMethodsPaymentMethod(
      createdBy: readText(source['created_by']),
      createdOn: readText(source['created_on']),
      isDefault: readFlag(source['default']),
      id: readText(source['id']),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lastUsedAt: readText(source['last_used_at']),
      object: readText(source['object']),
      paymentCount: readInteger(source['payment_count']),
      processor: BookingPaymentMethodsPaymentMethodProcessor.fromMap(
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

  final String? lastUsedAt;

  final String? object;

  final int? paymentCount;

  final BookingPaymentMethodsPaymentMethodProcessor? processor;

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

/// A [BookingPaymentMethodsPaymentMethod]'s `processor`.
class BookingPaymentMethodsPaymentMethodProcessor extends Dto {
  const BookingPaymentMethodsPaymentMethodProcessor({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingPaymentMethodsPaymentMethodProcessor? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPaymentMethodsPaymentMethodProcessor(
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

/// A [BookingPaymentMethod]'s `payment_method`.
class BookingPaymentMethodPaymentMethod extends Dto {
  const BookingPaymentMethodPaymentMethod({
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

  static BookingPaymentMethodPaymentMethod? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPaymentMethodPaymentMethod(
      createdBy: readText(source['created_by']),
      createdOn: readText(source['created_on']),
      isDefault: readFlag(source['default']),
      id: readText(source['id']),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      lastUsedAt: readText(source['last_used_at']),
      object: readText(source['object']),
      paymentCount: readInteger(source['payment_count']),
      processor: BookingPaymentMethodPaymentMethodProcessor.fromMap(
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

  final String? lastUsedAt;

  final String? object;

  final int? paymentCount;

  final BookingPaymentMethodPaymentMethodProcessor? processor;

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

/// A [BookingPaymentMethodPaymentMethod]'s `processor`.
class BookingPaymentMethodPaymentMethodProcessor extends Dto {
  const BookingPaymentMethodPaymentMethodProcessor({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingPaymentMethodPaymentMethodProcessor? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPaymentMethodPaymentMethodProcessor(
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

/// One entry of a [BookingPaymentList]'s `data`.
class BookingPayment extends Dto {
  const BookingPayment({
    this.account,
    this.createdBy,
    this.createdOn,
    this.creditApplied,
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

  static BookingPayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPayment(
      account: BookingPaymentAccount.fromMap(source['account']),
      createdBy: BookingPaymentCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditApplied: readList<Object>(source['credit_applied'], readAny),
      giftCertificateApplied:
          readList<Object>(source['gift_certificate_applied'], readAny),
      id: readText(source['id']),
      invoices: readList<BookingPaymentInvoice>(
          source['invoices'], BookingPaymentInvoice.fromMap),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      origin: readAny(source['origin']),
      paymentApplied: readList<BookingPaymentPaymentApplied>(
          source['payment_applied'], BookingPaymentPaymentApplied.fromMap),
      paymentNote: readText(source['payment_note']),
      reconcileStatus: readText(source['reconcile_status']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final BookingPaymentAccount? account;

  final BookingPaymentCreatedBy? createdBy;

  final String? createdOn;

  final List<Object?>? creditApplied;

  final List<Object?>? giftCertificateApplied;

  final String? id;

  final List<BookingPaymentInvoice?>? invoices;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedOn;

  final String? object;

  /// Null in every record measured, so untyped.
  final Object? origin;

  final List<BookingPaymentPaymentApplied?>? paymentApplied;

  final String? paymentNote;

  final String? reconcileStatus;

  final String? status;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_applied': creditApplied,
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

/// A [BookingPayment]'s `account`.
class BookingPaymentAccount extends Dto {
  const BookingPaymentAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingPaymentAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPaymentAccount(
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

/// A [BookingPayment]'s `created_by`.
class BookingPaymentCreatedBy extends Dto {
  const BookingPaymentCreatedBy({
    this.name,
    this.object,
  });

  static BookingPaymentCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPaymentCreatedBy(
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

/// One entry of a [BookingPayment]'s `invoices`.
class BookingPaymentInvoice extends Dto {
  const BookingPaymentInvoice({
    this.applied,
    this.dueDate,
    this.id,
    this.issueDate,
    this.outstanding,
    this.total,
  });

  static BookingPaymentInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPaymentInvoice(
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

/// One entry of a [BookingPayment]'s `payment_applied`.
class BookingPaymentPaymentApplied extends Dto {
  const BookingPaymentPaymentApplied({
    this.amount,
    this.gatewayResponse,
    this.method,
    this.processor,
    this.reference,
  });

  static BookingPaymentPaymentApplied? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPaymentPaymentApplied(
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

/// A [BookingPaymentView]'s `account`.
class BookingPaymentViewAccount extends Dto {
  const BookingPaymentViewAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static BookingPaymentViewAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPaymentViewAccount(
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

/// A [BookingPaymentView]'s `created_by`.
class BookingPaymentViewCreatedBy extends Dto {
  const BookingPaymentViewCreatedBy({
    this.name,
    this.object,
  });

  static BookingPaymentViewCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPaymentViewCreatedBy(
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

/// One entry of a [BookingPaymentView]'s `invoices`.
class BookingPaymentViewInvoice extends Dto {
  const BookingPaymentViewInvoice({
    this.applied,
    this.dueDate,
    this.id,
    this.issueDate,
    this.outstanding,
    this.total,
  });

  static BookingPaymentViewInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPaymentViewInvoice(
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

/// One entry of a [BookingPaymentView]'s `payment_applied`.
class BookingPaymentViewPaymentApplied extends Dto {
  const BookingPaymentViewPaymentApplied({
    this.amount,
    this.gatewayResponse,
    this.method,
    this.processor,
    this.reference,
  });

  static BookingPaymentViewPaymentApplied? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPaymentViewPaymentApplied(
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

/// A [BookingPdf]'s `pdf`.
class BookingPdfPdf extends Dto {
  const BookingPdfPdf({
    this.downloadUrl,
    this.fileSize,
    this.id,
    this.object,
    this.previewUrl,
  });

  static BookingPdfPdf? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingPdfPdf(
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

/// What `getBookingLine` answers, under `order_line`.
class BookingLine extends Dto {
  const BookingLine({
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
    'GET /api/{api_version}/booking/{booking_id}/lines/{line_uuid}',
  ];

  static BookingLine? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'order_line');
    if (source == null) return null;
    return BookingLine(
      chargeItemUuid: readText(source['charge_item_uuid']),
      expectedDeliveryDate: readText(source['expected_delivery_date']),
      id: readText(source['id']),
      item: BookingLineItem.fromMap(source['item']),
      itemAccountingCode:
          BookingLineItemAccountingCode.fromMap(source['item_accounting_code']),
      itemChargeType: readText(source['item_charge_type']),
      itemCustomAttributes:
          readList<Object>(source['item_custom_attributes'], readAny),
      itemDescription: readText(source['item_description']),
      itemInvoiceNote: readText(source['item_invoice_note']),
      itemOrderQuantity: readInteger(source['item_order_quantity']),
      itemPriceSnapshot:
          BookingLineItemPriceSnapshot.fromMap(source['item_price_snapshot']),
      itemPriceTax: BookingLineItemPriceTax.fromMap(source['item_price_tax']),
      itemProperties:
          BookingLineItemProperties.fromMap(source['item_properties']),
      itemSaleTaxConfiguration: BookingLineItemSaleTaxConfiguration.fromMap(
          source['item_sale_tax_configuration']),
      itemType: readText(source['item_type']),
      object: readText(source['object']),
      preOrderStockDetails: BookingLinePreOrderStockDetails.fromMap(
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

  final BookingLineItem? item;

  final BookingLineItemAccountingCode? itemAccountingCode;

  final String? itemChargeType;

  final List<Object?>? itemCustomAttributes;

  final String? itemDescription;

  final String? itemInvoiceNote;

  final int? itemOrderQuantity;

  final BookingLineItemPriceSnapshot? itemPriceSnapshot;

  final BookingLineItemPriceTax? itemPriceTax;

  final BookingLineItemProperties? itemProperties;

  final BookingLineItemSaleTaxConfiguration? itemSaleTaxConfiguration;

  final String? itemType;

  final String? object;

  final BookingLinePreOrderStockDetails? preOrderStockDetails;

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

/// A [BookingLine]'s `item`.
class BookingLineItem extends Dto {
  const BookingLineItem({
    this.href,
    this.id,
    this.name,
    this.object,
    this.uuid,
  });

  static BookingLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingLineItem(
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

/// A [BookingLine]'s `item_accounting_code`.
class BookingLineItemAccountingCode extends Dto {
  const BookingLineItemAccountingCode({
    this.salesRevenue,
  });

  static BookingLineItemAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingLineItemAccountingCode(
      salesRevenue: readText(source['sales_revenue']),
    );
  }

  final String? salesRevenue;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'sales_revenue': salesRevenue,
      };
}

/// A [BookingLine]'s `item_price_snapshot`.
class BookingLineItemPriceSnapshot extends Dto {
  const BookingLineItemPriceSnapshot({
    this.pricingRule,
  });

  static BookingLineItemPriceSnapshot? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingLineItemPriceSnapshot(
      pricingRule: BookingLineItemPriceSnapshotPricingRule.fromMap(
          source['pricing_rule']),
    );
  }

  final BookingLineItemPriceSnapshotPricingRule? pricingRule;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'pricing_rule': pricingRule,
      };
}

/// A [BookingLineItemPriceSnapshot]'s `pricing_rule`.
class BookingLineItemPriceSnapshotPricingRule extends Dto {
  const BookingLineItemPriceSnapshotPricingRule({
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

  static BookingLineItemPriceSnapshotPricingRule? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingLineItemPriceSnapshotPricingRule(
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

/// A [BookingLine]'s `item_price_tax`.
class BookingLineItemPriceTax extends Dto {
  const BookingLineItemPriceTax({
    this.href,
    this.id,
    this.name,
    this.object,
    this.rate,
  });

  static BookingLineItemPriceTax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingLineItemPriceTax(
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

/// A [BookingLine]'s `item_properties`.
class BookingLineItemProperties extends Dto {
  const BookingLineItemProperties({
    this.billingMode,
    this.chargingAndBillingAlignment,
    this.chargingStartDate,
    this.proRataPartialPricingPeriod,
  });

  static BookingLineItemProperties? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingLineItemProperties(
      billingMode: readText(source['billing_mode']),
      chargingAndBillingAlignment:
          readText(source['charging_and_billing_alignment']),
      chargingStartDate: readText(source['charging_start_date']),
      proRataPartialPricingPeriod:
          readText(source['pro_rata_partial_pricing_period']),
    );
  }

  final String? billingMode;

  final String? chargingAndBillingAlignment;

  final String? chargingStartDate;

  final String? proRataPartialPricingPeriod;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'billing_mode': billingMode,
        'charging_and_billing_alignment': chargingAndBillingAlignment,
        'charging_start_date': chargingStartDate,
        'pro_rata_partial_pricing_period': proRataPartialPricingPeriod,
      };
}

/// A [BookingLine]'s `item_sale_tax_configuration`.
class BookingLineItemSaleTaxConfiguration extends Dto {
  const BookingLineItemSaleTaxConfiguration({
    this.salePriceIsBasedOn,
    this.taxCode,
  });

  static BookingLineItemSaleTaxConfiguration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingLineItemSaleTaxConfiguration(
      salePriceIsBasedOn: readText(source['sale_price_is_based_on']),
      taxCode: BookingLineItemSaleTaxConfigurationTaxCode.fromMap(
          source['tax_code']),
    );
  }

  final String? salePriceIsBasedOn;

  final BookingLineItemSaleTaxConfigurationTaxCode? taxCode;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'sale_price_is_based_on': salePriceIsBasedOn,
        'tax_code': taxCode,
      };
}

/// A [BookingLineItemSaleTaxConfiguration]'s `tax_code`.
class BookingLineItemSaleTaxConfigurationTaxCode extends Dto {
  const BookingLineItemSaleTaxConfigurationTaxCode({
    this.code,
    this.link,
    this.rate,
    this.uuid,
  });

  static BookingLineItemSaleTaxConfigurationTaxCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingLineItemSaleTaxConfigurationTaxCode(
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

/// A [BookingLine]'s `pre_order_stock_details`.
class BookingLinePreOrderStockDetails extends Dto {
  const BookingLinePreOrderStockDetails({
    this.pendingReserve,
    this.reserved,
    this.sold,
  });

  static BookingLinePreOrderStockDetails? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BookingLinePreOrderStockDetails(
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
