/// The v4 salutations endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'salutations.dart' as endpoints;
import 'salutations_dto.dart' as views;

/// The salutations endpoints with [client] already applied.
class SalutationsResource {
  /// Bind the resource to a client; normally reached via `client.salutations`.
  const SalutationsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/salutations`
  Future<ApiResponse<views.SettingsSalutationList>> getSettingsSalutations({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsSalutations(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/salutations`
  Future<ApiResponse<views.SettingsSalutation>> createSettingsSalutation(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsSalutation(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/salutations/{salutation_id}`
  Future<ApiResponse<views.SettingsSalutation>> getSettingsSalutation(
    Object salutationId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsSalutation(
        client,
        salutationId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/salutations/{salutation_id}`
  Future<ApiResponse<Object?>> deleteSettingsSalutation(
    Object salutationId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsSalutation(
        client,
        salutationId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/salutations/{salutation_id}`
  Future<ApiResponse<views.SettingsSalutation>> updateSettingsSalutation(
    Object salutationId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsSalutation(
        client,
        salutationId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
