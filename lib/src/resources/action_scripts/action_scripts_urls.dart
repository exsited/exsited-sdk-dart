/// Action scripts path templates and body keys; the client fills `{api_version}`.
library;

class ActionScriptsUrls {
  ActionScriptsUrls._();

  static const String actionScripts = '/api/{api_version}/action_scripts';
  static const String actionScript =
      '/api/{api_version}/action_scripts/{action_script_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String actionScriptKey = 'action_script';
}
