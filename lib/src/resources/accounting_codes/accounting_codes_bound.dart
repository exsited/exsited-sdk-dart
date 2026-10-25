/// The v4 accounting codes endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'accounting_codes.dart' as endpoints;
import 'accounting_codes_dto.dart' as views;

/// The accounting codes endpoints with [client] already applied.
class AccountingCodesResource {
  /// Bind the resource to a client; normally reached via `client.accountingCodes`.
  const AccountingCodesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/accounting_codes`
  Future<ApiResponse<views.SettingsAccountingCodeList>>
      getSettingsAccountingCodes({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsAccountingCodes(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/accounting_codes`
  Future<ApiResponse<views.SettingsAccountingCode>>
      createSettingsAccountingCode(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsAccountingCode(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/accounting_codes/{accounting_code_id}`
  Future<ApiResponse<views.SettingsAccountingCode>> getSettingsAccountingCode(
    Object accountingCodeId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsAccountingCode(
        client,
        accountingCodeId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/accounting_codes/{accounting_code_id}`
  Future<ApiResponse<Object?>> deleteSettingsAccountingCode(
    Object accountingCodeId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsAccountingCode(
        client,
        accountingCodeId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/accounting_codes/{accounting_code_id}`
  Future<ApiResponse<views.SettingsAccountingCode>>
      updateSettingsAccountingCode(
    Object accountingCodeId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsAccountingCode(
            client,
            accountingCodeId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );
}
