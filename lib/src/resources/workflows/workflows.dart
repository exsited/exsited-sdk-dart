/// The v4 workflows endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'workflows_dto.dart';
import 'workflows_urls.dart';

/// `DELETE /api/{api_version}/milestones/{milestone_uuid}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteMilestone(
  ExsitedClient client,
  Object milestoneUuid, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(WorkflowsUrls.milestone,
        pathParams: {'milestone_uuid': milestoneUuid},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/workflow/component/{cc_id}`
///
/// The API answers this path 405, and the developer docs give this route with
/// two slots where this path has one; no working body is known.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateWorkflowComponentById(
  ExsitedClient client,
  Object ccId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(WorkflowsUrls.workflowComponentById,
        pathParams: {'cc_id': ccId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/workflows/{workflow_uuid}/milestones`
Future<ApiResponse<WorkflowMilestoneList>> getWorkflowMilestones(
  ExsitedClient client,
  Object workflowUuid, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(WorkflowsUrls.workflowMilestones,
        pathParams: {'workflow_uuid': workflowUuid},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: WorkflowMilestoneList.fromMap);

/// `POST /api/{api_version}/workflow/component/{cc_id}/milestone`
///
/// The API answers this path 405, and the developer docs give this route with
/// two slots where this path has one; no working body is known.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createWorkflowComponentCcMilestone(
  ExsitedClient client,
  Object ccId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(WorkflowsUrls.workflowComponentCcMilestone,
        pathParams: {'cc_id': ccId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/workflow/component/{component_object_id}/history`
///
/// The workflow history of one component instance, by its code; answered under
/// `histories`.
///
/// No typed view. Read `response.map`.
Future<ApiResponse<Object?>> getWorkflowComponentHistory(
  ExsitedClient client,
  Object componentObjectId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(WorkflowsUrls.workflowComponentHistory,
        pathParams: {'component_object_id': componentObjectId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/workflow/component/{component_uuid}/{component_object_id}/milestone`
///
/// The milestones of one component instance, by the component's uuid and the
/// instance's code; answered under `milestones`.
///
/// No typed view. Read `response.map`.
Future<ApiResponse<Object?>> getWorkflowComponentCcInstanceCcMilestone(
  ExsitedClient client,
  Object componentUuid,
  Object componentObjectId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(WorkflowsUrls.workflowComponentCcInstanceCcMilestone,
        pathParams: {
          'component_uuid': componentUuid,
          'component_object_id': componentObjectId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/workflows`
///
/// List workflows, cursor paged; a deleted one is not listed.
Future<ApiResponse<WorkflowList>> getWorkflows(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(WorkflowsUrls.workflows,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: WorkflowList.fromMap);

/// `GET /api/{api_version}/workflows/{workflow_id}`
///
/// Retrieve one workflow, the `wf_` id or the `code`, under `workflow`.
Future<ApiResponse<WorkflowView>> getWorkflow(
  ExsitedClient client,
  Object workflowId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(WorkflowsUrls.workflow,
        pathParams: {'workflow_id': workflowId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: WorkflowView.fromMap);

/// `POST /api/{api_version}/workflows`
///
/// Create a workflow, as a draft, wrapped in `workflow`; `name` is required and
/// any key but the eight the API reads is refused.
Future<ApiResponse<WorkflowView>> createWorkflow(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(WorkflowsUrls.workflows,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: WorkflowView.fromMap);

/// `PATCH /api/{api_version}/workflows/{workflow_id}`
///
/// Update a workflow or move its status, wrapped in `workflow`; `DRAFT` goes to
/// `ACTIVE`, and `ACTIVE` and `INACTIVE` to each other.
Future<ApiResponse<WorkflowView>> updateWorkflow(
  ExsitedClient client,
  Object workflowId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(WorkflowsUrls.workflow,
        pathParams: {'workflow_id': workflowId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: WorkflowView.fromMap);

/// `DELETE /api/{api_version}/workflows/{workflow_id}`
///
/// Delete a workflow; answered `204`. The record is kept as `DELETED` and reads
/// `404` after; a pre-built workflow is refused.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteWorkflow(
  ExsitedClient client,
  Object workflowId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(WorkflowsUrls.workflow,
        pathParams: {'workflow_id': workflowId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/workflows/{workflow_id}/stages`
///
/// List a workflow's stages.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getWorkflowStages(
  ExsitedClient client,
  Object workflowId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(WorkflowsUrls.workflowStages,
        pathParams: {'workflow_id': workflowId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/workflows/{workflow_id}/stages/{stage_id}`
///
/// Retrieve one stage, the `wfs_` id, under `workflow_stage`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getWorkflowStage(
  ExsitedClient client,
  Object workflowId,
  Object stageId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(WorkflowsUrls.workflowStage,
        pathParams: {'workflow_id': workflowId, 'stage_id': stageId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/workflows/{workflow_id}/milestones/{milestone_id}`
///
/// Retrieve one milestone definition, the `wfm_` id, under
/// `workflow_milestone`.
Future<ApiResponse<WorkflowMilestoneView>> getWorkflowMilestone(
  ExsitedClient client,
  Object workflowId,
  Object milestoneId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(WorkflowsUrls.workflowMilestone,
        pathParams: {'workflow_id': workflowId, 'milestone_id': milestoneId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: WorkflowMilestoneView.fromMap);

/// `GET /api/{api_version}/workflows/custom_components/{component_uuid}/{object_code}/history`
///
/// Workflow history of one component instance, the component's dashed uuid and
/// the instance's `code`. Answered empty, so no typed view.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getWorkflowCustomComponentHistory(
  ExsitedClient client,
  Object componentUuid,
  Object objectCode, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(WorkflowsUrls.workflowCustomComponentHistory,
        pathParams: {
          'component_uuid': componentUuid,
          'object_code': objectCode
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/workflows/custom_components/{component_uuid}/{object_code}/milestones`
///
/// Milestones of one component instance, the component's dashed uuid and the
/// instance's `code`. Answered empty, so no typed view.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getWorkflowCustomComponentMilestones(
  ExsitedClient client,
  Object componentUuid,
  Object objectCode, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(WorkflowsUrls.workflowCustomComponentMilestones,
        pathParams: {
          'component_uuid': componentUuid,
          'object_code': objectCode
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/workflows/custom_components/{component_uuid}/{object_code}/milestones/{milestone_id}`
///
/// One milestone of one component instance, the `wfmi_` id, under
/// `workflow_milestone_instance`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getWorkflowCustomComponentMilestone(
  ExsitedClient client,
  Object componentUuid,
  Object objectCode,
  Object milestoneId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(WorkflowsUrls.workflowCustomComponentMilestone,
        pathParams: {
          'component_uuid': componentUuid,
          'object_code': objectCode,
          'milestone_id': milestoneId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
