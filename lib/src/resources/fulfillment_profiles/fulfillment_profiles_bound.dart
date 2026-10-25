/// The v4 fulfillment profiles endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'fulfillment_profiles.dart' as endpoints;
import 'fulfillment_profiles_dto.dart' as views;

/// The fulfillment profiles endpoints with [client] already applied.
class FulfillmentProfilesResource {
  /// Bind the resource to a client; normally reached via `client.fulfillmentProfiles`.
  const FulfillmentProfilesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/fulfillment_profiles`
  Future<ApiResponse<views.SettingsFulfillmentProfileList>>
      getSettingsFulfillmentProfiles({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsFulfillmentProfiles(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/fulfillment_profiles`
  Future<ApiResponse<views.SettingsFulfillmentProfile>>
      createSettingsFulfillmentProfile(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsFulfillmentProfile(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/fulfillment_profiles/{fulfillment_profile_id}`
  Future<ApiResponse<views.SettingsFulfillmentProfile>>
      getSettingsFulfillmentProfile(
    Object fulfillmentProfileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsFulfillmentProfile(
            client,
            fulfillmentProfileId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/settings/fulfillment_profiles/{fulfillment_profile_id}`
  Future<ApiResponse<Object?>> deleteSettingsFulfillmentProfile(
    Object fulfillmentProfileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsFulfillmentProfile(
        client,
        fulfillmentProfileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/fulfillment_profiles/{fulfillment_profile_id}`
  Future<ApiResponse<views.SettingsFulfillmentProfile>>
      updateSettingsFulfillmentProfile(
    Object fulfillmentProfileId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsFulfillmentProfile(
            client,
            fulfillmentProfileId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );
}
