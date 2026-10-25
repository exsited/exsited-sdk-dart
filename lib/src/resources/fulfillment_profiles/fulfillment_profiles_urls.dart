/// Fulfillment profiles path templates and body keys; the client fills `{api_version}`.
library;

class FulfillmentProfilesUrls {
  FulfillmentProfilesUrls._();

  static const String settingsFulfillmentProfiles =
      '/api/{api_version}/settings/fulfillment_profiles';
  static const String settingsFulfillmentProfile =
      '/api/{api_version}/settings/fulfillment_profiles/{fulfillment_profile_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String fulfillmentProfileKey = 'fulfillment_profile';
}
