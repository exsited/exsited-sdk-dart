/// The v4 sales reps endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'sales_reps.dart' as endpoints;
import 'sales_reps_dto.dart' as views;

/// The sales reps endpoints with [client] already applied.
class SalesRepsResource {
  /// Bind the resource to a client; normally reached via `client.salesReps`.
  const SalesRepsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/sales_reps`
  Future<ApiResponse<views.SettingsSalesRepList>> getSettingsSalesReps({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsSalesReps(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/sales_reps`
  Future<ApiResponse<Object?>> createSettingsSalesRep(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsSalesRep(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/sales_reps/{sales_rep_id}`
  Future<ApiResponse<views.SettingsSalesRep>> getSettingsSalesRep(
    Object salesRepId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsSalesRep(
        client,
        salesRepId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/sales_reps/{sales_rep_id}`
  Future<ApiResponse<Object?>> deleteSettingsSalesRep(
    Object salesRepId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsSalesRep(
        client,
        salesRepId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/sales_reps/{sales_rep_id}`
  Future<ApiResponse<Object?>> updateSettingsSalesRep(
    Object salesRepId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsSalesRep(
        client,
        salesRepId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
