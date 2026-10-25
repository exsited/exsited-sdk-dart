/// The v4 additional codes endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'additional_codes_dto.dart';
import 'additional_codes_urls.dart';

/// `GET /api/{api_version}/settings/additional_codes`
///
/// List the additional codes, the data sets of purchase order lines.
Future<ApiResponse<SettingsAdditionalCodeList>> getSettingsAdditionalCodes(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AdditionalCodesUrls.settingsAdditionalCodes,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsAdditionalCodeList.fromMap);

/// `POST /api/{api_version}/settings/additional_codes`
///
/// Create an additional code; `name` is required.
Future<ApiResponse<SettingsAdditionalCode>> createSettingsAdditionalCode(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AdditionalCodesUrls.settingsAdditionalCodes,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsAdditionalCode.fromMap);

/// `GET /api/{api_version}/settings/additional_codes/{additional_code_id}`
///
/// Read one additional code by its `ac_` id.
Future<ApiResponse<SettingsAdditionalCode>> getSettingsAdditionalCode(
  ExsitedClient client,
  Object additionalCodeId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AdditionalCodesUrls.settingsAdditionalCode,
        pathParams: {'additional_code_id': additionalCodeId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsAdditionalCode.fromMap);

/// `DELETE /api/{api_version}/settings/additional_codes/{additional_code_id}`
///
/// Delete an additional code.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsAdditionalCode(
  ExsitedClient client,
  Object additionalCodeId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(AdditionalCodesUrls.settingsAdditionalCode,
        pathParams: {'additional_code_id': additionalCodeId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/additional_codes/{additional_code_id}`
///
/// Update an additional code's fields or its status.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateSettingsAdditionalCode(
  ExsitedClient client,
  Object additionalCodeId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(AdditionalCodesUrls.settingsAdditionalCode,
        pathParams: {'additional_code_id': additionalCodeId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
