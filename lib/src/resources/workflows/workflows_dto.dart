/// Typed views over the v4 workflows bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// One page of what `getWorkflowMilestones` lists, under `data`.
class WorkflowMilestoneList extends Dto {
  const WorkflowMilestoneList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/workflows/{workflow_uuid}/milestones',
  ];

  static WorkflowMilestoneList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return WorkflowMilestoneList(
      data: readList<WorkflowMilestone>(
          source['data'], WorkflowMilestone.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<WorkflowMilestone?>? data;

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

/// One entry of a [WorkflowMilestoneList]'s `data`.
class WorkflowMilestone extends Dto {
  const WorkflowMilestone({
    this.activityDefinition,
    this.autoCreate,
    this.createdOn,
    this.description,
    this.displayName,
    this.estimatedHours,
    this.href,
    this.icon,
    this.id,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.priority,
    this.sortOrder,
    this.status,
    this.workflow,
    this.workflowVersion,
  });

  static WorkflowMilestone? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return WorkflowMilestone(
      activityDefinition: WorkflowMilestoneActivityDefinition.fromMap(
          source['activity_definition']),
      autoCreate: readAny(source['auto_create']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      estimatedHours: readAny(source['estimated_hours']),
      href: readText(source['href']),
      icon: readAny(source['icon']),
      id: readText(source['id']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      priority: readText(source['priority']),
      sortOrder: readAny(source['sort_order']),
      status: readText(source['status']),
      workflow: WorkflowMilestoneWorkflow.fromMap(source['workflow']),
      workflowVersion:
          WorkflowMilestoneWorkflowVersion.fromMap(source['workflow_version']),
    );
  }

  final WorkflowMilestoneActivityDefinition? activityDefinition;

  /// Untyped: null in every record measured.
  final Object? autoCreate;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? description;

  final String? displayName;

  /// Untyped: null in every record measured.
  final Object? estimatedHours;

  final String? href;

  /// Untyped: null in every record measured.
  final Object? icon;

  final String? id;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? priority;

  /// Untyped: null in every record measured.
  final Object? sortOrder;

  final String? status;

  final WorkflowMilestoneWorkflow? workflow;

  final WorkflowMilestoneWorkflowVersion? workflowVersion;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_definition': activityDefinition,
        'auto_create': autoCreate,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'estimated_hours': estimatedHours,
        'href': href,
        'icon': icon,
        'id': id,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'priority': priority,
        'sort_order': sortOrder,
        'status': status,
        'workflow': workflow,
        'workflow_version': workflowVersion,
      };
}

/// A [WorkflowMilestone]'s `workflow`.
class WorkflowMilestoneWorkflow extends Dto {
  const WorkflowMilestoneWorkflow({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static WorkflowMilestoneWorkflow? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return WorkflowMilestoneWorkflow(
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

/// A [WorkflowMilestone]'s `activity_definition`.
class WorkflowMilestoneActivityDefinition extends Dto {
  const WorkflowMilestoneActivityDefinition({
    this.id,
    this.name,
    this.object,
  });

  static WorkflowMilestoneActivityDefinition? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return WorkflowMilestoneActivityDefinition(
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [WorkflowMilestone]'s `workflow_version`.
class WorkflowMilestoneWorkflowVersion extends Dto {
  const WorkflowMilestoneWorkflowVersion({
    this.id,
    this.name,
    this.object,
  });

  static WorkflowMilestoneWorkflowVersion? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return WorkflowMilestoneWorkflowVersion(
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'object': object,
      };
}

/// One page of what `getWorkflows` lists, under `data`.
class WorkflowList extends Dto {
  const WorkflowList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/workflows',
  ];

  static WorkflowList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return WorkflowList(
      data: readList<Workflow>(source['data'], Workflow.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Workflow?>? data;

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

/// One entry of a [WorkflowList]'s `data`.
class Workflow extends Dto {
  const Workflow({
    this.object,
    this.id,
    this.status,
    this.code,
    this.name,
    this.displayName,
    this.description,
    this.entity,
    this.entityId,
    this.event,
    this.isPreBuilt,
    this.enableStage,
    this.currentVersion,
    this.customForm,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.href,
  });

  static Workflow? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return Workflow(
      object: readText(source['object']),
      id: readText(source['id']),
      status: readText(source['status']),
      code: readAny(source['code']),
      name: readText(source['name']),
      displayName: readText(source['display_name']),
      description: readAny(source['description']),
      entity: readText(source['entity']),
      entityId: readInteger(source['entity_id']),
      event: readText(source['event']),
      isPreBuilt: readFlag(source['is_pre_built']),
      enableStage: readFlag(source['enable_stage']),
      currentVersion: WorkflowCurrentVersion.fromMap(source['current_version']),
      customForm: readAny(source['custom_form']),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      createdBy: WorkflowCreatedBy.fromMap(source['created_by']),
      lastUpdatedBy: WorkflowLastUpdatedBy.fromMap(source['last_updated_by']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? status;

  /// Null in every record measured, so untyped.
  final Object? code;

  final String? name;

  final String? displayName;

  /// Null in every record measured, so untyped.
  final Object? description;

  final String? entity;

  final int? entityId;

  final String? event;

  final bool? isPreBuilt;

  final bool? enableStage;

  final WorkflowCurrentVersion? currentVersion;

  /// Null in every record measured, so untyped.
  final Object? customForm;

  final String? createdOn;

  final String? lastUpdatedOn;

  final WorkflowCreatedBy? createdBy;

  final WorkflowLastUpdatedBy? lastUpdatedBy;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'status': status,
        'code': code,
        'name': name,
        'display_name': displayName,
        'description': description,
        'entity': entity,
        'entity_id': entityId,
        'event': event,
        'is_pre_built': isPreBuilt,
        'enable_stage': enableStage,
        'current_version': currentVersion,
        'custom_form': customForm,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'href': href,
      };
}

/// One workflow, under `workflow`: what `getWorkflow` answers, and the create
/// and the update, which answer the same record.
class WorkflowView extends Dto {
  const WorkflowView({
    this.object,
    this.id,
    this.status,
    this.code,
    this.name,
    this.displayName,
    this.description,
    this.entity,
    this.entityId,
    this.event,
    this.isPreBuilt,
    this.enableStage,
    this.currentVersion,
    this.customForm,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.href,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/workflows/{workflow_id}',
  ];

  static WorkflowView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'workflow');
    if (source == null) return null;
    return WorkflowView(
      object: readText(source['object']),
      id: readText(source['id']),
      status: readText(source['status']),
      code: readAny(source['code']),
      name: readText(source['name']),
      displayName: readText(source['display_name']),
      description: readAny(source['description']),
      entity: readText(source['entity']),
      entityId: readInteger(source['entity_id']),
      event: readText(source['event']),
      isPreBuilt: readFlag(source['is_pre_built']),
      enableStage: readFlag(source['enable_stage']),
      currentVersion: WorkflowCurrentVersion.fromMap(source['current_version']),
      customForm: readAny(source['custom_form']),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      createdBy: WorkflowCreatedBy.fromMap(source['created_by']),
      lastUpdatedBy: WorkflowLastUpdatedBy.fromMap(source['last_updated_by']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? status;

  /// Null in every record measured, so untyped.
  final Object? code;

  final String? name;

  final String? displayName;

  /// Null in every record measured, so untyped.
  final Object? description;

  final String? entity;

  final int? entityId;

  final String? event;

  final bool? isPreBuilt;

  final bool? enableStage;

  final WorkflowCurrentVersion? currentVersion;

  /// Null in every record measured, so untyped.
  final Object? customForm;

  final String? createdOn;

  final String? lastUpdatedOn;

  final WorkflowCreatedBy? createdBy;

  final WorkflowLastUpdatedBy? lastUpdatedBy;

  final String? href;

  @override
  String? get envelopeKey => 'workflow';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'status': status,
        'code': code,
        'name': name,
        'display_name': displayName,
        'description': description,
        'entity': entity,
        'entity_id': entityId,
        'event': event,
        'is_pre_built': isPreBuilt,
        'enable_stage': enableStage,
        'current_version': currentVersion,
        'custom_form': customForm,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'href': href,
      };
}

/// A [Workflow]'s `current_version`.
class WorkflowCurrentVersion extends Dto {
  const WorkflowCurrentVersion({
    this.object,
    this.id,
    this.name,
  });

  static WorkflowCurrentVersion? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return WorkflowCurrentVersion(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
      };
}

/// A [Workflow]'s `created_by`.
class WorkflowCreatedBy extends Dto {
  const WorkflowCreatedBy({
    this.object,
    this.name,
  });

  static WorkflowCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return WorkflowCreatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// A [Workflow]'s `last_updated_by`.
class WorkflowLastUpdatedBy extends Dto {
  const WorkflowLastUpdatedBy({
    this.object,
    this.name,
  });

  static WorkflowLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return WorkflowLastUpdatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// One milestone definition, under `workflow_milestone`: what
/// `getWorkflowMilestone` answers, the same fields as a listed one.
class WorkflowMilestoneView extends Dto {
  const WorkflowMilestoneView({
    this.activityDefinition,
    this.autoCreate,
    this.createdOn,
    this.description,
    this.displayName,
    this.estimatedHours,
    this.href,
    this.icon,
    this.id,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.priority,
    this.sortOrder,
    this.status,
    this.workflow,
    this.workflowVersion,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/workflows/{workflow_id}/milestones/{milestone_id}',
  ];

  static WorkflowMilestoneView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'workflow_milestone');
    if (source == null) return null;
    return WorkflowMilestoneView(
      activityDefinition: WorkflowMilestoneActivityDefinition.fromMap(
          source['activity_definition']),
      autoCreate: readAny(source['auto_create']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      estimatedHours: readAny(source['estimated_hours']),
      href: readText(source['href']),
      icon: readAny(source['icon']),
      id: readText(source['id']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      priority: readText(source['priority']),
      sortOrder: readAny(source['sort_order']),
      status: readText(source['status']),
      workflow: WorkflowMilestoneDetail.fromMap(source['workflow']),
      workflowVersion:
          WorkflowMilestoneWorkflowVersion.fromMap(source['workflow_version']),
    );
  }

  final WorkflowMilestoneActivityDefinition? activityDefinition;

  /// Null in every record measured, so untyped.
  final Object? autoCreate;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? description;

  final String? displayName;

  /// Null in every record measured, so untyped.
  final Object? estimatedHours;

  final String? href;

  /// Null in every record measured, so untyped.
  final Object? icon;

  final String? id;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? priority;

  /// Null in every record measured, so untyped.
  final Object? sortOrder;

  final String? status;

  final WorkflowMilestoneDetail? workflow;

  final WorkflowMilestoneWorkflowVersion? workflowVersion;

  @override
  String? get envelopeKey => 'workflow_milestone';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_definition': activityDefinition,
        'auto_create': autoCreate,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'estimated_hours': estimatedHours,
        'href': href,
        'icon': icon,
        'id': id,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'priority': priority,
        'sort_order': sortOrder,
        'status': status,
        'workflow': workflow,
        'workflow_version': workflowVersion,
      };
}

/// A [WorkflowMilestone]'s `workflow`.
class WorkflowMilestoneDetail extends Dto {
  const WorkflowMilestoneDetail({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static WorkflowMilestoneDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return WorkflowMilestoneDetail(
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
