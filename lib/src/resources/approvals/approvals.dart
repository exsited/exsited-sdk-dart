/// The v4 approvals endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'approvals_dto.dart';
import 'approvals_urls.dart';

/// `GET /api/{api_version}/approvals/account`
Future<ApiResponse<ApprovalsAccountList>> getApprovalsAccount(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ApprovalsUrls.approvalsAccount,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ApprovalsAccountList.fromMap);

/// `GET /api/{api_version}/approvals/saleOrder`
Future<ApiResponse<ApprovalsSaleorder>> getApprovalsSaleorder(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ApprovalsUrls.approvalsSaleorder,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ApprovalsSaleorder.fromMap);

/// `GET /api/{api_version}/approvals/account/{account_uuid}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getApprovalsAccountByUuid(
  ExsitedClient client,
  Object accountUuid, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ApprovalsUrls.approvalsAccountByUuid,
        pathParams: {'account_uuid': accountUuid},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/approvals/approve`
///
/// Approve a pending approval, `{"approval": {"entity", "resource_id",
/// "note"}}` for any of the 16 entities; it runs the held action.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> approveApproval(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ApprovalsUrls.approvalsApprove,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/approvals/reject`
///
/// Reject a pending approval, the same `{"approval": {"entity", "resource_id",
/// "note"}}` body as `approveApproval`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> rejectApproval(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ApprovalsUrls.approvalsReject,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
