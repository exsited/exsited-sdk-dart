/// The v4 uom endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'uom_dto.dart';
import 'uom_urls.dart';

/// `GET /api/{api_version}/settings/uom`
///
/// List units of measurement.
Future<ApiResponse<SettingsUomList>> getSettingsUoms(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(UomUrls.settingsUoms,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsUomList.fromMap);

/// `POST /api/{api_version}/settings/uom`
///
/// Create a unit of measurement; the API answers 400 validation_error, naming no
/// field, even to a valid body.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createSettingsUom(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(UomUrls.settingsUoms,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/settings/uom/{uom_id}`
///
/// Get one unit of measurement.
Future<ApiResponse<SettingsUom>> getSettingsUom(
  ExsitedClient client,
  Object uomId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(UomUrls.settingsUom,
        pathParams: {'uom_id': uomId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsUom.fromMap);

/// `DELETE /api/{api_version}/settings/uom/{uom_id}`
///
/// Delete a unit of measurement.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsUom(
  ExsitedClient client,
  Object uomId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(UomUrls.settingsUom,
        pathParams: {'uom_id': uomId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/uom/{uom_id}`
///
/// Update or enable/disable a unit of measurement; `status` takes active or
/// inactive.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateSettingsUom(
  ExsitedClient client,
  Object uomId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(UomUrls.settingsUom,
        pathParams: {'uom_id': uomId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
