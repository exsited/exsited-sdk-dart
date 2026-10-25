/// The v4 applications endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'applications.dart' as endpoints;
import 'applications_dto.dart' as views;

/// The applications endpoints with [client] already applied.
class ApplicationsResource {
  /// Bind the resource to a client; normally reached via `client.applications`.
  const ApplicationsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/applications`
  Future<ApiResponse<views.SettingsApplicationList>> getSettingsApplications({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsApplications(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/applications`
  Future<ApiResponse<views.SettingsApplication>> createSettingsApplication(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsApplication(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/applications/{application_id}`
  Future<ApiResponse<views.SettingsApplication>> getSettingsApplication(
    Object applicationId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsApplication(
        client,
        applicationId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/applications/{application_id}`
  Future<ApiResponse<Object?>> deleteSettingsApplication(
    Object applicationId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsApplication(
        client,
        applicationId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/applications/{application_id}`
  Future<ApiResponse<views.SettingsApplication>> updateSettingsApplication(
    Object applicationId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsApplication(
        client,
        applicationId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
