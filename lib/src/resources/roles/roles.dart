/// The v4 roles endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'roles_dto.dart';
import 'roles_urls.dart';

/// `GET /api/{api_version}/settings/roles`
///
/// List roles.
Future<ApiResponse<SettingsRoleList>> getSettingsRoles(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(RolesUrls.settingsRoles,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsRoleList.fromMap);

/// `POST /api/{api_version}/settings/roles`
///
/// Create a role; the role is saved and the API then answers 500.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createSettingsRole(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(RolesUrls.settingsRoles,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/settings/roles/{role_id}`
///
/// Get one role.
Future<ApiResponse<SettingsRole>> getSettingsRole(
  ExsitedClient client,
  Object roleId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(RolesUrls.settingsRole,
        pathParams: {'role_id': roleId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsRole.fromMap);

/// `DELETE /api/{api_version}/settings/roles/{role_id}`
///
/// Delete a role; a system role is refused.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsRole(
  ExsitedClient client,
  Object roleId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(RolesUrls.settingsRole,
        pathParams: {'role_id': roleId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/roles/{role_id}`
///
/// Update or enable/disable a role; the change is saved and the API then
/// answers 500.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateSettingsRole(
  ExsitedClient client,
  Object roleId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(RolesUrls.settingsRole,
        pathParams: {'role_id': roleId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
