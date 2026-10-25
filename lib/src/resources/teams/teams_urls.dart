/// Teams path templates and body keys; the client fills `{api_version}`.
library;

class TeamsUrls {
  TeamsUrls._();

  static const String settingsTeams = '/api/{api_version}/settings/teams';
  static const String settingsTeam =
      '/api/{api_version}/settings/teams/{team_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String teamKey = 'team';
}
