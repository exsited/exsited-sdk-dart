/// The v4 day of month endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'day_of_month.dart' as endpoints;
import 'day_of_month_dto.dart' as views;

/// The day of month endpoints with [client] already applied.
class DayOfMonthResource {
  /// Bind the resource to a client; normally reached via `client.dayOfMonth`.
  const DayOfMonthResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/day_of_month`
  Future<ApiResponse<views.SettingsDayOfMonthList>> getSettingsDaysOfMonth({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsDaysOfMonth(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/day_of_month/{day_of_month_id}`
  Future<ApiResponse<views.SettingsDayOfMonth>> getSettingsDayOfMonth(
    Object dayOfMonthId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsDayOfMonth(
        client,
        dayOfMonthId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
