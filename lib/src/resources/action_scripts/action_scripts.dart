/// The v4 action scripts endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'action_scripts_dto.dart';
import 'action_scripts_urls.dart';

/// `GET /api/{api_version}/action_scripts`
///
/// List action scripts; deleted scripts are left out.
Future<ApiResponse<ActionScriptList>> getActionScripts(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ActionScriptsUrls.actionScripts,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ActionScriptList.fromMap);

/// `GET /api/{api_version}/action_scripts/{action_script_id}`
///
/// One action script; the id is the `ascr_` one.
Future<ApiResponse<ActionScript>> getActionScript(
  ExsitedClient client,
  Object actionScriptId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ActionScriptsUrls.actionScript,
        pathParams: {'action_script_id': actionScriptId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ActionScript.fromMap);

/// `POST /api/{api_version}/action_scripts`
///
/// Store an action script, under `action_script`; `name` is required and
/// unique, and a `script_file` is a `.js` file sent as base64 `content`.
Future<ApiResponse<ActionScript>> createActionScript(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ActionScriptsUrls.actionScripts,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ActionScript.fromMap);

/// `PATCH /api/{api_version}/action_scripts/{action_script_id}`
///
/// Update an action script, under `action_script`; an unknown key is refused.
Future<ApiResponse<ActionScript>> updateActionScript(
  ExsitedClient client,
  Object actionScriptId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ActionScriptsUrls.actionScript,
        pathParams: {'action_script_id': actionScriptId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ActionScript.fromMap);

/// `DELETE /api/{api_version}/action_scripts/{action_script_id}`
///
/// Delete an action script; answered `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteActionScript(
  ExsitedClient client,
  Object actionScriptId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ActionScriptsUrls.actionScript,
        pathParams: {'action_script_id': actionScriptId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
