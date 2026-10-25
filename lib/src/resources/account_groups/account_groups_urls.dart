/// Account groups path templates and body keys; the client fills `{api_version}`.
library;

class AccountGroupsUrls {
  AccountGroupsUrls._();

  static const String settingsAccountGroups =
      '/api/{api_version}/settings/account_groups';
  static const String settingsAccountGroup =
      '/api/{api_version}/settings/account_groups/{account_group_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String accountGroupKey = 'account_group';
}
