/// The v4 pricing periods endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'pricing_periods_dto.dart';
import 'pricing_periods_urls.dart';

/// `GET /api/{api_version}/settings/pricing_periods`
///
/// List pricing periods; `time_period` reads null here, whatever the record
/// holds.
Future<ApiResponse<SettingsPricingPeriodList>> getSettingsPricingPeriods(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PricingPeriodsUrls.settingsPricingPeriods,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsPricingPeriodList.fromMap);

/// `POST /api/{api_version}/settings/pricing_periods`
///
/// Create a pricing period.
Future<ApiResponse<SettingsPricingPeriod>> createSettingsPricingPeriod(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PricingPeriodsUrls.settingsPricingPeriods,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsPricingPeriod.fromMap);

/// `GET /api/{api_version}/settings/pricing_periods/{pricing_period_id}`
///
/// Get one pricing period; `time_period` reads null here, whatever the record
/// holds.
Future<ApiResponse<SettingsPricingPeriod>> getSettingsPricingPeriod(
  ExsitedClient client,
  Object pricingPeriodId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PricingPeriodsUrls.settingsPricingPeriod,
        pathParams: {'pricing_period_id': pricingPeriodId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsPricingPeriod.fromMap);

/// `DELETE /api/{api_version}/settings/pricing_periods/{pricing_period_id}`
///
/// Delete a pricing period.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsPricingPeriod(
  ExsitedClient client,
  Object pricingPeriodId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(PricingPeriodsUrls.settingsPricingPeriod,
        pathParams: {'pricing_period_id': pricingPeriodId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/pricing_periods/{pricing_period_id}`
///
/// Update or enable/disable a pricing period - `PATCH
/// /settings/pricing_periods/{pricing_period_id}`; `status` takes active or
/// inactive.
Future<ApiResponse<SettingsPricingPeriod>> updateSettingsPricingPeriod(
  ExsitedClient client,
  Object pricingPeriodId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(PricingPeriodsUrls.settingsPricingPeriod,
        pathParams: {'pricing_period_id': pricingPeriodId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsPricingPeriod.fromMap);
