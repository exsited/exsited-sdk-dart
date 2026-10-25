/// The v4 settings workflows endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'settings_workflows_dto.dart';
import 'settings_workflows_urls.dart';

/// `GET /api/{api_version}/settings/workflows`
///
/// List workflows; read only here, the writes live under `/workflows`.
Future<ApiResponse<SettingsWorkflowList>> getSettingsWorkflows(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsWorkflowsUrls.settingsWorkflows,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsWorkflowList.fromMap);

/// `GET /api/{api_version}/settings/workflows/{workflow_id}`
///
/// Get one workflow.
Future<ApiResponse<SettingsWorkflow>> getSettingsWorkflow(
  ExsitedClient client,
  Object workflowId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsWorkflowsUrls.settingsWorkflow,
        pathParams: {'workflow_id': workflowId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsWorkflow.fromMap);
