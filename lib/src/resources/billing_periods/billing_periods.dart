/// The v4 billing periods endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'billing_periods_dto.dart';
import 'billing_periods_urls.dart';

/// `GET /api/{api_version}/settings/billing_periods`
///
/// List the billing periods.
Future<ApiResponse<SettingsBillingPeriodList>> getSettingsBillingPeriods(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BillingPeriodsUrls.settingsBillingPeriods,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsBillingPeriodList.fromMap);

/// `POST /api/{api_version}/settings/billing_periods`
///
/// Create a billing period; `name` and `time_period` are required, and
/// `time_period` is the time period's hyphenated uuid, not its `tp_` id.
Future<ApiResponse<SettingsBillingPeriod>> createSettingsBillingPeriod(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(BillingPeriodsUrls.settingsBillingPeriods,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsBillingPeriod.fromMap);

/// `GET /api/{api_version}/settings/billing_periods/{billing_period_id}`
///
/// Read one billing period by its `bp_` id.
Future<ApiResponse<SettingsBillingPeriod>> getSettingsBillingPeriod(
  ExsitedClient client,
  Object billingPeriodId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BillingPeriodsUrls.settingsBillingPeriod,
        pathParams: {'billing_period_id': billingPeriodId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsBillingPeriod.fromMap);

/// `DELETE /api/{api_version}/settings/billing_periods/{billing_period_id}`
///
/// Delete a billing period.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsBillingPeriod(
  ExsitedClient client,
  Object billingPeriodId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(BillingPeriodsUrls.settingsBillingPeriod,
        pathParams: {'billing_period_id': billingPeriodId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/billing_periods/{billing_period_id}`
///
/// Update a billing period; the answer carries `time_period` in place of
/// `period` and `duration`.
Future<ApiResponse<SettingsBillingPeriod>> updateSettingsBillingPeriod(
  ExsitedClient client,
  Object billingPeriodId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(BillingPeriodsUrls.settingsBillingPeriod,
        pathParams: {'billing_period_id': billingPeriodId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsBillingPeriod.fromMap);
