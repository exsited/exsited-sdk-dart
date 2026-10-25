/// The v4 approval user groups endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'approval_user_groups_dto.dart';
import 'approval_user_groups_urls.dart';

/// `GET /api/{api_version}/settings/approval_user_groups`
///
/// List the approval user groups.
Future<ApiResponse<SettingsApprovalUserGroupList>>
    getSettingsApprovalUserGroups(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(ApprovalUserGroupsUrls.settingsApprovalUserGroups,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsApprovalUserGroupList.fromMap);

/// `POST /api/{api_version}/settings/approval_user_groups`
///
/// Create an approval user group; `name` is required.
Future<ApiResponse<SettingsApprovalUserGroup>> createSettingsApprovalUserGroup(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ApprovalUserGroupsUrls.settingsApprovalUserGroups,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsApprovalUserGroup.fromMap);

/// `GET /api/{api_version}/settings/approval_user_groups/{approval_user_group_id}`
///
/// Read one approval user group by its `aug_` id.
Future<ApiResponse<SettingsApprovalUserGroup>> getSettingsApprovalUserGroup(
  ExsitedClient client,
  Object approvalUserGroupId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ApprovalUserGroupsUrls.settingsApprovalUserGroup,
        pathParams: {'approval_user_group_id': approvalUserGroupId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsApprovalUserGroup.fromMap);

/// `DELETE /api/{api_version}/settings/approval_user_groups/{approval_user_group_id}`
///
/// Delete an approval user group.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsApprovalUserGroup(
  ExsitedClient client,
  Object approvalUserGroupId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ApprovalUserGroupsUrls.settingsApprovalUserGroup,
        pathParams: {'approval_user_group_id': approvalUserGroupId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/approval_user_groups/{approval_user_group_id}`
///
/// Update an approval user group's name, display name or description.
Future<ApiResponse<SettingsApprovalUserGroup>> updateSettingsApprovalUserGroup(
  ExsitedClient client,
  Object approvalUserGroupId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ApprovalUserGroupsUrls.settingsApprovalUserGroup,
        pathParams: {'approval_user_group_id': approvalUserGroupId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsApprovalUserGroup.fromMap);
