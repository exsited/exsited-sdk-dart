/// The v4 timesheets endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'timesheets.dart' as endpoints;
import 'timesheets_dto.dart' as views;

/// The timesheets endpoints with [client] already applied.
class TimesheetsResource {
  /// Bind the resource to a client; normally reached via `client.timesheets`.
  const TimesheetsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/timesheets`
  Future<ApiResponse<views.TimesheetList>> getTimesheets({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getTimesheets(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/timesheets`
  Future<ApiResponse<views.Timesheets>> createTimesheet(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createTimesheet(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/timesheets/{timesheet_id}`
  Future<ApiResponse<Object?>> deleteTimesheet(
    Object createdTimesheetId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteTimesheet(
        client,
        createdTimesheetId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/timesheets/{timesheet_id}`
  Future<ApiResponse<views.Timesheets>> updateTimesheet(
    Object createdTimesheetId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateTimesheet(
        client,
        createdTimesheetId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/timesheets/{timesheet_id}`
  Future<ApiResponse<views.Timesheets>> getTimesheet(
    Object timesheetId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getTimesheet(
        client,
        timesheetId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
