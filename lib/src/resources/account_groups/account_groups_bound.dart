/// The v4 account groups endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'account_groups.dart' as endpoints;
import 'account_groups_dto.dart' as views;

/// The account groups endpoints with [client] already applied.
class AccountGroupsResource {
  /// Bind the resource to a client; normally reached via `client.accountGroups`.
  const AccountGroupsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/account_groups`
  Future<ApiResponse<views.SettingsAccountGroupList>> getSettingsAccountGroups({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsAccountGroups(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/account_groups`
  Future<ApiResponse<views.SettingsAccountGroup>> createSettingsAccountGroup(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsAccountGroup(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/account_groups/{account_group_id}`
  Future<ApiResponse<views.SettingsAccountGroup>> getSettingsAccountGroup(
    Object accountGroupId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsAccountGroup(
        client,
        accountGroupId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/account_groups/{account_group_id}`
  Future<ApiResponse<Object?>> deleteSettingsAccountGroup(
    Object accountGroupId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsAccountGroup(
        client,
        accountGroupId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/account_groups/{account_group_id}`
  Future<ApiResponse<Object?>> updateSettingsAccountGroup(
    Object accountGroupId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsAccountGroup(
        client,
        accountGroupId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
