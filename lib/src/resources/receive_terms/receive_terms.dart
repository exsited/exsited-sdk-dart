/// The v4 receive terms endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'receive_terms_dto.dart';
import 'receive_terms_urls.dart';

/// `GET /api/{api_version}/settings/receive_terms`
///
/// List receive terms.
Future<ApiResponse<SettingsReceiveTermList>> getSettingsReceiveTerms(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ReceiveTermsUrls.settingsReceiveTerms,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsReceiveTermList.fromMap);

/// `POST /api/{api_version}/settings/receive_terms`
///
/// Create a receive term; `period` is sent upper case and answered lower case.
Future<ApiResponse<SettingsReceiveTerm>> createSettingsReceiveTerm(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ReceiveTermsUrls.settingsReceiveTerms,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsReceiveTerm.fromMap);

/// `GET /api/{api_version}/settings/receive_terms/{receive_term_id}`
///
/// Get one receive term.
Future<ApiResponse<SettingsReceiveTerm>> getSettingsReceiveTerm(
  ExsitedClient client,
  Object receiveTermId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ReceiveTermsUrls.settingsReceiveTerm,
        pathParams: {'receive_term_id': receiveTermId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsReceiveTerm.fromMap);

/// `DELETE /api/{api_version}/settings/receive_terms/{receive_term_id}`
///
/// Delete a receive term.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsReceiveTerm(
  ExsitedClient client,
  Object receiveTermId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ReceiveTermsUrls.settingsReceiveTerm,
        pathParams: {'receive_term_id': receiveTermId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/receive_terms/{receive_term_id}`
///
/// Update or enable/disable a receive term - `PATCH
/// /settings/receive_terms/{receive_term_id}`; `status` takes active or
/// inactive.
Future<ApiResponse<SettingsReceiveTerm>> updateSettingsReceiveTerm(
  ExsitedClient client,
  Object receiveTermId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ReceiveTermsUrls.settingsReceiveTerm,
        pathParams: {'receive_term_id': receiveTermId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsReceiveTerm.fromMap);
