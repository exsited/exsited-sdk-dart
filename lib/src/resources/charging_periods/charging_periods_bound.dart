/// The v4 charging periods endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'charging_periods.dart' as endpoints;
import 'charging_periods_dto.dart' as views;

/// The charging periods endpoints with [client] already applied.
class ChargingPeriodsResource {
  /// Bind the resource to a client; normally reached via `client.chargingPeriods`.
  const ChargingPeriodsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/charging_periods`
  Future<ApiResponse<views.SettingsChargingPeriodList>>
      getSettingsChargingPeriods({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsChargingPeriods(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/charging_periods`
  Future<ApiResponse<views.SettingsChargingPeriod>>
      createSettingsChargingPeriod(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsChargingPeriod(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/charging_periods/{charging_period_id}`
  Future<ApiResponse<views.SettingsChargingPeriod>> getSettingsChargingPeriod(
    Object chargingPeriodId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsChargingPeriod(
        client,
        chargingPeriodId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/charging_periods/{charging_period_id}`
  Future<ApiResponse<Object?>> deleteSettingsChargingPeriod(
    Object chargingPeriodId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsChargingPeriod(
        client,
        chargingPeriodId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/charging_periods/{charging_period_id}`
  Future<ApiResponse<views.SettingsChargingPeriod>>
      updateSettingsChargingPeriod(
    Object chargingPeriodId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsChargingPeriod(
            client,
            chargingPeriodId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );
}
