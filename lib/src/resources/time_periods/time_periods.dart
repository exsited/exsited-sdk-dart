/// The v4 time periods endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'time_periods_dto.dart';
import 'time_periods_urls.dart';

/// `GET /api/{api_version}/settings/time_periods`
///
/// List time periods.
Future<ApiResponse<SettingsTimePeriodList>> getSettingsTimePeriods(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(TimePeriodsUrls.settingsTimePeriods,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsTimePeriodList.fromMap);

/// `POST /api/{api_version}/settings/time_periods`
///
/// Create a time period; `period` is sent upper case and answered lower case.
Future<ApiResponse<SettingsTimePeriod>> createSettingsTimePeriod(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(TimePeriodsUrls.settingsTimePeriods,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsTimePeriod.fromMap);

/// `GET /api/{api_version}/settings/time_periods/{time_period_id}`
///
/// Get one time period.
Future<ApiResponse<SettingsTimePeriod>> getSettingsTimePeriod(
  ExsitedClient client,
  Object timePeriodId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(TimePeriodsUrls.settingsTimePeriod,
        pathParams: {'time_period_id': timePeriodId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsTimePeriod.fromMap);

/// `DELETE /api/{api_version}/settings/time_periods/{time_period_id}`
///
/// Delete a time period.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsTimePeriod(
  ExsitedClient client,
  Object timePeriodId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(TimePeriodsUrls.settingsTimePeriod,
        pathParams: {'time_period_id': timePeriodId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/time_periods/{time_period_id}`
///
/// Update or enable/disable a time period - `PATCH
/// /settings/time_periods/{time_period_id}`; `status` takes active or inactive.
Future<ApiResponse<SettingsTimePeriod>> updateSettingsTimePeriod(
  ExsitedClient client,
  Object timePeriodId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(TimePeriodsUrls.settingsTimePeriod,
        pathParams: {'time_period_id': timePeriodId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsTimePeriod.fromMap);
