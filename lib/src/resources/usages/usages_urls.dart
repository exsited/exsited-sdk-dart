/// Usages path templates and body keys; the client fills `{api_version}`.
library;

class UsagesUrls {
  UsagesUrls._();

  static const String usages = '/api/{api_version}/usages';
  static const String usage = '/api/{api_version}/usages/{usage_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String usageKey = 'usage';
}
