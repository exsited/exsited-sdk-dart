/// System events path templates and body keys; the client fills `{api_version}`.
library;

class SystemEventsUrls {
  SystemEventsUrls._();

  static const String settingsSystemEvents =
      '/api/{api_version}/settings/system_events';
  static const String settingsSystemEvent =
      '/api/{api_version}/settings/system_events/{system_event_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String systemEventKey = 'system_event';
}
