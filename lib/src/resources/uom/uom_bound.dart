/// The v4 uom endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'uom.dart' as endpoints;
import 'uom_dto.dart' as views;

/// The uom endpoints with [client] already applied.
class UomResource {
  /// Bind the resource to a client; normally reached via `client.uom`.
  const UomResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/uom`
  Future<ApiResponse<views.SettingsUomList>> getSettingsUoms({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsUoms(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/uom`
  Future<ApiResponse<Object?>> createSettingsUom(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsUom(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/uom/{uom_id}`
  Future<ApiResponse<views.SettingsUom>> getSettingsUom(
    Object uomId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsUom(
        client,
        uomId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/uom/{uom_id}`
  Future<ApiResponse<Object?>> deleteSettingsUom(
    Object uomId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsUom(
        client,
        uomId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/uom/{uom_id}`
  Future<ApiResponse<Object?>> updateSettingsUom(
    Object uomId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsUom(
        client,
        uomId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
