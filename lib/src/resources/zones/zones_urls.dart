/// Zones path templates and body keys; the client fills `{api_version}`.
library;

class ZonesUrls {
  ZonesUrls._();

  static const String settingsZones = '/api/{api_version}/settings/zones';
  static const String settingsZone =
      '/api/{api_version}/settings/zones/{zone_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String zoneKey = 'zone';
}
