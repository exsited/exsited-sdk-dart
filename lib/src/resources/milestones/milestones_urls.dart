/// Milestones path templates and body keys; the client fills `{api_version}`.
library;

class MilestonesUrls {
  MilestonesUrls._();

  static const String milestones = '/api/{api_version}/milestones';
  static const String milestonesAccountById =
      '/api/{api_version}/milestones/account/{account_id}';
  static const String milestonesLabourById =
      '/api/{api_version}/milestones/labour/{labour_id}';
  static const String milestonesEmployeeByCode =
      '/api/{api_version}/milestones/employee/{employee_code}';
  static const String milestone =
      '/api/{api_version}/milestones/{milestone_uuid}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String milestoneKey = 'milestone';
}
