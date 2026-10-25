/// The v4 time periods endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'time_periods.dart' as endpoints;
import 'time_periods_dto.dart' as views;

/// The time periods endpoints with [client] already applied.
class TimePeriodsResource {
  /// Bind the resource to a client; normally reached via `client.timePeriods`.
  const TimePeriodsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/time_periods`
  Future<ApiResponse<views.SettingsTimePeriodList>> getSettingsTimePeriods({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsTimePeriods(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/time_periods`
  Future<ApiResponse<views.SettingsTimePeriod>> createSettingsTimePeriod(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsTimePeriod(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/time_periods/{time_period_id}`
  Future<ApiResponse<views.SettingsTimePeriod>> getSettingsTimePeriod(
    Object timePeriodId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsTimePeriod(
        client,
        timePeriodId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/time_periods/{time_period_id}`
  Future<ApiResponse<Object?>> deleteSettingsTimePeriod(
    Object timePeriodId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsTimePeriod(
        client,
        timePeriodId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/time_periods/{time_period_id}`
  Future<ApiResponse<views.SettingsTimePeriod>> updateSettingsTimePeriod(
    Object timePeriodId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsTimePeriod(
        client,
        timePeriodId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
