/// Pricing periods path templates and body keys; the client fills `{api_version}`.
library;

class PricingPeriodsUrls {
  PricingPeriodsUrls._();

  static const String settingsPricingPeriods =
      '/api/{api_version}/settings/pricing_periods';
  static const String settingsPricingPeriod =
      '/api/{api_version}/settings/pricing_periods/{pricing_period_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String pricingPeriodKey = 'pricing_period';
}
