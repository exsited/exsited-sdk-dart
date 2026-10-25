/// The v4 action scripts endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'action_scripts.dart' as endpoints;
import 'action_scripts_dto.dart' as views;

/// The action scripts endpoints with [client] already applied.
class ActionScriptsResource {
  /// Bind the resource to a client; normally reached via `client.actionScripts`.
  const ActionScriptsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/action_scripts`
  Future<ApiResponse<views.ActionScriptList>> getActionScripts({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getActionScripts(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/action_scripts/{action_script_id}`
  Future<ApiResponse<views.ActionScript>> getActionScript(
    Object actionScriptId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getActionScript(
        client,
        actionScriptId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/action_scripts`
  Future<ApiResponse<views.ActionScript>> createActionScript(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createActionScript(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/action_scripts/{action_script_id}`
  Future<ApiResponse<views.ActionScript>> updateActionScript(
    Object actionScriptId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateActionScript(
        client,
        actionScriptId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/action_scripts/{action_script_id}`
  Future<ApiResponse<Object?>> deleteActionScript(
    Object actionScriptId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteActionScript(
        client,
        actionScriptId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
