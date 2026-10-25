/// Charging periods path templates and body keys; the client fills `{api_version}`.
library;

class ChargingPeriodsUrls {
  ChargingPeriodsUrls._();

  static const String settingsChargingPeriods =
      '/api/{api_version}/settings/charging_periods';
  static const String settingsChargingPeriod =
      '/api/{api_version}/settings/charging_periods/{charging_period_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String chargingPeriodKey = 'charging_period';
}
