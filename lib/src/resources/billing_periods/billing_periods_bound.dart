/// The v4 billing periods endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'billing_periods.dart' as endpoints;
import 'billing_periods_dto.dart' as views;

/// The billing periods endpoints with [client] already applied.
class BillingPeriodsResource {
  /// Bind the resource to a client; normally reached via `client.billingPeriods`.
  const BillingPeriodsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/billing_periods`
  Future<ApiResponse<views.SettingsBillingPeriodList>>
      getSettingsBillingPeriods({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsBillingPeriods(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/billing_periods`
  Future<ApiResponse<views.SettingsBillingPeriod>> createSettingsBillingPeriod(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsBillingPeriod(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/billing_periods/{billing_period_id}`
  Future<ApiResponse<views.SettingsBillingPeriod>> getSettingsBillingPeriod(
    Object billingPeriodId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsBillingPeriod(
        client,
        billingPeriodId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/billing_periods/{billing_period_id}`
  Future<ApiResponse<Object?>> deleteSettingsBillingPeriod(
    Object billingPeriodId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsBillingPeriod(
        client,
        billingPeriodId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/billing_periods/{billing_period_id}`
  Future<ApiResponse<views.SettingsBillingPeriod>> updateSettingsBillingPeriod(
    Object billingPeriodId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsBillingPeriod(
        client,
        billingPeriodId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
