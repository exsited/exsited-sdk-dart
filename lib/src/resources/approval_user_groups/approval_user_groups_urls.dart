/// Approval user groups path templates and body keys; the client fills `{api_version}`.
library;

class ApprovalUserGroupsUrls {
  ApprovalUserGroupsUrls._();

  static const String settingsApprovalUserGroups =
      '/api/{api_version}/settings/approval_user_groups';
  static const String settingsApprovalUserGroup =
      '/api/{api_version}/settings/approval_user_groups/{approval_user_group_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String approvalUserGroupKey = 'approval_user_group';
}
