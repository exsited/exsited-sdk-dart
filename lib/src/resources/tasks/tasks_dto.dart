/// Typed views over the v4 tasks bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The task body.
class Task extends Dto {
  const Task({
    this.actualHours,
    this.code,
    this.completedAt,
    this.completedBy,
    this.createdBy,
    this.createdOn,
    this.customAttributes,
    this.description,
    this.displayName,
    this.dueDate,
    this.estimatedHours,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.milestone,
    this.name,
    this.object,
    this.parentTask,
    this.priority,
    this.resource,
    this.sortOrder,
    this.startAfter,
    this.startDate,
    this.state,
    this.status,
    this.taskStatus,
    this.version,
    this.workflow,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/tasks',
  ];

  static Task? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return Task(
      actualHours: readAny(source['actual_hours']),
      code: readText(source['code']),
      completedAt: readText(source['completed_at']),
      completedBy: TaskCompletedBy.fromMap(source['completed_by']),
      createdBy: TaskCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      dueDate: readText(source['due_date']),
      estimatedHours: readInteger(source['estimated_hours']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: TaskLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      milestone: readAny(source['milestone']),
      name: readText(source['name']),
      object: readText(source['object']),
      parentTask: readAny(source['parent_task']),
      priority: readText(source['priority']),
      resource: readAny(source['resource']),
      sortOrder: readInteger(source['sort_order']),
      startAfter: readAny(source['start_after']),
      startDate: readText(source['start_date']),
      state: readAny(source['state']),
      status: readText(source['status']),
      taskStatus: readText(source['task_status']),
      version: readInteger(source['version']),
      workflow: readAny(source['workflow']),
    );
  }

  /// Untyped: never populated in the records measured.
  final Object? actualHours;

  final String? code;

  final String? completedAt;

  final TaskCompletedBy? completedBy;

  final TaskCreatedBy? createdBy;

  final String? createdOn;

  final List<Object?>? customAttributes;

  final String? description;

  final String? displayName;

  final String? dueDate;

  final int? estimatedHours;

  final String? href;

  final String? id;

  final TaskLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  /// Untyped: never populated in the records measured.
  final Object? milestone;

  final String? name;

  final String? object;

  /// Untyped: never populated in the records measured.
  final Object? parentTask;

  final String? priority;

  /// Untyped: never populated in the records measured.
  final Object? resource;

  final int? sortOrder;

  /// Untyped: never populated in the records measured.
  final Object? startAfter;

  final String? startDate;

  /// Untyped: never populated in the records measured.
  final Object? state;

  final String? status;

  final String? taskStatus;

  final int? version;

  /// Untyped: never populated in the records measured.
  final Object? workflow;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'actual_hours': actualHours,
        'code': code,
        'completed_at': completedAt,
        'completed_by': completedBy,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_attributes': customAttributes,
        'description': description,
        'display_name': displayName,
        'due_date': dueDate,
        'estimated_hours': estimatedHours,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'milestone': milestone,
        'name': name,
        'object': object,
        'parent_task': parentTask,
        'priority': priority,
        'resource': resource,
        'sort_order': sortOrder,
        'start_after': startAfter,
        'start_date': startDate,
        'state': state,
        'status': status,
        'task_status': taskStatus,
        'version': version,
        'workflow': workflow,
      };
}

/// A page of Task records.
class TaskList extends Dto {
  const TaskList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/tasks',
  ];

  static TaskList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaskList(
      data: readList<Task>(source['data'], Task.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Task?>? data;

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

/// What `getTask` answers, under `work_task`.
class TaskView extends Dto {
  const TaskView({
    this.activityLogs,
    this.actualHours,
    this.alerts,
    this.assignees,
    this.checklist,
    this.code,
    this.completedAt,
    this.completedBy,
    this.createdBy,
    this.createdOn,
    this.customAttributes,
    this.description,
    this.displayName,
    this.dueDate,
    this.estimatedHours,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.milestone,
    this.name,
    this.object,
    this.parentTask,
    this.priority,
    this.resource,
    this.sortOrder,
    this.startAfter,
    this.startDate,
    this.state,
    this.status,
    this.taskStatus,
    this.version,
    this.workflow,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/tasks/{task_id}',
    'PATCH /api/{api_version}/tasks/{task_id}',
    'POST /api/{api_version}/tasks/{task_id}/checklist',
  ];

  static TaskView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'work_task');
    if (source == null) return null;
    return TaskView(
      activityLogs: readList<TaskViewActivityLog>(
          source['activity_logs'], TaskViewActivityLog.fromMap),
      actualHours: readAny(source['actual_hours']),
      alerts: readList<Object>(source['alerts'], readAny),
      assignees: TaskViewAssignees.fromMap(source['assignees']),
      checklist: readList<TaskViewChecklist>(
          source['checklist'], TaskViewChecklist.fromMap),
      code: readText(source['code']),
      completedAt: readText(source['completed_at']),
      completedBy: TaskViewCompletedBy.fromMap(source['completed_by']),
      createdBy: TaskViewCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      dueDate: readText(source['due_date']),
      estimatedHours: readInteger(source['estimated_hours']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: TaskViewLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      milestone: readAny(source['milestone']),
      name: readText(source['name']),
      object: readText(source['object']),
      parentTask: readAny(source['parent_task']),
      priority: readText(source['priority']),
      resource: readAny(source['resource']),
      sortOrder: readInteger(source['sort_order']),
      startAfter: readAny(source['start_after']),
      startDate: readText(source['start_date']),
      state: readAny(source['state']),
      status: readText(source['status']),
      taskStatus: readText(source['task_status']),
      version: readInteger(source['version']),
      workflow: readAny(source['workflow']),
    );
  }

  final List<TaskViewActivityLog?>? activityLogs;

  /// Untyped: null in every record measured.
  final Object? actualHours;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? alerts;

  final TaskViewAssignees? assignees;

  final List<TaskViewChecklist?>? checklist;

  final String? code;

  final String? completedAt;

  final TaskViewCompletedBy? completedBy;

  final TaskViewCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? customAttributes;

  final String? description;

  final String? displayName;

  final String? dueDate;

  final int? estimatedHours;

  final String? href;

  final String? id;

  final TaskViewLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  /// Untyped: null in every record measured.
  final Object? milestone;

  final String? name;

  final String? object;

  /// Untyped: null in every record measured.
  final Object? parentTask;

  final String? priority;

  /// Untyped: null in every record measured.
  final Object? resource;

  final int? sortOrder;

  /// Untyped: null in every record measured.
  final Object? startAfter;

  final String? startDate;

  /// Untyped: null in every record measured.
  final Object? state;

  final String? status;

  final String? taskStatus;

  final int? version;

  /// Untyped: null in every record measured.
  final Object? workflow;

  @override
  String? get envelopeKey => 'work_task';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'actual_hours': actualHours,
        'alerts': alerts,
        'assignees': assignees,
        'checklist': checklist,
        'code': code,
        'completed_at': completedAt,
        'completed_by': completedBy,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_attributes': customAttributes,
        'description': description,
        'display_name': displayName,
        'due_date': dueDate,
        'estimated_hours': estimatedHours,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'milestone': milestone,
        'name': name,
        'object': object,
        'parent_task': parentTask,
        'priority': priority,
        'resource': resource,
        'sort_order': sortOrder,
        'start_after': startAfter,
        'start_date': startDate,
        'state': state,
        'status': status,
        'task_status': taskStatus,
        'version': version,
        'workflow': workflow,
      };
}

/// What `getTaskChecklist` answers, under `work_task`.
class TaskChecklist extends Dto {
  const TaskChecklist({
    this.checklist,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/tasks/{task_id}/checklist',
    'GET /api/{api_version}/tasks/{task_id}/checklist/{task_checklist_uuid}',
  ];

  static TaskChecklist? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'work_task');
    if (source == null) return null;
    return TaskChecklist(
      checklist: readAny(source['checklist']),
    );
  }

  /// Untyped: the records measured disagree on its type.
  final Object? checklist;

  @override
  String? get envelopeKey => 'work_task';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'checklist': checklist,
      };
}

/// One page of what `getTaskNotes` lists, under `data`.
class TaskNoteList extends Dto {
  const TaskNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/tasks/{task_code}/notes',
  ];

  static TaskNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaskNoteList(
      data: readList<Object>(source['data'], readAny),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? data;

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

/// A [Task]'s `completed_by`.
class TaskCompletedBy extends Dto {
  const TaskCompletedBy({
    this.name,
    this.object,
  });

  static TaskCompletedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaskCompletedBy(
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

/// A [Task]'s `created_by`.
class TaskCreatedBy extends Dto {
  const TaskCreatedBy({
    this.name,
    this.object,
  });

  static TaskCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaskCreatedBy(
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

/// A [Task]'s `last_updated_by`.
class TaskLastUpdatedBy extends Dto {
  const TaskLastUpdatedBy({
    this.name,
    this.object,
  });

  static TaskLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaskLastUpdatedBy(
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

/// A [TaskView]'s `completed_by`.
class TaskViewCompletedBy extends Dto {
  const TaskViewCompletedBy({
    this.name,
    this.object,
  });

  static TaskViewCompletedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaskViewCompletedBy(
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

/// One entry of a [TaskView]'s `checklist`.
class TaskViewChecklist extends Dto {
  const TaskViewChecklist({
    this.completedAt,
    this.completedBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.id,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.sortOrder,
    this.status,
    this.version,
  });

  static TaskViewChecklist? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaskViewChecklist(
      completedAt: readAny(source['completed_at']),
      completedBy: readAny(source['completed_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      id: readText(source['id']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      sortOrder: readInteger(source['sort_order']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? completedAt;

  /// Untyped: null in every record measured.
  final Object? completedBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final String? id;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final int? sortOrder;

  final String? status;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'completed_at': completedAt,
        'completed_by': completedBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'id': id,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'sort_order': sortOrder,
        'status': status,
        'version': version,
      };
}

/// A [TaskView]'s `assignees`.
class TaskViewAssignees extends Dto {
  const TaskViewAssignees({
    this.manuallyAddedAccountContacts,
    this.selectedAccountContacts,
    this.selectedEmployees,
    this.selectedLabours,
    this.selectedOperators,
  });

  static TaskViewAssignees? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaskViewAssignees(
      manuallyAddedAccountContacts:
          readList<Object>(source['manually_added_account_contacts'], readAny),
      selectedAccountContacts:
          readList<Object>(source['selected_account_contacts'], readAny),
      selectedEmployees: readList<TaskViewAssigneesSelectedEmployee>(
          source['selected_employees'],
          TaskViewAssigneesSelectedEmployee.fromMap),
      selectedLabours: readList<TaskViewAssigneesSelectedLabour>(
          source['selected_labours'], TaskViewAssigneesSelectedLabour.fromMap),
      selectedOperators:
          readList<Object>(source['selected_operators'], readAny),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? manuallyAddedAccountContacts;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? selectedAccountContacts;

  final List<TaskViewAssigneesSelectedEmployee?>? selectedEmployees;

  final List<TaskViewAssigneesSelectedLabour?>? selectedLabours;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? selectedOperators;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'manually_added_account_contacts': manuallyAddedAccountContacts,
        'selected_account_contacts': selectedAccountContacts,
        'selected_employees': selectedEmployees,
        'selected_labours': selectedLabours,
        'selected_operators': selectedOperators,
      };
}

/// A [TaskView]'s `created_by`.
class TaskViewCreatedBy extends Dto {
  const TaskViewCreatedBy({
    this.name,
    this.object,
  });

  static TaskViewCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaskViewCreatedBy(
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

/// A [TaskView]'s `last_updated_by`.
class TaskViewLastUpdatedBy extends Dto {
  const TaskViewLastUpdatedBy({
    this.name,
    this.object,
  });

  static TaskViewLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaskViewLastUpdatedBy(
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

/// One entry of a [TaskView]'s `activity_logs`.
class TaskViewActivityLog extends Dto {
  const TaskViewActivityLog({
    this.activity,
  });

  static TaskViewActivityLog? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaskViewActivityLog(
      activity: readText(source['activity']),
    );
  }

  final String? activity;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity': activity,
      };
}

/// One entry of a [TaskViewAssignees]'s `selected_labours`.
class TaskViewAssigneesSelectedLabour extends Dto {
  const TaskViewAssigneesSelectedLabour({
    this.displayOrder,
    this.email,
    this.labourCode,
    this.name,
    this.responsibility,
    this.uuid,
  });

  static TaskViewAssigneesSelectedLabour? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaskViewAssigneesSelectedLabour(
      displayOrder: readInteger(source['display_order']),
      email: readText(source['email']),
      labourCode: readText(source['labour_code']),
      name: readText(source['name']),
      responsibility: readAny(source['responsibility']),
      uuid: readText(source['uuid']),
    );
  }

  final int? displayOrder;

  final String? email;

  final String? labourCode;

  final String? name;

  /// Untyped: null in every record measured.
  final Object? responsibility;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_order': displayOrder,
        'email': email,
        'labour_code': labourCode,
        'name': name,
        'responsibility': responsibility,
        'uuid': uuid,
      };
}

/// One entry of a [TaskViewAssignees]'s `selected_employees`.
class TaskViewAssigneesSelectedEmployee extends Dto {
  const TaskViewAssigneesSelectedEmployee({
    this.displayOrder,
    this.email,
    this.employeeCode,
    this.name,
    this.responsibility,
    this.uuid,
  });

  static TaskViewAssigneesSelectedEmployee? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TaskViewAssigneesSelectedEmployee(
      displayOrder: readInteger(source['display_order']),
      email: readText(source['email']),
      employeeCode: readText(source['employee_code']),
      name: readText(source['name']),
      responsibility: readAny(source['responsibility']),
      uuid: readText(source['uuid']),
    );
  }

  final int? displayOrder;

  final String? email;

  final String? employeeCode;

  final String? name;

  /// Untyped: null in every record measured.
  final Object? responsibility;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_order': displayOrder,
        'email': email,
        'employee_code': employeeCode,
        'name': name,
        'responsibility': responsibility,
        'uuid': uuid,
      };
}
