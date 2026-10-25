/// The v4 designations endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'designations.dart' as endpoints;
import 'designations_dto.dart' as views;

/// The designations endpoints with [client] already applied.
class DesignationsResource {
  /// Bind the resource to a client; normally reached via `client.designations`.
  const DesignationsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/designations`
  Future<ApiResponse<views.SettingsDesignationList>> getSettingsDesignations({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsDesignations(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/designations`
  Future<ApiResponse<Object?>> createSettingsDesignation(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsDesignation(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/designations/{designation_id}`
  Future<ApiResponse<views.SettingsDesignation>> getSettingsDesignation(
    Object designationId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsDesignation(
        client,
        designationId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/designations/{designation_id}`
  Future<ApiResponse<Object?>> deleteSettingsDesignation(
    Object designationId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsDesignation(
        client,
        designationId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/designations/{designation_id}`
  Future<ApiResponse<Object?>> updateSettingsDesignation(
    Object designationId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsDesignation(
        client,
        designationId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
