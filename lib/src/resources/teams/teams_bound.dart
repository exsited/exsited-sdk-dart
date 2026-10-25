/// The v4 teams endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'teams.dart' as endpoints;
import 'teams_dto.dart' as views;

/// The teams endpoints with [client] already applied.
class TeamsResource {
  /// Bind the resource to a client; normally reached via `client.teams`.
  const TeamsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/teams`
  Future<ApiResponse<views.SettingsTeamList>> getSettingsTeams({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsTeams(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/teams`
  Future<ApiResponse<views.SettingsTeam>> createSettingsTeam(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsTeam(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/teams/{team_id}`
  Future<ApiResponse<views.SettingsTeam>> getSettingsTeam(
    Object teamId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsTeam(
        client,
        teamId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/teams/{team_id}`
  Future<ApiResponse<Object?>> deleteSettingsTeam(
    Object teamId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsTeam(
        client,
        teamId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/teams/{team_id}`
  Future<ApiResponse<views.SettingsTeam>> updateSettingsTeam(
    Object teamId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsTeam(
        client,
        teamId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
