/// The v4 roles endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'roles.dart' as endpoints;
import 'roles_dto.dart' as views;

/// The roles endpoints with [client] already applied.
class RolesResource {
  /// Bind the resource to a client; normally reached via `client.roles`.
  const RolesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/roles`
  Future<ApiResponse<views.SettingsRoleList>> getSettingsRoles({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsRoles(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/roles`
  Future<ApiResponse<Object?>> createSettingsRole(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsRole(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/roles/{role_id}`
  Future<ApiResponse<views.SettingsRole>> getSettingsRole(
    Object roleId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsRole(
        client,
        roleId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/roles/{role_id}`
  Future<ApiResponse<Object?>> deleteSettingsRole(
    Object roleId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsRole(
        client,
        roleId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/roles/{role_id}`
  Future<ApiResponse<Object?>> updateSettingsRole(
    Object roleId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsRole(
        client,
        roleId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
