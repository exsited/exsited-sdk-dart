/// The v4 custom events endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'custom_events.dart' as endpoints;
import 'custom_events_dto.dart' as views;

/// The custom events endpoints with [client] already applied.
class CustomEventsResource {
  /// Bind the resource to a client; normally reached via `client.customEvents`.
  const CustomEventsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/custom_events`
  Future<ApiResponse<views.SettingsCustomEventList>> getSettingsCustomEvents({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsCustomEvents(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/custom_events`
  Future<ApiResponse<Object?>> createSettingsCustomEvent(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsCustomEvent(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/custom_events/{custom_event_id}`
  Future<ApiResponse<views.SettingsCustomEvent>> getSettingsCustomEvent(
    Object customEventId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsCustomEvent(
        client,
        customEventId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/custom_events/{custom_event_id}`
  Future<ApiResponse<Object?>> deleteSettingsCustomEvent(
    Object customEventId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsCustomEvent(
        client,
        customEventId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/custom_events/{custom_event_id}`
  Future<ApiResponse<Object?>> updateSettingsCustomEvent(
    Object customEventId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsCustomEvent(
        client,
        customEventId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
