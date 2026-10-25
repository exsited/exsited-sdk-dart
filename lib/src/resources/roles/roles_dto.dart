/// Typed views over the v4 roles bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings role body, under `role`.
class SettingsRole extends Dto {
  const SettingsRole({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.isSystemRole,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/roles',
    'GET /api/{api_version}/settings/roles/{role_id}',
  ];

  static SettingsRole? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'role');
    if (source == null) return null;
    return SettingsRole(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      isSystemRole: readFlag(source['is_system_role']),
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

  /// Null in every record measured, so untyped.
  final Object? description;

  final String? displayName;

  final String? href;

  final String? id;

  final bool? isSystemRole;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  @override
  String? get envelopeKey => 'role';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'is_system_role': isSystemRole,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
      };
}

/// One page of `SettingsRole` records, under `data`.
class SettingsRoleList extends Dto {
  const SettingsRoleList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/roles',
  ];

  static SettingsRoleList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsRoleList(
      data: readList<SettingsRole>(source['data'], SettingsRole.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsRole?>? data;

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
