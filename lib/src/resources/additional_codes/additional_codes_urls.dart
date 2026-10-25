/// Additional codes path templates and body keys; the client fills `{api_version}`.
library;

class AdditionalCodesUrls {
  AdditionalCodesUrls._();

  static const String settingsAdditionalCodes =
      '/api/{api_version}/settings/additional_codes';
  static const String settingsAdditionalCode =
      '/api/{api_version}/settings/additional_codes/{additional_code_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String additionalCodeKey = 'additional_code';
}
