/// The v4 system events endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'system_events_dto.dart';
import 'system_events_urls.dart';

/// `GET /api/{api_version}/settings/system_events`
///
/// List the base system events; reference data, read only.
Future<ApiResponse<SettingsSystemEventList>> getSettingsSystemEvents(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SystemEventsUrls.settingsSystemEvents,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsSystemEventList.fromMap);

/// `GET /api/{api_version}/settings/system_events/{system_event_id}`
///
/// Get one system event.
Future<ApiResponse<SettingsSystemEvent>> getSettingsSystemEvent(
  ExsitedClient client,
  Object systemEventId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SystemEventsUrls.settingsSystemEvent,
        pathParams: {'system_event_id': systemEventId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsSystemEvent.fromMap);
