/// The v4 account groups endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'account_groups_dto.dart';
import 'account_groups_urls.dart';

/// `GET /api/{api_version}/settings/account_groups`
///
/// List the account groups.
Future<ApiResponse<SettingsAccountGroupList>> getSettingsAccountGroups(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountGroupsUrls.settingsAccountGroups,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsAccountGroupList.fromMap);

/// `POST /api/{api_version}/settings/account_groups`
///
/// Create an account group; `name` is required.
Future<ApiResponse<SettingsAccountGroup>> createSettingsAccountGroup(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AccountGroupsUrls.settingsAccountGroups,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsAccountGroup.fromMap);

/// `GET /api/{api_version}/settings/account_groups/{account_group_id}`
///
/// Read one account group by its `ag_` id.
Future<ApiResponse<SettingsAccountGroup>> getSettingsAccountGroup(
  ExsitedClient client,
  Object accountGroupId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountGroupsUrls.settingsAccountGroup,
        pathParams: {'account_group_id': accountGroupId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsAccountGroup.fromMap);

/// `DELETE /api/{api_version}/settings/account_groups/{account_group_id}`
///
/// Delete an account group no account uses.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsAccountGroup(
  ExsitedClient client,
  Object accountGroupId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(AccountGroupsUrls.settingsAccountGroup,
        pathParams: {'account_group_id': accountGroupId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/account_groups/{account_group_id}`
///
/// Update an account group's fields or its status.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateSettingsAccountGroup(
  ExsitedClient client,
  Object accountGroupId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(AccountGroupsUrls.settingsAccountGroup,
        pathParams: {'account_group_id': accountGroupId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
