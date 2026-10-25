/// The v4 labours endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'labours_dto.dart';
import 'labours_urls.dart';

/// `GET /api/{api_version}/labour_availability`
Future<ApiResponse<LabourAvailabilityList>> getLabourAvailability(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(LaboursUrls.labourAvailability,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: LabourAvailabilityList.fromMap);

/// `GET /api/{api_version}/labour_profiles`
Future<ApiResponse<LabourProfileList>> getLabourProfiles(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(LaboursUrls.labourProfiles,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: LabourProfileList.fromMap);

/// `POST /api/{api_version}/labour_profiles`
Future<ApiResponse<LabourProfileView>> createLabourProfile(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(LaboursUrls.labourProfiles,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: LabourProfileView.fromMap);

/// `GET /api/{api_version}/labours`
Future<ApiResponse<LabourList>> getLabours(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(LaboursUrls.labours,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: LabourList.fromMap);

/// `POST /api/{api_version}/labours`
Future<ApiResponse<Labour>> createLabour(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(LaboursUrls.labours,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Labour.fromMap);

/// `GET /api/{api_version}/labour_profiles/{labour_profile_id}`
Future<ApiResponse<LabourProfileView>> getLabourProfile(
  ExsitedClient client,
  Object labourProfileId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(LaboursUrls.labourProfile,
        pathParams: {'labour_profile_id': labourProfileId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: LabourProfileView.fromMap);

/// `PATCH /api/{api_version}/labour_profiles/{labour_profile_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateLabourProfile(
  ExsitedClient client,
  Object labourProfileId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(LaboursUrls.labourProfile,
        pathParams: {'labour_profile_id': labourProfileId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/labour_profiles/{labour_profile_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteLabourProfile(
  ExsitedClient client,
  Object labourProfileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(LaboursUrls.labourProfile,
        pathParams: {'labour_profile_id': labourProfileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/labours/available_for_booking`
Future<ApiResponse<LabourList>> getLaboursAvailableForBooking(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(LaboursUrls.laboursAvailableForBooking,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: LabourList.fromMap);

/// `PATCH /api/{api_version}/labours/{labour_uuid}`
Future<ApiResponse<Labour>> updateLabour(
  ExsitedClient client,
  Object labourUuid,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(LaboursUrls.labour,
        pathParams: {'labour_uuid': labourUuid},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Labour.fromMap);

/// `DELETE /api/{api_version}/labours/{labour_uuid}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteLabour(
  ExsitedClient client,
  Object labourUuid, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(LaboursUrls.labour,
        pathParams: {'labour_uuid': labourUuid},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/labours/{labour_uuid}`
Future<ApiResponse<Labour>> getLabour(
  ExsitedClient client,
  Object labourUuid, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(LaboursUrls.labour,
        pathParams: {'labour_uuid': labourUuid},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Labour.fromMap);

/// `POST /api/{api_version}/labours/{labour_id}/cancel`
Future<ApiResponse<Labour>> cancelLabour(
  ExsitedClient client,
  Object labourId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(LaboursUrls.labourCancel,
        pathParams: {'labour_id': labourId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Labour.fromMap);

/// `POST /api/{api_version}/labours/{labour_id}/reactivate`
Future<ApiResponse<Labour>> reactivateLabour(
  ExsitedClient client,
  Object labourId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(LaboursUrls.labourReactivate,
        pathParams: {'labour_id': labourId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Labour.fromMap);

/// `GET /api/{api_version}/labours/{labour_uuid}/orders`
Future<ApiResponse<LabourOrderList>> getLabourOrders(
  ExsitedClient client,
  Object labourUuid, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(LaboursUrls.labourOrders,
        pathParams: {'labour_uuid': labourUuid},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: LabourOrderList.fromMap);

/// `PATCH /api/{api_version}/labour_availability`
///
/// Edit availability slots in bulk; the body is `{"labours": [{"id",
/// "labour_availability", "labour_custom_availability"}]}`, `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateLabourAvailability(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(LaboursUrls.labourAvailability,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/labour_profiles/{labour_profile_id}/sessions`
///
/// List a labour profile's sessions.
Future<ApiResponse<LabourProfileSessionList>> getLabourProfileSessions(
  ExsitedClient client,
  Object labourProfileId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(LaboursUrls.labourProfileSessions,
        pathParams: {'labour_profile_id': labourProfileId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: LabourProfileSessionList.fromMap);

/// `GET /api/{api_version}/labour_profiles/{labour_profile_id}/sessions/{session_id}`
///
/// Get one labour profile session.
Future<ApiResponse<LabourProfileSessionView>> getLabourProfileSession(
  ExsitedClient client,
  Object labourProfileId,
  Object sessionId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(LaboursUrls.labourProfileSession,
        pathParams: {
          'labour_profile_id': labourProfileId,
          'session_id': sessionId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: LabourProfileSessionView.fromMap);

/// `GET /api/{api_version}/labours/{labour_id}/availability`
///
/// One labour's availability calendar, under `labour_calendar`; the id or the
/// code.
Future<ApiResponse<LabourCalendar>> getLabourCalendar(
  ExsitedClient client,
  Object labourId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(LaboursUrls.labourCalendar,
        pathParams: {'labour_id': labourId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: LabourCalendar.fromMap);
