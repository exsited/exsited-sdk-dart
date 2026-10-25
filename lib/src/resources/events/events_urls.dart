/// Events path templates and body keys; the client fills `{api_version}`.
library;

class EventsUrls {
  EventsUrls._();

  static const String events = '/api/{api_version}/events';
  static const String event = '/api/{api_version}/events/{event_uuid}';
  static const String eventExecute =
      '/api/{api_version}/events/{event_uuid}/execute';
  static const String eventRemove =
      '/api/{api_version}/events/{event_uuid}/remove';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String eventKey = 'event';
}
