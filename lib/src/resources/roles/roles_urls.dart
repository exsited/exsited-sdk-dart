/// Roles path templates and body keys; the client fills `{api_version}`.
library;

class RolesUrls {
  RolesUrls._();

  static const String settingsRoles = '/api/{api_version}/settings/roles';
  static const String settingsRole =
      '/api/{api_version}/settings/roles/{role_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String roleKey = 'role';
}
