/// The v4 events endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'events_dto.dart';
import 'events_urls.dart';

/// `GET /api/{api_version}/events`
Future<ApiResponse<EventList>> getEvents(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(EventsUrls.events,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: EventList.fromMap);

/// `GET /api/{api_version}/events/{event_uuid}`
Future<ApiResponse<Event>> getEvent(
  ExsitedClient client,
  Object eventUuid, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(EventsUrls.event,
        pathParams: {'event_uuid': eventUuid},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Event.fromMap);

/// `POST /api/{api_version}/events/{event_uuid}/execute`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createEventExecute(
  ExsitedClient client,
  Object eventUuid,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(EventsUrls.eventExecute,
        pathParams: {'event_uuid': eventUuid},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/events/{event_uuid}/remove`
Future<ApiResponse<Event>> createEventRemove(
  ExsitedClient client,
  Object eventUuid,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(EventsUrls.eventRemove,
        pathParams: {'event_uuid': eventUuid},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Event.fromMap);
