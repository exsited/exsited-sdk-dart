/// Portals path templates and body keys; the client fills `{api_version}`.
library;

class PortalsUrls {
  PortalsUrls._();

  static const String portalActivate = '/api/{api_version}/portal/activate';
  static const String portalChangePassword =
      '/api/{api_version}/portal/change_password';
  static const String portalLogin = '/api/{api_version}/portal/login';
  static const String portalReset = '/api/{api_version}/portal/reset';
  static const String portalResetLink = '/api/{api_version}/portal/reset_link';
  static const String portalValidate = '/api/{api_version}/portal/validate';
  static const String portalChange = '/api/{api_version}/portal/change';

  /// The envelopes one record arrives under, read off this family's views.
  static const String portalKey = 'portal';
}
