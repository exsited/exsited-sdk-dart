/// Typed views over the v4 shipping rules bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings shipping rule body, under `shipping_rule`.
class SettingsShippingRule extends Dto {
  const SettingsShippingRule({
    this.configuration,
    this.createdBy,
    this.createdOn,
    this.description,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.shippingClass,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/shipping_rules',
    'GET /api/{api_version}/settings/shipping_rules/{shipping_rule_id}',
    'POST /api/{api_version}/settings/shipping_rules',
    'PATCH /api/{api_version}/settings/shipping_rules/{shipping_rule_id}',
  ];

  static SettingsShippingRule? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'shipping_rule');
    if (source == null) return null;
    return SettingsShippingRule(
      configuration:
          SettingsShippingRuleConfiguration.fromMap(source['configuration']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      shippingClass: readAny(source['shipping_class']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final SettingsShippingRuleConfiguration? configuration;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  /// Null in every record measured, so untyped.
  final Object? shippingClass;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'shipping_rule';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'configuration': configuration,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'shipping_class': shippingClass,
        'status': status,
        'version': version,
      };
}

/// One page of `SettingsShippingRule` records, under `data`.
class SettingsShippingRuleList extends Dto {
  const SettingsShippingRuleList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/shipping_rules',
  ];

  static SettingsShippingRuleList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsShippingRuleList(
      data: readList<SettingsShippingRule>(
          source['data'], SettingsShippingRule.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsShippingRule?>? data;

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

/// A [SettingsShippingRule]'s `configuration`.
class SettingsShippingRuleConfiguration extends Dto {
  const SettingsShippingRuleConfiguration({
    this.rate,
    this.zones,
  });

  static SettingsShippingRuleConfiguration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsShippingRuleConfiguration(
      rate: readAny(source['rate']),
      zones: readList<Object>(source['zones'], readAny),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? rate;

  /// Empty in every record measured, so untyped.
  final List<Object?>? zones;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'rate': rate,
        'zones': zones,
      };
}
