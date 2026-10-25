/// Typed views over the v4 settings workflows bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings workflow body, under `workflow`.
class SettingsWorkflow extends Dto {
  const SettingsWorkflow({
    this.code,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.enableStage,
    this.entity,
    this.event,
    this.href,
    this.id,
    this.isPreBuilt,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/workflows',
    'GET /api/{api_version}/settings/workflows/{workflow_id}',
  ];

  static SettingsWorkflow? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'workflow');
    if (source == null) return null;
    return SettingsWorkflow(
      code: readAny(source['code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      enableStage: readFlag(source['enable_stage']),
      entity: readText(source['entity']),
      event: readText(source['event']),
      href: readText(source['href']),
      id: readText(source['id']),
      isPreBuilt: readFlag(source['is_pre_built']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? code;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? description;

  final String? displayName;

  final bool? enableStage;

  final String? entity;

  final String? event;

  final String? href;

  final String? id;

  final bool? isPreBuilt;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  @override
  String? get envelopeKey => 'workflow';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'enable_stage': enableStage,
        'entity': entity,
        'event': event,
        'href': href,
        'id': id,
        'is_pre_built': isPreBuilt,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
      };
}

/// One page of `SettingsWorkflow` records, under `data`.
class SettingsWorkflowList extends Dto {
  const SettingsWorkflowList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/workflows',
  ];

  static SettingsWorkflowList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsWorkflowList(
      data:
          readList<SettingsWorkflow>(source['data'], SettingsWorkflow.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsWorkflow?>? data;

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
