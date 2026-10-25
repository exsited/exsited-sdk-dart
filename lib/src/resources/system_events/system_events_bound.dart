/// The v4 system events endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'system_events.dart' as endpoints;
import 'system_events_dto.dart' as views;

/// The system events endpoints with [client] already applied.
class SystemEventsResource {
  /// Bind the resource to a client; normally reached via `client.systemEvents`.
  const SystemEventsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/system_events`
  Future<ApiResponse<views.SettingsSystemEventList>> getSettingsSystemEvents({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsSystemEvents(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/system_events/{system_event_id}`
  Future<ApiResponse<views.SettingsSystemEvent>> getSettingsSystemEvent(
    Object systemEventId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsSystemEvent(
        client,
        systemEventId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
