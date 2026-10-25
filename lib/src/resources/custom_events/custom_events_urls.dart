/// Custom events path templates and body keys; the client fills `{api_version}`.
library;

class CustomEventsUrls {
  CustomEventsUrls._();

  static const String settingsCustomEvents =
      '/api/{api_version}/settings/custom_events';
  static const String settingsCustomEvent =
      '/api/{api_version}/settings/custom_events/{custom_event_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String customEventKey = 'custom_event';
}
