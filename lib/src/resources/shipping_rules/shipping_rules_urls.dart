/// Shipping rules path templates and body keys; the client fills `{api_version}`.
library;

class ShippingRulesUrls {
  ShippingRulesUrls._();

  static const String settingsShippingRules =
      '/api/{api_version}/settings/shipping_rules';
  static const String settingsShippingRule =
      '/api/{api_version}/settings/shipping_rules/{shipping_rule_id}';
  static const String settingsShippingRuleConfiguration =
      '/api/{api_version}/settings/shipping_rules/{shipping_rule_id}/configuration';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String configurationKey = 'configuration';
  static const String shippingRuleKey = 'shipping_rule';
}
