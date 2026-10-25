/// The v4 custom components endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../../errors.dart';
import 'custom_components_dto.dart';
import 'custom_components_urls.dart';

/// `GET /api/{api_version}/component`
Future<ApiResponse<ComponentList>> getComponent(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.component,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentList.fromMap);

/// `GET /api/{api_version}/component/{component_uuid}`
Future<ApiResponse<Component>> getComponentByUuid(
  ExsitedClient client,
  Object componentUuid, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.componentByUuid,
        pathParams: {'component_uuid': componentUuid},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Component.fromMap);

/// `POST /api/{api_version}/component/{component_uuid}`
///
/// Answered `201` under the component's name.
Future<ApiResponse<ComponentByUuid>> createComponentByUuid(
  ExsitedClient client,
  Object componentUuid,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CustomComponentsUrls.componentByUuid,
        pathParams: {'component_uuid': componentUuid},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentByUuid.fromMap);

/// `DELETE /api/{api_version}/component/{component_uuid}/{component_object_id}`
///
/// Answered `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteComponentById(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(CustomComponentsUrls.componentById,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/component/{component_uuid}/{component_object_id}`
///
/// Answered `202` under the component's name.
Future<ApiResponse<ComponentByUuid>> updateComponentById(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(CustomComponentsUrls.componentById,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentByUuid.fromMap);

/// `GET /api/{api_version}/components/{component_uuid}/objects`
Future<ApiResponse<ComponentObjects>> getComponentObjects(
  ExsitedClient client,
  Object componentUuid, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.componentObjects,
        pathParams: {'component_uuid': componentUuid},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObjects.fromMap);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}`
Future<ApiResponse<ComponentObject>> getComponentObject(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.componentObject,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObject.fromMap);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/activity`
Future<ApiResponse<ComponentObjectActivity>> getComponentObjectActivity(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.componentObjectActivity,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObjectActivity.fromMap);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects`
Future<ApiResponse<ComponentObjectCustomObjects>>
    getComponentObjectCustomObjects(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(CustomComponentsUrls.componentObjectCustomObjects,
            pathParams: {
              'component_uuid': componentUuid,
              'component_object_id': componentObjectId
            },
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ComponentObjectCustomObjects.fromMap);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/pdf`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getComponentObjectPdf(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.componentObjectPdf,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/component`
///
/// Create a component definition, under `component`; `name` is required, and
/// `use_in` asks for `relation` beside it.
Future<ApiResponse<Component>> createComponent(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CustomComponentsUrls.component,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Component.fromMap);

/// `PATCH /api/{api_version}/component/{component_uuid}`
///
/// Update a component definition, the `cmp_` id, under `component`.
Future<ApiResponse<Component>> updateComponent(
  ExsitedClient client,
  Object componentUuid,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(CustomComponentsUrls.componentByUuid,
        pathParams: {'component_uuid': componentUuid},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Component.fromMap);

/// `POST /api/{api_version}/components/{component_uuid}/objects`
///
/// Create an instance on v4, under `custom_component_object`; every key is
/// optional, and `parents` names the owner.
Future<ApiResponse<ComponentObjectRecord>> createComponentObject(
  ExsitedClient client,
  Object componentUuid,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CustomComponentsUrls.componentObjects,
        pathParams: {'component_uuid': componentUuid},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObjectRecord.fromMap);

/// `PATCH /api/{api_version}/components/{component_uuid}/objects/{component_object_id}`
///
/// Update an instance on v4; `version_id` must match when sent, and `code`,
/// `parents` and `custom_form` are refused.
Future<ApiResponse<ComponentObjectRecord>> updateComponentObject(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(CustomComponentsUrls.componentObject,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObjectRecord.fromMap);

/// `DELETE /api/{api_version}/components/{component_uuid}/objects/{component_object_id}`
///
/// Delete an instance on v4; answered `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteComponentObject(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(CustomComponentsUrls.componentObject,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/activity`
///
/// Log an activity, under `custom_component_object_activity` with `type`,
/// `message` and `user_name`.
Future<ApiResponse<ComponentObjectActivityEntry>> createComponentObjectActivity(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CustomComponentsUrls.componentObjectActivity,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObjectActivityEntry.fromMap);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/activity/{activity_id}`
///
/// One activity.
Future<ApiResponse<ComponentObjectActivityEntry>>
    getComponentObjectActivityById(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object activityId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(CustomComponentsUrls.componentObjectActivityEntry,
            pathParams: {
              'component_uuid': componentUuid,
              'component_object_id': componentObjectId,
              'activity_id': activityId
            },
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ComponentObjectActivityEntry.fromMap);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/milestones`
///
/// List workflow milestones; no typed view, so `.dto` is null.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getComponentObjectMilestones(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.componentObjectMilestones,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/milestones/{milestone_id}`
///
/// One workflow milestone, the `wfm_` id.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getComponentObjectMilestone(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object milestoneId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.componentObjectMilestone,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId,
          'milestone_id': milestoneId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/history`
///
/// List workflow history; no typed view, so `.dto` is null.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getComponentObjectHistory(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.componentObjectHistory,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/history/{history_id}`
///
/// One workflow history entry, the `wfh_` id.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getComponentObjectHistoryById(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object historyId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.componentObjectHistoryEntry,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId,
          'history_id': historyId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes`
///
/// List notes.
Future<ApiResponse<ComponentObjectNotes>> getComponentObjectNotes(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.componentObjectNotes,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObjectNotes.fromMap);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}`
///
/// One note.
Future<ApiResponse<ComponentObjectNote>> getComponentObjectNote(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.componentObjectNote,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId,
          'note_id': noteId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObjectNote.fromMap);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}/files`
///
/// List a note's files.
Future<ApiResponse<ComponentObjectNoteFiles>> getComponentObjectNoteFiles(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.componentObjectNoteFiles,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId,
          'note_id': noteId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObjectNoteFiles.fromMap);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}/files/{file_id}`
///
/// One file of a note `/notes/{note_id}/files/{file_id}`, the attachment's
/// `uuid`.
Future<ApiResponse<ComponentObjectNoteFile>> getComponentObjectNoteFile(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.componentObjectNoteFile,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId,
          'note_id': noteId,
          'file_id': fileId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObjectNoteFile.fromMap);

/// `POST /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes`
///
/// Attach a note; a form, the text as the `note` field with any `files` beside
/// it.
Future<ApiResponse<ComponentObjectNote>> createComponentObjectNote(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPostRequest(CustomComponentsUrls.componentObjectNotes,
      pathParams: {
        'component_uuid': componentUuid,
        'component_object_id': componentObjectId
      },
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: ComponentObjectNote.fromMap);
}

/// `PATCH /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}`
///
/// Update a note; a form, as the create is.
Future<ApiResponse<ComponentObjectNote>> updateComponentObjectNote(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
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
  return client.sendPatchRequest(CustomComponentsUrls.componentObjectNote,
      pathParams: {
        'component_uuid': componentUuid,
        'component_object_id': componentObjectId,
        'note_id': noteId
      },
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: ComponentObjectNote.fromMap);
}

/// `DELETE /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}`
///
/// Delete a note; answered `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteComponentObjectNote(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(CustomComponentsUrls.componentObjectNote,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId,
          'note_id': noteId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}/files/{file_id}`
///
/// Delete a note's file `/notes/{note_id}/files/{file_id}`, the attachment's
/// `uuid`; answered `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteComponentObjectNoteFile(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(CustomComponentsUrls.componentObjectNoteFile,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId,
          'note_id': noteId,
          'file_id': fileId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects/{custom_object_id}`
///
/// One custom object schema with its instances
/// `/{component_object_id}/custom_objects/{custom_object_id}`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getComponentObjectCustomObject(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object customObjectId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomComponentsUrls.componentObjectCustomObject,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId,
          'custom_object_id': customObjectId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects/{custom_object_id}`
///
/// Create a custom object instance
/// `/{component_object_id}/custom_objects/{custom_object_id}`, under
/// `custom_object_instances` with an `attributes` list; the path has no
/// `instances` segment.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createComponentObjectCustomObjectInstance(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object customObjectId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CustomComponentsUrls.componentObjectCustomObject,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId,
          'custom_object_id': customObjectId
        },
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects/{custom_object_id}/instances/{instance_id}`
///
/// One custom object instance
/// `/{component_object_id}/custom_objects/{custom_object_id}/instances/{instance_id}`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getComponentObjectCustomObjectInstance(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object customObjectId,
  Object instanceId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(
        CustomComponentsUrls.componentObjectCustomObjectInstance,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId,
          'custom_object_id': customObjectId,
          'instance_id': instanceId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects/{custom_object_id}/instances/{instance_id}`
///
/// Update a custom object instance
/// `/{component_object_id}/custom_objects/{custom_object_id}/instances/{instance_id}`,
/// under `custom_object_instance` with an `attributes` list.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateComponentObjectCustomObjectInstance(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object customObjectId,
  Object instanceId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(
        CustomComponentsUrls.componentObjectCustomObjectInstance,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId,
          'custom_object_id': customObjectId,
          'instance_id': instanceId
        },
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects/{custom_object_id}/instances/{instance_id}`
///
/// Delete a custom object instance
/// `/{component_object_id}/custom_objects/{custom_object_id}/instances/{instance_id}`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteComponentObjectCustomObjectInstance(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object customObjectId,
  Object instanceId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(
        CustomComponentsUrls.componentObjectCustomObjectInstance,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId,
          'custom_object_id': customObjectId,
          'instance_id': instanceId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/link_domains`
///
/// Link accounts or orders, under `custom_component_object` with `domain_type`
/// and `domains[].domain_id`.
Future<ApiResponse<ComponentObjectRecord>> linkComponentObjectDomains(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CustomComponentsUrls.componentObjectLinkDomains,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObjectRecord.fromMap);

/// `PATCH /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/link_domains`
///
/// Replace the linked accounts or orders; a domain left out of `domains` is
/// unlinked.
Future<ApiResponse<ComponentObjectRecord>> updateComponentObjectDomains(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(CustomComponentsUrls.componentObjectLinkDomains,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObjectRecord.fromMap);

/// `POST /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/unlink_domains`
///
/// Unlink accounts or orders; a domain that is not linked is refused.
Future<ApiResponse<ComponentObjectRecord>> unlinkComponentObjectDomains(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CustomComponentsUrls.componentObjectUnlinkDomains,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObjectRecord.fromMap);

/// `POST /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/change_status`
///
/// Move an instance through its workflow, under `custom_component_object` with
/// `workflow_status`; runs the transition at once.
Future<ApiResponse<ComponentObjectRecord>> changeComponentObjectStatus(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CustomComponentsUrls.componentObjectChangeStatus,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObjectRecord.fromMap);

/// `DELETE /api/{api_version}/component/{component_uuid}`
///
/// Delete a component definition, by the `id` its create answers; answered
/// `204`. The same request as `custom_features.deleteComponentById`.
///
/// No typed view: the answer has no body.
Future<ApiResponse<Object?>> deleteComponent(
  ExsitedClient client,
  Object componentUuid, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(CustomComponentsUrls.componentByUuid,
        pathParams: {'component_uuid': componentUuid},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
