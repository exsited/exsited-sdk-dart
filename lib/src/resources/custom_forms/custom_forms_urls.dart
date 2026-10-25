/// Custom forms path templates and body keys; the client fills `{api_version}`.
library;

class CustomFormsUrls {
  CustomFormsUrls._();

  static const String settingsCustomForms =
      '/api/{api_version}/settings/custom_forms';
  static const String settingsCustomForm =
      '/api/{api_version}/settings/custom_forms/{custom_form_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String customFormKey = 'custom_form';
}
