/// The v4 events endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'events.dart' as endpoints;
import 'events_dto.dart' as views;

/// The events endpoints with [client] already applied.
class EventsResource {
  /// Bind the resource to a client; normally reached via `client.events`.
  const EventsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/events`
  Future<ApiResponse<views.EventList>> getEvents({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getEvents(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/events/{event_uuid}`
  Future<ApiResponse<views.Event>> getEvent(
    Object eventUuid, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getEvent(
        client,
        eventUuid,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/events/{event_uuid}/execute`
  Future<ApiResponse<Object?>> createEventExecute(
    Object eventUuid,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createEventExecute(
        client,
        eventUuid,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/events/{event_uuid}/remove`
  Future<ApiResponse<views.Event>> createEventRemove(
    Object eventUuid,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createEventRemove(
        client,
        eventUuid,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
