/// The v4 fulfillment profiles endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'fulfillment_profiles_dto.dart';
import 'fulfillment_profiles_urls.dart';

/// `GET /api/{api_version}/settings/fulfillment_profiles`
///
/// List fulfillment profiles.
Future<ApiResponse<SettingsFulfillmentProfileList>>
    getSettingsFulfillmentProfiles(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            FulfillmentProfilesUrls.settingsFulfillmentProfiles,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsFulfillmentProfileList.fromMap);

/// `POST /api/{api_version}/settings/fulfillment_profiles`
///
/// Create a fulfillment profile; `statuses` needs one entry at least.
Future<ApiResponse<SettingsFulfillmentProfile>>
    createSettingsFulfillmentProfile(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPostRequest(
            FulfillmentProfilesUrls.settingsFulfillmentProfiles,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsFulfillmentProfile.fromMap);

/// `GET /api/{api_version}/settings/fulfillment_profiles/{fulfillment_profile_id}`
///
/// Get one fulfillment profile - `GET
/// /settings/fulfillment_profiles/{fulfillment_profile_id}`.
Future<ApiResponse<SettingsFulfillmentProfile>> getSettingsFulfillmentProfile(
  ExsitedClient client,
  Object fulfillmentProfileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(FulfillmentProfilesUrls.settingsFulfillmentProfile,
        pathParams: {'fulfillment_profile_id': fulfillmentProfileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsFulfillmentProfile.fromMap);

/// `DELETE /api/{api_version}/settings/fulfillment_profiles/{fulfillment_profile_id}`
///
/// Delete a fulfillment profile - `DELETE
/// /settings/fulfillment_profiles/{fulfillment_profile_id}`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsFulfillmentProfile(
  ExsitedClient client,
  Object fulfillmentProfileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(FulfillmentProfilesUrls.settingsFulfillmentProfile,
        pathParams: {'fulfillment_profile_id': fulfillmentProfileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/fulfillment_profiles/{fulfillment_profile_id}`
///
/// Update a fulfillment profile - `PATCH
/// /settings/fulfillment_profiles/{fulfillment_profile_id}`.
Future<ApiResponse<SettingsFulfillmentProfile>>
    updateSettingsFulfillmentProfile(
  ExsitedClient client,
  Object fulfillmentProfileId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(
            FulfillmentProfilesUrls.settingsFulfillmentProfile,
            pathParams: {'fulfillment_profile_id': fulfillmentProfileId},
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsFulfillmentProfile.fromMap);
