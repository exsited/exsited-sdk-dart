/// The v4 approval profiles endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'approval_profiles.dart' as endpoints;
import 'approval_profiles_dto.dart' as views;

/// The approval profiles endpoints with [client] already applied.
class ApprovalProfilesResource {
  /// Bind the resource to a client; normally reached via `client.approvalProfiles`.
  const ApprovalProfilesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/approval_profiles`
  Future<ApiResponse<views.SettingsApprovalProfileList>>
      getSettingsApprovalProfiles({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsApprovalProfiles(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/approval_profiles`
  Future<ApiResponse<Object?>> createSettingsApprovalProfile(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsApprovalProfile(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/approval_profiles/{approval_profile_id}`
  Future<ApiResponse<views.SettingsApprovalProfile>> getSettingsApprovalProfile(
    Object approvalProfileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsApprovalProfile(
        client,
        approvalProfileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/approval_profiles/{approval_profile_id}`
  Future<ApiResponse<Object?>> deleteSettingsApprovalProfile(
    Object approvalProfileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsApprovalProfile(
        client,
        approvalProfileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/approval_profiles/{approval_profile_id}`
  Future<ApiResponse<Object?>> updateSettingsApprovalProfile(
    Object approvalProfileId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsApprovalProfile(
        client,
        approvalProfileId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
