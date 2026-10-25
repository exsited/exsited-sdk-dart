/// Communication profiles path templates and body keys; the client fills `{api_version}`.
library;

class CommunicationProfilesUrls {
  CommunicationProfilesUrls._();

  static const String settingsCommunicationProfiles =
      '/api/{api_version}/settings/communication_profiles';
  static const String settingsCommunicationProfile =
      '/api/{api_version}/settings/communication_profiles/{communication_profile_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String communicationProfileKey = 'communication_profile';
}
