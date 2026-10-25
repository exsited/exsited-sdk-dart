/// Typed views over the v4 settings bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings discount profile body.
class SettingsDiscountProfile extends Dto {
  const SettingsDiscountProfile({
    this.accountingCode,
    this.createdBy,
    this.createdOn,
    this.description,
    this.discountType,
    this.displayName,
    this.endTime,
    this.fixedAmount,
    this.href,
    this.id,
    this.invoiceNote,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.maxUsePerAccount,
    this.maxUsePerOrder,
    this.maxUseTotal,
    this.name,
    this.object,
    this.ownerType,
    this.percentageAmount,
    this.priceIsInclusiveOfDiscount,
    this.priority,
    this.redemptionRequired,
    this.stackable,
    this.startTime,
    this.status,
    this.taxCode,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/discount_profiles',
  ];

  static SettingsDiscountProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsDiscountProfile(
      accountingCode: SettingsDiscountProfileAccountingCode.fromMap(
          source['accounting_code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      discountType: readText(source['discount_type']),
      displayName: readText(source['display_name']),
      endTime: readText(source['end_time']),
      fixedAmount: readDecimal(source['fixed_amount']),
      href: readText(source['href']),
      id: readText(source['id']),
      invoiceNote: readText(source['invoice_note']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      maxUsePerAccount: readInteger(source['max_use_per_account']),
      maxUsePerOrder: readInteger(source['max_use_per_order']),
      maxUseTotal: readInteger(source['max_use_total']),
      name: readText(source['name']),
      object: readText(source['object']),
      ownerType: readText(source['owner_type']),
      percentageAmount: readDecimal(source['percentage_amount']),
      priceIsInclusiveOfDiscount:
          readFlag(source['price_is_inclusive_of_discount']),
      priority: readInteger(source['priority']),
      redemptionRequired: readFlag(source['redemption_required']),
      stackable: readFlag(source['stackable']),
      startTime: readText(source['start_time']),
      status: readText(source['status']),
      taxCode: SettingsDiscountProfileTaxCode.fromMap(source['tax_code']),
      version: readInteger(source['version']),
    );
  }

  final SettingsDiscountProfileAccountingCode? accountingCode;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? discountType;

  final String? displayName;

  final String? endTime;

  final double? fixedAmount;

  final String? href;

  final String? id;

  final String? invoiceNote;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final int? maxUsePerAccount;

  final int? maxUsePerOrder;

  final int? maxUseTotal;

  final String? name;

  final String? object;

  final String? ownerType;

  final double? percentageAmount;

  final bool? priceIsInclusiveOfDiscount;

  final int? priority;

  final bool? redemptionRequired;

  final bool? stackable;

  final String? startTime;

  final String? status;

  final SettingsDiscountProfileTaxCode? taxCode;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'discount_type': discountType,
        'display_name': displayName,
        'end_time': endTime,
        'fixed_amount': fixedAmount,
        'href': href,
        'id': id,
        'invoice_note': invoiceNote,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'max_use_per_account': maxUsePerAccount,
        'max_use_per_order': maxUsePerOrder,
        'max_use_total': maxUseTotal,
        'name': name,
        'object': object,
        'owner_type': ownerType,
        'percentage_amount': percentageAmount,
        'price_is_inclusive_of_discount': priceIsInclusiveOfDiscount,
        'priority': priority,
        'redemption_required': redemptionRequired,
        'stackable': stackable,
        'start_time': startTime,
        'status': status,
        'tax_code': taxCode,
        'version': version,
      };
}

/// A page of SettingsDiscountProfile records.
class SettingsDiscountProfileList extends Dto {
  const SettingsDiscountProfileList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/discount_profiles',
  ];

  static SettingsDiscountProfileList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsDiscountProfileList(
      data: readList<SettingsDiscountProfile>(
          source['data'], SettingsDiscountProfile.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsDiscountProfile?>? data;

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

/// The settings payment processor body.
class SettingsPaymentProcessor extends Dto {
  const SettingsPaymentProcessor({
    this.accountingCode,
    this.conversionRate,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.description,
    this.disconnected,
    this.displayName,
    this.gatewayType,
    this.href,
    this.id,
    this.integrationState,
    this.isDefault,
    this.isForeignCurrency,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.provider,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/payment_processors',
  ];

  static SettingsPaymentProcessor? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsPaymentProcessor(
      accountingCode: SettingsPaymentProcessorAccountingCode.fromMap(
          source['accounting_code']),
      conversionRate: readDecimal(source['conversion_rate']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: SettingsPaymentProcessorCurrency.fromMap(source['currency']),
      description: readAny(source['description']),
      disconnected: readFlag(source['disconnected']),
      displayName: readText(source['display_name']),
      gatewayType: readText(source['gateway_type']),
      href: readText(source['href']),
      id: readText(source['id']),
      integrationState: readText(source['integration_state']),
      isDefault: readFlag(source['is_default']),
      isForeignCurrency: readFlag(source['is_foreign_currency']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      provider: readText(source['provider']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final SettingsPaymentProcessorAccountingCode? accountingCode;

  final double? conversionRate;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final SettingsPaymentProcessorCurrency? currency;

  /// Untyped: never populated in the records measured.
  final Object? description;

  final bool? disconnected;

  final String? displayName;

  final String? gatewayType;

  final String? href;

  final String? id;

  final String? integrationState;

  final bool? isDefault;

  final bool? isForeignCurrency;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? provider;

  final String? status;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'conversion_rate': conversionRate,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'description': description,
        'disconnected': disconnected,
        'display_name': displayName,
        'gateway_type': gatewayType,
        'href': href,
        'id': id,
        'integration_state': integrationState,
        'is_default': isDefault,
        'is_foreign_currency': isForeignCurrency,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'provider': provider,
        'status': status,
        'version': version,
      };
}

/// A page of SettingsPaymentProcessor records.
class SettingsPaymentProcessorList extends Dto {
  const SettingsPaymentProcessorList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/payment_processors',
  ];

  static SettingsPaymentProcessorList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsPaymentProcessorList(
      data: readList<SettingsPaymentProcessor>(
          source['data'], SettingsPaymentProcessor.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsPaymentProcessor?>? data;

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

/// The settings shipping profile body.
class SettingsShippingProfile extends Dto {
  const SettingsShippingProfile({
    this.accountingCode,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.fixedAmount,
    this.href,
    this.id,
    this.integrationConnection,
    this.invoiceNote,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.priceTaxInclusive,
    this.salesTaxRate,
    this.shippingType,
    this.status,
    this.taxExempt,
    this.taxRule,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/shipping_profiles',
  ];

  static SettingsShippingProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsShippingProfile(
      accountingCode: SettingsShippingProfileAccountingCode.fromMap(
          source['accounting_code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      fixedAmount: readDecimal(source['fixed_amount']),
      href: readText(source['href']),
      id: readText(source['id']),
      integrationConnection: readAny(source['integration_connection']),
      invoiceNote: readText(source['invoice_note']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      salesTaxRate: readDecimal(source['sales_tax_rate']),
      shippingType: readText(source['shipping_type']),
      status: readText(source['status']),
      taxExempt: readFlag(source['tax_exempt']),
      taxRule: SettingsShippingProfileTaxRule.fromMap(source['tax_rule']),
      version: readInteger(source['version']),
    );
  }

  final SettingsShippingProfileAccountingCode? accountingCode;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final double? fixedAmount;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? integrationConnection;

  final String? invoiceNote;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final bool? priceTaxInclusive;

  final double? salesTaxRate;

  final String? shippingType;

  final String? status;

  final bool? taxExempt;

  final SettingsShippingProfileTaxRule? taxRule;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'fixed_amount': fixedAmount,
        'href': href,
        'id': id,
        'integration_connection': integrationConnection,
        'invoice_note': invoiceNote,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'price_tax_inclusive': priceTaxInclusive,
        'sales_tax_rate': salesTaxRate,
        'shipping_type': shippingType,
        'status': status,
        'tax_exempt': taxExempt,
        'tax_rule': taxRule,
        'version': version,
      };
}

/// A page of SettingsShippingProfile records.
class SettingsShippingProfileList extends Dto {
  const SettingsShippingProfileList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/shipping_profiles',
  ];

  static SettingsShippingProfileList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsShippingProfileList(
      data: readList<SettingsShippingProfile>(
          source['data'], SettingsShippingProfile.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsShippingProfile?>? data;

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

/// The settings pricing level body.
class SettingsPricingLevel extends Dto {
  const SettingsPricingLevel({
    this.builtInItem,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.isDefault,
    this.isTaxInclusive,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.ordering,
    this.status,
    this.taxCode,
    this.taxExempt,
    this.taxInclusiveBasedOn,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/pricing_levels',
  ];

  static SettingsPricingLevel? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsPricingLevel(
      builtInItem: readAny(source['built_in_item']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      isDefault: readAny(source['is_default']),
      isTaxInclusive: readFlag(source['is_tax_inclusive']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      ordering: readInteger(source['ordering']),
      status: readText(source['status']),
      taxCode: SettingsPricingLevelTaxCode.fromMap(source['tax_code']),
      taxExempt: readFlag(source['tax_exempt']),
      taxInclusiveBasedOn: readText(source['tax_inclusive_based_on']),
    );
  }

  /// Untyped: never populated in the records measured.
  final Object? builtInItem;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? isDefault;

  final bool? isTaxInclusive;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final int? ordering;

  final String? status;

  final SettingsPricingLevelTaxCode? taxCode;

  final bool? taxExempt;

  final String? taxInclusiveBasedOn;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'built_in_item': builtInItem,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'is_default': isDefault,
        'is_tax_inclusive': isTaxInclusive,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'ordering': ordering,
        'status': status,
        'tax_code': taxCode,
        'tax_exempt': taxExempt,
        'tax_inclusive_based_on': taxInclusiveBasedOn,
      };
}

/// A page of SettingsPricingLevel records.
class SettingsPricingLevelList extends Dto {
  const SettingsPricingLevelList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/pricing_levels',
  ];

  static SettingsPricingLevelList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsPricingLevelList(
      data: readList<SettingsPricingLevel>(
          source['data'], SettingsPricingLevel.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsPricingLevel?>? data;

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

/// The settings time zone body.
class SettingsTimeZone extends Dto {
  const SettingsTimeZone({
    this.code,
    this.createdBy,
    this.createdOn,
    this.description,
    this.dstEnabled,
    this.hour,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.minute,
    this.name,
    this.object,
    this.offset,
    this.positive,
    this.status,
    this.timeZonePattern,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/time_zones',
  ];

  static SettingsTimeZone? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsTimeZone(
      code: readText(source['code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      dstEnabled: readFlag(source['dst_enabled']),
      hour: readInteger(source['hour']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      minute: readInteger(source['minute']),
      name: readText(source['name']),
      object: readText(source['object']),
      offset: readInteger(source['offset']),
      positive: readFlag(source['positive']),
      status: readText(source['status']),
      timeZonePattern: readText(source['time_zone_pattern']),
    );
  }

  final String? code;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  /// Untyped: never populated in the records measured.
  final Object? description;

  final bool? dstEnabled;

  final int? hour;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final int? minute;

  final String? name;

  final String? object;

  final int? offset;

  final bool? positive;

  final String? status;

  final String? timeZonePattern;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'dst_enabled': dstEnabled,
        'hour': hour,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'minute': minute,
        'name': name,
        'object': object,
        'offset': offset,
        'positive': positive,
        'status': status,
        'time_zone_pattern': timeZonePattern,
      };
}

/// A page of SettingsTimeZone records.
class SettingsTimeZoneList extends Dto {
  const SettingsTimeZoneList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/time_zones',
  ];

  static SettingsTimeZoneList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsTimeZoneList(
      data:
          readList<SettingsTimeZone>(source['data'], SettingsTimeZone.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsTimeZone?>? data;

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

/// The settings warehouse body.
class SettingsWarehouse extends Dto {
  const SettingsWarehouse({
    this.city,
    this.country,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.isDefault,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.postCode,
    this.state,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/warehouses',
  ];

  static SettingsWarehouse? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsWarehouse(
      city: readText(source['city']),
      country: SettingsWarehouseCountry.fromMap(source['country']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      isDefault: readFlag(source['is_default']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      postCode: readText(source['post_code']),
      state: readText(source['state']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final String? city;

  final SettingsWarehouseCountry? country;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  final bool? isDefault;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? postCode;

  final String? state;

  final String? status;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'city': city,
        'country': country,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'is_default': isDefault,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'post_code': postCode,
        'state': state,
        'status': status,
        'version': version,
      };
}

/// A page of SettingsWarehouse records.
class SettingsWarehouseList extends Dto {
  const SettingsWarehouseList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/warehouses',
  ];

  static SettingsWarehouseList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsWarehouseList(
      data: readList<SettingsWarehouse>(
          source['data'], SettingsWarehouse.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsWarehouse?>? data;

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

/// The settings currency body.
class SettingsCurrency extends Dto {
  const SettingsCurrency({
    this.cashRoundingInterval,
    this.code,
    this.conversionRate,
    this.country,
    this.createdBy,
    this.createdOn,
    this.decimalPlaces,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.rounding,
    this.status,
    this.symbol,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/currencies',
  ];

  static SettingsCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsCurrency(
      cashRoundingInterval: readDecimal(source['cash_rounding_interval']),
      code: readText(source['code']),
      conversionRate: readDecimal(source['conversion_rate']),
      country: SettingsCurrencyCountry.fromMap(source['country']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      decimalPlaces: readInteger(source['decimal_places']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      rounding: readText(source['rounding']),
      status: readText(source['status']),
      symbol: readText(source['symbol']),
    );
  }

  final double? cashRoundingInterval;

  final String? code;

  final double? conversionRate;

  final SettingsCurrencyCountry? country;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final int? decimalPlaces;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? rounding;

  final String? status;

  final String? symbol;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'cash_rounding_interval': cashRoundingInterval,
        'code': code,
        'conversion_rate': conversionRate,
        'country': country,
        'created_by': createdBy,
        'created_on': createdOn,
        'decimal_places': decimalPlaces,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'rounding': rounding,
        'status': status,
        'symbol': symbol,
      };
}

/// A page of SettingsCurrency records.
class SettingsCurrencyList extends Dto {
  const SettingsCurrencyList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/currencies',
  ];

  static SettingsCurrencyList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsCurrencyList(
      data:
          readList<SettingsCurrency>(source['data'], SettingsCurrency.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsCurrency?>? data;

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

/// The settings item group body.
class SettingsItemGroup extends Dto {
  const SettingsItemGroup({
    this.accountingCode,
    this.code,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/item_groups',
  ];

  static SettingsItemGroup? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsItemGroup(
      accountingCode:
          SettingsItemGroupAccountingCode.fromMap(source['accounting_code']),
      code: readText(source['code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final SettingsItemGroupAccountingCode? accountingCode;

  final String? code;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
        'version': version,
      };
}

/// A page of SettingsItemGroup records.
class SettingsItemGroupList extends Dto {
  const SettingsItemGroupList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/item_groups',
  ];

  static SettingsItemGroupList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsItemGroupList(
      data: readList<SettingsItemGroup>(
          source['data'], SettingsItemGroup.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsItemGroup?>? data;

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

/// The custom object body.
class CustomObject extends Dto {
  const CustomObject({
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

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/custom_objects',
  ];

  static CustomObject? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomObject(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      customComponent: readAny(source['custom_component']),
      description: readText(source['description']),
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

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  /// Untyped: never populated in the records measured.
  final Object? customComponent;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
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

/// A page of CustomObject records.
class CustomObjectList extends Dto {
  const CustomObjectList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/custom_objects',
  ];

  static CustomObjectList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomObjectList(
      data: readList<CustomObject>(source['data'], CustomObject.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<CustomObject?>? data;

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

/// The settings tax body.
class SettingsTax extends Dto {
  const SettingsTax({
    this.code,
    this.country,
    this.countryTaxByStates,
    this.createdBy,
    this.createdOn,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.rate,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/taxes',
  ];

  static SettingsTax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsTax(
      code: readText(source['code']),
      country: SettingsTaxCountry.fromMap(source['country']),
      countryTaxByStates: readList<SettingsTaxCountryTaxByState>(
          source['country_tax_by_states'],
          SettingsTaxCountryTaxByState.fromMap),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      rate: readDecimal(source['rate']),
      status: readText(source['status']),
    );
  }

  final String? code;

  final SettingsTaxCountry? country;

  final List<SettingsTaxCountryTaxByState?>? countryTaxByStates;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final double? rate;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'country': country,
        'country_tax_by_states': countryTaxByStates,
        'created_by': createdBy,
        'created_on': createdOn,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'rate': rate,
        'status': status,
      };
}

/// A page of SettingsTax records.
class SettingsTaxList extends Dto {
  const SettingsTaxList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/taxes',
  ];

  static SettingsTaxList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsTaxList(
      data: readList<SettingsTax>(source['data'], SettingsTax.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsTax?>? data;

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

/// The settings variation body.
class SettingsVariation extends Dto {
  const SettingsVariation({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/variations',
  ];

  static SettingsVariation? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsVariation(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
    );
  }

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
      };
}

/// A page of SettingsVariation records.
class SettingsVariationList extends Dto {
  const SettingsVariationList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/variations',
  ];

  static SettingsVariationList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsVariationList(
      data: readList<SettingsVariation>(
          source['data'], SettingsVariation.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsVariation?>? data;

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

/// The settings payment term body.
class SettingsPaymentTerm extends Dto {
  const SettingsPaymentTerm({
    this.description,
    this.displayName,
    this.duration,
    this.href,
    this.id,
    this.name,
    this.object,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/payment_terms',
  ];

  static SettingsPaymentTerm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsPaymentTerm(
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      duration: SettingsPaymentTermDuration.fromMap(source['duration']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
    );
  }

  /// Untyped: never populated in the records measured.
  final Object? description;

  final String? displayName;

  final SettingsPaymentTermDuration? duration;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'description': description,
        'display_name': displayName,
        'duration': duration,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'status': status,
      };
}

/// A page of SettingsPaymentTerm records.
class SettingsPaymentTermList extends Dto {
  const SettingsPaymentTermList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/payment_terms',
  ];

  static SettingsPaymentTermList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsPaymentTermList(
      data: readList<SettingsPaymentTerm>(
          source['data'], SettingsPaymentTerm.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsPaymentTerm?>? data;

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

/// The settings item groups body.
class SettingsItemGroups extends Dto {
  const SettingsItemGroups({
    this.accountingCode,
    this.billingPreferences,
    this.code,
    this.createdBy,
    this.createdOn,
    this.customAttributes,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.imageUri,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.manager,
    this.name,
    this.object,
    this.status,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/settings/item_groups',
    'GET /api/{api_version}/settings/item_groups/{item_group_id}',
    'PATCH /api/{api_version}/settings/item_groups/{item_group_id}',
    'POST /api/{api_version}/settings/item_groups/{item_group_id}/billing_preferences',
  ];

  static SettingsItemGroups? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'item_group');
    if (source == null) return null;
    return SettingsItemGroups(
      accountingCode:
          SettingsItemGroupsAccountingCode.fromMap(source['accounting_code']),
      billingPreferences: readAny(source['billing_preferences']),
      code: readText(source['code']),
      createdBy: readText(source['created_by']),
      createdOn: readText(source['created_on']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      imageUri: readText(source['image_uri']),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      manager: readText(source['manager']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final SettingsItemGroupsAccountingCode? accountingCode;

  final Object? billingPreferences;

  final String? code;

  final String? createdBy;

  final String? createdOn;

  final List<Object?>? customAttributes;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  final String? imageUri;

  final String? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? manager;

  final String? name;

  final String? object;

  final String? status;

  final String? uuid;

  final int? version;

  @override
  String? get envelopeKey => 'item_group';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'billing_preferences': billingPreferences,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_attributes': customAttributes,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'image_uri': imageUri,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'manager': manager,
        'name': name,
        'object': object,
        'status': status,
        'uuid': uuid,
        'version': version,
      };
}

/// The settings custom logic script body.
class SettingsCustomLogicScript extends Dto {
  const SettingsCustomLogicScript({
    this.actionName,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.objectName,
    this.status,
    this.type,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/custom_logic_scripts/{custom_logic_script_id}',
  ];

  static SettingsCustomLogicScript? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_logic_script');
    if (source == null) return null;
    return SettingsCustomLogicScript(
      actionName: readText(source['action_name']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      objectName: readText(source['object_name']),
      status: readText(source['status']),
      type: readText(source['type']),
    );
  }

  final String? actionName;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  /// Untyped: never populated in the records measured.
  final Object? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? objectName;

  final String? status;

  final String? type;

  @override
  String? get envelopeKey => 'custom_logic_script';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'action_name': actionName,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'object_name': objectName,
        'status': status,
        'type': type,
      };
}

/// The settings currency read body.
class SettingsCurrencyRead extends Dto {
  const SettingsCurrencyRead({
    this.cashRoundingInterval,
    this.code,
    this.conversionRate,
    this.country,
    this.createdBy,
    this.createdOn,
    this.decimalPlaces,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.rounding,
    this.status,
    this.symbol,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/currencies/{currency_id}',
  ];

  static SettingsCurrencyRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'currency');
    if (source == null) return null;
    return SettingsCurrencyRead(
      cashRoundingInterval: readDecimal(source['cash_rounding_interval']),
      code: readText(source['code']),
      conversionRate: readDecimal(source['conversion_rate']),
      country: SettingsCurrencyReadCountry.fromMap(source['country']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      decimalPlaces: readInteger(source['decimal_places']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      rounding: readText(source['rounding']),
      status: readText(source['status']),
      symbol: readText(source['symbol']),
    );
  }

  final double? cashRoundingInterval;

  final String? code;

  final double? conversionRate;

  final SettingsCurrencyReadCountry? country;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final int? decimalPlaces;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? rounding;

  final String? status;

  final String? symbol;

  @override
  String? get envelopeKey => 'currency';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'cash_rounding_interval': cashRoundingInterval,
        'code': code,
        'conversion_rate': conversionRate,
        'country': country,
        'created_by': createdBy,
        'created_on': createdOn,
        'decimal_places': decimalPlaces,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'rounding': rounding,
        'status': status,
        'symbol': symbol,
      };
}

/// The settings custom object customize body.
class SettingsCustomObjectCustomize extends Dto {
  const SettingsCustomObjectCustomize({
    this.configuration,
    this.created,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.relation,
    this.status,
    this.updated,
    this.useIn,
    this.uuid,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/settings/custom_objects/{custom_object_id}/customize',
  ];

  static SettingsCustomObjectCustomize? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_object');
    if (source == null) return null;
    return SettingsCustomObjectCustomize(
      configuration: SettingsCustomObjectCustomizeConfiguration.fromMap(
          source['configuration']),
      created: readText(source['created']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      relation: readText(source['relation']),
      status: readText(source['status']),
      updated: readText(source['updated']),
      useIn: readText(source['use_in']),
      uuid: readText(source['uuid']),
    );
  }

  final SettingsCustomObjectCustomizeConfiguration? configuration;

  final String? created;

  /// Untyped: null in every record measured.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? relation;

  final String? status;

  final String? updated;

  final String? useIn;

  final String? uuid;

  @override
  String? get envelopeKey => 'custom_object';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'configuration': configuration,
        'created': created,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'relation': relation,
        'status': status,
        'updated': updated,
        'use_in': useIn,
        'uuid': uuid,
      };
}

/// The settings custom objects body.
class SettingsCustomObjects extends Dto {
  const SettingsCustomObjects({
    this.created,
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
    this.status,
    this.updated,
    this.useIn,
    this.uuid,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/custom_objects/{custom_object_id}',
    'POST /api/{api_version}/settings/custom_objects',
    'PATCH /api/{api_version}/settings/custom_objects/{custom_object_id}',
  ];

  static SettingsCustomObjects? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_object');
    if (source == null) return null;
    return SettingsCustomObjects(
      created: readText(source['created']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      customComponent: readAny(source['custom_component']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      relation: readText(source['relation']),
      status: readText(source['status']),
      updated: readText(source['updated']),
      useIn: readText(source['use_in']),
      uuid: readText(source['uuid']),
    );
  }

  final String? created;

  /// Untyped: null in every record measured.
  final Object? createdBy;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? customComponent;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? relation;

  final String? status;

  final String? updated;

  final String? useIn;

  final String? uuid;

  @override
  String? get envelopeKey => 'custom_object';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created': created,
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
        'status': status,
        'updated': updated,
        'use_in': useIn,
        'uuid': uuid,
      };
}

/// The settings variations body.
class SettingsVariations extends Dto {
  const SettingsVariations({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.options,
    this.status,
    this.uuid,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/settings/variations',
    'GET /api/{api_version}/settings/variations/{variation_id}',
    'PATCH /api/{api_version}/settings/variations/{variation_id}',
  ];

  static SettingsVariations? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'variation');
    if (source == null) return null;
    return SettingsVariations(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      options: readList<Object>(source['options'], readAny),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final List<Object?>? options;

  final String? status;

  final String? uuid;

  @override
  String? get envelopeKey => 'variation';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'options': options,
        'status': status,
        'uuid': uuid,
      };
}

/// The settings time zone read body.
class SettingsTimeZoneRead extends Dto {
  const SettingsTimeZoneRead({
    this.code,
    this.createdBy,
    this.createdOn,
    this.description,
    this.dstEnabled,
    this.hour,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.minute,
    this.name,
    this.object,
    this.offset,
    this.positive,
    this.status,
    this.timeZonePattern,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/time_zones/{time_zone_id}',
  ];

  static SettingsTimeZoneRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'time_zone');
    if (source == null) return null;
    return SettingsTimeZoneRead(
      code: readText(source['code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      dstEnabled: readFlag(source['dst_enabled']),
      hour: readInteger(source['hour']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      minute: readInteger(source['minute']),
      name: readText(source['name']),
      object: readText(source['object']),
      offset: readInteger(source['offset']),
      positive: readFlag(source['positive']),
      status: readText(source['status']),
      timeZonePattern: readText(source['time_zone_pattern']),
    );
  }

  final String? code;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  /// Untyped: never populated in the records measured.
  final Object? description;

  final bool? dstEnabled;

  final int? hour;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final int? minute;

  final String? name;

  final String? object;

  final int? offset;

  final bool? positive;

  final String? status;

  final String? timeZonePattern;

  @override
  String? get envelopeKey => 'time_zone';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'dst_enabled': dstEnabled,
        'hour': hour,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'minute': minute,
        'name': name,
        'object': object,
        'offset': offset,
        'positive': positive,
        'status': status,
        'time_zone_pattern': timeZonePattern,
      };
}

/// The settings custom logic scripts body.
class SettingsCustomLogicScripts extends Dto {
  const SettingsCustomLogicScripts({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/custom_logic_scripts',
  ];

  static SettingsCustomLogicScripts? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsCustomLogicScripts(
      data: readList<Object>(source['data'], readAny),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Object?>? data;

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

/// The settings body.
class Settings extends Dto {
  const Settings({
    this.object,
    this.resources,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings',
  ];

  static Settings? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'settings');
    if (source == null) return null;
    return Settings(
      object: readText(source['object']),
      resources: readList<SettingsResourceEntry>(
          source['resources'], SettingsResourceEntry.fromMap),
    );
  }

  final String? object;

  final List<SettingsResourceEntry?>? resources;

  @override
  String? get envelopeKey => 'settings';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'resources': resources,
      };
}

/// The settings field settings item body.
class SettingsFieldSettingsItem extends Dto {
  const SettingsFieldSettingsItem({
    this.message,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/settings/field_settings/account',
    'PATCH /api/{api_version}/settings/field_settings/item',
    'PATCH /api/{api_version}/settings/general_settings/account',
  ];

  static SettingsFieldSettingsItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItem(
      message: readText(source['message']),
    );
  }

  final String? message;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'message': message,
      };
}

/// What `updateSettingsGeneralSettingsAccount` answers, under `general_settings`.
class SettingsGeneralSettingsAccountUpdated extends Dto {
  const SettingsGeneralSettingsAccountUpdated({
    this.account,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/settings/general_settings/account',
  ];

  static SettingsGeneralSettingsAccountUpdated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'general_settings');
    if (source == null) return null;
    return SettingsGeneralSettingsAccountUpdated(
      account: SettingsGeneralSettingsAccountUpdatedAccount.fromMap(
          source['account']),
    );
  }

  final SettingsGeneralSettingsAccountUpdatedAccount? account;

  @override
  String? get envelopeKey => 'general_settings';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
      };
}

/// What `updateSettingsGeneralSettingsItem` answers, under `general_settings`.
class SettingsGeneralSettingsItemUpdated extends Dto {
  const SettingsGeneralSettingsItemUpdated({
    this.item,
    this.product,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/settings/general_settings/item',
  ];

  static SettingsGeneralSettingsItemUpdated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'general_settings');
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdated(
      item: SettingsGeneralSettingsItemUpdatedItem.fromMap(source['item']),
      product:
          SettingsGeneralSettingsItemUpdatedProduct.fromMap(source['product']),
    );
  }

  final SettingsGeneralSettingsItemUpdatedItem? item;

  final SettingsGeneralSettingsItemUpdatedProduct? product;

  @override
  String? get envelopeKey => 'general_settings';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'item': item,
        'product': product,
      };
}

/// One page of what `updateSettingsFieldSettingsAccount` lists, under `data`.
class SettingsFieldSettingsAccountUpdated extends Dto {
  const SettingsFieldSettingsAccountUpdated({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/settings/field_settings/account',
  ];

  static SettingsFieldSettingsAccountUpdated? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsAccountUpdated(
      data: readList<SettingsFieldSettingsAccountUpdatedData>(
          source['data'], SettingsFieldSettingsAccountUpdatedData.fromMap),
      object: readText(source['object']),
      pagination: readAny(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsFieldSettingsAccountUpdatedData?>? data;

  final String? object;

  /// Untyped: null in every record measured.
  final Object? pagination;

  final String? url;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'data': data,
        'object': object,
        'pagination': pagination,
        'url': url,
      };
}

/// One page of what `updateSettingsFieldSettingsItem` lists, under `data`.
class SettingsFieldSettingsItemUpdated extends Dto {
  const SettingsFieldSettingsItemUpdated({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/settings/field_settings/item',
  ];

  static SettingsFieldSettingsItemUpdated? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItemUpdated(
      data: readList<SettingsFieldSettingsItemUpdatedData>(
          source['data'], SettingsFieldSettingsItemUpdatedData.fromMap),
      object: readText(source['object']),
      pagination: readAny(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsFieldSettingsItemUpdatedData?>? data;

  final String? object;

  /// Untyped: null in every record measured.
  final Object? pagination;

  final String? url;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'data': data,
        'object': object,
        'pagination': pagination,
        'url': url,
      };
}

/// One entry of a [Settings]'s `resources`.
class SettingsResourceEntry extends Dto {
  const SettingsResourceEntry({
    this.href,
    this.name,
  });

  static SettingsResourceEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsResourceEntry(
      href: readText(source['href']),
      name: readText(source['name']),
    );
  }

  final String? href;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'name': name,
      };
}

/// A [SettingsCurrencyRead]'s `country`.
class SettingsCurrencyReadCountry extends Dto {
  const SettingsCurrencyReadCountry({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static SettingsCurrencyReadCountry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsCurrencyReadCountry(
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

/// A [SettingsItemGroups]'s `accounting_code`.
class SettingsItemGroupsAccountingCode extends Dto {
  const SettingsItemGroupsAccountingCode({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static SettingsItemGroupsAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsItemGroupsAccountingCode(
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

/// A [SettingsCustomObjectCustomize]'s `configuration`.
class SettingsCustomObjectCustomizeConfiguration extends Dto {
  const SettingsCustomObjectCustomizeConfiguration({
    this.attributes,
  });

  static SettingsCustomObjectCustomizeConfiguration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsCustomObjectCustomizeConfiguration(
      attributes: readList<SettingsCustomObjectCustomizeConfigurationAttribute>(
          source['attributes'],
          SettingsCustomObjectCustomizeConfigurationAttribute.fromMap),
    );
  }

  final List<SettingsCustomObjectCustomizeConfigurationAttribute?>? attributes;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'attributes': attributes,
      };
}

/// A [SettingsGeneralSettingsAccountUpdated]'s `account`.
class SettingsGeneralSettingsAccountUpdatedAccount extends Dto {
  const SettingsGeneralSettingsAccountUpdatedAccount({
    this.accountGrouping,
    this.accountManagement,
    this.additionalContact1,
    this.additionalContact2,
    this.additionalContact3,
    this.billingContact,
    this.creationOfSubsidiaryAccount,
    this.enableWorkflowApprovalForAccount,
    this.referralTrackingAtAccountLevel,
    this.requireEmailAddressForAccount,
    this.requireNameToBeUnique,
    this.salesRepTrackingAtAccountLevel,
    this.sendCommunicationAsGroups,
    this.shippingContact,
    this.uniqueEmailAddressForAccount,
    this.uniqueEmailAddressForContacts,
  });

  static SettingsGeneralSettingsAccountUpdatedAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsAccountUpdatedAccount(
      accountGrouping:
          SettingsGeneralSettingsAccountUpdatedAccountAccountGrouping.fromMap(
              source['account_grouping']),
      accountManagement:
          SettingsGeneralSettingsAccountUpdatedAccountAccountManagement.fromMap(
              source['account_management']),
      additionalContact1:
          SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact1
              .fromMap(source['additional_contact_1']),
      additionalContact2:
          SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact2
              .fromMap(source['additional_contact_2']),
      additionalContact3:
          SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact3
              .fromMap(source['additional_contact_3']),
      billingContact:
          SettingsGeneralSettingsAccountUpdatedAccountBillingContact.fromMap(
              source['billing_contact']),
      creationOfSubsidiaryAccount:
          SettingsGeneralSettingsAccountUpdatedAccountCreationOfSubsidiaryAccount
              .fromMap(source['creation_of_subsidiary_account']),
      enableWorkflowApprovalForAccount:
          readText(source['enable_workflow_approval_for_account']),
      referralTrackingAtAccountLevel:
          SettingsGeneralSettingsAccountUpdatedAccountReferralTrackingAtAccountLevel
              .fromMap(source['referral_tracking_at_account_level']),
      requireEmailAddressForAccount:
          readText(source['require_email_address_for_account']),
      requireNameToBeUnique: readText(source['require_name_to_be_unique']),
      salesRepTrackingAtAccountLevel:
          SettingsGeneralSettingsAccountUpdatedAccountSalesRepTrackingAtAccountLevel
              .fromMap(source['sales_rep_tracking_at_account_level']),
      sendCommunicationAsGroups:
          readText(source['send_communication_as_groups']),
      shippingContact:
          SettingsGeneralSettingsAccountUpdatedAccountShippingContact.fromMap(
              source['shipping_contact']),
      uniqueEmailAddressForAccount:
          readText(source['unique_email_address_for_account']),
      uniqueEmailAddressForContacts:
          readText(source['unique_email_address_for_contacts']),
    );
  }

  final SettingsGeneralSettingsAccountUpdatedAccountAccountGrouping?
      accountGrouping;

  final SettingsGeneralSettingsAccountUpdatedAccountAccountManagement?
      accountManagement;

  final SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact1?
      additionalContact1;

  final SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact2?
      additionalContact2;

  final SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact3?
      additionalContact3;

  final SettingsGeneralSettingsAccountUpdatedAccountBillingContact?
      billingContact;

  final SettingsGeneralSettingsAccountUpdatedAccountCreationOfSubsidiaryAccount?
      creationOfSubsidiaryAccount;

  final String? enableWorkflowApprovalForAccount;

  final SettingsGeneralSettingsAccountUpdatedAccountReferralTrackingAtAccountLevel?
      referralTrackingAtAccountLevel;

  final String? requireEmailAddressForAccount;

  final String? requireNameToBeUnique;

  final SettingsGeneralSettingsAccountUpdatedAccountSalesRepTrackingAtAccountLevel?
      salesRepTrackingAtAccountLevel;

  final String? sendCommunicationAsGroups;

  final SettingsGeneralSettingsAccountUpdatedAccountShippingContact?
      shippingContact;

  final String? uniqueEmailAddressForAccount;

  final String? uniqueEmailAddressForContacts;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account_grouping': accountGrouping,
        'account_management': accountManagement,
        'additional_contact_1': additionalContact1,
        'additional_contact_2': additionalContact2,
        'additional_contact_3': additionalContact3,
        'billing_contact': billingContact,
        'creation_of_subsidiary_account': creationOfSubsidiaryAccount,
        'enable_workflow_approval_for_account':
            enableWorkflowApprovalForAccount,
        'referral_tracking_at_account_level': referralTrackingAtAccountLevel,
        'require_email_address_for_account': requireEmailAddressForAccount,
        'require_name_to_be_unique': requireNameToBeUnique,
        'sales_rep_tracking_at_account_level': salesRepTrackingAtAccountLevel,
        'send_communication_as_groups': sendCommunicationAsGroups,
        'shipping_contact': shippingContact,
        'unique_email_address_for_account': uniqueEmailAddressForAccount,
        'unique_email_address_for_contacts': uniqueEmailAddressForContacts,
      };
}

/// A [SettingsDiscountProfile]'s `accounting_code`.
class SettingsDiscountProfileAccountingCode extends Dto {
  const SettingsDiscountProfileAccountingCode({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static SettingsDiscountProfileAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsDiscountProfileAccountingCode(
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

/// A [SettingsDiscountProfile]'s `tax_code`.
class SettingsDiscountProfileTaxCode extends Dto {
  const SettingsDiscountProfileTaxCode({
    this.href,
    this.id,
    this.object,
  });

  static SettingsDiscountProfileTaxCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsDiscountProfileTaxCode(
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

/// A [SettingsPaymentProcessor]'s `currency`.
class SettingsPaymentProcessorCurrency extends Dto {
  const SettingsPaymentProcessorCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static SettingsPaymentProcessorCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsPaymentProcessorCurrency(
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

/// A [SettingsPaymentProcessor]'s `accounting_code`.
class SettingsPaymentProcessorAccountingCode extends Dto {
  const SettingsPaymentProcessorAccountingCode({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static SettingsPaymentProcessorAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsPaymentProcessorAccountingCode(
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

/// A [SettingsShippingProfile]'s `tax_rule`.
class SettingsShippingProfileTaxRule extends Dto {
  const SettingsShippingProfileTaxRule({
    this.href,
    this.id,
    this.object,
  });

  static SettingsShippingProfileTaxRule? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsShippingProfileTaxRule(
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

/// A [SettingsShippingProfile]'s `accounting_code`.
class SettingsShippingProfileAccountingCode extends Dto {
  const SettingsShippingProfileAccountingCode({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static SettingsShippingProfileAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsShippingProfileAccountingCode(
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

/// A [SettingsPricingLevel]'s `tax_code`.
class SettingsPricingLevelTaxCode extends Dto {
  const SettingsPricingLevelTaxCode({
    this.href,
    this.id,
    this.object,
  });

  static SettingsPricingLevelTaxCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsPricingLevelTaxCode(
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

/// A [SettingsWarehouse]'s `country`.
class SettingsWarehouseCountry extends Dto {
  const SettingsWarehouseCountry({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static SettingsWarehouseCountry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsWarehouseCountry(
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

/// A [SettingsCurrency]'s `country`.
class SettingsCurrencyCountry extends Dto {
  const SettingsCurrencyCountry({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static SettingsCurrencyCountry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsCurrencyCountry(
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

/// A [SettingsItemGroup]'s `accounting_code`.
class SettingsItemGroupAccountingCode extends Dto {
  const SettingsItemGroupAccountingCode({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static SettingsItemGroupAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsItemGroupAccountingCode(
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

/// A [SettingsTax]'s `country`.
class SettingsTaxCountry extends Dto {
  const SettingsTaxCountry({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static SettingsTaxCountry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsTaxCountry(
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

/// One entry of a [SettingsTax]'s `country_tax_by_states`.
class SettingsTaxCountryTaxByState extends Dto {
  const SettingsTaxCountryTaxByState({
    this.createdOn,
    this.id,
    this.lastUpdatedOn,
    this.object,
    this.rate,
    this.state,
    this.status,
  });

  static SettingsTaxCountryTaxByState? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsTaxCountryTaxByState(
      createdOn: readText(source['created_on']),
      id: readText(source['id']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      rate: readDecimal(source['rate']),
      state: readAny(source['state']),
      status: readText(source['status']),
    );
  }

  final String? createdOn;

  final String? id;

  final String? lastUpdatedOn;

  final String? object;

  final double? rate;

  /// Untyped: null in every record measured.
  final Object? state;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_on': createdOn,
        'id': id,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'rate': rate,
        'state': state,
        'status': status,
      };
}

/// A [SettingsPaymentTerm]'s `duration`.
class SettingsPaymentTermDuration extends Dto {
  const SettingsPaymentTermDuration({
    this.count,
    this.period,
  });

  static SettingsPaymentTermDuration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsPaymentTermDuration(
      count: readInteger(source['count']),
      period: readText(source['period']),
    );
  }

  final int? count;

  final String? period;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'count': count,
        'period': period,
      };
}

/// A [SettingsGeneralSettingsItemUpdated]'s `item`.
class SettingsGeneralSettingsItemUpdatedItem extends Dto {
  const SettingsGeneralSettingsItemUpdatedItem({
    this.availableChargeTypes,
    this.availablePricingMethods,
    this.chargingPeriodCanVaryFromBillingPeriod,
    this.chargingStartDateCanVaryFromBillingStartDate,
    this.enableBackOrder,
    this.enableBatchTracking,
    this.enableBundleItem,
    this.enableDirectCostItem,
    this.enableFamilyCostItem,
    this.enableFixedAssetItem,
    this.enableGiftCertificateBasedItem,
    this.enableInventoryCosting,
    this.enableInventoryManagement,
    this.enablePricingProfile,
    this.enablePurchase,
    this.enableSales,
    this.enableSerialization,
    this.enableSupplierManagement,
    this.enableVariation,
    this.enableVariationBasedItem,
    this.enableWarehouseManagement,
    this.enableWorkflowApprovalForItem,
    this.inventoryAdjustmentRules,
    this.itemGrouping,
    this.itemManagement,
    this.preOrder,
    this.pricingPeriodCanVaryFromChargingPeriod,
    this.purchasePriceEnteredIsInclusiveOfTax,
    this.requireNameToBeUnique,
    this.salePriceEnteredIsInclusiveOfTax,
    this.useOnSalePrice,
    this.usePricingLevel,
    this.useSchedulingOfFuturePricing,
    this.useShippingProfile,
    this.useVolumePricing,
  });

  static SettingsGeneralSettingsItemUpdatedItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedItem(
      availableChargeTypes:
          SettingsGeneralSettingsItemUpdatedItemAvailableChargeTypes.fromMap(
              source['available_charge_types']),
      availablePricingMethods:
          SettingsGeneralSettingsItemUpdatedItemAvailablePricingMethods.fromMap(
              source['available_pricing_methods']),
      chargingPeriodCanVaryFromBillingPeriod:
          readText(source['charging_period_can_vary_from_billing_period']),
      chargingStartDateCanVaryFromBillingStartDate: readText(
          source['charging_start_date_can_vary_from_billing_start_date']),
      enableBackOrder: readText(source['enable_back_order']),
      enableBatchTracking: readText(source['enable_batch_tracking']),
      enableBundleItem: readText(source['enable_bundle_item']),
      enableDirectCostItem: readText(source['enable_direct_cost_item']),
      enableFamilyCostItem: readText(source['enable_family_cost_item']),
      enableFixedAssetItem: readText(source['enable_fixed_asset_item']),
      enableGiftCertificateBasedItem:
          readText(source['enable_gift_certificate_based_item']),
      enableInventoryCosting: readText(source['enable_inventory_costing']),
      enableInventoryManagement:
          readText(source['enable_inventory_management']),
      enablePricingProfile: readText(source['enable_pricing_profile']),
      enablePurchase: readText(source['enable_purchase']),
      enableSales: readText(source['enable_sales']),
      enableSerialization: readText(source['enable_serialization']),
      enableSupplierManagement: readText(source['enable_supplier_management']),
      enableVariation: readText(source['enable_variation']),
      enableVariationBasedItem: readText(source['enable_variation_based_item']),
      enableWarehouseManagement:
          readText(source['enable_warehouse_management']),
      enableWorkflowApprovalForItem:
          readText(source['enable_workflow_approval_for_item']),
      inventoryAdjustmentRules:
          SettingsGeneralSettingsItemUpdatedItemInventoryAdjustmentRules
              .fromMap(source['inventory_adjustment_rules']),
      itemGrouping: SettingsGeneralSettingsItemUpdatedItemItemGrouping.fromMap(
          source['item_grouping']),
      itemManagement:
          SettingsGeneralSettingsItemUpdatedItemItemManagement.fromMap(
              source['item_management']),
      preOrder: SettingsGeneralSettingsItemUpdatedItemPreOrder.fromMap(
          source['pre_order']),
      pricingPeriodCanVaryFromChargingPeriod:
          SettingsGeneralSettingsItemUpdatedItemPricingPeriodCanVaryFromChargingPeriod
              .fromMap(source['pricing_period_can_vary_from_charging_period']),
      purchasePriceEnteredIsInclusiveOfTax:
          SettingsGeneralSettingsItemUpdatedItemPurchasePriceEnteredIsInclusiveOfTax
              .fromMap(source['purchase_price_entered_is_inclusive_of_tax']),
      requireNameToBeUnique: readText(source['require_name_to_be_unique']),
      salePriceEnteredIsInclusiveOfTax:
          SettingsGeneralSettingsItemUpdatedItemSalePriceEnteredIsInclusiveOfTax
              .fromMap(source['sale_price_entered_is_inclusive_of_tax']),
      useOnSalePrice: readText(source['use_on_sale_price']),
      usePricingLevel: readText(source['use_pricing_level']),
      useSchedulingOfFuturePricing:
          readText(source['use_scheduling_of_future_pricing']),
      useShippingProfile: readText(source['use_shipping_profile']),
      useVolumePricing:
          SettingsGeneralSettingsItemUpdatedItemUseVolumePricing.fromMap(
              source['use_volume_pricing']),
    );
  }

  final SettingsGeneralSettingsItemUpdatedItemAvailableChargeTypes?
      availableChargeTypes;

  final SettingsGeneralSettingsItemUpdatedItemAvailablePricingMethods?
      availablePricingMethods;

  final String? chargingPeriodCanVaryFromBillingPeriod;

  final String? chargingStartDateCanVaryFromBillingStartDate;

  final String? enableBackOrder;

  final String? enableBatchTracking;

  final String? enableBundleItem;

  final String? enableDirectCostItem;

  final String? enableFamilyCostItem;

  final String? enableFixedAssetItem;

  final String? enableGiftCertificateBasedItem;

  final String? enableInventoryCosting;

  final String? enableInventoryManagement;

  final String? enablePricingProfile;

  final String? enablePurchase;

  final String? enableSales;

  final String? enableSerialization;

  final String? enableSupplierManagement;

  final String? enableVariation;

  final String? enableVariationBasedItem;

  final String? enableWarehouseManagement;

  final String? enableWorkflowApprovalForItem;

  final SettingsGeneralSettingsItemUpdatedItemInventoryAdjustmentRules?
      inventoryAdjustmentRules;

  final SettingsGeneralSettingsItemUpdatedItemItemGrouping? itemGrouping;

  final SettingsGeneralSettingsItemUpdatedItemItemManagement? itemManagement;

  final SettingsGeneralSettingsItemUpdatedItemPreOrder? preOrder;

  final SettingsGeneralSettingsItemUpdatedItemPricingPeriodCanVaryFromChargingPeriod?
      pricingPeriodCanVaryFromChargingPeriod;

  final SettingsGeneralSettingsItemUpdatedItemPurchasePriceEnteredIsInclusiveOfTax?
      purchasePriceEnteredIsInclusiveOfTax;

  final String? requireNameToBeUnique;

  final SettingsGeneralSettingsItemUpdatedItemSalePriceEnteredIsInclusiveOfTax?
      salePriceEnteredIsInclusiveOfTax;

  final String? useOnSalePrice;

  final String? usePricingLevel;

  final String? useSchedulingOfFuturePricing;

  final String? useShippingProfile;

  final SettingsGeneralSettingsItemUpdatedItemUseVolumePricing?
      useVolumePricing;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'available_charge_types': availableChargeTypes,
        'available_pricing_methods': availablePricingMethods,
        'charging_period_can_vary_from_billing_period':
            chargingPeriodCanVaryFromBillingPeriod,
        'charging_start_date_can_vary_from_billing_start_date':
            chargingStartDateCanVaryFromBillingStartDate,
        'enable_back_order': enableBackOrder,
        'enable_batch_tracking': enableBatchTracking,
        'enable_bundle_item': enableBundleItem,
        'enable_direct_cost_item': enableDirectCostItem,
        'enable_family_cost_item': enableFamilyCostItem,
        'enable_fixed_asset_item': enableFixedAssetItem,
        'enable_gift_certificate_based_item': enableGiftCertificateBasedItem,
        'enable_inventory_costing': enableInventoryCosting,
        'enable_inventory_management': enableInventoryManagement,
        'enable_pricing_profile': enablePricingProfile,
        'enable_purchase': enablePurchase,
        'enable_sales': enableSales,
        'enable_serialization': enableSerialization,
        'enable_supplier_management': enableSupplierManagement,
        'enable_variation': enableVariation,
        'enable_variation_based_item': enableVariationBasedItem,
        'enable_warehouse_management': enableWarehouseManagement,
        'enable_workflow_approval_for_item': enableWorkflowApprovalForItem,
        'inventory_adjustment_rules': inventoryAdjustmentRules,
        'item_grouping': itemGrouping,
        'item_management': itemManagement,
        'pre_order': preOrder,
        'pricing_period_can_vary_from_charging_period':
            pricingPeriodCanVaryFromChargingPeriod,
        'purchase_price_entered_is_inclusive_of_tax':
            purchasePriceEnteredIsInclusiveOfTax,
        'require_name_to_be_unique': requireNameToBeUnique,
        'sale_price_entered_is_inclusive_of_tax':
            salePriceEnteredIsInclusiveOfTax,
        'use_on_sale_price': useOnSalePrice,
        'use_pricing_level': usePricingLevel,
        'use_scheduling_of_future_pricing': useSchedulingOfFuturePricing,
        'use_shipping_profile': useShippingProfile,
        'use_volume_pricing': useVolumePricing,
      };
}

/// A [SettingsGeneralSettingsItemUpdated]'s `product`.
class SettingsGeneralSettingsItemUpdatedProduct extends Dto {
  const SettingsGeneralSettingsItemUpdatedProduct({
    this.allowItemSellMultiQuantity,
    this.allowPlanSellMultiQuantity,
    this.allowProductSellMultiQuantity,
    this.allowRateSellMultiQuantity,
    this.itemQuantityUse,
    this.planQuantityUse,
    this.productQuantityUse,
    this.rateQuantityUse,
  });

  static SettingsGeneralSettingsItemUpdatedProduct? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedProduct(
      allowItemSellMultiQuantity:
          readText(source['allow_item_sell_multi_quantity']),
      allowPlanSellMultiQuantity:
          readText(source['allow_plan_sell_multi_quantity']),
      allowProductSellMultiQuantity:
          readText(source['allow_product_sell_multi_quantity']),
      allowRateSellMultiQuantity:
          readText(source['allow_rate_sell_multi_quantity']),
      itemQuantityUse: readText(source['item_quantity_use']),
      planQuantityUse: readText(source['plan_quantity_use']),
      productQuantityUse: readText(source['product_quantity_use']),
      rateQuantityUse: readText(source['rate_quantity_use']),
    );
  }

  final String? allowItemSellMultiQuantity;

  final String? allowPlanSellMultiQuantity;

  final String? allowProductSellMultiQuantity;

  final String? allowRateSellMultiQuantity;

  final String? itemQuantityUse;

  final String? planQuantityUse;

  final String? productQuantityUse;

  final String? rateQuantityUse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'allow_item_sell_multi_quantity': allowItemSellMultiQuantity,
        'allow_plan_sell_multi_quantity': allowPlanSellMultiQuantity,
        'allow_product_sell_multi_quantity': allowProductSellMultiQuantity,
        'allow_rate_sell_multi_quantity': allowRateSellMultiQuantity,
        'item_quantity_use': itemQuantityUse,
        'plan_quantity_use': planQuantityUse,
        'product_quantity_use': productQuantityUse,
        'rate_quantity_use': rateQuantityUse,
      };
}

/// One entry of a [SettingsFieldSettingsAccountUpdated]'s `data`.
class SettingsFieldSettingsAccountUpdatedData extends Dto {
  const SettingsFieldSettingsAccountUpdatedData({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayCode,
    this.editable,
    this.enabled,
    this.entity,
    this.fieldName,
    this.fieldType,
    this.globalSearch,
    this.groupKey,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.mandatory,
    this.note,
    this.object,
    this.sortOrder,
  });

  static SettingsFieldSettingsAccountUpdatedData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsAccountUpdatedData(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      displayCode: readText(source['display_code']),
      editable: readAny(source['editable']),
      enabled: readFlag(source['enabled']),
      entity: readText(source['entity']),
      fieldName: readText(source['field_name']),
      fieldType: readText(source['field_type']),
      globalSearch: readFlag(source['global_search']),
      groupKey: readText(source['group_key']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      mandatory: readFlag(source['mandatory']),
      note: readAny(source['note']),
      object: readText(source['object']),
      sortOrder: readInteger(source['sort_order']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? createdBy;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? description;

  final String? displayCode;

  /// Untyped: null in every record measured.
  final Object? editable;

  final bool? enabled;

  final String? entity;

  final String? fieldName;

  final String? fieldType;

  final bool? globalSearch;

  final String? groupKey;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final bool? mandatory;

  /// Untyped: null in every record measured.
  final Object? note;

  final String? object;

  final int? sortOrder;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_code': displayCode,
        'editable': editable,
        'enabled': enabled,
        'entity': entity,
        'field_name': fieldName,
        'field_type': fieldType,
        'global_search': globalSearch,
        'group_key': groupKey,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'mandatory': mandatory,
        'note': note,
        'object': object,
        'sort_order': sortOrder,
      };
}

/// One entry of a [SettingsFieldSettingsItemUpdated]'s `data`.
class SettingsFieldSettingsItemUpdatedData extends Dto {
  const SettingsFieldSettingsItemUpdatedData({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayCode,
    this.editable,
    this.enabled,
    this.entity,
    this.fieldName,
    this.fieldType,
    this.globalSearch,
    this.groupKey,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.mandatory,
    this.note,
    this.object,
    this.sortOrder,
  });

  static SettingsFieldSettingsItemUpdatedData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItemUpdatedData(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      displayCode: readText(source['display_code']),
      editable: readAny(source['editable']),
      enabled: readFlag(source['enabled']),
      entity: readText(source['entity']),
      fieldName: readText(source['field_name']),
      fieldType: readText(source['field_type']),
      globalSearch: readFlag(source['global_search']),
      groupKey: readText(source['group_key']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      mandatory: readFlag(source['mandatory']),
      note: readAny(source['note']),
      object: readText(source['object']),
      sortOrder: readInteger(source['sort_order']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? createdBy;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? description;

  final String? displayCode;

  /// Untyped: null in every record measured.
  final Object? editable;

  final bool? enabled;

  final String? entity;

  final String? fieldName;

  final String? fieldType;

  final bool? globalSearch;

  final String? groupKey;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final bool? mandatory;

  /// Untyped: null in every record measured.
  final Object? note;

  final String? object;

  final int? sortOrder;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_code': displayCode,
        'editable': editable,
        'enabled': enabled,
        'entity': entity,
        'field_name': fieldName,
        'field_type': fieldType,
        'global_search': globalSearch,
        'group_key': groupKey,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'mandatory': mandatory,
        'note': note,
        'object': object,
        'sort_order': sortOrder,
      };
}

/// One entry of a [SettingsCustomObjectCustomizeConfiguration]'s `attributes`.
class SettingsCustomObjectCustomizeConfigurationAttribute extends Dto {
  const SettingsCustomObjectCustomizeConfigurationAttribute({
    this.name,
    this.order,
  });

  static SettingsCustomObjectCustomizeConfigurationAttribute? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsCustomObjectCustomizeConfigurationAttribute(
      name: readText(source['name']),
      order: readInteger(source['order']),
    );
  }

  final String? name;

  final int? order;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'order': order,
      };
}

/// A [SettingsGeneralSettingsAccountUpdatedAccount]'s `account_grouping`.
class SettingsGeneralSettingsAccountUpdatedAccountAccountGrouping extends Dto {
  const SettingsGeneralSettingsAccountUpdatedAccountAccountGrouping({
    this.defaultGroup,
    this.enabled,
  });

  static SettingsGeneralSettingsAccountUpdatedAccountAccountGrouping? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsAccountUpdatedAccountAccountGrouping(
      defaultGroup: readAny(source['default_group']),
      enabled: readText(source['enabled']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? defaultGroup;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_group': defaultGroup,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettingsAccountUpdatedAccount]'s `creation_of_subsidiary_account`.
class SettingsGeneralSettingsAccountUpdatedAccountCreationOfSubsidiaryAccount
    extends Dto {
  const SettingsGeneralSettingsAccountUpdatedAccountCreationOfSubsidiaryAccount({
    this.defaultGroup,
    this.enabled,
  });

  static SettingsGeneralSettingsAccountUpdatedAccountCreationOfSubsidiaryAccount?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsAccountUpdatedAccountCreationOfSubsidiaryAccount(
      defaultGroup: readAny(source['default_group']),
      enabled: readText(source['enabled']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? defaultGroup;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_group': defaultGroup,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettingsAccountUpdatedAccount]'s `account_management`.
class SettingsGeneralSettingsAccountUpdatedAccountAccountManagement
    extends Dto {
  const SettingsGeneralSettingsAccountUpdatedAccountAccountManagement({
    this.defaultManager,
    this.enabled,
  });

  static SettingsGeneralSettingsAccountUpdatedAccountAccountManagement? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsAccountUpdatedAccountAccountManagement(
      defaultManager: readAny(source['default_manager']),
      enabled: readText(source['enabled']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? defaultManager;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_manager': defaultManager,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettingsAccountUpdatedAccount]'s `sales_rep_tracking_at_account_level`.
class SettingsGeneralSettingsAccountUpdatedAccountSalesRepTrackingAtAccountLevel
    extends Dto {
  const SettingsGeneralSettingsAccountUpdatedAccountSalesRepTrackingAtAccountLevel({
    this.defaultSalesRepTracking,
    this.enabled,
  });

  static SettingsGeneralSettingsAccountUpdatedAccountSalesRepTrackingAtAccountLevel?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsAccountUpdatedAccountSalesRepTrackingAtAccountLevel(
      defaultSalesRepTracking: readAny(source['default_sales_rep_tracking']),
      enabled: readText(source['enabled']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? defaultSalesRepTracking;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_sales_rep_tracking': defaultSalesRepTracking,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettingsAccountUpdatedAccount]'s `referral_tracking_at_account_level`.
class SettingsGeneralSettingsAccountUpdatedAccountReferralTrackingAtAccountLevel
    extends Dto {
  const SettingsGeneralSettingsAccountUpdatedAccountReferralTrackingAtAccountLevel({
    this.defaultReferralTracking,
    this.enabled,
  });

  static SettingsGeneralSettingsAccountUpdatedAccountReferralTrackingAtAccountLevel?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsAccountUpdatedAccountReferralTrackingAtAccountLevel(
      defaultReferralTracking: readAny(source['default_referral_tracking']),
      enabled: readText(source['enabled']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? defaultReferralTracking;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_referral_tracking': defaultReferralTracking,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettingsAccountUpdatedAccount]'s `billing_contact`.
class SettingsGeneralSettingsAccountUpdatedAccountBillingContact extends Dto {
  const SettingsGeneralSettingsAccountUpdatedAccountBillingContact({
    this.displayName,
    this.enabled,
    this.requireEmailAddressForBillingContact,
    this.type,
  });

  static SettingsGeneralSettingsAccountUpdatedAccountBillingContact? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsAccountUpdatedAccountBillingContact(
      displayName: readText(source['display_name']),
      enabled: readText(source['enabled']),
      requireEmailAddressForBillingContact:
          readText(source['require_email_address_for_billing_contact']),
      type: readText(source['type']),
    );
  }

  final String? displayName;

  final String? enabled;

  final String? requireEmailAddressForBillingContact;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_name': displayName,
        'enabled': enabled,
        'require_email_address_for_billing_contact':
            requireEmailAddressForBillingContact,
        'type': type,
      };
}

/// A [SettingsGeneralSettingsAccountUpdatedAccount]'s `shipping_contact`.
class SettingsGeneralSettingsAccountUpdatedAccountShippingContact extends Dto {
  const SettingsGeneralSettingsAccountUpdatedAccountShippingContact({
    this.displayName,
    this.enabled,
    this.requireEmailAddressForShippingContact,
    this.type,
  });

  static SettingsGeneralSettingsAccountUpdatedAccountShippingContact? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsAccountUpdatedAccountShippingContact(
      displayName: readText(source['display_name']),
      enabled: readText(source['enabled']),
      requireEmailAddressForShippingContact:
          readText(source['require_email_address_for_shipping_contact']),
      type: readText(source['type']),
    );
  }

  final String? displayName;

  final String? enabled;

  final String? requireEmailAddressForShippingContact;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_name': displayName,
        'enabled': enabled,
        'require_email_address_for_shipping_contact':
            requireEmailAddressForShippingContact,
        'type': type,
      };
}

/// A [SettingsGeneralSettingsAccountUpdatedAccount]'s `additional_contact_1`.
class SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact1
    extends Dto {
  const SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact1({
    this.displayName,
    this.enabled,
    this.requireEmailAddressForAdditionalContact1,
    this.type,
  });

  static SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact1?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact1(
      displayName: readText(source['display_name']),
      enabled: readText(source['enabled']),
      requireEmailAddressForAdditionalContact1:
          readText(source['require_email_address_for_additional_contact_1']),
      type: readText(source['type']),
    );
  }

  final String? displayName;

  final String? enabled;

  final String? requireEmailAddressForAdditionalContact1;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_name': displayName,
        'enabled': enabled,
        'require_email_address_for_additional_contact_1':
            requireEmailAddressForAdditionalContact1,
        'type': type,
      };
}

/// A [SettingsGeneralSettingsAccountUpdatedAccount]'s `additional_contact_2`.
class SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact2
    extends Dto {
  const SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact2({
    this.displayName,
    this.enabled,
    this.requireEmailAddressForAdditionalContact2,
    this.type,
  });

  static SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact2?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact2(
      displayName: readText(source['display_name']),
      enabled: readText(source['enabled']),
      requireEmailAddressForAdditionalContact2:
          readText(source['require_email_address_for_additional_contact_2']),
      type: readText(source['type']),
    );
  }

  final String? displayName;

  final String? enabled;

  final String? requireEmailAddressForAdditionalContact2;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_name': displayName,
        'enabled': enabled,
        'require_email_address_for_additional_contact_2':
            requireEmailAddressForAdditionalContact2,
        'type': type,
      };
}

/// A [SettingsGeneralSettingsAccountUpdatedAccount]'s `additional_contact_3`.
class SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact3
    extends Dto {
  const SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact3({
    this.displayName,
    this.enabled,
    this.requireEmailAddressForAdditionalContact3,
    this.type,
  });

  static SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact3?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsAccountUpdatedAccountAdditionalContact3(
      displayName: readText(source['display_name']),
      enabled: readText(source['enabled']),
      requireEmailAddressForAdditionalContact3:
          readText(source['require_email_address_for_additional_contact_3']),
      type: readText(source['type']),
    );
  }

  final String? displayName;

  final String? enabled;

  final String? requireEmailAddressForAdditionalContact3;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_name': displayName,
        'enabled': enabled,
        'require_email_address_for_additional_contact_3':
            requireEmailAddressForAdditionalContact3,
        'type': type,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedItem]'s `available_charge_types`.
class SettingsGeneralSettingsItemUpdatedItemAvailableChargeTypes extends Dto {
  const SettingsGeneralSettingsItemUpdatedItemAvailableChargeTypes({
    this.metered,
    this.oneOff,
    this.recurring,
  });

  static SettingsGeneralSettingsItemUpdatedItemAvailableChargeTypes? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedItemAvailableChargeTypes(
      metered: readText(source['metered']),
      oneOff: readText(source['one_off']),
      recurring: readText(source['recurring']),
    );
  }

  final String? metered;

  final String? oneOff;

  final String? recurring;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'metered': metered,
        'one_off': oneOff,
        'recurring': recurring,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedItem]'s `available_pricing_methods`.
class SettingsGeneralSettingsItemUpdatedItemAvailablePricingMethods
    extends Dto {
  const SettingsGeneralSettingsItemUpdatedItemAvailablePricingMethods({
    this.discountBased,
    this.markupBased,
    this.standard,
  });

  static SettingsGeneralSettingsItemUpdatedItemAvailablePricingMethods? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedItemAvailablePricingMethods(
      discountBased: readText(source['discount_based']),
      markupBased: readText(source['markup_based']),
      standard: readText(source['standard']),
    );
  }

  final String? discountBased;

  final String? markupBased;

  final String? standard;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'discount_based': discountBased,
        'markup_based': markupBased,
        'standard': standard,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedItem]'s `item_grouping`.
class SettingsGeneralSettingsItemUpdatedItemItemGrouping extends Dto {
  const SettingsGeneralSettingsItemUpdatedItemItemGrouping({
    this.defaultGroup,
    this.enabled,
  });

  static SettingsGeneralSettingsItemUpdatedItemItemGrouping? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedItemItemGrouping(
      defaultGroup: readAny(source['default_group']),
      enabled: readText(source['enabled']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? defaultGroup;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_group': defaultGroup,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedItem]'s `item_management`.
class SettingsGeneralSettingsItemUpdatedItemItemManagement extends Dto {
  const SettingsGeneralSettingsItemUpdatedItemItemManagement({
    this.defaultManager,
    this.enabled,
  });

  static SettingsGeneralSettingsItemUpdatedItemItemManagement? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedItemItemManagement(
      defaultManager: readAny(source['default_manager']),
      enabled: readText(source['enabled']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? defaultManager;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_manager': defaultManager,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedItem]'s `use_volume_pricing`.
class SettingsGeneralSettingsItemUpdatedItemUseVolumePricing extends Dto {
  const SettingsGeneralSettingsItemUpdatedItemUseVolumePricing({
    this.allUnitsFixedPricing,
    this.allUnitsPerUnitPricing,
    this.enabled,
    this.incrementalFixedPricing,
    this.incrementalPerUnitPricing,
  });

  static SettingsGeneralSettingsItemUpdatedItemUseVolumePricing? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedItemUseVolumePricing(
      allUnitsFixedPricing: readText(source['all_units_fixed_pricing']),
      allUnitsPerUnitPricing: readText(source['all_units_per_unit_pricing']),
      enabled: readText(source['enabled']),
      incrementalFixedPricing: readText(source['incremental_fixed_pricing']),
      incrementalPerUnitPricing:
          readText(source['incremental_per_unit_pricing']),
    );
  }

  final String? allUnitsFixedPricing;

  final String? allUnitsPerUnitPricing;

  final String? enabled;

  final String? incrementalFixedPricing;

  final String? incrementalPerUnitPricing;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'all_units_fixed_pricing': allUnitsFixedPricing,
        'all_units_per_unit_pricing': allUnitsPerUnitPricing,
        'enabled': enabled,
        'incremental_fixed_pricing': incrementalFixedPricing,
        'incremental_per_unit_pricing': incrementalPerUnitPricing,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedItem]'s `pricing_period_can_vary_from_charging_period`.
class SettingsGeneralSettingsItemUpdatedItemPricingPeriodCanVaryFromChargingPeriod
    extends Dto {
  const SettingsGeneralSettingsItemUpdatedItemPricingPeriodCanVaryFromChargingPeriod({
    this.defaultPricingPeriod,
    this.enabled,
  });

  static SettingsGeneralSettingsItemUpdatedItemPricingPeriodCanVaryFromChargingPeriod?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedItemPricingPeriodCanVaryFromChargingPeriod(
      defaultPricingPeriod: readAny(source['default_pricing_period']),
      enabled: readText(source['enabled']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? defaultPricingPeriod;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_pricing_period': defaultPricingPeriod,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedItem]'s `sale_price_entered_is_inclusive_of_tax`.
class SettingsGeneralSettingsItemUpdatedItemSalePriceEnteredIsInclusiveOfTax
    extends Dto {
  const SettingsGeneralSettingsItemUpdatedItemSalePriceEnteredIsInclusiveOfTax({
    this.enabled,
    this.tax,
    this.taxIncludedInSalesPriceIsBasedOn,
  });

  static SettingsGeneralSettingsItemUpdatedItemSalePriceEnteredIsInclusiveOfTax?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedItemSalePriceEnteredIsInclusiveOfTax(
      enabled: readText(source['enabled']),
      tax: readAny(source['tax']),
      taxIncludedInSalesPriceIsBasedOn:
          readText(source['tax_included_in_sales_price_is_based_on']),
    );
  }

  final String? enabled;

  /// Untyped: null in every record measured.
  final Object? tax;

  final String? taxIncludedInSalesPriceIsBasedOn;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'enabled': enabled,
        'tax': tax,
        'tax_included_in_sales_price_is_based_on':
            taxIncludedInSalesPriceIsBasedOn,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedItem]'s `purchase_price_entered_is_inclusive_of_tax`.
class SettingsGeneralSettingsItemUpdatedItemPurchasePriceEnteredIsInclusiveOfTax
    extends Dto {
  const SettingsGeneralSettingsItemUpdatedItemPurchasePriceEnteredIsInclusiveOfTax({
    this.enabled,
    this.tax,
  });

  static SettingsGeneralSettingsItemUpdatedItemPurchasePriceEnteredIsInclusiveOfTax?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedItemPurchasePriceEnteredIsInclusiveOfTax(
      enabled: readText(source['enabled']),
      tax:
          SettingsGeneralSettingsItemUpdatedItemPurchasePriceEnteredIsInclusiveOfTaxTax
              .fromMap(source['tax']),
    );
  }

  final String? enabled;

  final SettingsGeneralSettingsItemUpdatedItemPurchasePriceEnteredIsInclusiveOfTaxTax?
      tax;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'enabled': enabled,
        'tax': tax,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedItem]'s `inventory_adjustment_rules`.
class SettingsGeneralSettingsItemUpdatedItemInventoryAdjustmentRules
    extends Dto {
  const SettingsGeneralSettingsItemUpdatedItemInventoryAdjustmentRules({
    this.quantityAvailableForSale,
    this.quantityAvailableForSaleDetermination,
  });

  static SettingsGeneralSettingsItemUpdatedItemInventoryAdjustmentRules?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedItemInventoryAdjustmentRules(
      quantityAvailableForSale: readText(source['quantity_available_for_sale']),
      quantityAvailableForSaleDetermination:
          readText(source['quantity_available_for_sale_determination']),
    );
  }

  final String? quantityAvailableForSale;

  final String? quantityAvailableForSaleDetermination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'quantity_available_for_sale': quantityAvailableForSale,
        'quantity_available_for_sale_determination':
            quantityAvailableForSaleDetermination,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedItem]'s `pre_order`.
class SettingsGeneralSettingsItemUpdatedItemPreOrder extends Dto {
  const SettingsGeneralSettingsItemUpdatedItemPreOrder({
    this.enabled,
    this.numberOfPeriod,
    this.period,
  });

  static SettingsGeneralSettingsItemUpdatedItemPreOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedItemPreOrder(
      enabled: readText(source['enabled']),
      numberOfPeriod: readText(source['number_of_period']),
      period: readText(source['period']),
    );
  }

  final String? enabled;

  final String? numberOfPeriod;

  final String? period;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'enabled': enabled,
        'number_of_period': numberOfPeriod,
        'period': period,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedItemPurchasePriceEnteredIsInclusiveOfTax]'s `tax`.
class SettingsGeneralSettingsItemUpdatedItemPurchasePriceEnteredIsInclusiveOfTaxTax
    extends Dto {
  const SettingsGeneralSettingsItemUpdatedItemPurchasePriceEnteredIsInclusiveOfTaxTax({
    this.uuid,
  });

  static SettingsGeneralSettingsItemUpdatedItemPurchasePriceEnteredIsInclusiveOfTaxTax?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedItemPurchasePriceEnteredIsInclusiveOfTaxTax(
      uuid: readText(source['uuid']),
    );
  }

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'uuid': uuid,
      };
}

/// One entry of a [SettingsFieldSettingsItem]'s `data`.
class SettingsFieldSettingsItemData extends Dto {
  const SettingsFieldSettingsItemData({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayCode,
    this.editable,
    this.enabled,
    this.entity,
    this.fieldName,
    this.fieldType,
    this.globalSearch,
    this.groupKey,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.mandatory,
    this.note,
    this.object,
    this.sortOrder,
  });

  static SettingsFieldSettingsItemData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItemData(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      displayCode: readText(source['display_code']),
      editable: readAny(source['editable']),
      enabled: readFlag(source['enabled']),
      entity: readText(source['entity']),
      fieldName: readText(source['field_name']),
      fieldType: readText(source['field_type']),
      globalSearch: readFlag(source['global_search']),
      groupKey: readText(source['group_key']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      mandatory: readFlag(source['mandatory']),
      note: readAny(source['note']),
      object: readText(source['object']),
      sortOrder: readInteger(source['sort_order']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? description;

  final String? displayCode;

  /// Null in every record measured, so untyped.
  final Object? editable;

  final bool? enabled;

  final String? entity;

  final String? fieldName;

  final String? fieldType;

  final bool? globalSearch;

  final String? groupKey;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final bool? mandatory;

  /// Null in every record measured, so untyped.
  final Object? note;

  final String? object;

  final int? sortOrder;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_code': displayCode,
        'editable': editable,
        'enabled': enabled,
        'entity': entity,
        'field_name': fieldName,
        'field_type': fieldType,
        'global_search': globalSearch,
        'group_key': groupKey,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'mandatory': mandatory,
        'note': note,
        'object': object,
        'sort_order': sortOrder,
      };
}

/// A [SettingsGeneralSettingsItemUpdated]'s `item`.
class SettingsGeneralSettingsItemUpdatedDetail extends Dto {
  const SettingsGeneralSettingsItemUpdatedDetail({
    this.availableChargeTypes,
    this.availablePricingMethods,
    this.chargingPeriodCanVaryFromBillingPeriod,
    this.chargingStartDateCanVaryFromBillingStartDate,
    this.enableBackOrder,
    this.enableBatchTracking,
    this.enableBundleItem,
    this.enableDirectCostItem,
    this.enableFamilyCostItem,
    this.enableFixedAssetItem,
    this.enableGiftCertificateBasedItem,
    this.enableInventoryCosting,
    this.enableInventoryManagement,
    this.enablePricingProfile,
    this.enablePurchase,
    this.enableSales,
    this.enableSerialization,
    this.enableSupplierManagement,
    this.enableVariation,
    this.enableVariationBasedItem,
    this.enableWarehouseManagement,
    this.enableWorkflowApprovalForItem,
    this.inventoryAdjustmentRules,
    this.itemGrouping,
    this.itemManagement,
    this.preOrder,
    this.pricingPeriodCanVaryFromChargingPeriod,
    this.purchasePriceEnteredIsInclusiveOfTax,
    this.requireNameToBeUnique,
    this.salePriceEnteredIsInclusiveOfTax,
    this.useOnSalePrice,
    this.usePricingLevel,
    this.useSchedulingOfFuturePricing,
    this.useShippingProfile,
    this.useVolumePricing,
  });

  static SettingsGeneralSettingsItemUpdatedDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedDetail(
      availableChargeTypes:
          SettingsGeneralSettingsItemUpdatedDetailAvailableChargeTypes.fromMap(
              source['available_charge_types']),
      availablePricingMethods:
          SettingsGeneralSettingsItemUpdatedDetailAvailablePricingMethods
              .fromMap(source['available_pricing_methods']),
      chargingPeriodCanVaryFromBillingPeriod:
          readText(source['charging_period_can_vary_from_billing_period']),
      chargingStartDateCanVaryFromBillingStartDate: readText(
          source['charging_start_date_can_vary_from_billing_start_date']),
      enableBackOrder: readText(source['enable_back_order']),
      enableBatchTracking: readText(source['enable_batch_tracking']),
      enableBundleItem: readText(source['enable_bundle_item']),
      enableDirectCostItem: readText(source['enable_direct_cost_item']),
      enableFamilyCostItem: readText(source['enable_family_cost_item']),
      enableFixedAssetItem: readText(source['enable_fixed_asset_item']),
      enableGiftCertificateBasedItem:
          readText(source['enable_gift_certificate_based_item']),
      enableInventoryCosting: readText(source['enable_inventory_costing']),
      enableInventoryManagement:
          readText(source['enable_inventory_management']),
      enablePricingProfile: readText(source['enable_pricing_profile']),
      enablePurchase: readText(source['enable_purchase']),
      enableSales: readText(source['enable_sales']),
      enableSerialization: readText(source['enable_serialization']),
      enableSupplierManagement: readText(source['enable_supplier_management']),
      enableVariation: readText(source['enable_variation']),
      enableVariationBasedItem: readText(source['enable_variation_based_item']),
      enableWarehouseManagement:
          readText(source['enable_warehouse_management']),
      enableWorkflowApprovalForItem:
          readText(source['enable_workflow_approval_for_item']),
      inventoryAdjustmentRules:
          SettingsGeneralSettingsItemUpdatedDetailInventoryAdjustmentRules
              .fromMap(source['inventory_adjustment_rules']),
      itemGrouping:
          SettingsGeneralSettingsItemUpdatedDetailItemGrouping.fromMap(
              source['item_grouping']),
      itemManagement:
          SettingsGeneralSettingsItemUpdatedDetailItemManagement.fromMap(
              source['item_management']),
      preOrder: SettingsGeneralSettingsItemUpdatedDetailPreOrder.fromMap(
          source['pre_order']),
      pricingPeriodCanVaryFromChargingPeriod:
          SettingsGeneralSettingsItemUpdatedDetailPricingPeriodCanVaryFromChargingPeriod
              .fromMap(source['pricing_period_can_vary_from_charging_period']),
      purchasePriceEnteredIsInclusiveOfTax:
          SettingsGeneralSettingsItemUpdatedDetailPurchasePriceEnteredIsInclusiveOfTax
              .fromMap(source['purchase_price_entered_is_inclusive_of_tax']),
      requireNameToBeUnique: readText(source['require_name_to_be_unique']),
      salePriceEnteredIsInclusiveOfTax:
          SettingsGeneralSettingsItemUpdatedDetailSalePriceEnteredIsInclusiveOfTax
              .fromMap(source['sale_price_entered_is_inclusive_of_tax']),
      useOnSalePrice: readText(source['use_on_sale_price']),
      usePricingLevel: readText(source['use_pricing_level']),
      useSchedulingOfFuturePricing:
          readText(source['use_scheduling_of_future_pricing']),
      useShippingProfile: readText(source['use_shipping_profile']),
      useVolumePricing:
          SettingsGeneralSettingsItemUpdatedDetailUseVolumePricing.fromMap(
              source['use_volume_pricing']),
    );
  }

  final SettingsGeneralSettingsItemUpdatedDetailAvailableChargeTypes?
      availableChargeTypes;

  final SettingsGeneralSettingsItemUpdatedDetailAvailablePricingMethods?
      availablePricingMethods;

  final String? chargingPeriodCanVaryFromBillingPeriod;

  final String? chargingStartDateCanVaryFromBillingStartDate;

  final String? enableBackOrder;

  final String? enableBatchTracking;

  final String? enableBundleItem;

  final String? enableDirectCostItem;

  final String? enableFamilyCostItem;

  final String? enableFixedAssetItem;

  final String? enableGiftCertificateBasedItem;

  final String? enableInventoryCosting;

  final String? enableInventoryManagement;

  final String? enablePricingProfile;

  final String? enablePurchase;

  final String? enableSales;

  final String? enableSerialization;

  final String? enableSupplierManagement;

  final String? enableVariation;

  final String? enableVariationBasedItem;

  final String? enableWarehouseManagement;

  final String? enableWorkflowApprovalForItem;

  final SettingsGeneralSettingsItemUpdatedDetailInventoryAdjustmentRules?
      inventoryAdjustmentRules;

  final SettingsGeneralSettingsItemUpdatedDetailItemGrouping? itemGrouping;

  final SettingsGeneralSettingsItemUpdatedDetailItemManagement? itemManagement;

  final SettingsGeneralSettingsItemUpdatedDetailPreOrder? preOrder;

  final SettingsGeneralSettingsItemUpdatedDetailPricingPeriodCanVaryFromChargingPeriod?
      pricingPeriodCanVaryFromChargingPeriod;

  final SettingsGeneralSettingsItemUpdatedDetailPurchasePriceEnteredIsInclusiveOfTax?
      purchasePriceEnteredIsInclusiveOfTax;

  final String? requireNameToBeUnique;

  final SettingsGeneralSettingsItemUpdatedDetailSalePriceEnteredIsInclusiveOfTax?
      salePriceEnteredIsInclusiveOfTax;

  final String? useOnSalePrice;

  final String? usePricingLevel;

  final String? useSchedulingOfFuturePricing;

  final String? useShippingProfile;

  final SettingsGeneralSettingsItemUpdatedDetailUseVolumePricing?
      useVolumePricing;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'available_charge_types': availableChargeTypes,
        'available_pricing_methods': availablePricingMethods,
        'charging_period_can_vary_from_billing_period':
            chargingPeriodCanVaryFromBillingPeriod,
        'charging_start_date_can_vary_from_billing_start_date':
            chargingStartDateCanVaryFromBillingStartDate,
        'enable_back_order': enableBackOrder,
        'enable_batch_tracking': enableBatchTracking,
        'enable_bundle_item': enableBundleItem,
        'enable_direct_cost_item': enableDirectCostItem,
        'enable_family_cost_item': enableFamilyCostItem,
        'enable_fixed_asset_item': enableFixedAssetItem,
        'enable_gift_certificate_based_item': enableGiftCertificateBasedItem,
        'enable_inventory_costing': enableInventoryCosting,
        'enable_inventory_management': enableInventoryManagement,
        'enable_pricing_profile': enablePricingProfile,
        'enable_purchase': enablePurchase,
        'enable_sales': enableSales,
        'enable_serialization': enableSerialization,
        'enable_supplier_management': enableSupplierManagement,
        'enable_variation': enableVariation,
        'enable_variation_based_item': enableVariationBasedItem,
        'enable_warehouse_management': enableWarehouseManagement,
        'enable_workflow_approval_for_item': enableWorkflowApprovalForItem,
        'inventory_adjustment_rules': inventoryAdjustmentRules,
        'item_grouping': itemGrouping,
        'item_management': itemManagement,
        'pre_order': preOrder,
        'pricing_period_can_vary_from_charging_period':
            pricingPeriodCanVaryFromChargingPeriod,
        'purchase_price_entered_is_inclusive_of_tax':
            purchasePriceEnteredIsInclusiveOfTax,
        'require_name_to_be_unique': requireNameToBeUnique,
        'sale_price_entered_is_inclusive_of_tax':
            salePriceEnteredIsInclusiveOfTax,
        'use_on_sale_price': useOnSalePrice,
        'use_pricing_level': usePricingLevel,
        'use_scheduling_of_future_pricing': useSchedulingOfFuturePricing,
        'use_shipping_profile': useShippingProfile,
        'use_volume_pricing': useVolumePricing,
      };
}

/// A [SettingsFieldSettingsItemGeneralSettings]'s `account`.
class SettingsFieldSettingsItemGeneralSettingsAccount extends Dto {
  const SettingsFieldSettingsItemGeneralSettingsAccount({
    this.accountGrouping,
    this.accountManagement,
    this.additionalContact1,
    this.additionalContact2,
    this.additionalContact3,
    this.billingContact,
    this.creationOfSubsidiaryAccount,
    this.enableWorkflowApprovalForAccount,
    this.referralTrackingAtAccountLevel,
    this.requireEmailAddressForAccount,
    this.requireNameToBeUnique,
    this.salesRepTrackingAtAccountLevel,
    this.sendCommunicationAsGroups,
    this.shippingContact,
    this.uniqueEmailAddressForAccount,
    this.uniqueEmailAddressForContacts,
  });

  static SettingsFieldSettingsItemGeneralSettingsAccount? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItemGeneralSettingsAccount(
      accountGrouping:
          SettingsFieldSettingsItemGeneralSettingsAccountAccountGrouping
              .fromMap(source['account_grouping']),
      accountManagement:
          SettingsFieldSettingsItemGeneralSettingsAccountAccountManagement
              .fromMap(source['account_management']),
      additionalContact1:
          SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact1
              .fromMap(source['additional_contact_1']),
      additionalContact2:
          SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact2
              .fromMap(source['additional_contact_2']),
      additionalContact3:
          SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact3
              .fromMap(source['additional_contact_3']),
      billingContact:
          SettingsFieldSettingsItemGeneralSettingsAccountBillingContact.fromMap(
              source['billing_contact']),
      creationOfSubsidiaryAccount:
          SettingsFieldSettingsItemGeneralSettingsAccountCreationOfSubsidiaryAccount
              .fromMap(source['creation_of_subsidiary_account']),
      enableWorkflowApprovalForAccount:
          readText(source['enable_workflow_approval_for_account']),
      referralTrackingAtAccountLevel:
          SettingsFieldSettingsItemGeneralSettingsAccountReferralTrackingAtAccountLevel
              .fromMap(source['referral_tracking_at_account_level']),
      requireEmailAddressForAccount:
          readText(source['require_email_address_for_account']),
      requireNameToBeUnique: readText(source['require_name_to_be_unique']),
      salesRepTrackingAtAccountLevel:
          SettingsFieldSettingsItemGeneralSettingsAccountSalesRepTrackingAtAccountLevel
              .fromMap(source['sales_rep_tracking_at_account_level']),
      sendCommunicationAsGroups:
          readText(source['send_communication_as_groups']),
      shippingContact:
          SettingsFieldSettingsItemGeneralSettingsAccountShippingContact
              .fromMap(source['shipping_contact']),
      uniqueEmailAddressForAccount:
          readText(source['unique_email_address_for_account']),
      uniqueEmailAddressForContacts:
          readText(source['unique_email_address_for_contacts']),
    );
  }

  final SettingsFieldSettingsItemGeneralSettingsAccountAccountGrouping?
      accountGrouping;

  final SettingsFieldSettingsItemGeneralSettingsAccountAccountManagement?
      accountManagement;

  final SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact1?
      additionalContact1;

  final SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact2?
      additionalContact2;

  final SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact3?
      additionalContact3;

  final SettingsFieldSettingsItemGeneralSettingsAccountBillingContact?
      billingContact;

  final SettingsFieldSettingsItemGeneralSettingsAccountCreationOfSubsidiaryAccount?
      creationOfSubsidiaryAccount;

  final String? enableWorkflowApprovalForAccount;

  final SettingsFieldSettingsItemGeneralSettingsAccountReferralTrackingAtAccountLevel?
      referralTrackingAtAccountLevel;

  final String? requireEmailAddressForAccount;

  final String? requireNameToBeUnique;

  final SettingsFieldSettingsItemGeneralSettingsAccountSalesRepTrackingAtAccountLevel?
      salesRepTrackingAtAccountLevel;

  final String? sendCommunicationAsGroups;

  final SettingsFieldSettingsItemGeneralSettingsAccountShippingContact?
      shippingContact;

  final String? uniqueEmailAddressForAccount;

  final String? uniqueEmailAddressForContacts;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account_grouping': accountGrouping,
        'account_management': accountManagement,
        'additional_contact_1': additionalContact1,
        'additional_contact_2': additionalContact2,
        'additional_contact_3': additionalContact3,
        'billing_contact': billingContact,
        'creation_of_subsidiary_account': creationOfSubsidiaryAccount,
        'enable_workflow_approval_for_account':
            enableWorkflowApprovalForAccount,
        'referral_tracking_at_account_level': referralTrackingAtAccountLevel,
        'require_email_address_for_account': requireEmailAddressForAccount,
        'require_name_to_be_unique': requireNameToBeUnique,
        'sales_rep_tracking_at_account_level': salesRepTrackingAtAccountLevel,
        'send_communication_as_groups': sendCommunicationAsGroups,
        'shipping_contact': shippingContact,
        'unique_email_address_for_account': uniqueEmailAddressForAccount,
        'unique_email_address_for_contacts': uniqueEmailAddressForContacts,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedDetail]'s `available_charge_types`.
class SettingsGeneralSettingsItemUpdatedDetailAvailableChargeTypes extends Dto {
  const SettingsGeneralSettingsItemUpdatedDetailAvailableChargeTypes({
    this.metered,
    this.oneOff,
    this.recurring,
  });

  static SettingsGeneralSettingsItemUpdatedDetailAvailableChargeTypes? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedDetailAvailableChargeTypes(
      metered: readText(source['metered']),
      oneOff: readText(source['one_off']),
      recurring: readText(source['recurring']),
    );
  }

  final String? metered;

  final String? oneOff;

  final String? recurring;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'metered': metered,
        'one_off': oneOff,
        'recurring': recurring,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedDetail]'s `available_pricing_methods`.
class SettingsGeneralSettingsItemUpdatedDetailAvailablePricingMethods
    extends Dto {
  const SettingsGeneralSettingsItemUpdatedDetailAvailablePricingMethods({
    this.discountBased,
    this.markupBased,
    this.standard,
  });

  static SettingsGeneralSettingsItemUpdatedDetailAvailablePricingMethods?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedDetailAvailablePricingMethods(
      discountBased: readText(source['discount_based']),
      markupBased: readText(source['markup_based']),
      standard: readText(source['standard']),
    );
  }

  final String? discountBased;

  final String? markupBased;

  final String? standard;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'discount_based': discountBased,
        'markup_based': markupBased,
        'standard': standard,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedDetail]'s `item_grouping`.
class SettingsGeneralSettingsItemUpdatedDetailItemGrouping extends Dto {
  const SettingsGeneralSettingsItemUpdatedDetailItemGrouping({
    this.defaultGroup,
    this.enabled,
  });

  static SettingsGeneralSettingsItemUpdatedDetailItemGrouping? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedDetailItemGrouping(
      defaultGroup: readAny(source['default_group']),
      enabled: readText(source['enabled']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? defaultGroup;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_group': defaultGroup,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedDetail]'s `item_management`.
class SettingsGeneralSettingsItemUpdatedDetailItemManagement extends Dto {
  const SettingsGeneralSettingsItemUpdatedDetailItemManagement({
    this.defaultManager,
    this.enabled,
  });

  static SettingsGeneralSettingsItemUpdatedDetailItemManagement? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedDetailItemManagement(
      defaultManager: readAny(source['default_manager']),
      enabled: readText(source['enabled']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? defaultManager;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_manager': defaultManager,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedDetail]'s `use_volume_pricing`.
class SettingsGeneralSettingsItemUpdatedDetailUseVolumePricing extends Dto {
  const SettingsGeneralSettingsItemUpdatedDetailUseVolumePricing({
    this.allUnitsFixedPricing,
    this.allUnitsPerUnitPricing,
    this.enabled,
    this.incrementalFixedPricing,
    this.incrementalPerUnitPricing,
  });

  static SettingsGeneralSettingsItemUpdatedDetailUseVolumePricing? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedDetailUseVolumePricing(
      allUnitsFixedPricing: readText(source['all_units_fixed_pricing']),
      allUnitsPerUnitPricing: readText(source['all_units_per_unit_pricing']),
      enabled: readText(source['enabled']),
      incrementalFixedPricing: readText(source['incremental_fixed_pricing']),
      incrementalPerUnitPricing:
          readText(source['incremental_per_unit_pricing']),
    );
  }

  final String? allUnitsFixedPricing;

  final String? allUnitsPerUnitPricing;

  final String? enabled;

  final String? incrementalFixedPricing;

  final String? incrementalPerUnitPricing;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'all_units_fixed_pricing': allUnitsFixedPricing,
        'all_units_per_unit_pricing': allUnitsPerUnitPricing,
        'enabled': enabled,
        'incremental_fixed_pricing': incrementalFixedPricing,
        'incremental_per_unit_pricing': incrementalPerUnitPricing,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedDetail]'s
/// `pricing_period_can_vary_from_charging_period`.
class SettingsGeneralSettingsItemUpdatedDetailPricingPeriodCanVaryFromChargingPeriod
    extends Dto {
  const SettingsGeneralSettingsItemUpdatedDetailPricingPeriodCanVaryFromChargingPeriod({
    this.defaultPricingPeriod,
    this.enabled,
  });

  static SettingsGeneralSettingsItemUpdatedDetailPricingPeriodCanVaryFromChargingPeriod?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedDetailPricingPeriodCanVaryFromChargingPeriod(
      defaultPricingPeriod: readAny(source['default_pricing_period']),
      enabled: readText(source['enabled']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? defaultPricingPeriod;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_pricing_period': defaultPricingPeriod,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedDetail]'s
/// `sale_price_entered_is_inclusive_of_tax`.
class SettingsGeneralSettingsItemUpdatedDetailSalePriceEnteredIsInclusiveOfTax
    extends Dto {
  const SettingsGeneralSettingsItemUpdatedDetailSalePriceEnteredIsInclusiveOfTax({
    this.enabled,
    this.tax,
    this.taxIncludedInSalesPriceIsBasedOn,
  });

  static SettingsGeneralSettingsItemUpdatedDetailSalePriceEnteredIsInclusiveOfTax?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedDetailSalePriceEnteredIsInclusiveOfTax(
      enabled: readText(source['enabled']),
      tax: readAny(source['tax']),
      taxIncludedInSalesPriceIsBasedOn:
          readText(source['tax_included_in_sales_price_is_based_on']),
    );
  }

  final String? enabled;

  /// Null in every record measured, so untyped.
  final Object? tax;

  final String? taxIncludedInSalesPriceIsBasedOn;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'enabled': enabled,
        'tax': tax,
        'tax_included_in_sales_price_is_based_on':
            taxIncludedInSalesPriceIsBasedOn,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedDetail]'s
/// `purchase_price_entered_is_inclusive_of_tax`.
class SettingsGeneralSettingsItemUpdatedDetailPurchasePriceEnteredIsInclusiveOfTax
    extends Dto {
  const SettingsGeneralSettingsItemUpdatedDetailPurchasePriceEnteredIsInclusiveOfTax({
    this.enabled,
    this.tax,
  });

  static SettingsGeneralSettingsItemUpdatedDetailPurchasePriceEnteredIsInclusiveOfTax?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedDetailPurchasePriceEnteredIsInclusiveOfTax(
      enabled: readText(source['enabled']),
      tax:
          SettingsGeneralSettingsItemUpdatedDetailPurchasePriceEnteredIsInclusiveOfTaxDetail
              .fromMap(source['tax']),
    );
  }

  final String? enabled;

  final SettingsGeneralSettingsItemUpdatedDetailPurchasePriceEnteredIsInclusiveOfTaxDetail?
      tax;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'enabled': enabled,
        'tax': tax,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedDetail]'s `inventory_adjustment_rules`.
class SettingsGeneralSettingsItemUpdatedDetailInventoryAdjustmentRules
    extends Dto {
  const SettingsGeneralSettingsItemUpdatedDetailInventoryAdjustmentRules({
    this.quantityAvailableForSale,
    this.quantityAvailableForSaleDetermination,
  });

  static SettingsGeneralSettingsItemUpdatedDetailInventoryAdjustmentRules?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedDetailInventoryAdjustmentRules(
      quantityAvailableForSale: readText(source['quantity_available_for_sale']),
      quantityAvailableForSaleDetermination:
          readText(source['quantity_available_for_sale_determination']),
    );
  }

  final String? quantityAvailableForSale;

  final String? quantityAvailableForSaleDetermination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'quantity_available_for_sale': quantityAvailableForSale,
        'quantity_available_for_sale_determination':
            quantityAvailableForSaleDetermination,
      };
}

/// A [SettingsGeneralSettingsItemUpdatedDetail]'s `pre_order`.
class SettingsGeneralSettingsItemUpdatedDetailPreOrder extends Dto {
  const SettingsGeneralSettingsItemUpdatedDetailPreOrder({
    this.enabled,
    this.numberOfPeriod,
    this.period,
  });

  static SettingsGeneralSettingsItemUpdatedDetailPreOrder? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedDetailPreOrder(
      enabled: readText(source['enabled']),
      numberOfPeriod: readText(source['number_of_period']),
      period: readText(source['period']),
    );
  }

  final String? enabled;

  final String? numberOfPeriod;

  final String? period;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'enabled': enabled,
        'number_of_period': numberOfPeriod,
        'period': period,
      };
}

/// A [SettingsFieldSettingsItemGeneralSettingsAccount]'s `account_grouping`.
class SettingsFieldSettingsItemGeneralSettingsAccountAccountGrouping
    extends Dto {
  const SettingsFieldSettingsItemGeneralSettingsAccountAccountGrouping({
    this.defaultGroup,
    this.enabled,
  });

  static SettingsFieldSettingsItemGeneralSettingsAccountAccountGrouping?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItemGeneralSettingsAccountAccountGrouping(
      defaultGroup: readAny(source['default_group']),
      enabled: readText(source['enabled']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? defaultGroup;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_group': defaultGroup,
        'enabled': enabled,
      };
}

/// A [SettingsFieldSettingsItemGeneralSettingsAccount]'s
/// `creation_of_subsidiary_account`.
class SettingsFieldSettingsItemGeneralSettingsAccountCreationOfSubsidiaryAccount
    extends Dto {
  const SettingsFieldSettingsItemGeneralSettingsAccountCreationOfSubsidiaryAccount({
    this.defaultGroup,
    this.enabled,
  });

  static SettingsFieldSettingsItemGeneralSettingsAccountCreationOfSubsidiaryAccount?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItemGeneralSettingsAccountCreationOfSubsidiaryAccount(
      defaultGroup: readAny(source['default_group']),
      enabled: readText(source['enabled']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? defaultGroup;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_group': defaultGroup,
        'enabled': enabled,
      };
}

/// A [SettingsFieldSettingsItemGeneralSettingsAccount]'s `account_management`.
class SettingsFieldSettingsItemGeneralSettingsAccountAccountManagement
    extends Dto {
  const SettingsFieldSettingsItemGeneralSettingsAccountAccountManagement({
    this.defaultManager,
    this.enabled,
  });

  static SettingsFieldSettingsItemGeneralSettingsAccountAccountManagement?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItemGeneralSettingsAccountAccountManagement(
      defaultManager: readAny(source['default_manager']),
      enabled: readText(source['enabled']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? defaultManager;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_manager': defaultManager,
        'enabled': enabled,
      };
}

/// A [SettingsFieldSettingsItemGeneralSettingsAccount]'s
/// `sales_rep_tracking_at_account_level`.
class SettingsFieldSettingsItemGeneralSettingsAccountSalesRepTrackingAtAccountLevel
    extends Dto {
  const SettingsFieldSettingsItemGeneralSettingsAccountSalesRepTrackingAtAccountLevel({
    this.defaultSalesRepTracking,
    this.enabled,
  });

  static SettingsFieldSettingsItemGeneralSettingsAccountSalesRepTrackingAtAccountLevel?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItemGeneralSettingsAccountSalesRepTrackingAtAccountLevel(
      defaultSalesRepTracking: readAny(source['default_sales_rep_tracking']),
      enabled: readText(source['enabled']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? defaultSalesRepTracking;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_sales_rep_tracking': defaultSalesRepTracking,
        'enabled': enabled,
      };
}

/// A [SettingsFieldSettingsItemGeneralSettingsAccount]'s
/// `referral_tracking_at_account_level`.
class SettingsFieldSettingsItemGeneralSettingsAccountReferralTrackingAtAccountLevel
    extends Dto {
  const SettingsFieldSettingsItemGeneralSettingsAccountReferralTrackingAtAccountLevel({
    this.defaultReferralTracking,
    this.enabled,
  });

  static SettingsFieldSettingsItemGeneralSettingsAccountReferralTrackingAtAccountLevel?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItemGeneralSettingsAccountReferralTrackingAtAccountLevel(
      defaultReferralTracking: readAny(source['default_referral_tracking']),
      enabled: readText(source['enabled']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? defaultReferralTracking;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_referral_tracking': defaultReferralTracking,
        'enabled': enabled,
      };
}

/// A [SettingsFieldSettingsItemGeneralSettingsAccount]'s `billing_contact`.
class SettingsFieldSettingsItemGeneralSettingsAccountBillingContact
    extends Dto {
  const SettingsFieldSettingsItemGeneralSettingsAccountBillingContact({
    this.displayName,
    this.enabled,
    this.requireEmailAddressForBillingContact,
    this.type,
  });

  static SettingsFieldSettingsItemGeneralSettingsAccountBillingContact? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItemGeneralSettingsAccountBillingContact(
      displayName: readText(source['display_name']),
      enabled: readText(source['enabled']),
      requireEmailAddressForBillingContact:
          readText(source['require_email_address_for_billing_contact']),
      type: readText(source['type']),
    );
  }

  final String? displayName;

  final String? enabled;

  final String? requireEmailAddressForBillingContact;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_name': displayName,
        'enabled': enabled,
        'require_email_address_for_billing_contact':
            requireEmailAddressForBillingContact,
        'type': type,
      };
}

/// A [SettingsFieldSettingsItemGeneralSettingsAccount]'s `shipping_contact`.
class SettingsFieldSettingsItemGeneralSettingsAccountShippingContact
    extends Dto {
  const SettingsFieldSettingsItemGeneralSettingsAccountShippingContact({
    this.displayName,
    this.enabled,
    this.requireEmailAddressForShippingContact,
    this.type,
  });

  static SettingsFieldSettingsItemGeneralSettingsAccountShippingContact?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItemGeneralSettingsAccountShippingContact(
      displayName: readText(source['display_name']),
      enabled: readText(source['enabled']),
      requireEmailAddressForShippingContact:
          readText(source['require_email_address_for_shipping_contact']),
      type: readText(source['type']),
    );
  }

  final String? displayName;

  final String? enabled;

  final String? requireEmailAddressForShippingContact;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_name': displayName,
        'enabled': enabled,
        'require_email_address_for_shipping_contact':
            requireEmailAddressForShippingContact,
        'type': type,
      };
}

/// A [SettingsFieldSettingsItemGeneralSettingsAccount]'s
/// `additional_contact_1`.
class SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact1
    extends Dto {
  const SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact1({
    this.displayName,
    this.enabled,
    this.requireEmailAddressForAdditionalContact1,
    this.type,
  });

  static SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact1?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact1(
      displayName: readText(source['display_name']),
      enabled: readText(source['enabled']),
      requireEmailAddressForAdditionalContact1:
          readText(source['require_email_address_for_additional_contact_1']),
      type: readText(source['type']),
    );
  }

  final String? displayName;

  final String? enabled;

  final String? requireEmailAddressForAdditionalContact1;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_name': displayName,
        'enabled': enabled,
        'require_email_address_for_additional_contact_1':
            requireEmailAddressForAdditionalContact1,
        'type': type,
      };
}

/// A [SettingsFieldSettingsItemGeneralSettingsAccount]'s
/// `additional_contact_2`.
class SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact2
    extends Dto {
  const SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact2({
    this.displayName,
    this.enabled,
    this.requireEmailAddressForAdditionalContact2,
    this.type,
  });

  static SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact2?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact2(
      displayName: readText(source['display_name']),
      enabled: readText(source['enabled']),
      requireEmailAddressForAdditionalContact2:
          readText(source['require_email_address_for_additional_contact_2']),
      type: readText(source['type']),
    );
  }

  final String? displayName;

  final String? enabled;

  final String? requireEmailAddressForAdditionalContact2;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_name': displayName,
        'enabled': enabled,
        'require_email_address_for_additional_contact_2':
            requireEmailAddressForAdditionalContact2,
        'type': type,
      };
}

/// A [SettingsFieldSettingsItemGeneralSettingsAccount]'s
/// `additional_contact_3`.
class SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact3
    extends Dto {
  const SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact3({
    this.displayName,
    this.enabled,
    this.requireEmailAddressForAdditionalContact3,
    this.type,
  });

  static SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact3?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingsItemGeneralSettingsAccountAdditionalContact3(
      displayName: readText(source['display_name']),
      enabled: readText(source['enabled']),
      requireEmailAddressForAdditionalContact3:
          readText(source['require_email_address_for_additional_contact_3']),
      type: readText(source['type']),
    );
  }

  final String? displayName;

  final String? enabled;

  final String? requireEmailAddressForAdditionalContact3;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_name': displayName,
        'enabled': enabled,
        'require_email_address_for_additional_contact_3':
            requireEmailAddressForAdditionalContact3,
        'type': type,
      };
}

/// A
/// [SettingsGeneralSettingsItemUpdatedDetailPurchasePriceEnteredIsInclusiveOfTax]'s
/// `tax`.
class SettingsGeneralSettingsItemUpdatedDetailPurchasePriceEnteredIsInclusiveOfTaxDetail
    extends Dto {
  const SettingsGeneralSettingsItemUpdatedDetailPurchasePriceEnteredIsInclusiveOfTaxDetail({
    this.uuid,
  });

  static SettingsGeneralSettingsItemUpdatedDetailPurchasePriceEnteredIsInclusiveOfTaxDetail?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsItemUpdatedDetailPurchasePriceEnteredIsInclusiveOfTaxDetail(
      uuid: readText(source['uuid']),
    );
  }

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'uuid': uuid,
      };
}

/// One custom object definition, as `/settings/custom_objects` serves it.
class SettingsCustomObjectDefinition extends Dto {
  const SettingsCustomObjectDefinition({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.relation,
    this.status,
    this.useIn,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/custom_objects',
    'GET /api/{api_version}/settings/custom_objects/{custom_object_id}',
  ];

  static SettingsCustomObjectDefinition? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsCustomObjectDefinition(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      relation: readText(source['relation']),
      status: readText(source['status']),
      useIn: readText(source['use_in']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? relation;

  final String? status;

  final String? useIn;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'relation': relation,
        'status': status,
        'use_in': useIn,
      };
}

/// One page of `SettingsCustomObjectDefinition` records, under `data`; paged by
/// cursor.
class SettingsCustomObjectDefinitionList extends Dto {
  const SettingsCustomObjectDefinitionList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/custom_objects',
  ];

  static SettingsCustomObjectDefinitionList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsCustomObjectDefinitionList(
      data: readList<SettingsCustomObjectDefinition>(
          source['data'], SettingsCustomObjectDefinition.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsCustomObjectDefinition?>? data;

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

/// One custom object definition, under `custom_object`: the record the listing
/// serves.
class SettingsCustomObjectDefinitionRead extends Dto {
  const SettingsCustomObjectDefinitionRead({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.relation,
    this.status,
    this.useIn,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/custom_objects/{custom_object_id}',
  ];

  static SettingsCustomObjectDefinitionRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_object');
    if (source == null) return null;
    return SettingsCustomObjectDefinitionRead(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      relation: readText(source['relation']),
      status: readText(source['status']),
      useIn: readText(source['use_in']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? relation;

  final String? status;

  final String? useIn;

  @override
  String? get envelopeKey => 'custom_object';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'relation': relation,
        'status': status,
        'use_in': useIn,
      };
}

/// One discount profile, under `discount_profile`: the record the listing
/// serves.
class SettingsDiscountProfileRead extends Dto {
  const SettingsDiscountProfileRead({
    this.accountingCode,
    this.createdBy,
    this.createdOn,
    this.description,
    this.discountType,
    this.displayName,
    this.endTime,
    this.fixedAmount,
    this.href,
    this.id,
    this.invoiceNote,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.maxUsePerAccount,
    this.maxUsePerOrder,
    this.maxUseTotal,
    this.name,
    this.object,
    this.ownerType,
    this.percentageAmount,
    this.priceIsInclusiveOfDiscount,
    this.priority,
    this.redemptionRequired,
    this.stackable,
    this.startTime,
    this.status,
    this.taxCode,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/discount_profiles/{discount_profile_id}',
    'POST /api/{api_version}/settings/discount_profiles',
    'PATCH /api/{api_version}/settings/discount_profiles/{discount_profile_id}',
  ];

  static SettingsDiscountProfileRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'discount_profile');
    if (source == null) return null;
    return SettingsDiscountProfileRead(
      accountingCode: SettingsDiscountProfileAccountingCode.fromMap(
          source['accounting_code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      discountType: readText(source['discount_type']),
      displayName: readText(source['display_name']),
      endTime: readText(source['end_time']),
      fixedAmount: readDecimal(source['fixed_amount']),
      href: readText(source['href']),
      id: readText(source['id']),
      invoiceNote: readText(source['invoice_note']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      maxUsePerAccount: readInteger(source['max_use_per_account']),
      maxUsePerOrder: readInteger(source['max_use_per_order']),
      maxUseTotal: readInteger(source['max_use_total']),
      name: readText(source['name']),
      object: readText(source['object']),
      ownerType: readText(source['owner_type']),
      percentageAmount: readDecimal(source['percentage_amount']),
      priceIsInclusiveOfDiscount:
          readFlag(source['price_is_inclusive_of_discount']),
      priority: readInteger(source['priority']),
      redemptionRequired: readFlag(source['redemption_required']),
      stackable: readFlag(source['stackable']),
      startTime: readText(source['start_time']),
      status: readText(source['status']),
      taxCode: SettingsDiscountProfileTaxCode.fromMap(source['tax_code']),
      version: readInteger(source['version']),
    );
  }

  final SettingsDiscountProfileAccountingCode? accountingCode;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? discountType;

  final String? displayName;

  final String? endTime;

  final double? fixedAmount;

  final String? href;

  final String? id;

  final String? invoiceNote;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final int? maxUsePerAccount;

  final int? maxUsePerOrder;

  final int? maxUseTotal;

  final String? name;

  final String? object;

  final String? ownerType;

  final double? percentageAmount;

  final bool? priceIsInclusiveOfDiscount;

  final int? priority;

  final bool? redemptionRequired;

  final bool? stackable;

  final String? startTime;

  final String? status;

  final SettingsDiscountProfileTaxCode? taxCode;

  final int? version;

  @override
  String? get envelopeKey => 'discount_profile';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'discount_type': discountType,
        'display_name': displayName,
        'end_time': endTime,
        'fixed_amount': fixedAmount,
        'href': href,
        'id': id,
        'invoice_note': invoiceNote,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'max_use_per_account': maxUsePerAccount,
        'max_use_per_order': maxUsePerOrder,
        'max_use_total': maxUseTotal,
        'name': name,
        'object': object,
        'owner_type': ownerType,
        'percentage_amount': percentageAmount,
        'price_is_inclusive_of_discount': priceIsInclusiveOfDiscount,
        'priority': priority,
        'redemption_required': redemptionRequired,
        'stackable': stackable,
        'start_time': startTime,
        'status': status,
        'tax_code': taxCode,
        'version': version,
      };
}

/// One payment processor, under `payment_processor`: the record the listing
/// serves.
class SettingsPaymentProcessorRead extends Dto {
  const SettingsPaymentProcessorRead({
    this.accountingCode,
    this.conversionRate,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.description,
    this.disconnected,
    this.displayName,
    this.gatewayType,
    this.href,
    this.id,
    this.integrationState,
    this.isDefault,
    this.isForeignCurrency,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.provider,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/payment_processors/{payment_processor_id}',
  ];

  static SettingsPaymentProcessorRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'payment_processor');
    if (source == null) return null;
    return SettingsPaymentProcessorRead(
      accountingCode: SettingsPaymentProcessorAccountingCode.fromMap(
          source['accounting_code']),
      conversionRate: readDecimal(source['conversion_rate']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: SettingsPaymentProcessorCurrency.fromMap(source['currency']),
      description: readAny(source['description']),
      disconnected: readFlag(source['disconnected']),
      displayName: readText(source['display_name']),
      gatewayType: readText(source['gateway_type']),
      href: readText(source['href']),
      id: readText(source['id']),
      integrationState: readText(source['integration_state']),
      isDefault: readFlag(source['is_default']),
      isForeignCurrency: readFlag(source['is_foreign_currency']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      provider: readText(source['provider']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final SettingsPaymentProcessorAccountingCode? accountingCode;

  final double? conversionRate;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final SettingsPaymentProcessorCurrency? currency;

  /// Null in every record measured, so untyped.
  final Object? description;

  final bool? disconnected;

  final String? displayName;

  final String? gatewayType;

  final String? href;

  final String? id;

  final String? integrationState;

  final bool? isDefault;

  final bool? isForeignCurrency;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? provider;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'payment_processor';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'conversion_rate': conversionRate,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'description': description,
        'disconnected': disconnected,
        'display_name': displayName,
        'gateway_type': gatewayType,
        'href': href,
        'id': id,
        'integration_state': integrationState,
        'is_default': isDefault,
        'is_foreign_currency': isForeignCurrency,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'provider': provider,
        'status': status,
        'version': version,
      };
}

/// One payment term, under `payment_term`: the record the listing serves.
class SettingsPaymentTermRead extends Dto {
  const SettingsPaymentTermRead({
    this.description,
    this.displayName,
    this.duration,
    this.href,
    this.id,
    this.name,
    this.object,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/payment_terms/{payment_term_id}',
  ];

  static SettingsPaymentTermRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'payment_term');
    if (source == null) return null;
    return SettingsPaymentTermRead(
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      duration: SettingsPaymentTermDuration.fromMap(source['duration']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? description;

  final String? displayName;

  final SettingsPaymentTermDuration? duration;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? status;

  @override
  String? get envelopeKey => 'payment_term';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'description': description,
        'display_name': displayName,
        'duration': duration,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'status': status,
      };
}

/// One pricing level, under `pricing_level`: the record the listing serves.
class SettingsPricingLevelRead extends Dto {
  const SettingsPricingLevelRead({
    this.builtInItem,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.isDefault,
    this.isTaxInclusive,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.ordering,
    this.status,
    this.taxCode,
    this.taxExempt,
    this.taxInclusiveBasedOn,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/pricing_levels/{pricing_level_id}',
    'PATCH /api/{api_version}/settings/pricing_levels/{pricing_level_id}',
  ];

  static SettingsPricingLevelRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'pricing_level');
    if (source == null) return null;
    return SettingsPricingLevelRead(
      builtInItem: readAny(source['built_in_item']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      isDefault: readAny(source['is_default']),
      isTaxInclusive: readFlag(source['is_tax_inclusive']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      ordering: readInteger(source['ordering']),
      status: readText(source['status']),
      taxCode: SettingsPricingLevelTaxCode.fromMap(source['tax_code']),
      taxExempt: readFlag(source['tax_exempt']),
      taxInclusiveBasedOn: readText(source['tax_inclusive_based_on']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? builtInItem;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? isDefault;

  final bool? isTaxInclusive;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final int? ordering;

  final String? status;

  final SettingsPricingLevelTaxCode? taxCode;

  final bool? taxExempt;

  final String? taxInclusiveBasedOn;

  @override
  String? get envelopeKey => 'pricing_level';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'built_in_item': builtInItem,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'is_default': isDefault,
        'is_tax_inclusive': isTaxInclusive,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'ordering': ordering,
        'status': status,
        'tax_code': taxCode,
        'tax_exempt': taxExempt,
        'tax_inclusive_based_on': taxInclusiveBasedOn,
      };
}

/// One shipping profile, under `shipping_profile`: the record the listing
/// serves.
class SettingsShippingProfileRead extends Dto {
  const SettingsShippingProfileRead({
    this.accountingCode,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.fixedAmount,
    this.href,
    this.id,
    this.integrationConnection,
    this.invoiceNote,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.priceTaxInclusive,
    this.salesTaxRate,
    this.shippingType,
    this.status,
    this.taxExempt,
    this.taxRule,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/shipping_profiles/{shipping_profile_id}',
    'POST /api/{api_version}/settings/shipping_profiles',
  ];

  static SettingsShippingProfileRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'shipping_profile');
    if (source == null) return null;
    return SettingsShippingProfileRead(
      accountingCode: SettingsShippingProfileAccountingCode.fromMap(
          source['accounting_code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      fixedAmount: readDecimal(source['fixed_amount']),
      href: readText(source['href']),
      id: readText(source['id']),
      integrationConnection: readAny(source['integration_connection']),
      invoiceNote: readText(source['invoice_note']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      salesTaxRate: readDecimal(source['sales_tax_rate']),
      shippingType: readText(source['shipping_type']),
      status: readText(source['status']),
      taxExempt: readFlag(source['tax_exempt']),
      taxRule: SettingsShippingProfileTaxRule.fromMap(source['tax_rule']),
      version: readInteger(source['version']),
    );
  }

  final SettingsShippingProfileAccountingCode? accountingCode;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final double? fixedAmount;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? integrationConnection;

  final String? invoiceNote;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final bool? priceTaxInclusive;

  final double? salesTaxRate;

  final String? shippingType;

  final String? status;

  final bool? taxExempt;

  final SettingsShippingProfileTaxRule? taxRule;

  final int? version;

  @override
  String? get envelopeKey => 'shipping_profile';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'fixed_amount': fixedAmount,
        'href': href,
        'id': id,
        'integration_connection': integrationConnection,
        'invoice_note': invoiceNote,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'price_tax_inclusive': priceTaxInclusive,
        'sales_tax_rate': salesTaxRate,
        'shipping_type': shippingType,
        'status': status,
        'tax_exempt': taxExempt,
        'tax_rule': taxRule,
        'version': version,
      };
}

/// One tax, under `tax`: the record the listing serves.
class SettingsTaxRead extends Dto {
  const SettingsTaxRead({
    this.code,
    this.country,
    this.countryTaxByStates,
    this.createdBy,
    this.createdOn,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.rate,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/taxes/{tax_id}',
  ];

  static SettingsTaxRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'tax');
    if (source == null) return null;
    return SettingsTaxRead(
      code: readText(source['code']),
      country: SettingsTaxCountry.fromMap(source['country']),
      countryTaxByStates: readList<SettingsTaxCountryTaxByState>(
          source['country_tax_by_states'],
          SettingsTaxCountryTaxByState.fromMap),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      rate: readDecimal(source['rate']),
      status: readText(source['status']),
    );
  }

  final String? code;

  final SettingsTaxCountry? country;

  final List<SettingsTaxCountryTaxByState?>? countryTaxByStates;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final double? rate;

  final String? status;

  @override
  String? get envelopeKey => 'tax';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'country': country,
        'country_tax_by_states': countryTaxByStates,
        'created_by': createdBy,
        'created_on': createdOn,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'rate': rate,
        'status': status,
      };
}

/// One warehouse, under `warehouse`: the record the listing serves.
class SettingsWarehouseRead extends Dto {
  const SettingsWarehouseRead({
    this.city,
    this.country,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.isDefault,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.postCode,
    this.state,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/warehouses/{warehouse_id}',
    'POST /api/{api_version}/settings/warehouses',
    'PATCH /api/{api_version}/settings/warehouses/{warehouse_id}',
  ];

  static SettingsWarehouseRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'warehouse');
    if (source == null) return null;
    return SettingsWarehouseRead(
      city: readText(source['city']),
      country: SettingsWarehouseCountry.fromMap(source['country']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      isDefault: readFlag(source['is_default']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      postCode: readText(source['post_code']),
      state: readText(source['state']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final String? city;

  final SettingsWarehouseCountry? country;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  final bool? isDefault;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? postCode;

  final String? state;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'warehouse';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'city': city,
        'country': country,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'is_default': isDefault,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'post_code': postCode,
        'state': state,
        'status': status,
        'version': version,
      };
}

/// One page of `SettingsFieldSettingsItemData` records, under `data`; paged by
/// cursor.
class SettingsFieldSettingList extends Dto {
  const SettingsFieldSettingList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/field_settings',
  ];

  static SettingsFieldSettingList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFieldSettingList(
      data: readList<SettingsFieldSettingsItemData>(
          source['data'], SettingsFieldSettingsItemData.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsFieldSettingsItemData?>? data;

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

/// One field setting, under `field_setting`: the record the listing serves.
class SettingsFieldSettingRead extends Dto {
  const SettingsFieldSettingRead({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayCode,
    this.editable,
    this.enabled,
    this.entity,
    this.fieldName,
    this.fieldType,
    this.globalSearch,
    this.groupKey,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.mandatory,
    this.note,
    this.object,
    this.sortOrder,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/field_settings/{field_setting_id}',
  ];

  static SettingsFieldSettingRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'field_setting');
    if (source == null) return null;
    return SettingsFieldSettingRead(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      displayCode: readText(source['display_code']),
      editable: readAny(source['editable']),
      enabled: readFlag(source['enabled']),
      entity: readText(source['entity']),
      fieldName: readText(source['field_name']),
      fieldType: readText(source['field_type']),
      globalSearch: readFlag(source['global_search']),
      groupKey: readText(source['group_key']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      mandatory: readFlag(source['mandatory']),
      note: readAny(source['note']),
      object: readText(source['object']),
      sortOrder: readInteger(source['sort_order']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? description;

  final String? displayCode;

  /// Null in every record measured, so untyped.
  final Object? editable;

  final bool? enabled;

  final String? entity;

  final String? fieldName;

  final String? fieldType;

  final bool? globalSearch;

  final String? groupKey;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final bool? mandatory;

  /// Null in every record measured, so untyped.
  final Object? note;

  final String? object;

  final int? sortOrder;

  @override
  String? get envelopeKey => 'field_setting';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_code': displayCode,
        'editable': editable,
        'enabled': enabled,
        'entity': entity,
        'field_name': fieldName,
        'field_type': fieldType,
        'global_search': globalSearch,
        'group_key': groupKey,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'mandatory': mandatory,
        'note': note,
        'object': object,
        'sort_order': sortOrder,
      };
}

/// What the custom logic script writes answer, under `custom_logic_script`: the
/// read's fields and `code`, which the server does not store.
class SettingsCustomLogicScriptSaved extends Dto {
  const SettingsCustomLogicScriptSaved({
    this.actionName,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.objectName,
    this.status,
    this.type,
    this.code,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/settings/custom_logic_scripts',
    'PATCH /api/{api_version}/settings/custom_logic_scripts/{custom_logic_script_id}',
  ];

  static SettingsCustomLogicScriptSaved? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_logic_script');
    if (source == null) return null;
    return SettingsCustomLogicScriptSaved(
      actionName: readText(source['action_name']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      objectName: readText(source['object_name']),
      status: readText(source['status']),
      type: readText(source['type']),
      code: readAny(source['code']),
    );
  }

  final String? actionName;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

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

  final String? objectName;

  final String? status;

  final String? type;

  /// Null in every record measured, so untyped.
  final Object? code;

  @override
  String? get envelopeKey => 'custom_logic_script';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'action_name': actionName,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'object_name': objectName,
        'status': status,
        'type': type,
        'code': code,
      };
}

/// What `updateSettingsPaymentTerm` answers, under `payment_term`: the read's
/// fields and `display_order`.
class SettingsPaymentTermUpdated extends Dto {
  const SettingsPaymentTermUpdated({
    this.description,
    this.displayName,
    this.duration,
    this.href,
    this.id,
    this.name,
    this.object,
    this.status,
    this.displayOrder,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/settings/payment_terms/{payment_term_id}',
  ];

  static SettingsPaymentTermUpdated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'payment_term');
    if (source == null) return null;
    return SettingsPaymentTermUpdated(
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      duration: SettingsPaymentTermDuration.fromMap(source['duration']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
      displayOrder: readInteger(source['display_order']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? description;

  final String? displayName;

  final SettingsPaymentTermDuration? duration;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? status;

  final int? displayOrder;

  @override
  String? get envelopeKey => 'payment_term';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'description': description,
        'display_name': displayName,
        'duration': duration,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'status': status,
        'display_order': displayOrder,
      };
}

/// What `createSettingsPaymentProcessor` answers, under `payment_processor`:
/// `gateway_name` and `credentials` where the read has `provider`.
class SettingsPaymentProcessorSaved extends Dto {
  const SettingsPaymentProcessorSaved({
    this.accountingCode,
    this.conversionRate,
    this.createdBy,
    this.createdOn,
    this.credentials,
    this.currency,
    this.description,
    this.disconnected,
    this.displayName,
    this.gatewayName,
    this.gatewayType,
    this.href,
    this.id,
    this.integrationState,
    this.isDefault,
    this.isForeignCurrency,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.provider,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/settings/payment_processors',
    'PATCH /api/{api_version}/settings/payment_processors/{payment_processor_id}',
  ];

  static SettingsPaymentProcessorSaved? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'payment_processor');
    if (source == null) return null;
    return SettingsPaymentProcessorSaved(
      accountingCode: readAny(source['accounting_code']),
      conversionRate: readDecimal(source['conversion_rate']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      credentials: readAny(source['credentials']),
      currency:
          SettingsPaymentProcessorSavedCurrency.fromMap(source['currency']),
      description: readText(source['description']),
      disconnected: readFlag(source['disconnected']),
      displayName: readText(source['display_name']),
      gatewayName: readText(source['gateway_name']),
      gatewayType: readText(source['gateway_type']),
      href: readText(source['href']),
      id: readText(source['id']),
      integrationState: readText(source['integration_state']),
      isDefault: readFlag(source['is_default']),
      isForeignCurrency: readFlag(source['is_foreign_currency']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      provider: readText(source['provider']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? accountingCode;

  final double? conversionRate;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? credentials;

  final SettingsPaymentProcessorSavedCurrency? currency;

  final String? description;

  final bool? disconnected;

  final String? displayName;

  final String? gatewayName;

  final String? gatewayType;

  final String? href;

  final String? id;

  final String? integrationState;

  final bool? isDefault;

  final bool? isForeignCurrency;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? provider;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'payment_processor';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'conversion_rate': conversionRate,
        'created_by': createdBy,
        'created_on': createdOn,
        'credentials': credentials,
        'currency': currency,
        'description': description,
        'disconnected': disconnected,
        'display_name': displayName,
        'gateway_name': gatewayName,
        'gateway_type': gatewayType,
        'href': href,
        'id': id,
        'integration_state': integrationState,
        'is_default': isDefault,
        'is_foreign_currency': isForeignCurrency,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'provider': provider,
        'status': status,
        'version': version,
      };
}

/// A [SettingsPaymentProcessorSaved]'s `currency`.
class SettingsPaymentProcessorSavedCurrency extends Dto {
  const SettingsPaymentProcessorSavedCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static SettingsPaymentProcessorSavedCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsPaymentProcessorSavedCurrency(
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

/// What `createSettingsPaymentTerm` answers, under `payment_term`: a flat
/// `period` and `duration` where the read nests them.
class SettingsPaymentTermCreated extends Dto {
  const SettingsPaymentTermCreated({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.duration,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.ordering,
    this.period,
    this.status,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/settings/payment_terms',
  ];

  static SettingsPaymentTermCreated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'payment_term');
    if (source == null) return null;
    return SettingsPaymentTermCreated(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      duration: readInteger(source['duration']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      ordering: readAny(source['ordering']),
      period: readText(source['period']),
      status: readText(source['status']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? description;

  final String? displayName;

  final int? duration;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  /// Null in every record measured, so untyped.
  final Object? ordering;

  final String? period;

  final String? status;

  @override
  String? get envelopeKey => 'payment_term';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'duration': duration,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'ordering': ordering,
        'period': period,
        'status': status,
      };
}

/// What `createSettingsPricingLevel` answers, under `pricing_level`:
/// `price_tax_inclusive` where the read has three tax fields.
class SettingsPricingLevelCreated extends Dto {
  const SettingsPricingLevelCreated({
    this.builtInItem,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.isDefault,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.ordering,
    this.priceTaxInclusive,
    this.status,
    this.taxExempt,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/settings/pricing_levels',
  ];

  static SettingsPricingLevelCreated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'pricing_level');
    if (source == null) return null;
    return SettingsPricingLevelCreated(
      builtInItem: readAny(source['built_in_item']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      isDefault: readAny(source['is_default']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      ordering: readInteger(source['ordering']),
      priceTaxInclusive: readAny(source['price_tax_inclusive']),
      status: readText(source['status']),
      taxExempt: readAny(source['tax_exempt']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? builtInItem;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? isDefault;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final int? ordering;

  /// Null in every record measured, so untyped.
  final Object? priceTaxInclusive;

  final String? status;

  /// Null in every record measured, so untyped.
  final Object? taxExempt;

  @override
  String? get envelopeKey => 'pricing_level';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'built_in_item': builtInItem,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'is_default': isDefault,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'ordering': ordering,
        'price_tax_inclusive': priceTaxInclusive,
        'status': status,
        'tax_exempt': taxExempt,
      };
}

/// One group of general settings, under `general_settings`, keyed by the group;
/// `item` and `order` also carry `product`.
class SettingsGeneralSettings extends Dto {
  const SettingsGeneralSettings({
    this.account,
    this.dashboard,
    this.dateAndTime,
    this.display,
    this.general,
    this.item,
    this.labour,
    this.order,
    this.portal,
    this.product,
    this.purchase,
    this.security,
    this.transaction,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/general_settings/{group}',
  ];

  static SettingsGeneralSettings? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'general_settings');
    if (source == null) return null;
    return SettingsGeneralSettings(
      account: SettingsFieldSettingsItemGeneralSettingsAccount.fromMap(
          source['account']),
      dashboard: SettingsGeneralSettingsDashboard.fromMap(source['dashboard']),
      dateAndTime:
          SettingsGeneralSettingsDateAndTime.fromMap(source['date_and_time']),
      display: readAny(source['display']),
      general: readAny(source['general']),
      item: SettingsGeneralSettingsItemUpdatedDetail.fromMap(source['item']),
      labour: SettingsGeneralSettingsLabour.fromMap(source['labour']),
      order: SettingsGeneralSettingsOrder.fromMap(source['order']),
      portal: SettingsGeneralSettingsPortal.fromMap(source['portal']),
      product:
          SettingsGeneralSettingsItemUpdatedProduct.fromMap(source['product']),
      purchase: SettingsGeneralSettingsPurchase.fromMap(source['purchase']),
      security: SettingsGeneralSettingsSecurity.fromMap(source['security']),
      transaction:
          SettingsGeneralSettingsTransaction.fromMap(source['transaction']),
    );
  }

  final SettingsFieldSettingsItemGeneralSettingsAccount? account;

  final SettingsGeneralSettingsDashboard? dashboard;

  final SettingsGeneralSettingsDateAndTime? dateAndTime;

  /// Keys are the instance's own setting names, so a mapping.
  final Object? display;

  /// Keys are the instance's own setting names, so a mapping.
  final Object? general;

  final SettingsGeneralSettingsItemUpdatedDetail? item;

  final SettingsGeneralSettingsLabour? labour;

  final SettingsGeneralSettingsOrder? order;

  final SettingsGeneralSettingsPortal? portal;

  final SettingsGeneralSettingsItemUpdatedProduct? product;

  final SettingsGeneralSettingsPurchase? purchase;

  final SettingsGeneralSettingsSecurity? security;

  final SettingsGeneralSettingsTransaction? transaction;

  @override
  String? get envelopeKey => 'general_settings';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'dashboard': dashboard,
        'date_and_time': dateAndTime,
        'display': display,
        'general': general,
        'item': item,
        'labour': labour,
        'order': order,
        'portal': portal,
        'product': product,
        'purchase': purchase,
        'security': security,
        'transaction': transaction,
      };
}

/// A [SettingsGeneralSettings]'s `dashboard`.
class SettingsGeneralSettingsDashboard extends Dto {
  const SettingsGeneralSettingsDashboard({
    this.accounting,
    this.defaultDashboard,
    this.executive,
    this.finance,
    this.production,
    this.purchase,
    this.sales,
  });

  static SettingsGeneralSettingsDashboard? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsDashboard(
      accounting: readText(source['accounting']),
      defaultDashboard: readAny(source['defaultDashboard']),
      executive: readText(source['executive']),
      finance: readText(source['finance']),
      production: readText(source['production']),
      purchase: readText(source['purchase']),
      sales: readText(source['sales']),
    );
  }

  final String? accounting;

  /// Null in every record measured, so untyped.
  final Object? defaultDashboard;

  final String? executive;

  final String? finance;

  final String? production;

  final String? purchase;

  final String? sales;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting': accounting,
        'defaultDashboard': defaultDashboard,
        'executive': executive,
        'finance': finance,
        'production': production,
        'purchase': purchase,
        'sales': sales,
      };
}

/// A [SettingsGeneralSettings]'s `date_and_time`.
class SettingsGeneralSettingsDateAndTime extends Dto {
  const SettingsGeneralSettingsDateAndTime({
    this.dateFormat,
    this.firstDayOfWeek,
    this.timeFormat,
    this.timeZone,
  });

  static SettingsGeneralSettingsDateAndTime? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsDateAndTime(
      dateFormat: readText(source['date_format']),
      firstDayOfWeek: readAny(source['first_day_of_week']),
      timeFormat: readText(source['time_format']),
      timeZone: readText(source['time_zone']),
    );
  }

  final String? dateFormat;

  /// Null in every record measured, so untyped.
  final Object? firstDayOfWeek;

  final String? timeFormat;

  final String? timeZone;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'date_format': dateFormat,
        'first_day_of_week': firstDayOfWeek,
        'time_format': timeFormat,
        'time_zone': timeZone,
      };
}

/// A [SettingsGeneralSettings]'s `labour`.
class SettingsGeneralSettingsLabour extends Dto {
  const SettingsGeneralSettingsLabour({
    this.requireEmailAddressForLabour,
    this.uniqueEmailAddress,
    this.uniqueLabourName,
  });

  static SettingsGeneralSettingsLabour? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsLabour(
      requireEmailAddressForLabour:
          readText(source['require_email_address_for_labour']),
      uniqueEmailAddress: readText(source['unique_email_address']),
      uniqueLabourName: readText(source['unique_labour_name']),
    );
  }

  final String? requireEmailAddressForLabour;

  final String? uniqueEmailAddress;

  final String? uniqueLabourName;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'require_email_address_for_labour': requireEmailAddressForLabour,
        'unique_email_address': uniqueEmailAddress,
        'unique_labour_name': uniqueLabourName,
      };
}

/// A [SettingsGeneralSettings]'s `order`.
class SettingsGeneralSettingsOrder extends Dto {
  const SettingsGeneralSettingsOrder({
    this.allowNameToBeChangedInOrder,
    this.allowUnitPriceToBeChangedInOrder,
    this.defaultFulfillmentStatus,
    this.defaultShippingProfile,
    this.displayedPriceIsInclusiveOfTax,
    this.enableBooking,
    this.enableLastSalePriceLookUpForAnAccount,
    this.enableOrderBackdating,
    this.enableQuote,
    this.orderManagement,
    this.referralTrackingAtOrderLevel,
    this.salesRepTrackingAtOrderLevel,
    this.useGlobalWarehouse,
  });

  static SettingsGeneralSettingsOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsOrder(
      allowNameToBeChangedInOrder:
          readText(source['allow_name_to_be_changed_in_order']),
      allowUnitPriceToBeChangedInOrder:
          readText(source['allow_unit_price_to_be_changed_in_order']),
      defaultFulfillmentStatus: readText(source['default_fulfillment_status']),
      defaultShippingProfile: readAny(source['default_shipping_profile']),
      displayedPriceIsInclusiveOfTax:
          readText(source['displayed_price_is_inclusive_of_tax']),
      enableBooking: readText(source['enable_booking']),
      enableLastSalePriceLookUpForAnAccount:
          readText(source['enable_last_sale_price_look_up_for_an_account']),
      enableOrderBackdating: readText(source['enable_order_backdating']),
      enableQuote: readText(source['enable_quote']),
      orderManagement: SettingsGeneralSettingsOrderOrderManagement.fromMap(
          source['order_management']),
      referralTrackingAtOrderLevel:
          SettingsGeneralSettingsOrderReferralTrackingAtOrderLevel.fromMap(
              source['referral_tracking_at_order_level']),
      salesRepTrackingAtOrderLevel:
          SettingsGeneralSettingsOrderSalesRepTrackingAtOrderLevel.fromMap(
              source['sales_rep_tracking_at_order_level']),
      useGlobalWarehouse: readText(source['use_global_warehouse']),
    );
  }

  final String? allowNameToBeChangedInOrder;

  final String? allowUnitPriceToBeChangedInOrder;

  final String? defaultFulfillmentStatus;

  /// Null in every record measured, so untyped.
  final Object? defaultShippingProfile;

  final String? displayedPriceIsInclusiveOfTax;

  final String? enableBooking;

  final String? enableLastSalePriceLookUpForAnAccount;

  final String? enableOrderBackdating;

  final String? enableQuote;

  final SettingsGeneralSettingsOrderOrderManagement? orderManagement;

  final SettingsGeneralSettingsOrderReferralTrackingAtOrderLevel?
      referralTrackingAtOrderLevel;

  final SettingsGeneralSettingsOrderSalesRepTrackingAtOrderLevel?
      salesRepTrackingAtOrderLevel;

  final String? useGlobalWarehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'allow_name_to_be_changed_in_order': allowNameToBeChangedInOrder,
        'allow_unit_price_to_be_changed_in_order':
            allowUnitPriceToBeChangedInOrder,
        'default_fulfillment_status': defaultFulfillmentStatus,
        'default_shipping_profile': defaultShippingProfile,
        'displayed_price_is_inclusive_of_tax': displayedPriceIsInclusiveOfTax,
        'enable_booking': enableBooking,
        'enable_last_sale_price_look_up_for_an_account':
            enableLastSalePriceLookUpForAnAccount,
        'enable_order_backdating': enableOrderBackdating,
        'enable_quote': enableQuote,
        'order_management': orderManagement,
        'referral_tracking_at_order_level': referralTrackingAtOrderLevel,
        'sales_rep_tracking_at_order_level': salesRepTrackingAtOrderLevel,
        'use_global_warehouse': useGlobalWarehouse,
      };
}

/// A [SettingsGeneralSettingsOrder]'s `order_management`.
class SettingsGeneralSettingsOrderOrderManagement extends Dto {
  const SettingsGeneralSettingsOrderOrderManagement({
    this.defaultManager,
    this.enabled,
  });

  static SettingsGeneralSettingsOrderOrderManagement? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsOrderOrderManagement(
      defaultManager: readAny(source['default_manager']),
      enabled: readText(source['enabled']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? defaultManager;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_manager': defaultManager,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettingsOrder]'s `referral_tracking_at_order_level`.
class SettingsGeneralSettingsOrderReferralTrackingAtOrderLevel extends Dto {
  const SettingsGeneralSettingsOrderReferralTrackingAtOrderLevel({
    this.defaultReferralTracking,
    this.enabled,
  });

  static SettingsGeneralSettingsOrderReferralTrackingAtOrderLevel? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsOrderReferralTrackingAtOrderLevel(
      defaultReferralTracking: readAny(source['default_referral_tracking']),
      enabled: readText(source['enabled']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? defaultReferralTracking;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_referral_tracking': defaultReferralTracking,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettingsOrder]'s `sales_rep_tracking_at_order_level`.
class SettingsGeneralSettingsOrderSalesRepTrackingAtOrderLevel extends Dto {
  const SettingsGeneralSettingsOrderSalesRepTrackingAtOrderLevel({
    this.defaultSalesRepTracking,
    this.enabled,
  });

  static SettingsGeneralSettingsOrderSalesRepTrackingAtOrderLevel? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsOrderSalesRepTrackingAtOrderLevel(
      defaultSalesRepTracking: readAny(source['default_sales_rep_tracking']),
      enabled: readText(source['enabled']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? defaultSalesRepTracking;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default_sales_rep_tracking': defaultSalesRepTracking,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettings]'s `portal`.
class SettingsGeneralSettingsPortal extends Dto {
  const SettingsGeneralSettingsPortal({
    this.contacts,
    this.enableCustomerPortal,
    this.enableInviteToActivePortalForContact,
    this.enableSpecifyPortalPasswordForContact,
    this.settings,
  });

  static SettingsGeneralSettingsPortal? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsPortal(
      contacts: readAny(source['contacts']),
      enableCustomerPortal: readText(source['enableCustomerPortal']),
      enableInviteToActivePortalForContact:
          readText(source['enableInviteToActivePortalForContact']),
      enableSpecifyPortalPasswordForContact:
          readText(source['enableSpecifyPortalPasswordForContact']),
      settings: readAny(source['settings']),
    );
  }

  /// Keys are the instance's own setting names, so a mapping.
  final Object? contacts;

  final String? enableCustomerPortal;

  final String? enableInviteToActivePortalForContact;

  final String? enableSpecifyPortalPasswordForContact;

  /// Keys are the instance's own setting names, so a mapping.
  final Object? settings;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'contacts': contacts,
        'enableCustomerPortal': enableCustomerPortal,
        'enableInviteToActivePortalForContact':
            enableInviteToActivePortalForContact,
        'enableSpecifyPortalPasswordForContact':
            enableSpecifyPortalPasswordForContact,
        'settings': settings,
      };
}

/// A [SettingsGeneralSettings]'s `purchase`.
class SettingsGeneralSettingsPurchase extends Dto {
  const SettingsGeneralSettingsPurchase({
    this.allowModificationOfFollowingPurchaseCreditNoteFields,
    this.allowModificationOfFollowingPurchaseInvoiceFields,
    this.allowModificationOfFollowingPurchasePaymentFields,
    this.allowModificationOfFollowingPurchaseRefundFields,
    this.enableLastPurchasePriceLookUp,
    this.enablePurchaseQuote,
    this.enableWorkflowApprovalForPurchaseCreditNote,
    this.enableWorkflowApprovalForPurchaseInvoice,
    this.enableWorkflowApprovalForPurchaseOrder,
    this.enableWorkflowApprovalForPurchasePayment,
    this.enableWorkflowApprovalForPurchaseRefund,
    this.inventoryIsAdjustedWhen,
    this.supplierInvoiceIdShouldBeUnique,
    this.useGlobalWarehouse,
  });

  static SettingsGeneralSettingsPurchase? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsPurchase(
      allowModificationOfFollowingPurchaseCreditNoteFields:
          SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseCreditNoteFields
              .fromMap(source[
                  'allow_modification_of_following_purchase_credit_note_fields']),
      allowModificationOfFollowingPurchaseInvoiceFields:
          SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseInvoiceFields
              .fromMap(source[
                  'allow_modification_of_following_purchase_invoice_fields']),
      allowModificationOfFollowingPurchasePaymentFields:
          SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchasePaymentFields
              .fromMap(source[
                  'allow_modification_of_following_purchase_payment_fields']),
      allowModificationOfFollowingPurchaseRefundFields:
          SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseRefundFields
              .fromMap(source[
                  'allow_modification_of_following_purchase_refund_fields']),
      enableLastPurchasePriceLookUp:
          readText(source['enable_last_purchase_price_look_up']),
      enablePurchaseQuote: readText(source['enable_purchase_quote']),
      enableWorkflowApprovalForPurchaseCreditNote:
          readText(source['enable_workflow_approval_for_purchase_credit_note']),
      enableWorkflowApprovalForPurchaseInvoice:
          readText(source['enable_workflow_approval_for_purchase_invoice']),
      enableWorkflowApprovalForPurchaseOrder:
          readText(source['enable_workflow_approval_for_purchase_order']),
      enableWorkflowApprovalForPurchasePayment:
          readText(source['enable_workflow_approval_for_purchase_payment']),
      enableWorkflowApprovalForPurchaseRefund:
          readText(source['enable_workflow_approval_for_purchase_refund']),
      inventoryIsAdjustedWhen: readText(source['inventory_is_adjusted_when']),
      supplierInvoiceIdShouldBeUnique:
          readText(source['supplier_invoice_id_should_be_unique']),
      useGlobalWarehouse: readText(source['use_global_warehouse']),
    );
  }

  final SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseCreditNoteFields?
      allowModificationOfFollowingPurchaseCreditNoteFields;

  final SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseInvoiceFields?
      allowModificationOfFollowingPurchaseInvoiceFields;

  final SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchasePaymentFields?
      allowModificationOfFollowingPurchasePaymentFields;

  final SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseRefundFields?
      allowModificationOfFollowingPurchaseRefundFields;

  final String? enableLastPurchasePriceLookUp;

  final String? enablePurchaseQuote;

  final String? enableWorkflowApprovalForPurchaseCreditNote;

  final String? enableWorkflowApprovalForPurchaseInvoice;

  final String? enableWorkflowApprovalForPurchaseOrder;

  final String? enableWorkflowApprovalForPurchasePayment;

  final String? enableWorkflowApprovalForPurchaseRefund;

  final String? inventoryIsAdjustedWhen;

  final String? supplierInvoiceIdShouldBeUnique;

  final String? useGlobalWarehouse;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'allow_modification_of_following_purchase_credit_note_fields':
            allowModificationOfFollowingPurchaseCreditNoteFields,
        'allow_modification_of_following_purchase_invoice_fields':
            allowModificationOfFollowingPurchaseInvoiceFields,
        'allow_modification_of_following_purchase_payment_fields':
            allowModificationOfFollowingPurchasePaymentFields,
        'allow_modification_of_following_purchase_refund_fields':
            allowModificationOfFollowingPurchaseRefundFields,
        'enable_last_purchase_price_look_up': enableLastPurchasePriceLookUp,
        'enable_purchase_quote': enablePurchaseQuote,
        'enable_workflow_approval_for_purchase_credit_note':
            enableWorkflowApprovalForPurchaseCreditNote,
        'enable_workflow_approval_for_purchase_invoice':
            enableWorkflowApprovalForPurchaseInvoice,
        'enable_workflow_approval_for_purchase_order':
            enableWorkflowApprovalForPurchaseOrder,
        'enable_workflow_approval_for_purchase_payment':
            enableWorkflowApprovalForPurchasePayment,
        'enable_workflow_approval_for_purchase_refund':
            enableWorkflowApprovalForPurchaseRefund,
        'inventory_is_adjusted_when': inventoryIsAdjustedWhen,
        'supplier_invoice_id_should_be_unique': supplierInvoiceIdShouldBeUnique,
        'use_global_warehouse': useGlobalWarehouse,
      };
}

/// A [SettingsGeneralSettingsPurchase]'s
/// `allow_modification_of_following_purchase_credit_note_fields`.
class SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseCreditNoteFields
    extends Dto {
  const SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseCreditNoteFields({
    this.refundable,
  });

  static SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseCreditNoteFields?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseCreditNoteFields(
      refundable: readText(source['refundable']),
    );
  }

  final String? refundable;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'refundable': refundable,
      };
}

/// A [SettingsGeneralSettingsPurchase]'s
/// `allow_modification_of_following_purchase_invoice_fields`.
class SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseInvoiceFields
    extends Dto {
  const SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseInvoiceFields({
    this.dueDate,
    this.issueDate,
  });

  static SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseInvoiceFields?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseInvoiceFields(
      dueDate: readText(source['due_date']),
      issueDate: readText(source['issue_date']),
    );
  }

  final String? dueDate;

  final String? issueDate;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'due_date': dueDate,
        'issue_date': issueDate,
      };
}

/// A [SettingsGeneralSettingsPurchase]'s
/// `allow_modification_of_following_purchase_payment_fields`.
class SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchasePaymentFields
    extends Dto {
  const SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchasePaymentFields({
    this.paymentDate,
    this.paymentProcessor,
    this.paymentReference,
  });

  static SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchasePaymentFields?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchasePaymentFields(
      paymentDate: readText(source['payment_date']),
      paymentProcessor: readText(source['payment_processor']),
      paymentReference: readText(source['payment_reference']),
    );
  }

  final String? paymentDate;

  final String? paymentProcessor;

  final String? paymentReference;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'payment_date': paymentDate,
        'payment_processor': paymentProcessor,
        'payment_reference': paymentReference,
      };
}

/// A [SettingsGeneralSettingsPurchase]'s
/// `allow_modification_of_following_purchase_refund_fields`.
class SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseRefundFields
    extends Dto {
  const SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseRefundFields({
    this.refundDate,
    this.refundReference,
  });

  static SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseRefundFields?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsPurchaseAllowModificationOfFollowingPurchaseRefundFields(
      refundDate: readText(source['refund_date']),
      refundReference: readText(source['refund_reference']),
    );
  }

  final String? refundDate;

  final String? refundReference;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'refund_date': refundDate,
        'refund_reference': refundReference,
      };
}

/// A [SettingsGeneralSettings]'s `security`.
class SettingsGeneralSettingsSecurity extends Dto {
  const SettingsGeneralSettingsSecurity({
    this.enableForceSessionExpire,
    this.enableTwoFactorAuthentication,
    this.implementerLogin,
    this.sessionExpireLimitHour,
  });

  static SettingsGeneralSettingsSecurity? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsSecurity(
      enableForceSessionExpire: readText(source['enable_force_session_expire']),
      enableTwoFactorAuthentication:
          readText(source['enable_two_factor_authentication']),
      implementerLogin: readText(source['implementerLogin']),
      sessionExpireLimitHour: readText(source['session_expire_limit_hour']),
    );
  }

  final String? enableForceSessionExpire;

  final String? enableTwoFactorAuthentication;

  final String? implementerLogin;

  final String? sessionExpireLimitHour;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'enable_force_session_expire': enableForceSessionExpire,
        'enable_two_factor_authentication': enableTwoFactorAuthentication,
        'implementerLogin': implementerLogin,
        'session_expire_limit_hour': sessionExpireLimitHour,
      };
}

/// A [SettingsGeneralSettings]'s `transaction`.
class SettingsGeneralSettingsTransaction extends Dto {
  const SettingsGeneralSettingsTransaction({
    this.accountingMethod,
    this.allowModificationOfFollowingCreditNoteFields,
    this.allowModificationOfFollowingInvoiceFields,
    this.allowModificationOfFollowingPaymentFields,
    this.allowModificationOfFollowingRefundFields,
    this.availableMediumsForCommunicationPreference,
    this.createNegativeChargeToAccommodateAdjustmentRequiredForOrderCancelOrChange,
    this.defaultAccountingCodes,
    this.defaultShippingProfile,
    this.disableNotificationForInvoiceWithChargesOfZeroAmount,
    this.displayedPriceIsInclusiveOfTax,
    this.enableCreationOfAutomaticPaymentSurcharge,
    this.enableDiscountProfile,
    this.updateCurrentInvoiceToIncludeChargeAdjustments,
    this.updateInvoiceToIncludeCurrentPaymentSurcharge,
  });

  static SettingsGeneralSettingsTransaction? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsTransaction(
      accountingMethod: readAny(source['accounting_method']),
      allowModificationOfFollowingCreditNoteFields:
          SettingsGeneralSettingsTransactionAllowModificationOfFollowingCreditNoteFields
              .fromMap(
                  source['allow_modification_of_following_credit_note_fields']),
      allowModificationOfFollowingInvoiceFields:
          SettingsGeneralSettingsTransactionAllowModificationOfFollowingInvoiceFields
              .fromMap(
                  source['allow_modification_of_following_invoice_fields']),
      allowModificationOfFollowingPaymentFields:
          SettingsGeneralSettingsTransactionAllowModificationOfFollowingPaymentFields
              .fromMap(
                  source['allow_modification_of_following_payment_fields']),
      allowModificationOfFollowingRefundFields:
          SettingsGeneralSettingsTransactionAllowModificationOfFollowingRefundFields
              .fromMap(source['allow_modification_of_following_refund_fields']),
      availableMediumsForCommunicationPreference:
          SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreference
              .fromMap(
                  source['available_mediums_for_communication_preference']),
      createNegativeChargeToAccommodateAdjustmentRequiredForOrderCancelOrChange:
          readText(source[
              'create_negative_charge_to_accommodate_adjustment_required_for_order_cancel_or_change']),
      defaultAccountingCodes:
          SettingsGeneralSettingsTransactionDefaultAccountingCodes.fromMap(
              source['default_accounting_codes']),
      defaultShippingProfile: readAny(source['default_shipping_profile']),
      disableNotificationForInvoiceWithChargesOfZeroAmount: readText(source[
          'disable_notification_for_invoice_with_charges_of_zero_amount']),
      displayedPriceIsInclusiveOfTax:
          readText(source['displayed_price_is_inclusive_of_tax']),
      enableCreationOfAutomaticPaymentSurcharge:
          readText(source['enable_creation_of_automatic_payment_surcharge']),
      enableDiscountProfile: readText(source['enable_discount_profile']),
      updateCurrentInvoiceToIncludeChargeAdjustments: readText(
          source['update_current_invoice_to_include_charge_adjustments']),
      updateInvoiceToIncludeCurrentPaymentSurcharge: readText(
          source['update_invoice_to_include_current_payment_surcharge']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? accountingMethod;

  final SettingsGeneralSettingsTransactionAllowModificationOfFollowingCreditNoteFields?
      allowModificationOfFollowingCreditNoteFields;

  final SettingsGeneralSettingsTransactionAllowModificationOfFollowingInvoiceFields?
      allowModificationOfFollowingInvoiceFields;

  final SettingsGeneralSettingsTransactionAllowModificationOfFollowingPaymentFields?
      allowModificationOfFollowingPaymentFields;

  final SettingsGeneralSettingsTransactionAllowModificationOfFollowingRefundFields?
      allowModificationOfFollowingRefundFields;

  final SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreference?
      availableMediumsForCommunicationPreference;

  final String?
      createNegativeChargeToAccommodateAdjustmentRequiredForOrderCancelOrChange;

  final SettingsGeneralSettingsTransactionDefaultAccountingCodes?
      defaultAccountingCodes;

  /// Null in every record measured, so untyped.
  final Object? defaultShippingProfile;

  final String? disableNotificationForInvoiceWithChargesOfZeroAmount;

  final String? displayedPriceIsInclusiveOfTax;

  final String? enableCreationOfAutomaticPaymentSurcharge;

  final String? enableDiscountProfile;

  final String? updateCurrentInvoiceToIncludeChargeAdjustments;

  final String? updateInvoiceToIncludeCurrentPaymentSurcharge;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_method': accountingMethod,
        'allow_modification_of_following_credit_note_fields':
            allowModificationOfFollowingCreditNoteFields,
        'allow_modification_of_following_invoice_fields':
            allowModificationOfFollowingInvoiceFields,
        'allow_modification_of_following_payment_fields':
            allowModificationOfFollowingPaymentFields,
        'allow_modification_of_following_refund_fields':
            allowModificationOfFollowingRefundFields,
        'available_mediums_for_communication_preference':
            availableMediumsForCommunicationPreference,
        'create_negative_charge_to_accommodate_adjustment_required_for_order_cancel_or_change':
            createNegativeChargeToAccommodateAdjustmentRequiredForOrderCancelOrChange,
        'default_accounting_codes': defaultAccountingCodes,
        'default_shipping_profile': defaultShippingProfile,
        'disable_notification_for_invoice_with_charges_of_zero_amount':
            disableNotificationForInvoiceWithChargesOfZeroAmount,
        'displayed_price_is_inclusive_of_tax': displayedPriceIsInclusiveOfTax,
        'enable_creation_of_automatic_payment_surcharge':
            enableCreationOfAutomaticPaymentSurcharge,
        'enable_discount_profile': enableDiscountProfile,
        'update_current_invoice_to_include_charge_adjustments':
            updateCurrentInvoiceToIncludeChargeAdjustments,
        'update_invoice_to_include_current_payment_surcharge':
            updateInvoiceToIncludeCurrentPaymentSurcharge,
      };
}

/// A [SettingsGeneralSettingsTransaction]'s
/// `allow_modification_of_following_credit_note_fields`.
class SettingsGeneralSettingsTransactionAllowModificationOfFollowingCreditNoteFields
    extends Dto {
  const SettingsGeneralSettingsTransactionAllowModificationOfFollowingCreditNoteFields({
    this.creditNoteDate,
    this.refundable,
  });

  static SettingsGeneralSettingsTransactionAllowModificationOfFollowingCreditNoteFields?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsTransactionAllowModificationOfFollowingCreditNoteFields(
      creditNoteDate: readText(source['credit_note_date']),
      refundable: readText(source['refundable']),
    );
  }

  final String? creditNoteDate;

  final String? refundable;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'credit_note_date': creditNoteDate,
        'refundable': refundable,
      };
}

/// A [SettingsGeneralSettingsTransaction]'s
/// `allow_modification_of_following_invoice_fields`.
class SettingsGeneralSettingsTransactionAllowModificationOfFollowingInvoiceFields
    extends Dto {
  const SettingsGeneralSettingsTransactionAllowModificationOfFollowingInvoiceFields({
    this.billingPeriod,
    this.chargePeriod,
    this.dueDate,
    this.issueDate,
  });

  static SettingsGeneralSettingsTransactionAllowModificationOfFollowingInvoiceFields?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsTransactionAllowModificationOfFollowingInvoiceFields(
      billingPeriod: readText(source['billing_period']),
      chargePeriod: readText(source['charge_period']),
      dueDate: readText(source['due_date']),
      issueDate: readText(source['issue_date']),
    );
  }

  final String? billingPeriod;

  final String? chargePeriod;

  final String? dueDate;

  final String? issueDate;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'billing_period': billingPeriod,
        'charge_period': chargePeriod,
        'due_date': dueDate,
        'issue_date': issueDate,
      };
}

/// A [SettingsGeneralSettingsTransaction]'s
/// `allow_modification_of_following_payment_fields`.
class SettingsGeneralSettingsTransactionAllowModificationOfFollowingPaymentFields
    extends Dto {
  const SettingsGeneralSettingsTransactionAllowModificationOfFollowingPaymentFields({
    this.paymentDate,
    this.paymentProcessor,
    this.paymentReference,
  });

  static SettingsGeneralSettingsTransactionAllowModificationOfFollowingPaymentFields?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsTransactionAllowModificationOfFollowingPaymentFields(
      paymentDate: readText(source['payment_date']),
      paymentProcessor: readText(source['payment_processor']),
      paymentReference: readText(source['payment_reference']),
    );
  }

  final String? paymentDate;

  final String? paymentProcessor;

  final String? paymentReference;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'payment_date': paymentDate,
        'payment_processor': paymentProcessor,
        'payment_reference': paymentReference,
      };
}

/// A [SettingsGeneralSettingsTransaction]'s
/// `allow_modification_of_following_refund_fields`.
class SettingsGeneralSettingsTransactionAllowModificationOfFollowingRefundFields
    extends Dto {
  const SettingsGeneralSettingsTransactionAllowModificationOfFollowingRefundFields({
    this.refundDate,
    this.refundReference,
  });

  static SettingsGeneralSettingsTransactionAllowModificationOfFollowingRefundFields?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsTransactionAllowModificationOfFollowingRefundFields(
      refundDate: readText(source['refund_date']),
      refundReference: readText(source['refund_reference']),
    );
  }

  final String? refundDate;

  final String? refundReference;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'refund_date': refundDate,
        'refund_reference': refundReference,
      };
}

/// A [SettingsGeneralSettingsTransaction]'s
/// `available_mediums_for_communication_preference`.
class SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreference
    extends Dto {
  const SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreference({
    this.email,
    this.postalMail,
    this.textMessage,
    this.voiceMail,
  });

  static SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreference?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreference(
      email:
          SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceEmail
              .fromMap(source['email']),
      postalMail:
          SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferencePostalMail
              .fromMap(source['postal_mail']),
      textMessage:
          SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceTextMessage
              .fromMap(source['text_message']),
      voiceMail:
          SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceVoiceMail
              .fromMap(source['voice_mail']),
    );
  }

  final SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceEmail?
      email;

  final SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferencePostalMail?
      postalMail;

  final SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceTextMessage?
      textMessage;

  final SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceVoiceMail?
      voiceMail;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'email': email,
        'postal_mail': postalMail,
        'text_message': textMessage,
        'voice_mail': voiceMail,
      };
}

/// A
/// [SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreference]'s
/// `email`.
class SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceEmail
    extends Dto {
  const SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceEmail({
    this.isDefault,
    this.enabled,
  });

  static SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceEmail?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceEmail(
      isDefault: readText(source['default']),
      enabled: readText(source['enabled']),
    );
  }

  final String? isDefault;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default': isDefault,
        'enabled': enabled,
      };
}

/// A
/// [SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreference]'s
/// `postal_mail`.
class SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferencePostalMail
    extends Dto {
  const SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferencePostalMail({
    this.isDefault,
    this.enabled,
  });

  static SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferencePostalMail?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferencePostalMail(
      isDefault: readText(source['default']),
      enabled: readText(source['enabled']),
    );
  }

  final String? isDefault;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default': isDefault,
        'enabled': enabled,
      };
}

/// A
/// [SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreference]'s
/// `text_message`.
class SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceTextMessage
    extends Dto {
  const SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceTextMessage({
    this.isDefault,
    this.enabled,
  });

  static SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceTextMessage?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceTextMessage(
      isDefault: readText(source['default']),
      enabled: readText(source['enabled']),
    );
  }

  final String? isDefault;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default': isDefault,
        'enabled': enabled,
      };
}

/// A
/// [SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreference]'s
/// `voice_mail`.
class SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceVoiceMail
    extends Dto {
  const SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceVoiceMail({
    this.isDefault,
    this.enabled,
  });

  static SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceVoiceMail?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsTransactionAvailableMediumsForCommunicationPreferenceVoiceMail(
      isDefault: readText(source['default']),
      enabled: readText(source['enabled']),
    );
  }

  final String? isDefault;

  final String? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'default': isDefault,
        'enabled': enabled,
      };
}

/// A [SettingsGeneralSettingsTransaction]'s `default_accounting_codes`.
class SettingsGeneralSettingsTransactionDefaultAccountingCodes extends Dto {
  const SettingsGeneralSettingsTransactionDefaultAccountingCodes({
    this.accountPayable,
    this.accountReceivable,
    this.cashAndCashEquivalent,
    this.costOfGoodsSold,
    this.creditNotePayable,
    this.deduction,
    this.eventCharge,
    this.inventory,
    this.paymentSurcharge,
    this.rounding,
    this.salesRevenue,
    this.tax,
  });

  static SettingsGeneralSettingsTransactionDefaultAccountingCodes? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsGeneralSettingsTransactionDefaultAccountingCodes(
      accountPayable: readText(source['account_payable']),
      accountReceivable: readText(source['account_receivable']),
      cashAndCashEquivalent: readText(source['cash_and_cash_equivalent']),
      costOfGoodsSold: readText(source['cost_of_goods_sold']),
      creditNotePayable: readText(source['credit_note_payable']),
      deduction: readText(source['deduction']),
      eventCharge: readText(source['event_charge']),
      inventory: readText(source['inventory']),
      paymentSurcharge: readText(source['payment_surcharge']),
      rounding: readText(source['rounding']),
      salesRevenue: readText(source['sales_revenue']),
      tax: readText(source['tax']),
    );
  }

  final String? accountPayable;

  final String? accountReceivable;

  final String? cashAndCashEquivalent;

  final String? costOfGoodsSold;

  final String? creditNotePayable;

  final String? deduction;

  final String? eventCharge;

  final String? inventory;

  final String? paymentSurcharge;

  final String? rounding;

  final String? salesRevenue;

  final String? tax;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account_payable': accountPayable,
        'account_receivable': accountReceivable,
        'cash_and_cash_equivalent': cashAndCashEquivalent,
        'cost_of_goods_sold': costOfGoodsSold,
        'credit_note_payable': creditNotePayable,
        'deduction': deduction,
        'event_charge': eventCharge,
        'inventory': inventory,
        'payment_surcharge': paymentSurcharge,
        'rounding': rounding,
        'sales_revenue': salesRevenue,
        'tax': tax,
      };
}
