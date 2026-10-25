/// Billing periods path templates and body keys; the client fills `{api_version}`.
library;

class BillingPeriodsUrls {
  BillingPeriodsUrls._();

  static const String settingsBillingPeriods =
      '/api/{api_version}/settings/billing_periods';
  static const String settingsBillingPeriod =
      '/api/{api_version}/settings/billing_periods/{billing_period_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String billingPeriodKey = 'billing_period';
}
