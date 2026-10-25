/// The v4 teams endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'teams_dto.dart';
import 'teams_urls.dart';

/// `GET /api/{api_version}/settings/teams`
///
/// List teams.
Future<ApiResponse<SettingsTeamList>> getSettingsTeams(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(TeamsUrls.settingsTeams,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsTeamList.fromMap);

/// `POST /api/{api_version}/settings/teams`
///
/// Create a team.
Future<ApiResponse<SettingsTeam>> createSettingsTeam(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(TeamsUrls.settingsTeams,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsTeam.fromMap);

/// `GET /api/{api_version}/settings/teams/{team_id}`
///
/// Get one team.
Future<ApiResponse<SettingsTeam>> getSettingsTeam(
  ExsitedClient client,
  Object teamId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(TeamsUrls.settingsTeam,
        pathParams: {'team_id': teamId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsTeam.fromMap);

/// `DELETE /api/{api_version}/settings/teams/{team_id}`
///
/// Delete a team; refused while the team has members.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsTeam(
  ExsitedClient client,
  Object teamId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(TeamsUrls.settingsTeam,
        pathParams: {'team_id': teamId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/teams/{team_id}`
///
/// Update or enable/disable a team; `status` takes active or inactive.
Future<ApiResponse<SettingsTeam>> updateSettingsTeam(
  ExsitedClient client,
  Object teamId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(TeamsUrls.settingsTeam,
        pathParams: {'team_id': teamId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsTeam.fromMap);
