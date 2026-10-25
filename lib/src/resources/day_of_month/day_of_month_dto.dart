/// Typed views over the v4 day of month bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings day of month body, under `day_of_month`.
class SettingsDayOfMonth extends Dto {
  const SettingsDayOfMonth({
    this.createdBy,
    this.createdOn,
    this.day,
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
    'GET /api/{api_version}/settings/day_of_month',
    'GET /api/{api_version}/settings/day_of_month/{day_of_month_id}',
  ];

  static SettingsDayOfMonth? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'day_of_month');
    if (source == null) return null;
    return SettingsDayOfMonth(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      day: readInteger(source['day']),
      description: readAny(source['description']),
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

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final int? day;

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

  final String? status;

  @override
  String? get envelopeKey => 'day_of_month';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'day': day,
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

/// One page of `SettingsDayOfMonth` records, under `data`.
class SettingsDayOfMonthList extends Dto {
  const SettingsDayOfMonthList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/day_of_month',
  ];

  static SettingsDayOfMonthList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsDayOfMonthList(
      data: readList<SettingsDayOfMonth>(
          source['data'], SettingsDayOfMonth.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsDayOfMonth?>? data;

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
