/// Tasks path templates and body keys; the client fills `{api_version}`.
library;

class TasksUrls {
  TasksUrls._();

  static const String tasks = '/api/{api_version}/tasks';
  static const String task = '/api/{api_version}/tasks/{task_id}';
  static const String taskChecklist =
      '/api/{api_version}/tasks/{task_id}/checklist';
  static const String taskNotes = '/api/{api_version}/tasks/{task_code}/notes';
  static const String taskChecklistByUuid =
      '/api/{api_version}/tasks/{task_id}/checklist/{task_checklist_uuid}';
  static const String taskNote =
      '/api/{api_version}/tasks/{task_code}/notes/{note_id}';
  static const String taskNoteFiles =
      '/api/{api_version}/tasks/{task_code}/notes/{note_id}/files';
  static const String taskNoteFile =
      '/api/{api_version}/tasks/{task_code}/notes/{note_id}/files/{file_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String fileKey = 'file';
  static const String noteKey = 'note';
  static const String workTaskKey = 'work_task';
}
