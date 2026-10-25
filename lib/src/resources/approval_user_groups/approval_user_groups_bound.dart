/// The v4 approval user groups endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'approval_user_groups.dart' as endpoints;
import 'approval_user_groups_dto.dart' as views;

/// The approval user groups endpoints with [client] already applied.
class ApprovalUserGroupsResource {
  /// Bind the resource to a client; normally reached via `client.approvalUserGroups`.
  const ApprovalUserGroupsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/approval_user_groups`
  Future<ApiResponse<views.SettingsApprovalUserGroupList>>
      getSettingsApprovalUserGroups({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsApprovalUserGroups(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/approval_user_groups`
  Future<ApiResponse<views.SettingsApprovalUserGroup>>
      createSettingsApprovalUserGroup(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsApprovalUserGroup(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/approval_user_groups/{approval_user_group_id}`
  Future<ApiResponse<views.SettingsApprovalUserGroup>>
      getSettingsApprovalUserGroup(
    Object approvalUserGroupId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsApprovalUserGroup(
            client,
            approvalUserGroupId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/settings/approval_user_groups/{approval_user_group_id}`
  Future<ApiResponse<Object?>> deleteSettingsApprovalUserGroup(
    Object approvalUserGroupId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsApprovalUserGroup(
        client,
        approvalUserGroupId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/approval_user_groups/{approval_user_group_id}`
  Future<ApiResponse<views.SettingsApprovalUserGroup>>
      updateSettingsApprovalUserGroup(
    Object approvalUserGroupId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsApprovalUserGroup(
            client,
            approvalUserGroupId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );
}
