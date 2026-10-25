/// Typed views over the v4 billing periods bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings billing period body, under `billing_period`.
class SettingsBillingPeriod extends Dto {
  const SettingsBillingPeriod({
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
    this.timePeriod,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/billing_periods',
    'GET /api/{api_version}/settings/billing_periods/{billing_period_id}',
    'POST /api/{api_version}/settings/billing_periods',
    'PATCH /api/{api_version}/settings/billing_periods/{billing_period_id}',
  ];

  static SettingsBillingPeriod? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'billing_period');
    if (source == null) return null;
    return SettingsBillingPeriod(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      duration: readInteger(source['duration']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      ordering: readInteger(source['ordering']),
      period: readText(source['period']),
      status: readText(source['status']),
      timePeriod: readText(source['time_period']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final int? duration;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final int? ordering;

  final String? period;

  final String? status;

  final String? timePeriod;

  @override
  String? get envelopeKey => 'billing_period';

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
        'time_period': timePeriod,
      };
}

/// One page of `SettingsBillingPeriod` records, under `data`.
class SettingsBillingPeriodList extends Dto {
  const SettingsBillingPeriodList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/billing_periods',
  ];

  static SettingsBillingPeriodList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsBillingPeriodList(
      data: readList<SettingsBillingPeriod>(
          source['data'], SettingsBillingPeriod.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsBillingPeriod?>? data;

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
