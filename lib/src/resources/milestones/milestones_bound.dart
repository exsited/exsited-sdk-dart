/// The v4 milestones endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'milestones.dart' as endpoints;
import 'milestones_dto.dart' as views;

/// The milestones endpoints with [client] already applied.
class MilestonesResource {
  /// Bind the resource to a client; normally reached via `client.milestones`.
  const MilestonesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/milestones`
  Future<ApiResponse<views.Milestones>> getMilestones({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getMilestones(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/milestones/account/{account_id}`
  Future<ApiResponse<views.Milestones>> getMilestonesAccountById(
    Object accountId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getMilestonesAccountById(
        client,
        accountId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/milestones/labour/{labour_id}`
  Future<ApiResponse<views.MilestonesLabourByIdList>> getMilestonesLabourById(
    Object labourId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getMilestonesLabourById(
        client,
        labourId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/milestones/employee/{employee_code}`
  Future<ApiResponse<views.Milestones>> getMilestonesEmployeeByCode(
    Object employeeCode, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getMilestonesEmployeeByCode(
        client,
        employeeCode,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/milestones/{milestone_uuid}`
  Future<ApiResponse<Object?>> getMilestone(
    Object milestoneUuid, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getMilestone(
        client,
        milestoneUuid,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
