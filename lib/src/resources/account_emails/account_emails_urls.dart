/// Account emails path templates and body keys; the client fills `{api_version}`.
library;

class AccountEmailsUrls {
  AccountEmailsUrls._();

  static const String accountCommunicationsEmail =
      '/api/{api_version}/accounts/{account_id}/communications/emails/{email_uuid}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String emailKey = 'email';
}
