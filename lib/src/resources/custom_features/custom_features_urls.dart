/// Custom features path templates and body keys; the client fills `{api_version}`.
library;

class CustomFeaturesUrls {
  CustomFeaturesUrls._();

  static const String customFeature = '/api/{api_version}/custom_feature';
  static const String componentById =
      '/api/{api_version}/component/{custom_feature_id}';
  static const String customFeatureById =
      '/api/{api_version}/custom_feature/{custom_feature_id}';

  /// The envelopes one record arrives under, read off this family's views.
  static const String componentKey = 'component';
  static const String customFeatureKey = 'custom_feature';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';
}
