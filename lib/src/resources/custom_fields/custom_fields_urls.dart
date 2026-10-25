/// Custom fields path templates and body keys; the client fills `{api_version}`.
library;

class CustomFieldsUrls {
  CustomFieldsUrls._();

  static const String settingsCustomFields =
      '/api/{api_version}/settings/custom_fields';
  static const String settingsCustomField =
      '/api/{api_version}/settings/custom_fields/{custom_field_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String customFieldKey = 'custom_field';
}
