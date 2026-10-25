/// The v4 tasks endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'tasks.dart' as endpoints;
import 'tasks_dto.dart' as views;

/// The tasks endpoints with [client] already applied.
class TasksResource {
  /// Bind the resource to a client; normally reached via `client.tasks`.
  const TasksResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/tasks`
  Future<ApiResponse<views.TaskList>> getTasks({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getTasks(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/tasks/{task_id}`
  Future<ApiResponse<Object?>> deleteTask(
    Object taskId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteTask(
        client,
        taskId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/tasks/{task_id}`
  Future<ApiResponse<views.TaskView>> getTask(
    Object taskId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getTask(
        client,
        taskId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/tasks/{task_id}`
  Future<ApiResponse<views.TaskView>> updateTask(
    Object taskId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateTask(
        client,
        taskId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/tasks/{task_id}/checklist`
  Future<ApiResponse<views.TaskChecklist>> getTaskChecklist(
    Object taskId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getTaskChecklist(
        client,
        taskId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/tasks/{task_id}/checklist`
  Future<ApiResponse<views.TaskView>> createTaskChecklist(
    Object taskId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createTaskChecklist(
        client,
        taskId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/tasks/{task_code}/notes`
  Future<ApiResponse<views.TaskNoteList>> getTaskNotes(
    Object taskId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getTaskNotes(
        client,
        taskId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/tasks/{task_code}/notes`
  Future<ApiResponse<Object?>> createTaskNote(
    Object taskId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createTaskNote(
        client,
        taskId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/tasks/{task_id}/checklist/{task_checklist_uuid}`
  Future<ApiResponse<views.TaskChecklist>> getTaskChecklistByUuid(
    Object taskId,
    Object taskChecklistUuid, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getTaskChecklistByUuid(
        client,
        taskId,
        taskChecklistUuid,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/tasks/{task_code}/notes/{note_id}`
  Future<ApiResponse<Object?>> deleteTaskNote(
    Object taskId,
    Object taskNoteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteTaskNote(
        client,
        taskId,
        taskNoteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/tasks`
  Future<ApiResponse<views.TaskView>> createTask(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createTask(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/tasks/{task_id}/checklist/{task_checklist_uuid}`
  Future<ApiResponse<views.TaskView>> updateTaskChecklistByUuid(
    Object taskId,
    Object taskChecklistUuid,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateTaskChecklistByUuid(
        client,
        taskId,
        taskChecklistUuid,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/tasks/{task_id}/checklist/{task_checklist_uuid}`
  Future<ApiResponse<Object?>> deleteTaskChecklistByUuid(
    Object taskId,
    Object taskChecklistUuid, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteTaskChecklistByUuid(
        client,
        taskId,
        taskChecklistUuid,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/tasks/{task_code}/notes/{note_id}`
  Future<ApiResponse<Object?>> getTaskNote(
    Object taskCode,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getTaskNote(
        client,
        taskCode,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/tasks/{task_code}/notes/{note_id}`
  Future<ApiResponse<Object?>> updateTaskNote(
    Object taskCode,
    Object noteId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateTaskNote(
        client,
        taskCode,
        noteId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/tasks/{task_code}/notes/{note_id}/files`
  Future<ApiResponse<Object?>> getTaskNoteFiles(
    Object taskCode,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getTaskNoteFiles(
        client,
        taskCode,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/tasks/{task_code}/notes/{note_id}/files/{file_id}`
  Future<ApiResponse<Object?>> getTaskNoteFile(
    Object taskCode,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getTaskNoteFile(
        client,
        taskCode,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/tasks/{task_code}/notes/{note_id}/files/{file_id}`
  Future<ApiResponse<Object?>> deleteTaskNoteFile(
    Object taskCode,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteTaskNoteFile(
        client,
        taskCode,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
