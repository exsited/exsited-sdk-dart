/// Typed views over the v4 approval user groups bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings approval user group body, under `approval_user_group`.
class SettingsApprovalUserGroup extends Dto {
  const SettingsApprovalUserGroup({
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
    'GET /api/{api_version}/settings/approval_user_groups',
    'GET /api/{api_version}/settings/approval_user_groups/{approval_user_group_id}',
    'POST /api/{api_version}/settings/approval_user_groups',
    'PATCH /api/{api_version}/settings/approval_user_groups/{approval_user_group_id}',
  ];

  static SettingsApprovalUserGroup? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'approval_user_group');
    if (source == null) return null;
    return SettingsApprovalUserGroup(
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

  @override
  String? get envelopeKey => 'approval_user_group';

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

/// One page of `SettingsApprovalUserGroup` records, under `data`.
class SettingsApprovalUserGroupList extends Dto {
  const SettingsApprovalUserGroupList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/approval_user_groups',
  ];

  static SettingsApprovalUserGroupList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsApprovalUserGroupList(
      data: readList<SettingsApprovalUserGroup>(
          source['data'], SettingsApprovalUserGroup.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsApprovalUserGroup?>? data;

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
