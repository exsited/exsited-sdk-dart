/// Sales reps path templates and body keys; the client fills `{api_version}`.
library;

class SalesRepsUrls {
  SalesRepsUrls._();

  static const String settingsSalesReps =
      '/api/{api_version}/settings/sales_reps';
  static const String settingsSalesRep =
      '/api/{api_version}/settings/sales_reps/{sales_rep_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String salesRepKey = 'sales_rep';
}
