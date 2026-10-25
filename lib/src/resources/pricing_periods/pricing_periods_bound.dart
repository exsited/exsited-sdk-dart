/// The v4 pricing periods endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'pricing_periods.dart' as endpoints;
import 'pricing_periods_dto.dart' as views;

/// The pricing periods endpoints with [client] already applied.
class PricingPeriodsResource {
  /// Bind the resource to a client; normally reached via `client.pricingPeriods`.
  const PricingPeriodsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/pricing_periods`
  Future<ApiResponse<views.SettingsPricingPeriodList>>
      getSettingsPricingPeriods({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsPricingPeriods(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/pricing_periods`
  Future<ApiResponse<views.SettingsPricingPeriod>> createSettingsPricingPeriod(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsPricingPeriod(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/pricing_periods/{pricing_period_id}`
  Future<ApiResponse<views.SettingsPricingPeriod>> getSettingsPricingPeriod(
    Object pricingPeriodId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsPricingPeriod(
        client,
        pricingPeriodId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/pricing_periods/{pricing_period_id}`
  Future<ApiResponse<Object?>> deleteSettingsPricingPeriod(
    Object pricingPeriodId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsPricingPeriod(
        client,
        pricingPeriodId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/pricing_periods/{pricing_period_id}`
  Future<ApiResponse<views.SettingsPricingPeriod>> updateSettingsPricingPeriod(
    Object pricingPeriodId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsPricingPeriod(
        client,
        pricingPeriodId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
