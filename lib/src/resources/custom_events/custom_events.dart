/// The v4 custom events endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'custom_events_dto.dart';
import 'custom_events_urls.dart';

/// `GET /api/{api_version}/settings/custom_events`
///
/// List the custom events.
Future<ApiResponse<SettingsCustomEventList>> getSettingsCustomEvents(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomEventsUrls.settingsCustomEvents,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomEventList.fromMap);

/// `POST /api/{api_version}/settings/custom_events`
///
/// Create a custom event; `name` and `base_event`, an `se_` id, are required,
/// and a message is added to every communication profile.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createSettingsCustomEvent(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CustomEventsUrls.settingsCustomEvents,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/settings/custom_events/{custom_event_id}`
///
/// Read one custom event by its `ce_` id.
Future<ApiResponse<SettingsCustomEvent>> getSettingsCustomEvent(
  ExsitedClient client,
  Object customEventId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomEventsUrls.settingsCustomEvent,
        pathParams: {'custom_event_id': customEventId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomEvent.fromMap);

/// `DELETE /api/{api_version}/settings/custom_events/{custom_event_id}`
///
/// Delete a custom event no workflow uses.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsCustomEvent(
  ExsitedClient client,
  Object customEventId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(CustomEventsUrls.settingsCustomEvent,
        pathParams: {'custom_event_id': customEventId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/custom_events/{custom_event_id}`
///
/// Update a custom event's fields or its status.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateSettingsCustomEvent(
  ExsitedClient client,
  Object customEventId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(CustomEventsUrls.settingsCustomEvent,
        pathParams: {'custom_event_id': customEventId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
