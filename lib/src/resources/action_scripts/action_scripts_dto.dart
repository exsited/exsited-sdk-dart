/// Typed views over the v4 action scripts bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The action script body, under `action_script`; `activity_logs` comes on the
/// create answer only.
class ActionScript extends Dto {
  const ActionScript({
    this.actionName,
    this.activityLogs,
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
    this.objectName,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/action_scripts',
    'GET /api/{api_version}/action_scripts/{action_script_id}',
    'POST /api/{api_version}/action_scripts',
    'PATCH /api/{api_version}/action_scripts/{action_script_id}',
  ];

  static ActionScript? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'action_script');
    if (source == null) return null;
    return ActionScript(
      actionName: readAny(source['action_name']),
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      createdBy: ActionScriptCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy:
          ActionScriptLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      objectName: readAny(source['object_name']),
      status: readText(source['status']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? actionName;

  final List<Object?>? activityLogs;

  final ActionScriptCreatedBy? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  final ActionScriptLastUpdatedBy? lastUpdatedBy;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedOn;

  final String? name;

  final String? object;

  /// Null in every record measured, so untyped.
  final Object? objectName;

  final String? status;

  @override
  String? get envelopeKey => 'action_script';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'action_name': actionName,
        'activity_logs': activityLogs,
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
        'object_name': objectName,
        'status': status,
      };
}

/// One page of `ActionScript` records, under `data`.
class ActionScriptList extends Dto {
  const ActionScriptList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/action_scripts',
  ];

  static ActionScriptList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ActionScriptList(
      data: readList<ActionScript>(source['data'], ActionScript.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<ActionScript?>? data;

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

/// An [ActionScript]'s `created_by`.
class ActionScriptCreatedBy extends Dto {
  const ActionScriptCreatedBy({
    this.name,
    this.object,
  });

  static ActionScriptCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ActionScriptCreatedBy(
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'object': object,
      };
}

/// An [ActionScript]'s `last_updated_by`, set once the script has been updated.
class ActionScriptLastUpdatedBy extends Dto {
  const ActionScriptLastUpdatedBy({
    this.name,
    this.object,
  });

  static ActionScriptLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ActionScriptLastUpdatedBy(
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'object': object,
      };
}
