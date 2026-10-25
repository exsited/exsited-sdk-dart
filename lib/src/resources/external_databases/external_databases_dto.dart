/// Typed views over the v4 external databases bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The external databases body.
class ExternalDatabases extends Dto {
  const ExternalDatabases({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/external_databases',
    'GET /api/{api_version}/external_databases/{db_name}',
  ];

  static ExternalDatabases? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExternalDatabases(
      data: readList<Object>(source['data'], readAny),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Object?>? data;

  final String? object;

  final Pagination? pagination;

  final String? url;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'data': data,
        'object': object,
        'pagination': pagination,
        'url': url,
      };
}

/// One page of what `getExternalDatabaseTable` lists, under `data`.
class ExternalDatabaseTableList extends Dto {
  const ExternalDatabaseTableList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/external_databases/{db_name}/tables/{table_name}',
  ];

  static ExternalDatabaseTableList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ExternalDatabaseTableList(
      data: readList<Object>(source['data'], readAny),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? data;

  final String? object;

  final Pagination? pagination;

  final String? url;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'data': data,
        'object': object,
        'pagination': pagination,
        'url': url,
      };
}

/// What `createExternalDatabase` answers, under `external_database`.
class ExternalDatabasesView extends Dto {
  const ExternalDatabasesView({
    this.activityLogs,
    this.message,
    this.name,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/external_databases',
  ];

  static ExternalDatabasesView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'external_database');
    if (source == null) return null;
    return ExternalDatabasesView(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      message: readText(source['message']),
      name: readText(source['name']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  final String? message;

  final String? name;

  @override
  String? get envelopeKey => 'external_database';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'message': message,
        'name': name,
      };
}

/// What `createExternalDatabaseInsertRecord` answers, under `external_database`.
class ExternalDatabaseInsertRecord extends Dto {
  const ExternalDatabaseInsertRecord({
    this.insertedData,
    this.message,
    this.success,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/external_databases/{db_name}/insert_records',
  ];

  static ExternalDatabaseInsertRecord? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'external_database');
    if (source == null) return null;
    return ExternalDatabaseInsertRecord(
      insertedData: readList<Object>(source['inserted_data'], readAny),
      message: readText(source['message']),
      success: readFlag(source['success']),
    );
  }

  final List<Object?>? insertedData;

  final String? message;

  final bool? success;

  @override
  String? get envelopeKey => 'external_database';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'inserted_data': insertedData,
        'message': message,
        'success': success,
      };
}

/// What `createExternalDatabaseSearch` answers, under `external_database`.
class ExternalDatabaseSearch extends Dto {
  const ExternalDatabaseSearch({
    this.count,
    this.limit,
    this.list,
    this.offset,
    this.success,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/external_databases/{db_name}/search',
  ];

  static ExternalDatabaseSearch? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'external_database');
    if (source == null) return null;
    return ExternalDatabaseSearch(
      count: readInteger(source['count']),
      limit: readInteger(source['limit']),
      list: readAny(source['list']),
      offset: readInteger(source['offset']),
      success: readFlag(source['success']),
    );
  }

  final int? count;

  final int? limit;

  /// Untyped: an object with no keys in every record measured.
  final Object? list;

  final int? offset;

  final bool? success;

  @override
  String? get envelopeKey => 'external_database';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'count': count,
        'limit': limit,
        'list': list,
        'offset': offset,
        'success': success,
      };
}

/// What `updateExternalDatabaseUpdateRecords` answers, under `external_database`.
class ExternalDatabaseUpdateRecordsUpdated extends Dto {
  const ExternalDatabaseUpdateRecordsUpdated({
    this.message,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/external_databases/{db_name}/update_records',
  ];

  static ExternalDatabaseUpdateRecordsUpdated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'external_database');
    if (source == null) return null;
    return ExternalDatabaseUpdateRecordsUpdated(
      message: readText(source['message']),
    );
  }

  final String? message;

  @override
  String? get envelopeKey => 'external_database';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'message': message,
      };
}
