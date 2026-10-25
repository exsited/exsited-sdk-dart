/// The v4 settings workflows endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'settings_workflows.dart' as endpoints;
import 'settings_workflows_dto.dart' as views;

/// The settings workflows endpoints with [client] already applied.
class SettingsWorkflowsResource {
  /// Bind the resource to a client; normally reached via `client.settingsWorkflows`.
  const SettingsWorkflowsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/workflows`
  Future<ApiResponse<views.SettingsWorkflowList>> getSettingsWorkflows({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsWorkflows(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/workflows/{workflow_id}`
  Future<ApiResponse<views.SettingsWorkflow>> getSettingsWorkflow(
    Object workflowId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsWorkflow(
        client,
        workflowId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
