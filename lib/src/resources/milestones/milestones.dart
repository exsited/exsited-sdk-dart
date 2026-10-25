/// The v4 milestones endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'milestones_dto.dart';
import 'milestones_urls.dart';

/// `GET /api/{api_version}/milestones`
Future<ApiResponse<Milestones>> getMilestones(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(MilestonesUrls.milestones,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Milestones.fromMap);

/// `GET /api/{api_version}/milestones/account/{account_id}`
Future<ApiResponse<Milestones>> getMilestonesAccountById(
  ExsitedClient client,
  Object accountId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(MilestonesUrls.milestonesAccountById,
        pathParams: {'account_id': accountId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Milestones.fromMap);

/// `GET /api/{api_version}/milestones/labour/{labour_id}`
Future<ApiResponse<MilestonesLabourByIdList>> getMilestonesLabourById(
  ExsitedClient client,
  Object labourId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(MilestonesUrls.milestonesLabourById,
        pathParams: {'labour_id': labourId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: MilestonesLabourByIdList.fromMap);

/// `GET /api/{api_version}/milestones/employee/{employee_code}`
///
/// Get milestones by employee; the employee's `code`, since an `emp_` id
/// answers `404`.
Future<ApiResponse<Milestones>> getMilestonesEmployeeByCode(
  ExsitedClient client,
  Object employeeCode, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(MilestonesUrls.milestonesEmployeeByCode,
        pathParams: {'employee_code': employeeCode},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Milestones.fromMap);

/// `GET /api/{api_version}/milestones/{milestone_uuid}`
///
/// Get one milestone, a `wfm_` id or its raw uuid; a workflow's milestone
/// definition is a different record and answers `404`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getMilestone(
  ExsitedClient client,
  Object milestoneUuid, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(MilestonesUrls.milestone,
        pathParams: {'milestone_uuid': milestoneUuid},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
