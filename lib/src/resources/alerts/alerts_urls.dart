/// Alerts path templates and body keys; the client fills `{api_version}`.
library;

class AlertsUrls {
  AlertsUrls._();

  static const String alerts = '/api/{api_version}/alerts';
  static const String alert = '/api/{api_version}/alerts/{alert_id}';
  static const String alertsAccountById =
      '/api/{api_version}/alerts/account/{account_id}';
  static const String alertsEmployeeById =
      '/api/{api_version}/alerts/employee/{employee_id}';
  static const String alertsLabourById =
      '/api/{api_version}/alerts/labour/{labour_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';
}
