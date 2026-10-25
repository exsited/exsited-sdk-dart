/// The v4 zones endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'zones.dart' as endpoints;
import 'zones_dto.dart' as views;

/// The zones endpoints with [client] already applied.
class ZonesResource {
  /// Bind the resource to a client; normally reached via `client.zones`.
  const ZonesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/zones`
  Future<ApiResponse<views.SettingsZoneList>> getSettingsZones({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsZones(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/zones`
  Future<ApiResponse<views.SettingsZone>> createSettingsZone(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsZone(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/zones/{zone_id}`
  Future<ApiResponse<views.SettingsZone>> getSettingsZone(
    Object zoneId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsZone(
        client,
        zoneId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/zones/{zone_id}`
  Future<ApiResponse<Object?>> deleteSettingsZone(
    Object zoneId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsZone(
        client,
        zoneId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/zones/{zone_id}`
  Future<ApiResponse<views.SettingsZone>> updateSettingsZone(
    Object zoneId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsZone(
        client,
        zoneId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
