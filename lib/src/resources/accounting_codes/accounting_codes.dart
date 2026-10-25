/// The v4 accounting codes endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'accounting_codes_dto.dart';
import 'accounting_codes_urls.dart';

/// `GET /api/{api_version}/settings/accounting_codes`
Future<ApiResponse<SettingsAccountingCodeList>> getSettingsAccountingCodes(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountingCodesUrls.settingsAccountingCodes,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsAccountingCodeList.fromMap);

/// `POST /api/{api_version}/settings/accounting_codes`
Future<ApiResponse<SettingsAccountingCode>> createSettingsAccountingCode(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AccountingCodesUrls.settingsAccountingCodes,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsAccountingCode.fromMap);

/// `GET /api/{api_version}/settings/accounting_codes/{accounting_code_id}`
Future<ApiResponse<SettingsAccountingCode>> getSettingsAccountingCode(
  ExsitedClient client,
  Object accountingCodeId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountingCodesUrls.settingsAccountingCode,
        pathParams: {'accounting_code_id': accountingCodeId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsAccountingCode.fromMap);

/// `DELETE /api/{api_version}/settings/accounting_codes/{accounting_code_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsAccountingCode(
  ExsitedClient client,
  Object accountingCodeId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(AccountingCodesUrls.settingsAccountingCode,
        pathParams: {'accounting_code_id': accountingCodeId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/accounting_codes/{accounting_code_id}`
Future<ApiResponse<SettingsAccountingCode>> updateSettingsAccountingCode(
  ExsitedClient client,
  Object accountingCodeId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(AccountingCodesUrls.settingsAccountingCode,
        pathParams: {'accounting_code_id': accountingCodeId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsAccountingCode.fromMap);
