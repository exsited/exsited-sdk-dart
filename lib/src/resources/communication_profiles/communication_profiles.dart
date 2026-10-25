/// The v4 communication profiles endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'communication_profiles_dto.dart';
import 'communication_profiles_urls.dart';

/// `GET /api/{api_version}/settings/communication_profiles`
///
/// List the communication profiles.
Future<ApiResponse<SettingsCommunicationProfileList>>
    getSettingsCommunicationProfiles(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            CommunicationProfilesUrls.settingsCommunicationProfiles,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsCommunicationProfileList.fromMap);

/// `POST /api/{api_version}/settings/communication_profiles`
///
/// Create a communication profile; `name` is required, and its messages are
/// copied from `copy_from` or else from the default profile.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createSettingsCommunicationProfile(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(
        CommunicationProfilesUrls.settingsCommunicationProfiles,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/settings/communication_profiles/{communication_profile_id}`
///
/// Read one communication profile by its `cmp_` id.
Future<ApiResponse<SettingsCommunicationProfile>>
    getSettingsCommunicationProfile(
  ExsitedClient client,
  Object communicationProfileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            CommunicationProfilesUrls.settingsCommunicationProfile,
            pathParams: {'communication_profile_id': communicationProfileId},
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsCommunicationProfile.fromMap);

/// `DELETE /api/{api_version}/settings/communication_profiles/{communication_profile_id}`
///
/// Delete a communication profile that is not the default.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsCommunicationProfile(
  ExsitedClient client,
  Object communicationProfileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(
        CommunicationProfilesUrls.settingsCommunicationProfile,
        pathParams: {'communication_profile_id': communicationProfileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/communication_profiles/{communication_profile_id}`
///
/// Update a communication profile's fields and channel settings.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateSettingsCommunicationProfile(
  ExsitedClient client,
  Object communicationProfileId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(
        CommunicationProfilesUrls.settingsCommunicationProfile,
        pathParams: {'communication_profile_id': communicationProfileId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
