/// Receive terms path templates and body keys; the client fills `{api_version}`.
library;

class ReceiveTermsUrls {
  ReceiveTermsUrls._();

  static const String settingsReceiveTerms =
      '/api/{api_version}/settings/receive_terms';
  static const String settingsReceiveTerm =
      '/api/{api_version}/settings/receive_terms/{receive_term_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String receiveTermKey = 'receive_term';
}
