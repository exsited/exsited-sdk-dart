/// The v4 salutations endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'salutations_dto.dart';
import 'salutations_urls.dart';

/// `GET /api/{api_version}/settings/salutations`
///
/// List salutations.
Future<ApiResponse<SettingsSalutationList>> getSettingsSalutations(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SalutationsUrls.settingsSalutations,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsSalutationList.fromMap);

/// `POST /api/{api_version}/settings/salutations`
///
/// Create a salutation.
Future<ApiResponse<SettingsSalutation>> createSettingsSalutation(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(SalutationsUrls.settingsSalutations,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsSalutation.fromMap);

/// `GET /api/{api_version}/settings/salutations/{salutation_id}`
///
/// Get one salutation.
Future<ApiResponse<SettingsSalutation>> getSettingsSalutation(
  ExsitedClient client,
  Object salutationId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SalutationsUrls.settingsSalutation,
        pathParams: {'salutation_id': salutationId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsSalutation.fromMap);

/// `DELETE /api/{api_version}/settings/salutations/{salutation_id}`
///
/// Delete a salutation.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsSalutation(
  ExsitedClient client,
  Object salutationId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(SalutationsUrls.settingsSalutation,
        pathParams: {'salutation_id': salutationId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/salutations/{salutation_id}`
///
/// Update a salutation.
Future<ApiResponse<SettingsSalutation>> updateSettingsSalutation(
  ExsitedClient client,
  Object salutationId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(SalutationsUrls.settingsSalutation,
        pathParams: {'salutation_id': salutationId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsSalutation.fromMap);
