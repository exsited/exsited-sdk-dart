/// The v4 charging periods endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'charging_periods_dto.dart';
import 'charging_periods_urls.dart';

/// `GET /api/{api_version}/settings/charging_periods`
///
/// List the charging periods.
Future<ApiResponse<SettingsChargingPeriodList>> getSettingsChargingPeriods(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ChargingPeriodsUrls.settingsChargingPeriods,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsChargingPeriodList.fromMap);

/// `POST /api/{api_version}/settings/charging_periods`
///
/// Create a charging period; `name`, `display_name` and `time_period`, a `tp_`
/// id, are required.
Future<ApiResponse<SettingsChargingPeriod>> createSettingsChargingPeriod(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ChargingPeriodsUrls.settingsChargingPeriods,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsChargingPeriod.fromMap);

/// `GET /api/{api_version}/settings/charging_periods/{charging_period_id}`
///
/// Read one charging period by its `cp_` id.
Future<ApiResponse<SettingsChargingPeriod>> getSettingsChargingPeriod(
  ExsitedClient client,
  Object chargingPeriodId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ChargingPeriodsUrls.settingsChargingPeriod,
        pathParams: {'charging_period_id': chargingPeriodId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsChargingPeriod.fromMap);

/// `DELETE /api/{api_version}/settings/charging_periods/{charging_period_id}`
///
/// Delete a charging period.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsChargingPeriod(
  ExsitedClient client,
  Object chargingPeriodId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ChargingPeriodsUrls.settingsChargingPeriod,
        pathParams: {'charging_period_id': chargingPeriodId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/charging_periods/{charging_period_id}`
///
/// Update a charging period's fields or its status.
Future<ApiResponse<SettingsChargingPeriod>> updateSettingsChargingPeriod(
  ExsitedClient client,
  Object chargingPeriodId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ChargingPeriodsUrls.settingsChargingPeriod,
        pathParams: {'charging_period_id': chargingPeriodId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsChargingPeriod.fromMap);
