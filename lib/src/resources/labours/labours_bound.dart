/// The v4 labours endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'labours.dart' as endpoints;
import 'labours_dto.dart' as views;

/// The labours endpoints with [client] already applied.
class LaboursResource {
  /// Bind the resource to a client; normally reached via `client.labours`.
  const LaboursResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/labour_availability`
  Future<ApiResponse<views.LabourAvailabilityList>> getLabourAvailability({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getLabourAvailability(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/labour_profiles`
  Future<ApiResponse<views.LabourProfileList>> getLabourProfiles({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getLabourProfiles(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/labour_profiles`
  Future<ApiResponse<views.LabourProfileView>> createLabourProfile(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createLabourProfile(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/labours`
  Future<ApiResponse<views.LabourList>> getLabours({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getLabours(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/labours`
  Future<ApiResponse<views.Labour>> createLabour(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createLabour(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/labour_profiles/{labour_profile_id}`
  Future<ApiResponse<views.LabourProfileView>> getLabourProfile(
    Object labourProfileId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getLabourProfile(
        client,
        labourProfileId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/labour_profiles/{labour_profile_id}`
  Future<ApiResponse<Object?>> updateLabourProfile(
    Object labourProfileId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateLabourProfile(
        client,
        labourProfileId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/labour_profiles/{labour_profile_id}`
  Future<ApiResponse<Object?>> deleteLabourProfile(
    Object labourProfileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteLabourProfile(
        client,
        labourProfileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/labours/available_for_booking`
  Future<ApiResponse<views.LabourList>> getLaboursAvailableForBooking({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getLaboursAvailableForBooking(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/labours/{labour_uuid}`
  Future<ApiResponse<views.Labour>> updateLabour(
    Object labourUuid,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateLabour(
        client,
        labourUuid,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/labours/{labour_uuid}`
  Future<ApiResponse<Object?>> deleteLabour(
    Object labourUuid, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteLabour(
        client,
        labourUuid,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/labours/{labour_uuid}`
  Future<ApiResponse<views.Labour>> getLabour(
    Object labourUuid, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getLabour(
        client,
        labourUuid,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/labours/{labour_id}/cancel`
  Future<ApiResponse<views.Labour>> cancelLabour(
    Object labourId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.cancelLabour(
        client,
        labourId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/labours/{labour_id}/reactivate`
  Future<ApiResponse<views.Labour>> reactivateLabour(
    Object labourId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.reactivateLabour(
        client,
        labourId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/labours/{labour_uuid}/orders`
  Future<ApiResponse<views.LabourOrderList>> getLabourOrders(
    Object labourUuid, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getLabourOrders(
        client,
        labourUuid,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/labour_availability`
  Future<ApiResponse<Object?>> updateLabourAvailability(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateLabourAvailability(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/labour_profiles/{labour_profile_id}/sessions`
  Future<ApiResponse<views.LabourProfileSessionList>> getLabourProfileSessions(
    Object labourProfileId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getLabourProfileSessions(
        client,
        labourProfileId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/labour_profiles/{labour_profile_id}/sessions/{session_id}`
  Future<ApiResponse<views.LabourProfileSessionView>> getLabourProfileSession(
    Object labourProfileId,
    Object sessionId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getLabourProfileSession(
        client,
        labourProfileId,
        sessionId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/labours/{labour_id}/availability`
  Future<ApiResponse<views.LabourCalendar>> getLabourCalendar(
    Object labourId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getLabourCalendar(
        client,
        labourId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
