/// The v4 timesheets endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'timesheets_dto.dart';
import 'timesheets_urls.dart';

/// `GET /api/{api_version}/timesheets`
Future<ApiResponse<TimesheetList>> getTimesheets(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(TimesheetsUrls.timesheets,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: TimesheetList.fromMap);

/// `POST /api/{api_version}/timesheets`
Future<ApiResponse<Timesheets>> createTimesheet(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(TimesheetsUrls.timesheets,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Timesheets.fromMap);

/// `DELETE /api/{api_version}/timesheets/{timesheet_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteTimesheet(
  ExsitedClient client,
  Object createdTimesheetId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(TimesheetsUrls.timesheet,
        pathParams: {'timesheet_id': createdTimesheetId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/timesheets/{timesheet_id}`
Future<ApiResponse<Timesheets>> updateTimesheet(
  ExsitedClient client,
  Object createdTimesheetId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(TimesheetsUrls.timesheet,
        pathParams: {'timesheet_id': createdTimesheetId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Timesheets.fromMap);

/// `GET /api/{api_version}/timesheets/{timesheet_id}`
///
/// Get one timesheet, by the `ts_` id the listing and the create answer.
Future<ApiResponse<Timesheets>> getTimesheet(
  ExsitedClient client,
  Object timesheetId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(TimesheetsUrls.timesheet,
        pathParams: {'timesheet_id': timesheetId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Timesheets.fromMap);
