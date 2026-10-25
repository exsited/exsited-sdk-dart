/// The v4 note groups endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'note_groups.dart' as endpoints;
import 'note_groups_dto.dart' as views;

/// The note groups endpoints with [client] already applied.
class NoteGroupsResource {
  /// Bind the resource to a client; normally reached via `client.noteGroups`.
  const NoteGroupsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/note_groups`
  Future<ApiResponse<views.NoteGroupList>> getNoteGroups({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getNoteGroups(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/note_groups`
  Future<ApiResponse<views.NoteGroup>> createNoteGroup(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createNoteGroup(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/note_groups/{note_group_id}`
  Future<ApiResponse<Object?>> deleteNoteGroup(
    Object noteGroupId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteNoteGroup(
        client,
        noteGroupId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/note_groups/{note_group_id}`
  Future<ApiResponse<views.NoteGroup>> getNoteGroup(
    Object noteGroupId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getNoteGroup(
        client,
        noteGroupId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/note_groups/{note_group_id}`
  Future<ApiResponse<views.NoteGroup>> updateNoteGroup(
    Object noteGroupId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateNoteGroup(
        client,
        noteGroupId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/note_groups/{note_group_id}/notes`
  Future<ApiResponse<views.NoteGroupNotes>> getNoteGroupNotes(
    Object noteGroupId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getNoteGroupNotes(
        client,
        noteGroupId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/note_groups/{note_group_id}/notes/user/{note_user}`
  Future<ApiResponse<Object?>> getNoteGroupNotesByUser(
    Object noteGroupId,
    Object noteUser, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getNoteGroupNotesByUser(
        client,
        noteGroupId,
        noteUser,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
