/// Approvals path templates and body keys; the client fills `{api_version}`.
library;

class ApprovalsUrls {
  ApprovalsUrls._();

  static const String approvalsAccount = '/api/{api_version}/approvals/account';
  static const String approvalsSaleorder =
      '/api/{api_version}/approvals/saleOrder';
  static const String approvalsAccountByUuid =
      '/api/{api_version}/approvals/account/{account_uuid}';
  static const String approvalsApprove = '/api/{api_version}/approvals/approve';
  static const String approvalsReject = '/api/{api_version}/approvals/reject';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String approvalKey = 'approval';
}
