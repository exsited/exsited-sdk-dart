/// Uom path templates and body keys; the client fills `{api_version}`.
library;

class UomUrls {
  UomUrls._();

  static const String settingsUoms = '/api/{api_version}/settings/uom';
  static const String settingsUom = '/api/{api_version}/settings/uom/{uom_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String uomKey = 'uom';
}
