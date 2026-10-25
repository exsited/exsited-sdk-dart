/// Timesheets path templates and body keys; the client fills `{api_version}`.
library;

class TimesheetsUrls {
  TimesheetsUrls._();

  static const String timesheets = '/api/{api_version}/timesheets';
  static const String timesheet =
      '/api/{api_version}/timesheets/{timesheet_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String timesheetKey = 'timesheet';
}
