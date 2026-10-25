/// Typed views over the v4 account groups bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings account group body, under `account_group`.
class SettingsAccountGroup extends Dto {
  const SettingsAccountGroup({
    this.accountingCode,
    this.customAttributes,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.invoiceAccountMedia,
    this.managedBy,
    this.name,
    this.object,
    this.pricingLevel,
    this.stateRule,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/account_groups',
    'GET /api/{api_version}/settings/account_groups/{account_group_id}',
    'POST /api/{api_version}/settings/account_groups',
  ];

  static SettingsAccountGroup? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'account_group');
    if (source == null) return null;
    return SettingsAccountGroup(
      accountingCode: readAny(source['accounting_code']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      invoiceAccountMedia:
          readList<String>(source['invoice_account_media'], readText),
      managedBy: readAny(source['managed_by']),
      name: readText(source['name']),
      object: readText(source['object']),
      pricingLevel: readAny(source['pricing_level']),
      stateRule: SettingsAccountGroupStateRule.fromMap(source['state_rule']),
      status: readText(source['status']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? accountingCode;

  /// Present but empty on every record measured, so the element type is
  /// unknown.
  final List<Object?>? customAttributes;

  /// Null in every record measured, so untyped.
  final Object? description;

  final String? displayName;

  final String? href;

  final String? id;

  final List<String?>? invoiceAccountMedia;

  /// Null in every record measured, so untyped.
  final Object? managedBy;

  final String? name;

  final String? object;

  /// Null in every record measured, so untyped.
  final Object? pricingLevel;

  final SettingsAccountGroupStateRule? stateRule;

  final String? status;

  @override
  String? get envelopeKey => 'account_group';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'custom_attributes': customAttributes,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'invoice_account_media': invoiceAccountMedia,
        'managed_by': managedBy,
        'name': name,
        'object': object,
        'pricing_level': pricingLevel,
        'state_rule': stateRule,
        'status': status,
      };
}

/// One page of `SettingsAccountGroup` records, under `data`.
class SettingsAccountGroupList extends Dto {
  const SettingsAccountGroupList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/account_groups',
  ];

  static SettingsAccountGroupList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsAccountGroupList(
      data: readList<SettingsAccountGroup>(
          source['data'], SettingsAccountGroup.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsAccountGroup?>? data;

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

/// A [SettingsAccountGroup]'s `state_rule`.
class SettingsAccountGroupStateRule extends Dto {
  const SettingsAccountGroupStateRule({
    this.href,
    this.id,
    this.object,
  });

  static SettingsAccountGroupStateRule? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsAccountGroupStateRule(
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
