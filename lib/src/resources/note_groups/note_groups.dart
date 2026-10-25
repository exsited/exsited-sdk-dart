/// The v4 note groups endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'note_groups_dto.dart';
import 'note_groups_urls.dart';

/// `GET /api/{api_version}/note_groups`
Future<ApiResponse<NoteGroupList>> getNoteGroups(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(NoteGroupsUrls.noteGroups,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: NoteGroupList.fromMap);

/// `POST /api/{api_version}/note_groups`
Future<ApiResponse<NoteGroup>> createNoteGroup(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(NoteGroupsUrls.noteGroups,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: NoteGroup.fromMap);

/// `DELETE /api/{api_version}/note_groups/{note_group_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteNoteGroup(
  ExsitedClient client,
  Object noteGroupId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(NoteGroupsUrls.noteGroup,
        pathParams: {'note_group_id': noteGroupId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/note_groups/{note_group_id}`
Future<ApiResponse<NoteGroup>> getNoteGroup(
  ExsitedClient client,
  Object noteGroupId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(NoteGroupsUrls.noteGroup,
        pathParams: {'note_group_id': noteGroupId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: NoteGroup.fromMap);

/// `PATCH /api/{api_version}/note_groups/{note_group_id}`
Future<ApiResponse<NoteGroup>> updateNoteGroup(
  ExsitedClient client,
  Object noteGroupId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(NoteGroupsUrls.noteGroup,
        pathParams: {'note_group_id': noteGroupId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: NoteGroup.fromMap);

/// `GET /api/{api_version}/note_groups/{note_group_id}/notes`
Future<ApiResponse<NoteGroupNotes>> getNoteGroupNotes(
  ExsitedClient client,
  Object noteGroupId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(NoteGroupsUrls.noteGroupNotes,
        pathParams: {'note_group_id': noteGroupId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: NoteGroupNotes.fromMap);

/// `GET /api/{api_version}/note_groups/{note_group_id}/notes/user/{note_user}`
///
/// List a group's notes as one of its users sees them; `note_user` is the note
/// user's uuid or what it was added as: an entity's uuid, or a manual user's
/// email address.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getNoteGroupNotesByUser(
  ExsitedClient client,
  Object noteGroupId,
  Object noteUser, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(NoteGroupsUrls.noteGroupNotesByUser,
        pathParams: {'note_group_id': noteGroupId, 'note_user': noteUser},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
