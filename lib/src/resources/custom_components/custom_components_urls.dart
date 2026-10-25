/// Custom components path templates and body keys; the client fills `{api_version}`.
library;

class CustomComponentsUrls {
  CustomComponentsUrls._();

  static const String component = '/api/{api_version}/component';
  static const String componentByUuid =
      '/api/{api_version}/component/{component_uuid}';
  static const String componentById =
      '/api/{api_version}/component/{component_uuid}/{component_object_id}';
  static const String componentObjects =
      '/api/{api_version}/components/{component_uuid}/objects';
  static const String componentObject =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}';
  static const String componentObjectActivity =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/activity';
  static const String componentObjectCustomObjects =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects';
  static const String componentObjectPdf =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/pdf';
  static const String componentObjectActivityEntry =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/activity/{activity_id}';
  static const String componentObjectMilestones =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/milestones';
  static const String componentObjectMilestone =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/milestones/{milestone_id}';
  static const String componentObjectHistory =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/history';
  static const String componentObjectHistoryEntry =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/history/{history_id}';
  static const String componentObjectNotes =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes';
  static const String componentObjectNote =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}';
  static const String componentObjectNoteFiles =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}/files';
  static const String componentObjectNoteFile =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/notes/{note_id}/files/{file_id}';
  static const String componentObjectCustomObject =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects/{custom_object_id}';
  static const String componentObjectCustomObjectInstance =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/custom_objects/{custom_object_id}/instances/{instance_id}';
  static const String componentObjectLinkDomains =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/link_domains';
  static const String componentObjectUnlinkDomains =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/unlink_domains';
  static const String componentObjectChangeStatus =
      '/api/{api_version}/components/{component_uuid}/objects/{component_object_id}/change_status';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String accCusCompKey = 'Acc Cus Comp';
  static const String componentKey = 'component';
  static const String customComponentObjectActivityKey =
      'custom_component_object_activity';
  static const String customComponentObjectKey = 'custom_component_object';
  static const String customObjectInstanceKey = 'custom_object_instance';
  static const String customObjectInstancesKey = 'custom_object_instances';
  static const String fileKey = 'file';
  static const String noteKey = 'note';
}
