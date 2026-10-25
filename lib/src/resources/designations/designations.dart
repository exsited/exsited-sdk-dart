/// The v4 designations endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'designations_dto.dart';
import 'designations_urls.dart';

/// `GET /api/{api_version}/settings/designations`
///
/// List the designations.
Future<ApiResponse<SettingsDesignationList>> getSettingsDesignations(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(DesignationsUrls.settingsDesignations,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsDesignationList.fromMap);

/// `POST /api/{api_version}/settings/designations`
///
/// Create a designation; `name` is required.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createSettingsDesignation(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(DesignationsUrls.settingsDesignations,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/settings/designations/{designation_id}`
///
/// Read one designation by its `des_` id.
Future<ApiResponse<SettingsDesignation>> getSettingsDesignation(
  ExsitedClient client,
  Object designationId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(DesignationsUrls.settingsDesignation,
        pathParams: {'designation_id': designationId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsDesignation.fromMap);

/// `DELETE /api/{api_version}/settings/designations/{designation_id}`
///
/// Delete a designation.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsDesignation(
  ExsitedClient client,
  Object designationId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(DesignationsUrls.settingsDesignation,
        pathParams: {'designation_id': designationId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/designations/{designation_id}`
///
/// Update a designation's name, display name or description.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateSettingsDesignation(
  ExsitedClient client,
  Object designationId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(DesignationsUrls.settingsDesignation,
        pathParams: {'designation_id': designationId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
