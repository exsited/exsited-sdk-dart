/// The v4 communication profiles endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'communication_profiles.dart' as endpoints;
import 'communication_profiles_dto.dart' as views;

/// The communication profiles endpoints with [client] already applied.
class CommunicationProfilesResource {
  /// Bind the resource to a client; normally reached via `client.communicationProfiles`.
  const CommunicationProfilesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/communication_profiles`
  Future<ApiResponse<views.SettingsCommunicationProfileList>>
      getSettingsCommunicationProfiles({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsCommunicationProfiles(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/communication_profiles`
  Future<ApiResponse<Object?>> createSettingsCommunicationProfile(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsCommunicationProfile(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/communication_profiles/{communication_profile_id}`
  Future<ApiResponse<views.SettingsCommunicationProfile>>
      getSettingsCommunicationProfile(
    Object communicationProfileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsCommunicationProfile(
            client,
            communicationProfileId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/settings/communication_profiles/{communication_profile_id}`
  Future<ApiResponse<Object?>> deleteSettingsCommunicationProfile(
    Object communicationProfileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsCommunicationProfile(
        client,
        communicationProfileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/communication_profiles/{communication_profile_id}`
  Future<ApiResponse<Object?>> updateSettingsCommunicationProfile(
    Object communicationProfileId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsCommunicationProfile(
        client,
        communicationProfileId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
