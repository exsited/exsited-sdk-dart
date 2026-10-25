/// Settings workflows path templates and body keys; the client fills `{api_version}`.
library;

class SettingsWorkflowsUrls {
  SettingsWorkflowsUrls._();

  static const String settingsWorkflows =
      '/api/{api_version}/settings/workflows';
  static const String settingsWorkflow =
      '/api/{api_version}/settings/workflows/{workflow_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String workflowKey = 'workflow';
}
