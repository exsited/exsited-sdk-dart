/// Day of month path templates and body keys; the client fills `{api_version}`.
library;

class DayOfMonthUrls {
  DayOfMonthUrls._();

  static const String settingsDaysOfMonth =
      '/api/{api_version}/settings/day_of_month';
  static const String settingsDayOfMonth =
      '/api/{api_version}/settings/day_of_month/{day_of_month_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String dayOfMonthKey = 'day_of_month';
}
