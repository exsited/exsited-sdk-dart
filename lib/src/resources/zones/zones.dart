/// The v4 zones endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'zones_dto.dart';
import 'zones_urls.dart';

/// `GET /api/{api_version}/settings/zones`
///
/// List zones.
Future<ApiResponse<SettingsZoneList>> getSettingsZones(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ZonesUrls.settingsZones,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsZoneList.fromMap);

/// `POST /api/{api_version}/settings/zones`
///
/// Create a zone; `country_list` takes country ids, one at least.
Future<ApiResponse<SettingsZone>> createSettingsZone(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ZonesUrls.settingsZones,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsZone.fromMap);

/// `GET /api/{api_version}/settings/zones/{zone_id}`
///
/// Get one zone.
Future<ApiResponse<SettingsZone>> getSettingsZone(
  ExsitedClient client,
  Object zoneId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ZonesUrls.settingsZone,
        pathParams: {'zone_id': zoneId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsZone.fromMap);

/// `DELETE /api/{api_version}/settings/zones/{zone_id}`
///
/// Delete a zone.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsZone(
  ExsitedClient client,
  Object zoneId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ZonesUrls.settingsZone,
        pathParams: {'zone_id': zoneId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/zones/{zone_id}`
///
/// Update a zone; the API answers 200 and changes nothing.
Future<ApiResponse<SettingsZone>> updateSettingsZone(
  ExsitedClient client,
  Object zoneId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ZonesUrls.settingsZone,
        pathParams: {'zone_id': zoneId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsZone.fromMap);
