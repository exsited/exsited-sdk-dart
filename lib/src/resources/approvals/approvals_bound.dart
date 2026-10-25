/// The v4 approvals endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'approvals.dart' as endpoints;
import 'approvals_dto.dart' as views;

/// The approvals endpoints with [client] already applied.
class ApprovalsResource {
  /// Bind the resource to a client; normally reached via `client.approvals`.
  const ApprovalsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/approvals/account`
  Future<ApiResponse<views.ApprovalsAccountList>> getApprovalsAccount({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getApprovalsAccount(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/approvals/saleOrder`
  Future<ApiResponse<views.ApprovalsSaleorder>> getApprovalsSaleorder({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getApprovalsSaleorder(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/approvals/account/{account_uuid}`
  Future<ApiResponse<Object?>> getApprovalsAccountByUuid(
    Object accountUuid, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getApprovalsAccountByUuid(
        client,
        accountUuid,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/approvals/approve`
  Future<ApiResponse<Object?>> approveApproval(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.approveApproval(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/approvals/reject`
  Future<ApiResponse<Object?>> rejectApproval(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.rejectApproval(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
