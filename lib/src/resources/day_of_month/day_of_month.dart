/// The v4 day of month endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'day_of_month_dto.dart';
import 'day_of_month_urls.dart';

/// `GET /api/{api_version}/settings/day_of_month`
///
/// List the days of the month a date can be aligned to.
Future<ApiResponse<SettingsDayOfMonthList>> getSettingsDaysOfMonth(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(DayOfMonthUrls.settingsDaysOfMonth,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsDayOfMonthList.fromMap);

/// `GET /api/{api_version}/settings/day_of_month/{day_of_month_id}`
///
/// Read one day of the month by its `dom_` id.
Future<ApiResponse<SettingsDayOfMonth>> getSettingsDayOfMonth(
  ExsitedClient client,
  Object dayOfMonthId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(DayOfMonthUrls.settingsDayOfMonth,
        pathParams: {'day_of_month_id': dayOfMonthId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsDayOfMonth.fromMap);
