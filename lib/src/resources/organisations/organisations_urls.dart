/// Organisations path templates and body keys; the client fills `{api_version}`.
library;

class OrganisationsUrls {
  OrganisationsUrls._();

  static const String settingsOrganisations =
      '/api/{api_version}/settings/organisations';
  static const String settingsOrganisation =
      '/api/{api_version}/settings/organisations/{organisation_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String organizationKey = 'organization';
}
