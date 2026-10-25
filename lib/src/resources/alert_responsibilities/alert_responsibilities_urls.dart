/// Alert responsibilities path templates and body keys; the client fills `{api_version}`.
library;

class AlertResponsibilitiesUrls {
  AlertResponsibilitiesUrls._();

  static const String settingsAlertResponsibilities =
      '/api/{api_version}/settings/alert_responsibilities';
  static const String settingsAlertResponsibility =
      '/api/{api_version}/settings/alert_responsibilities/{alert_responsibility_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String alertResponsibilityKey = 'alert_responsibility';
}
