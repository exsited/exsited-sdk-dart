/// Email templates path templates and body keys; the client fills `{api_version}`.
library;

class EmailTemplatesUrls {
  EmailTemplatesUrls._();

  static const String settingsEmailTemplates =
      '/api/{api_version}/settings/email_templates';
  static const String settingsEmailTemplate =
      '/api/{api_version}/settings/email_templates/{email_template_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String emailTemplateKey = 'email_template';
}
