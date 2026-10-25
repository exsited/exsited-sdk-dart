/// The v4 sales reps endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'sales_reps_dto.dart';
import 'sales_reps_urls.dart';

/// `GET /api/{api_version}/settings/sales_reps`
///
/// List sales reps.
Future<ApiResponse<SettingsSalesRepList>> getSettingsSalesReps(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SalesRepsUrls.settingsSalesReps,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsSalesRepList.fromMap);

/// `POST /api/{api_version}/settings/sales_reps`
///
/// Create a sales rep; the API answers 400 validation_error, naming no field,
/// even to a valid body.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createSettingsSalesRep(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(SalesRepsUrls.settingsSalesReps,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/settings/sales_reps/{sales_rep_id}`
///
/// Get one sales rep.
Future<ApiResponse<SettingsSalesRep>> getSettingsSalesRep(
  ExsitedClient client,
  Object salesRepId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SalesRepsUrls.settingsSalesRep,
        pathParams: {'sales_rep_id': salesRepId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsSalesRep.fromMap);

/// `DELETE /api/{api_version}/settings/sales_reps/{sales_rep_id}`
///
/// Delete a sales rep.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsSalesRep(
  ExsitedClient client,
  Object salesRepId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(SalesRepsUrls.settingsSalesRep,
        pathParams: {'sales_rep_id': salesRepId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/sales_reps/{sales_rep_id}`
///
/// Update or enable/disable a sales rep; `status` takes active or inactive.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateSettingsSalesRep(
  ExsitedClient client,
  Object salesRepId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(SalesRepsUrls.settingsSalesRep,
        pathParams: {'sales_rep_id': salesRepId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
