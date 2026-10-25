/// Note groups path templates and body keys; the client fills `{api_version}`.
library;

class NoteGroupsUrls {
  NoteGroupsUrls._();

  static const String noteGroups = '/api/{api_version}/note_groups';
  static const String noteGroup =
      '/api/{api_version}/note_groups/{note_group_id}';
  static const String noteGroupNotes =
      '/api/{api_version}/note_groups/{note_group_id}/notes';
  static const String noteGroupNotesByUser =
      '/api/{api_version}/note_groups/{note_group_id}/notes/user/{note_user}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String noteGroupKey = 'note_group';
}
