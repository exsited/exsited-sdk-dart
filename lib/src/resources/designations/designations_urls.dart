/// Designations path templates and body keys; the client fills `{api_version}`.
library;

class DesignationsUrls {
  DesignationsUrls._();

  static const String settingsDesignations =
      '/api/{api_version}/settings/designations';
  static const String settingsDesignation =
      '/api/{api_version}/settings/designations/{designation_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String designationKey = 'designation';
}
