/// Countries path templates and body keys; the client fills `{api_version}`.
library;

class CountriesUrls {
  CountriesUrls._();

  static const String settingsCountries =
      '/api/{api_version}/settings/countries';
  static const String settingsCountry =
      '/api/{api_version}/settings/countries/{country_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String countryKey = 'country';
}
