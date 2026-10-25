/// Fulfillment terms path templates and body keys; the client fills `{api_version}`.
library;

class FulfillmentTermsUrls {
  FulfillmentTermsUrls._();

  static const String settingsFulfillmentTerms =
      '/api/{api_version}/settings/fulfillment_terms';
  static const String settingsFulfillmentTerm =
      '/api/{api_version}/settings/fulfillment_terms/{fulfillment_term_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String fulfillmentTermKey = 'fulfillment_term';
}
