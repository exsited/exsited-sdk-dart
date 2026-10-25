/// The v4 workflows endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'workflows.dart' as endpoints;
import 'workflows_dto.dart' as views;

/// The workflows endpoints with [client] already applied.
class WorkflowsResource {
  /// Bind the resource to a client; normally reached via `client.workflows`.
  const WorkflowsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `DELETE /api/{api_version}/milestones/{milestone_uuid}`
  Future<ApiResponse<Object?>> deleteMilestone(
    Object milestoneUuid, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteMilestone(
        client,
        milestoneUuid,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/workflow/component/{cc_id}`
  Future<ApiResponse<Object?>> updateWorkflowComponentById(
    Object ccId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateWorkflowComponentById(
        client,
        ccId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/workflows/{workflow_uuid}/milestones`
  Future<ApiResponse<views.WorkflowMilestoneList>> getWorkflowMilestones(
    Object workflowUuid, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getWorkflowMilestones(
        client,
        workflowUuid,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/workflow/component/{cc_id}/milestone`
  Future<ApiResponse<Object?>> createWorkflowComponentCcMilestone(
    Object ccId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createWorkflowComponentCcMilestone(
        client,
        ccId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/workflow/component/{component_object_id}/history`
  Future<ApiResponse<Object?>> getWorkflowComponentHistory(
    Object componentObjectId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getWorkflowComponentHistory(
        client,
        componentObjectId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/workflow/component/{component_uuid}/{component_object_id}/milestone`
  Future<ApiResponse<Object?>> getWorkflowComponentCcInstanceCcMilestone(
    Object componentUuid,
    Object componentObjectId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getWorkflowComponentCcInstanceCcMilestone(
        client,
        componentUuid,
        componentObjectId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/workflows`
  Future<ApiResponse<views.WorkflowList>> getWorkflows({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getWorkflows(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/workflows/{workflow_id}`
  Future<ApiResponse<views.WorkflowView>> getWorkflow(
    Object workflowId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getWorkflow(
        client,
        workflowId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/workflows`
  Future<ApiResponse<views.WorkflowView>> createWorkflow(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createWorkflow(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/workflows/{workflow_id}`
  Future<ApiResponse<views.WorkflowView>> updateWorkflow(
    Object workflowId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateWorkflow(
        client,
        workflowId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/workflows/{workflow_id}`
  Future<ApiResponse<Object?>> deleteWorkflow(
    Object workflowId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteWorkflow(
        client,
        workflowId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/workflows/{workflow_id}/stages`
  Future<ApiResponse<Object?>> getWorkflowStages(
    Object workflowId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getWorkflowStages(
        client,
        workflowId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/workflows/{workflow_id}/stages/{stage_id}`
  Future<ApiResponse<Object?>> getWorkflowStage(
    Object workflowId,
    Object stageId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getWorkflowStage(
        client,
        workflowId,
        stageId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/workflows/{workflow_id}/milestones/{milestone_id}`
  Future<ApiResponse<views.WorkflowMilestoneView>> getWorkflowMilestone(
    Object workflowId,
    Object milestoneId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getWorkflowMilestone(
        client,
        workflowId,
        milestoneId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/workflows/custom_components/{component_uuid}/{object_code}/history`
  Future<ApiResponse<Object?>> getWorkflowCustomComponentHistory(
    Object componentUuid,
    Object objectCode, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getWorkflowCustomComponentHistory(
        client,
        componentUuid,
        objectCode,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/workflows/custom_components/{component_uuid}/{object_code}/milestones`
  Future<ApiResponse<Object?>> getWorkflowCustomComponentMilestones(
    Object componentUuid,
    Object objectCode, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getWorkflowCustomComponentMilestones(
        client,
        componentUuid,
        objectCode,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/workflows/custom_components/{component_uuid}/{object_code}/milestones/{milestone_id}`
  Future<ApiResponse<Object?>> getWorkflowCustomComponentMilestone(
    Object componentUuid,
    Object objectCode,
    Object milestoneId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getWorkflowCustomComponentMilestone(
        client,
        componentUuid,
        objectCode,
        milestoneId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
