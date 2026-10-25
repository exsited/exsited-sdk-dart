/// Typed views over the v4 system events bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings system event body, under `system_event`.
class SettingsSystemEvent extends Dto {
  const SettingsSystemEvent({
    this.baseEvent,
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
    'GET /api/{api_version}/settings/system_events',
    'GET /api/{api_version}/settings/system_events/{system_event_id}',
  ];

  static SettingsSystemEvent? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'system_event');
    if (source == null) return null;
    return SettingsSystemEvent(
      baseEvent: readFlag(source['base_event']),
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
      status: readText(source['status']),
    );
  }

  final bool? baseEvent;

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

  final String? status;

  @override
  String? get envelopeKey => 'system_event';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'base_event': baseEvent,
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

/// One page of `SettingsSystemEvent` records, under `data`.
class SettingsSystemEventList extends Dto {
  const SettingsSystemEventList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/system_events',
  ];

  static SettingsSystemEventList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsSystemEventList(
      data: readList<SettingsSystemEvent>(
          source['data'], SettingsSystemEvent.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsSystemEvent?>? data;

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
