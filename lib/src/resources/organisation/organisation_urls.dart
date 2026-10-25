/// Organisation path templates and body keys; the client fills `{api_version}`.
library;

class OrganisationUrls {
  OrganisationUrls._();

  static const String settingsOrganisation =
      '/api/{api_version}/settings/organisation';

  /// The envelopes one record arrives under, read off this family's views.
  static const String organizationKey = 'organization';
}
