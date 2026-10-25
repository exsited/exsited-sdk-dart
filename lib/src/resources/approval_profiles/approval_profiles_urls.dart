/// Approval profiles path templates and body keys; the client fills `{api_version}`.
library;

class ApprovalProfilesUrls {
  ApprovalProfilesUrls._();

  static const String settingsApprovalProfiles =
      '/api/{api_version}/settings/approval_profiles';
  static const String settingsApprovalProfile =
      '/api/{api_version}/settings/approval_profiles/{approval_profile_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String approvalProfileKey = 'approval_profile';
}
