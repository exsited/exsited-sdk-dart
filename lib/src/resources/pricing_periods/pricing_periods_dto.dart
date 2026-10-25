/// Typed views over the v4 pricing periods bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings pricing period body, under `pricing_period`.
class SettingsPricingPeriod extends Dto {
  const SettingsPricingPeriod({
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
    this.timePeriod,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/pricing_periods',
    'GET /api/{api_version}/settings/pricing_periods/{pricing_period_id}',
    'POST /api/{api_version}/settings/pricing_periods',
    'PATCH /api/{api_version}/settings/pricing_periods/{pricing_period_id}',
  ];

  static SettingsPricingPeriod? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'pricing_period');
    if (source == null) return null;
    return SettingsPricingPeriod(
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
      timePeriod:
          SettingsPricingPeriodTimePeriod.fromMap(source['time_period']),
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

  final String? status;

  final SettingsPricingPeriodTimePeriod? timePeriod;

  @override
  String? get envelopeKey => 'pricing_period';

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
        'time_period': timePeriod,
      };
}

/// One page of `SettingsPricingPeriod` records, under `data`.
class SettingsPricingPeriodList extends Dto {
  const SettingsPricingPeriodList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/pricing_periods',
  ];

  static SettingsPricingPeriodList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsPricingPeriodList(
      data: readList<SettingsPricingPeriod>(
          source['data'], SettingsPricingPeriod.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsPricingPeriod?>? data;

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

/// A [SettingsPricingPeriod]'s `time_period`.
class SettingsPricingPeriodTimePeriod extends Dto {
  const SettingsPricingPeriodTimePeriod({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static SettingsPricingPeriodTimePeriod? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsPricingPeriodTimePeriod(
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
