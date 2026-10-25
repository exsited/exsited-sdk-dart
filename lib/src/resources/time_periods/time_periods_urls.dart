/// Time periods path templates and body keys; the client fills `{api_version}`.
library;

class TimePeriodsUrls {
  TimePeriodsUrls._();

  static const String settingsTimePeriods =
      '/api/{api_version}/settings/time_periods';
  static const String settingsTimePeriod =
      '/api/{api_version}/settings/time_periods/{time_period_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String timePeriodKey = 'time_period';
}
