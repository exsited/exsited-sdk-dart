/// Workflows path templates and body keys; the client fills `{api_version}`.
library;

class WorkflowsUrls {
  WorkflowsUrls._();

  static const String milestone =
      '/api/{api_version}/milestones/{milestone_uuid}';
  static const String workflowComponentById =
      '/api/{api_version}/workflow/component/{cc_id}';
  static const String workflowMilestones =
      '/api/{api_version}/workflows/{workflow_uuid}/milestones';
  static const String workflowComponentCcMilestone =
      '/api/{api_version}/workflow/component/{cc_id}/milestone';
  static const String workflowComponentHistory =
      '/api/{api_version}/workflow/component/{component_object_id}/history';
  static const String workflowComponentCcInstanceCcMilestone =
      '/api/{api_version}/workflow/component/{component_uuid}/{component_object_id}/milestone';
  static const String workflows = '/api/{api_version}/workflows';
  static const String workflow = '/api/{api_version}/workflows/{workflow_id}';
  static const String workflowStages =
      '/api/{api_version}/workflows/{workflow_id}/stages';
  static const String workflowStage =
      '/api/{api_version}/workflows/{workflow_id}/stages/{stage_id}';
  static const String workflowMilestone =
      '/api/{api_version}/workflows/{workflow_id}/milestones/{milestone_id}';
  static const String workflowCustomComponentHistory =
      '/api/{api_version}/workflows/custom_components/{component_uuid}/{object_code}/history';
  static const String workflowCustomComponentMilestones =
      '/api/{api_version}/workflows/custom_components/{component_uuid}/{object_code}/milestones';
  static const String workflowCustomComponentMilestone =
      '/api/{api_version}/workflows/custom_components/{component_uuid}/{object_code}/milestones/{milestone_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String workflowKey = 'workflow';
  static const String workflowMilestoneInstanceKey =
      'workflow_milestone_instance';
  static const String workflowMilestoneKey = 'workflow_milestone';
  static const String workflowStageKey = 'workflow_stage';
}
