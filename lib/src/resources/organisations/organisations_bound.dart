/// The v4 organisations endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'organisations.dart' as endpoints;

/// The organisations endpoints with [client] already applied.
class OrganisationsResource {
  /// Bind the resource to a client; normally reached via `client.organisations`.
  const OrganisationsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/organisations`
  Future<ApiResponse<Object?>> getSettingsOrganisations({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsOrganisations(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/organisations`
  Future<ApiResponse<Object?>> createSettingsOrganisation(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsOrganisation(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/organisations/{organisation_id}`
  Future<ApiResponse<Object?>> getSettingsOrganisation(
    Object organisationId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsOrganisation(
        client,
        organisationId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/organisations/{organisation_id}`
  Future<ApiResponse<Object?>> deleteSettingsOrganisation(
    Object organisationId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsOrganisation(
        client,
        organisationId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/organisations/{organisation_id}`
  Future<ApiResponse<Object?>> updateSettingsOrganisation(
    Object organisationId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsOrganisation(
        client,
        organisationId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
