/// The v4 approval profiles endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'approval_profiles_dto.dart';
import 'approval_profiles_urls.dart';

/// `GET /api/{api_version}/settings/approval_profiles`
///
/// List the approval profiles.
Future<ApiResponse<SettingsApprovalProfileList>> getSettingsApprovalProfiles(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ApprovalProfilesUrls.settingsApprovalProfiles,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsApprovalProfileList.fromMap);

/// `POST /api/{api_version}/settings/approval_profiles`
///
/// Create an approval profile; `name`, `entity`, `event`, `approver_type` and
/// `approver` are required.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createSettingsApprovalProfile(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ApprovalProfilesUrls.settingsApprovalProfiles,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/settings/approval_profiles/{approval_profile_id}`
///
/// Read one approval profile by its `ap_` id.
Future<ApiResponse<SettingsApprovalProfile>> getSettingsApprovalProfile(
  ExsitedClient client,
  Object approvalProfileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ApprovalProfilesUrls.settingsApprovalProfile,
        pathParams: {'approval_profile_id': approvalProfileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsApprovalProfile.fromMap);

/// `DELETE /api/{api_version}/settings/approval_profiles/{approval_profile_id}`
///
/// Delete an approval profile that is not in use.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsApprovalProfile(
  ExsitedClient client,
  Object approvalProfileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ApprovalProfilesUrls.settingsApprovalProfile,
        pathParams: {'approval_profile_id': approvalProfileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/approval_profiles/{approval_profile_id}`
///
/// Update an approval profile's fields or its status.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateSettingsApprovalProfile(
  ExsitedClient client,
  Object approvalProfileId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ApprovalProfilesUrls.settingsApprovalProfile,
        pathParams: {'approval_profile_id': approvalProfileId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
