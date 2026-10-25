/// The v4 tasks endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../../errors.dart';
import 'tasks_dto.dart';
import 'tasks_urls.dart';

/// `GET /api/{api_version}/tasks`
Future<ApiResponse<TaskList>> getTasks(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(TasksUrls.tasks,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: TaskList.fromMap);

/// `DELETE /api/{api_version}/tasks/{task_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteTask(
  ExsitedClient client,
  Object taskId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(TasksUrls.task,
        pathParams: {'task_id': taskId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/tasks/{task_id}`
Future<ApiResponse<TaskView>> getTask(
  ExsitedClient client,
  Object taskId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(TasksUrls.task,
        pathParams: {'task_id': taskId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: TaskView.fromMap);

/// `PATCH /api/{api_version}/tasks/{task_id}`
Future<ApiResponse<TaskView>> updateTask(
  ExsitedClient client,
  Object taskId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(TasksUrls.task,
        pathParams: {'task_id': taskId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: TaskView.fromMap);

/// `GET /api/{api_version}/tasks/{task_id}/checklist`
Future<ApiResponse<TaskChecklist>> getTaskChecklist(
  ExsitedClient client,
  Object taskId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(TasksUrls.taskChecklist,
        pathParams: {'task_id': taskId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: TaskChecklist.fromMap);

/// `POST /api/{api_version}/tasks/{task_id}/checklist`
Future<ApiResponse<TaskView>> createTaskChecklist(
  ExsitedClient client,
  Object taskId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(TasksUrls.taskChecklist,
        pathParams: {'task_id': taskId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: TaskView.fromMap);

/// `GET /api/{api_version}/tasks/{task_code}/notes`
Future<ApiResponse<TaskNoteList>> getTaskNotes(
  ExsitedClient client,
  Object taskId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(TasksUrls.taskNotes,
        pathParams: {'task_code': taskId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: TaskNoteList.fromMap);

/// `POST /api/{api_version}/tasks/{task_code}/notes`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
///
/// Sent as a form, the text as the `note` field, and as multipart with any
/// [files] beside it: the endpoint reads no JSON body.
Future<ApiResponse<Object?>> createTaskNote(
  ExsitedClient client,
  Object taskId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPostRequest(TasksUrls.taskNotes,
      pathParams: {'task_code': taskId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat);
}

/// `GET /api/{api_version}/tasks/{task_id}/checklist/{task_checklist_uuid}`
Future<ApiResponse<TaskChecklist>> getTaskChecklistByUuid(
  ExsitedClient client,
  Object taskId,
  Object taskChecklistUuid, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(TasksUrls.taskChecklistByUuid,
        pathParams: {
          'task_id': taskId,
          'task_checklist_uuid': taskChecklistUuid
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: TaskChecklist.fromMap);

/// `DELETE /api/{api_version}/tasks/{task_code}/notes/{note_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteTaskNote(
  ExsitedClient client,
  Object taskId,
  Object taskNoteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(TasksUrls.taskNote,
        pathParams: {'task_code': taskId, 'note_id': taskNoteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/tasks`
///
/// Create task, `{"work_task": {...}}`, `name` required and unknown keys
/// refused; `201` with the task as `getTask` reads it.
Future<ApiResponse<TaskView>> createTask(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(TasksUrls.tasks,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: TaskView.fromMap);

/// `PATCH /api/{api_version}/tasks/{task_id}/checklist/{task_checklist_uuid}`
///
/// Edit one checklist item, `{"checklist": {...}}`; the task's id or code, and
/// the whole task back.
Future<ApiResponse<TaskView>> updateTaskChecklistByUuid(
  ExsitedClient client,
  Object taskId,
  Object taskChecklistUuid,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(TasksUrls.taskChecklistByUuid,
        pathParams: {
          'task_id': taskId,
          'task_checklist_uuid': taskChecklistUuid
        },
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: TaskView.fromMap);

/// `DELETE /api/{api_version}/tasks/{task_id}/checklist/{task_checklist_uuid}`
///
/// Delete one checklist item; `409` once the item is `COMPLETED`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteTaskChecklistByUuid(
  ExsitedClient client,
  Object taskId,
  Object taskChecklistUuid, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(TasksUrls.taskChecklistByUuid,
        pathParams: {
          'task_id': taskId,
          'task_checklist_uuid': taskChecklistUuid
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/tasks/{task_code}/notes/{note_id}`
///
/// Get one note, by the task's code; a `wt_` id answers `404`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getTaskNote(
  ExsitedClient client,
  Object taskCode,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(TasksUrls.taskNote,
        pathParams: {'task_code': taskCode, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/tasks/{task_code}/notes/{note_id}`
///
/// Update a note's text; a form, as the create is, by the task's code.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateTaskNote(
  ExsitedClient client,
  Object taskCode,
  Object noteId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPatchRequest(TasksUrls.taskNote,
      pathParams: {'task_code': taskCode, 'note_id': noteId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat);
}

/// `GET /api/{api_version}/tasks/{task_code}/notes/{note_id}/files`
///
/// List a note's attachments, by the task's code.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getTaskNoteFiles(
  ExsitedClient client,
  Object taskCode,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(TasksUrls.taskNoteFiles,
        pathParams: {'task_code': taskCode, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/tasks/{task_code}/notes/{note_id}/files/{file_id}`
///
/// Get one attachment, the `uuid` the files listing gives; a JSON descriptor
/// under `file`, not the bytes.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getTaskNoteFile(
  ExsitedClient client,
  Object taskCode,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(TasksUrls.taskNoteFile,
        pathParams: {
          'task_code': taskCode,
          'note_id': noteId,
          'file_id': fileId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/tasks/{task_code}/notes/{note_id}/files/{file_id}`
///
/// Delete one attachment, by the task's code and the file's `uuid`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteTaskNoteFile(
  ExsitedClient client,
  Object taskCode,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(TasksUrls.taskNoteFile,
        pathParams: {
          'task_code': taskCode,
          'note_id': noteId,
          'file_id': fileId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
