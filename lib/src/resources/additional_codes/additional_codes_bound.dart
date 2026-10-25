/// The v4 additional codes endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'additional_codes.dart' as endpoints;
import 'additional_codes_dto.dart' as views;

/// The additional codes endpoints with [client] already applied.
class AdditionalCodesResource {
  /// Bind the resource to a client; normally reached via `client.additionalCodes`.
  const AdditionalCodesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/additional_codes`
  Future<ApiResponse<views.SettingsAdditionalCodeList>>
      getSettingsAdditionalCodes({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsAdditionalCodes(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/additional_codes`
  Future<ApiResponse<views.SettingsAdditionalCode>>
      createSettingsAdditionalCode(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsAdditionalCode(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/additional_codes/{additional_code_id}`
  Future<ApiResponse<views.SettingsAdditionalCode>> getSettingsAdditionalCode(
    Object additionalCodeId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsAdditionalCode(
        client,
        additionalCodeId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/additional_codes/{additional_code_id}`
  Future<ApiResponse<Object?>> deleteSettingsAdditionalCode(
    Object additionalCodeId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsAdditionalCode(
        client,
        additionalCodeId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/additional_codes/{additional_code_id}`
  Future<ApiResponse<Object?>> updateSettingsAdditionalCode(
    Object additionalCodeId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsAdditionalCode(
        client,
        additionalCodeId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
