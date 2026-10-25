/// Typed views over the v4 time periods bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings time period body, under `time_period`.
class SettingsTimePeriod extends Dto {
  const SettingsTimePeriod({
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
    this.period,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/time_periods',
    'GET /api/{api_version}/settings/time_periods/{time_period_id}',
    'POST /api/{api_version}/settings/time_periods',
    'PATCH /api/{api_version}/settings/time_periods/{time_period_id}',
  ];

  static SettingsTimePeriod? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'time_period');
    if (source == null) return null;
    return SettingsTimePeriod(
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
      period: readText(source['period']),
      status: readText(source['status']),
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

  final String? period;

  final String? status;

  @override
  String? get envelopeKey => 'time_period';

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
        'period': period,
        'status': status,
      };
}

/// One page of `SettingsTimePeriod` records, under `data`.
class SettingsTimePeriodList extends Dto {
  const SettingsTimePeriodList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/time_periods',
  ];

  static SettingsTimePeriodList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsTimePeriodList(
      data: readList<SettingsTimePeriod>(
          source['data'], SettingsTimePeriod.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsTimePeriod?>? data;

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
