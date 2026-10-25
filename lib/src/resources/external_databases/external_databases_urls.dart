/// External databases path templates and body keys; the client fills `{api_version}`.
library;

class ExternalDatabasesUrls {
  ExternalDatabasesUrls._();

  static const String externalDatabases =
      '/api/{api_version}/external_databases';
  static const String externalDatabase =
      '/api/{api_version}/external_databases/{db_name}';
  static const String externalDatabaseInsertRecords =
      '/api/{api_version}/external_databases/{db_name}/insert_records';
  static const String externalDatabaseSearch =
      '/api/{api_version}/external_databases/{db_name}/search';
  static const String externalDatabaseUpdateRecords =
      '/api/{api_version}/external_databases/{db_name}/update_records';
  static const String externalDatabaseTable =
      '/api/{api_version}/external_databases/{db_name}/tables/{table_name}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String externalDatabaseKey = 'external_database';
}
