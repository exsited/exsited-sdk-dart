/// Salutations path templates and body keys; the client fills `{api_version}`.
library;

class SalutationsUrls {
  SalutationsUrls._();

  static const String settingsSalutations =
      '/api/{api_version}/settings/salutations';
  static const String settingsSalutation =
      '/api/{api_version}/settings/salutations/{salutation_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String salutationKey = 'salutation';
}
