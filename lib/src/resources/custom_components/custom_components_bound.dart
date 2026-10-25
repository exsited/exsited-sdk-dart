/// The v4 custom components endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'custom_components.dart' as endpoints;
import 'custom_components_dto.dart' as views;

/// The custom components endpoints with [client] already applied.
class CustomComponentsResource {
  /// Bind the resource to a client; normally reached via `client.customComponents`.
  const CustomComponentsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/component`
  Future<ApiResponse<views.ComponentList>> getComponent({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponent(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/component/{component_uuid}`
  Future<ApiResponse<views.Component>> getComponentByUuid(
    Object componentUuid, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponentByUuid(
        client,
        componentUuid,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/component/{component_uuid}`
  Future<ApiResponse<views.ComponentByUuid>> createComponentByUuid(
    Object componentUuid,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createComponentByUuid(
        client,
        componentUuid,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/component/{component_uuid}/{component_object_id}`
  Future<ApiResponse<Object?>> deleteComponentById(
    Object componentUuid,
    Object componentObjectId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteComponentById(
        client,
        componentUuid,
        componentObjectId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/component/{component_uuid}/{component_object_id}`
  Future<ApiResponse<views.ComponentByUuid>> updateComponentById(
    Object componentUuid,
    Object componentObjectId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateComponentById(
        client,
        componentUuid,
        componentObjectId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/components/{component_uuid}/objects`
  Future<ApiResponse<views.ComponentObjects>> getComponentObjects(
    Object componentUuid, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponentObjects(
        client,
        componentUuid,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}`
  Future<ApiResponse<views.ComponentObject>> getComponentObject(
    Object componentUuid,
    Object componentObjectId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponentObject(
        client,
        componentUuid,
        componentObjectId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/activity`
  Future<ApiResponse<views.ComponentObjectActivity>> getComponentObjectActivity(
    Object componentUuid,
    Object componentObjectId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponentObjectActivity(
        client,
        componentUuid,
        componentObjectId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects`
  Future<ApiResponse<views.ComponentObjectCustomObjects>>
      getComponentObjectCustomObjects(
    Object componentUuid,
    Object componentObjectId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getComponentObjectCustomObjects(
            client,
            componentUuid,
            componentObjectId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/pdf`
  Future<ApiResponse<Object?>> getComponentObjectPdf(
    Object componentUuid,
    Object componentObjectId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponentObjectPdf(
        client,
        componentUuid,
        componentObjectId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/component`
  Future<ApiResponse<views.Component>> createComponent(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createComponent(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/component/{component_uuid}`
  Future<ApiResponse<views.Component>> updateComponent(
    Object componentUuid,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateComponent(
        client,
        componentUuid,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/components/{component_uuid}/objects`
  Future<ApiResponse<views.ComponentObjectRecord>> createComponentObject(
    Object componentUuid,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createComponentObject(
        client,
        componentUuid,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/components/{component_uuid}/objects/{component_object_id}`
  Future<ApiResponse<views.ComponentObjectRecord>> updateComponentObject(
    Object componentUuid,
    Object componentObjectId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateComponentObject(
        client,
        componentUuid,
        componentObjectId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/components/{component_uuid}/objects/{component_object_id}`
  Future<ApiResponse<Object?>> deleteComponentObject(
    Object componentUuid,
    Object componentObjectId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteComponentObject(
        client,
        componentUuid,
        componentObjectId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/activity`
  Future<ApiResponse<views.ComponentObjectActivityEntry>>
      createComponentObjectActivity(
    Object componentUuid,
    Object componentObjectId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createComponentObjectActivity(
            client,
            componentUuid,
            componentObjectId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/activity/{activity_id}`
  Future<ApiResponse<views.ComponentObjectActivityEntry>>
      getComponentObjectActivityById(
    Object componentUuid,
    Object componentObjectId,
    Object activityId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getComponentObjectActivityById(
            client,
            componentUuid,
            componentObjectId,
            activityId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/milestones`
  Future<ApiResponse<Object?>> getComponentObjectMilestones(
    Object componentUuid,
    Object componentObjectId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponentObjectMilestones(
        client,
        componentUuid,
        componentObjectId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/milestones/{milestone_id}`
  Future<ApiResponse<Object?>> getComponentObjectMilestone(
    Object componentUuid,
    Object componentObjectId,
    Object milestoneId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponentObjectMilestone(
        client,
        componentUuid,
        componentObjectId,
        milestoneId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/history`
  Future<ApiResponse<Object?>> getComponentObjectHistory(
    Object componentUuid,
    Object componentObjectId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponentObjectHistory(
        client,
        componentUuid,
        componentObjectId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/history/{history_id}`
  Future<ApiResponse<Object?>> getComponentObjectHistoryById(
    Object componentUuid,
    Object componentObjectId,
    Object historyId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponentObjectHistoryById(
        client,
        componentUuid,
        componentObjectId,
        historyId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes`
  Future<ApiResponse<views.ComponentObjectNotes>> getComponentObjectNotes(
    Object componentUuid,
    Object componentObjectId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponentObjectNotes(
        client,
        componentUuid,
        componentObjectId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}`
  Future<ApiResponse<views.ComponentObjectNote>> getComponentObjectNote(
    Object componentUuid,
    Object componentObjectId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponentObjectNote(
        client,
        componentUuid,
        componentObjectId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}/files`
  Future<ApiResponse<views.ComponentObjectNoteFiles>>
      getComponentObjectNoteFiles(
    Object componentUuid,
    Object componentObjectId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getComponentObjectNoteFiles(
            client,
            componentUuid,
            componentObjectId,
            noteId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}/files/{file_id}`
  Future<ApiResponse<views.ComponentObjectNoteFile>> getComponentObjectNoteFile(
    Object componentUuid,
    Object componentObjectId,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponentObjectNoteFile(
        client,
        componentUuid,
        componentObjectId,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes`
  Future<ApiResponse<views.ComponentObjectNote>> createComponentObjectNote(
    Object componentUuid,
    Object componentObjectId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createComponentObjectNote(
        client,
        componentUuid,
        componentObjectId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}`
  Future<ApiResponse<views.ComponentObjectNote>> updateComponentObjectNote(
    Object componentUuid,
    Object componentObjectId,
    Object noteId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateComponentObjectNote(
        client,
        componentUuid,
        componentObjectId,
        noteId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}`
  Future<ApiResponse<Object?>> deleteComponentObjectNote(
    Object componentUuid,
    Object componentObjectId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteComponentObjectNote(
        client,
        componentUuid,
        componentObjectId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}/files/{file_id}`
  Future<ApiResponse<Object?>> deleteComponentObjectNoteFile(
    Object componentUuid,
    Object componentObjectId,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteComponentObjectNoteFile(
        client,
        componentUuid,
        componentObjectId,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects/{custom_object_id}`
  Future<ApiResponse<Object?>> getComponentObjectCustomObject(
    Object componentUuid,
    Object componentObjectId,
    Object customObjectId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponentObjectCustomObject(
        client,
        componentUuid,
        componentObjectId,
        customObjectId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects/{custom_object_id}`
  Future<ApiResponse<Object?>> createComponentObjectCustomObjectInstance(
    Object componentUuid,
    Object componentObjectId,
    Object customObjectId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createComponentObjectCustomObjectInstance(
        client,
        componentUuid,
        componentObjectId,
        customObjectId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects/{custom_object_id}/instances/{instance_id}`
  Future<ApiResponse<Object?>> getComponentObjectCustomObjectInstance(
    Object componentUuid,
    Object componentObjectId,
    Object customObjectId,
    Object instanceId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getComponentObjectCustomObjectInstance(
        client,
        componentUuid,
        componentObjectId,
        customObjectId,
        instanceId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects/{custom_object_id}/instances/{instance_id}`
  Future<ApiResponse<Object?>> updateComponentObjectCustomObjectInstance(
    Object componentUuid,
    Object componentObjectId,
    Object customObjectId,
    Object instanceId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateComponentObjectCustomObjectInstance(
        client,
        componentUuid,
        componentObjectId,
        customObjectId,
        instanceId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects/{custom_object_id}/instances/{instance_id}`
  Future<ApiResponse<Object?>> deleteComponentObjectCustomObjectInstance(
    Object componentUuid,
    Object componentObjectId,
    Object customObjectId,
    Object instanceId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteComponentObjectCustomObjectInstance(
        client,
        componentUuid,
        componentObjectId,
        customObjectId,
        instanceId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/link_domains`
  Future<ApiResponse<views.ComponentObjectRecord>> linkComponentObjectDomains(
    Object componentUuid,
    Object componentObjectId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.linkComponentObjectDomains(
        client,
        componentUuid,
        componentObjectId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/link_domains`
  Future<ApiResponse<views.ComponentObjectRecord>> updateComponentObjectDomains(
    Object componentUuid,
    Object componentObjectId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateComponentObjectDomains(
        client,
        componentUuid,
        componentObjectId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/unlink_domains`
  Future<ApiResponse<views.ComponentObjectRecord>> unlinkComponentObjectDomains(
    Object componentUuid,
    Object componentObjectId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.unlinkComponentObjectDomains(
        client,
        componentUuid,
        componentObjectId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/components/{component_uuid}/objects/{component_object_id}/change_status`
  Future<ApiResponse<views.ComponentObjectRecord>> changeComponentObjectStatus(
    Object componentUuid,
    Object componentObjectId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.changeComponentObjectStatus(
        client,
        componentUuid,
        componentObjectId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/component/{component_uuid}`
  Future<ApiResponse<Object?>> deleteComponent(
    Object componentUuid, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteComponent(
        client,
        componentUuid,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
