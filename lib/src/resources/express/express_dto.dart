/// Typed views over the v4 express bodies.
library;

import '../../client/dto.dart';

/// What `createExpress` answers, under `express`.
class Express extends Dto {
  const Express({
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
    'POST /api/{api_version}/express',
  ];

  static Express? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'express');
    if (source == null) return null;
    return Express(
      account: ExpressAccount.fromMap(source['account']),
      activityLogs: readList<ExpressActivityLog>(
          source['activity_logs'], ExpressActivityLog.fromMap),
      allowContract: readFlag(source['allow_contract']),
      billingAddress: readAny(source['billing_address']),
      billingPreferences:
          ExpressBillingPreferences.fromMap(source['billing_preferences']),
      billingStartDate: readText(source['billing_start_date']),
      communicationPreferences:
          readList<Object>(source['communication_preferences'], readAny),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: ExpressCurrency.fromMap(source['currency']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customForm: ExpressCustomForm.fromMap(source['custom_form']),
      customerPurchaseOrderId: readAny(source['customer_purchase_order_id']),
      description: readAny(source['description']),
      discountProfile: readAny(source['discount_profile']),
      displayName: readText(source['display_name']),
      id: readText(source['id']),
      invoiceNote: readAny(source['invoice_note']),
      kpis: ExpressKpis.fromMap(source['kpis']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      lines: readList<ExpressLine>(source['lines'], ExpressLine.fromMap),
      manager: readAny(source['manager']),
      name: readText(source['name']),
      nextBillingFromDate: readText(source['next_billing_from_date']),
      object: readText(source['object']),
      orderStartDate: readText(source['order_start_date']),
      orderType: readText(source['order_type']),
      origin: readAny(source['origin']),
      originalTotal: readText(source['original_total']),
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
      timeZone: ExpressTimeZone.fromMap(source['time_zone']),
      total: readText(source['total']),
      version: readInteger(source['version']),
    );
  }

  final ExpressAccount? account;

  final List<ExpressActivityLog?>? activityLogs;

  final bool? allowContract;

  /// Untyped: null in every record measured.
  final Object? billingAddress;

  final ExpressBillingPreferences? billingPreferences;

  final String? billingStartDate;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? communicationPreferences;

  /// Untyped: null in every record measured.
  final Object? createdBy;

  final String? createdOn;

  final ExpressCurrency? currency;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? customAttributes;

  final ExpressCustomForm? customForm;

  /// Untyped: null in every record measured.
  final Object? customerPurchaseOrderId;

  /// Untyped: null in every record measured.
  final Object? description;

  /// Untyped: null in every record measured.
  final Object? discountProfile;

  final String? displayName;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? invoiceNote;

  final ExpressKpis? kpis;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final List<ExpressLine?>? lines;

  /// Untyped: null in every record measured.
  final Object? manager;

  final String? name;

  final String? nextBillingFromDate;

  final String? object;

  final String? orderStartDate;

  final String? orderType;

  /// Untyped: null in every record measured.
  final Object? origin;

  final String? originalTotal;

  final bool? preOrder;

  final bool? priceTaxInclusive;

  final bool? quoteConverted;

  final bool? quoteOrder;

  /// Untyped: null in every record measured.
  final Object? referralAccount;

  /// Untyped: null in every record measured.
  final Object? salesRep;

  /// Untyped: null in every record measured.
  final Object? shippingAddress;

  final double? shippingCost;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? shippingLineItems;

  /// Untyped: null in every record measured.
  final Object? shippingProfile;

  final String? status;

  final String? subtotal;

  final String? tax;

  final ExpressTimeZone? timeZone;

  final String? total;

  final int? version;

  @override
  String? get envelopeKey => 'express';

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

/// A [Express]'s `currency`.
class ExpressCurrency extends Dto {
  const ExpressCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ExpressCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressCurrency(
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

/// A [Express]'s `time_zone`.
class ExpressTimeZone extends Dto {
  const ExpressTimeZone({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ExpressTimeZone? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressTimeZone(
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

/// A [Express]'s `custom_form`.
class ExpressCustomForm extends Dto {
  const ExpressCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ExpressCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressCustomForm(
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

/// A [Express]'s `account`.
class ExpressAccount extends Dto {
  const ExpressAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static ExpressAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressAccount(
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

/// A [Express]'s `billing_preferences`.
class ExpressBillingPreferences extends Dto {
  const ExpressBillingPreferences({
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

  static ExpressBillingPreferences? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressBillingPreferences(
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
      proformaProperties: ExpressBillingPreferencesProformaProperties.fromMap(
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

  final ExpressBillingPreferencesProformaProperties? proformaProperties;

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

/// One entry of a [Express]'s `lines`.
class ExpressLine extends Dto {
  const ExpressLine({
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

  static ExpressLine? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressLine(
      chargeItemUuid: readText(source['charge_item_uuid']),
      expectedDeliveryDate: readText(source['expected_delivery_date']),
      id: readText(source['id']),
      item: ExpressLineItem.fromMap(source['item']),
      itemAccountingCode:
          ExpressLineItemAccountingCode.fromMap(source['item_accounting_code']),
      itemChargeType: readText(source['item_charge_type']),
      itemCustomAttributes:
          readList<Object>(source['item_custom_attributes'], readAny),
      itemDescription: readText(source['item_description']),
      itemInvoiceNote: readText(source['item_invoice_note']),
      itemOrderQuantity: readInteger(source['item_order_quantity']),
      itemPriceSnapshot:
          ExpressLineItemPriceSnapshot.fromMap(source['item_price_snapshot']),
      itemPriceTax: ExpressLineItemPriceTax.fromMap(source['item_price_tax']),
      itemSaleTaxConfiguration: ExpressLineItemSaleTaxConfiguration.fromMap(
          source['item_sale_tax_configuration']),
      itemType: readText(source['item_type']),
      object: readText(source['object']),
      preOrderStockDetails: ExpressLinePreOrderStockDetails.fromMap(
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

  final ExpressLineItem? item;

  final ExpressLineItemAccountingCode? itemAccountingCode;

  final String? itemChargeType;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? itemCustomAttributes;

  final String? itemDescription;

  final String? itemInvoiceNote;

  final int? itemOrderQuantity;

  final ExpressLineItemPriceSnapshot? itemPriceSnapshot;

  final ExpressLineItemPriceTax? itemPriceTax;

  final ExpressLineItemSaleTaxConfiguration? itemSaleTaxConfiguration;

  final String? itemType;

  final String? object;

  final ExpressLinePreOrderStockDetails? preOrderStockDetails;

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

/// A [Express]'s `kpis`.
class ExpressKpis extends Dto {
  const ExpressKpis({
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

  static ExpressKpis? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressKpis(
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

/// One entry of a [Express]'s `activity_logs`.
class ExpressActivityLog extends Dto {
  const ExpressActivityLog({
    this.activity,
  });

  static ExpressActivityLog? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressActivityLog(
      activity: readText(source['activity']),
    );
  }

  final String? activity;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity': activity,
      };
}

/// A [ExpressBillingPreferences]'s `proforma_properties`.
class ExpressBillingPreferencesProformaProperties extends Dto {
  const ExpressBillingPreferencesProformaProperties({
    this.acceptanceDate,
    this.acceptanceRequired,
    this.acceptanceTerm,
    this.paymentRequired,
    this.termsAndConditions,
  });

  static ExpressBillingPreferencesProformaProperties? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressBillingPreferencesProformaProperties(
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

/// A [ExpressLine]'s `item`.
class ExpressLineItem extends Dto {
  const ExpressLineItem({
    this.href,
    this.id,
    this.name,
    this.object,
    this.uuid,
  });

  static ExpressLineItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressLineItem(
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

/// A [ExpressLine]'s `item_price_snapshot`.
class ExpressLineItemPriceSnapshot extends Dto {
  const ExpressLineItemPriceSnapshot({
    this.pricingRule,
  });

  static ExpressLineItemPriceSnapshot? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressLineItemPriceSnapshot(
      pricingRule: ExpressLineItemPriceSnapshotPricingRule.fromMap(
          source['pricing_rule']),
    );
  }

  final ExpressLineItemPriceSnapshotPricingRule? pricingRule;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'pricing_rule': pricingRule,
      };
}

/// A [ExpressLine]'s `item_price_tax`.
class ExpressLineItemPriceTax extends Dto {
  const ExpressLineItemPriceTax({
    this.href,
    this.id,
    this.name,
    this.object,
    this.rate,
  });

  static ExpressLineItemPriceTax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressLineItemPriceTax(
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

/// A [ExpressLine]'s `item_sale_tax_configuration`.
class ExpressLineItemSaleTaxConfiguration extends Dto {
  const ExpressLineItemSaleTaxConfiguration({
    this.salePriceIsBasedOn,
    this.taxCode,
  });

  static ExpressLineItemSaleTaxConfiguration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressLineItemSaleTaxConfiguration(
      salePriceIsBasedOn: readText(source['sale_price_is_based_on']),
      taxCode: ExpressLineItemSaleTaxConfigurationTaxCode.fromMap(
          source['tax_code']),
    );
  }

  final String? salePriceIsBasedOn;

  final ExpressLineItemSaleTaxConfigurationTaxCode? taxCode;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'sale_price_is_based_on': salePriceIsBasedOn,
        'tax_code': taxCode,
      };
}

/// A [ExpressLine]'s `item_accounting_code`.
class ExpressLineItemAccountingCode extends Dto {
  const ExpressLineItemAccountingCode({
    this.salesRevenue,
  });

  static ExpressLineItemAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressLineItemAccountingCode(
      salesRevenue: readText(source['sales_revenue']),
    );
  }

  final String? salesRevenue;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'sales_revenue': salesRevenue,
      };
}

/// A [ExpressLine]'s `pre_order_stock_details`.
class ExpressLinePreOrderStockDetails extends Dto {
  const ExpressLinePreOrderStockDetails({
    this.pendingReserve,
    this.reserved,
    this.sold,
  });

  static ExpressLinePreOrderStockDetails? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressLinePreOrderStockDetails(
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

/// A [ExpressLineItemPriceSnapshot]'s `pricing_rule`.
class ExpressLineItemPriceSnapshotPricingRule extends Dto {
  const ExpressLineItemPriceSnapshotPricingRule({
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

  static ExpressLineItemPriceSnapshotPricingRule? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressLineItemPriceSnapshotPricingRule(
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

/// A [ExpressLineItemSaleTaxConfiguration]'s `tax_code`.
class ExpressLineItemSaleTaxConfigurationTaxCode extends Dto {
  const ExpressLineItemSaleTaxConfigurationTaxCode({
    this.code,
    this.link,
    this.rate,
    this.uuid,
  });

  static ExpressLineItemSaleTaxConfigurationTaxCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExpressLineItemSaleTaxConfigurationTaxCode(
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
