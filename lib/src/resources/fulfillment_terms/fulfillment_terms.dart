/// The v4 fulfillment terms endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'fulfillment_terms_dto.dart';
import 'fulfillment_terms_urls.dart';

/// `GET /api/{api_version}/settings/fulfillment_terms`
///
/// List fulfillment terms.
Future<ApiResponse<SettingsFulfillmentTermList>> getSettingsFulfillmentTerms(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(FulfillmentTermsUrls.settingsFulfillmentTerms,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsFulfillmentTermList.fromMap);

/// `POST /api/{api_version}/settings/fulfillment_terms`
///
/// Create a fulfillment term; `period` is sent upper case and answered lower
/// case.
Future<ApiResponse<SettingsFulfillmentTerm>> createSettingsFulfillmentTerm(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(FulfillmentTermsUrls.settingsFulfillmentTerms,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsFulfillmentTerm.fromMap);

/// `GET /api/{api_version}/settings/fulfillment_terms/{fulfillment_term_id}`
///
/// Get one fulfillment term.
Future<ApiResponse<SettingsFulfillmentTerm>> getSettingsFulfillmentTerm(
  ExsitedClient client,
  Object fulfillmentTermId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(FulfillmentTermsUrls.settingsFulfillmentTerm,
        pathParams: {'fulfillment_term_id': fulfillmentTermId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsFulfillmentTerm.fromMap);

/// `DELETE /api/{api_version}/settings/fulfillment_terms/{fulfillment_term_id}`
///
/// Delete a fulfillment term.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsFulfillmentTerm(
  ExsitedClient client,
  Object fulfillmentTermId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(FulfillmentTermsUrls.settingsFulfillmentTerm,
        pathParams: {'fulfillment_term_id': fulfillmentTermId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/fulfillment_terms/{fulfillment_term_id}`
///
/// Update or enable/disable a fulfillment term - `PATCH
/// /settings/fulfillment_terms/{fulfillment_term_id}`; `status` takes active or
/// inactive.
Future<ApiResponse<SettingsFulfillmentTerm>> updateSettingsFulfillmentTerm(
  ExsitedClient client,
  Object fulfillmentTermId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(FulfillmentTermsUrls.settingsFulfillmentTerm,
        pathParams: {'fulfillment_term_id': fulfillmentTermId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsFulfillmentTerm.fromMap);
