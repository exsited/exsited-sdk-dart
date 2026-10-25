/// Labours path templates and body keys; the client fills `{api_version}`.
library;

class LaboursUrls {
  LaboursUrls._();

  static const String labourAvailability =
      '/api/{api_version}/labour_availability';
  static const String labourProfiles = '/api/{api_version}/labour_profiles';
  static const String labours = '/api/{api_version}/labours';
  static const String labourProfile =
      '/api/{api_version}/labour_profiles/{labour_profile_id}';
  static const String laboursAvailableForBooking =
      '/api/{api_version}/labours/available_for_booking';
  static const String labour = '/api/{api_version}/labours/{labour_uuid}';
  static const String labourCancel =
      '/api/{api_version}/labours/{labour_id}/cancel';
  static const String labourReactivate =
      '/api/{api_version}/labours/{labour_id}/reactivate';
  static const String labourOrders =
      '/api/{api_version}/labours/{labour_uuid}/orders';
  static const String labourProfileSessions =
      '/api/{api_version}/labour_profiles/{labour_profile_id}/sessions';
  static const String labourProfileSession =
      '/api/{api_version}/labour_profiles/{labour_profile_id}/sessions/{session_id}';
  static const String labourCalendar =
      '/api/{api_version}/labours/{labour_id}/availability';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String labourCalendarKey = 'labour_calendar';
  static const String labourKey = 'labour';
  static const String labourProfileKey = 'labour_profile';
  static const String labourProfileSessionKey = 'labour_profile_session';
}
