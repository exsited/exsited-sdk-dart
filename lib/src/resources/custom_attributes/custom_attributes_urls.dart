/// Custom attributes path templates and body keys; the client fills `{api_version}`.
library;

class CustomAttributesUrls {
  CustomAttributesUrls._();

  static const String customAttributes = '/api/{api_version}/custom_attributes';
  static const String customAttribute =
      '/api/{api_version}/custom_attributes/{custom_attribute_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String customAttributeKey = 'custom_attribute';
}
