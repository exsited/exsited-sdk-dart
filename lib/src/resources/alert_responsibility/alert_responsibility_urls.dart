/// Alert responsibility path templates and body keys; the client fills `{api_version}`.
library;

class AlertResponsibilityUrls {
  AlertResponsibilityUrls._();

  static const String alertResponsibilities =
      '/api/{api_version}/alert_responsibility';
  static const String alertResponsibility =
      '/api/{api_version}/alert_responsibility/{alert_responsibility_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String alertResponsibilityKey = 'alert_responsibility';
}
