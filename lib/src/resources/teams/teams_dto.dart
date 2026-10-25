/// Typed views over the v4 teams bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings team body, under `team`.
class SettingsTeam extends Dto {
  const SettingsTeam({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.managedBy,
    this.name,
    this.object,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/teams',
    'GET /api/{api_version}/settings/teams/{team_id}',
    'POST /api/{api_version}/settings/teams',
    'PATCH /api/{api_version}/settings/teams/{team_id}',
  ];

  static SettingsTeam? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'team');
    if (source == null) return null;
    return SettingsTeam(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      managedBy: readAny(source['managed_by']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
      version: readAny(source['version']),
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

  /// Null in every record measured, so untyped.
  final Object? managedBy;

  final String? name;

  final String? object;

  final String? status;

  /// Null in every record measured, so untyped.
  final Object? version;

  @override
  String? get envelopeKey => 'team';

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
        'managed_by': managedBy,
        'name': name,
        'object': object,
        'status': status,
        'version': version,
      };
}

/// One page of `SettingsTeam` records, under `data`.
class SettingsTeamList extends Dto {
  const SettingsTeamList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/teams',
  ];

  static SettingsTeamList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsTeamList(
      data: readList<SettingsTeam>(source['data'], SettingsTeam.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsTeam?>? data;

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
