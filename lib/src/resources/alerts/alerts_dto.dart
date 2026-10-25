/// Typed views over the v4 alerts bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The alerts body.
class Alerts extends Dto {
  const Alerts({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/alerts',
    'GET /api/{api_version}/alerts/account/{account_id}',
  ];

  static Alerts? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return Alerts(
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

/// One page of what `getAlertsEmployeeById` lists, under `data`.
class AlertsEmployeeByIdList extends Dto {
  const AlertsEmployeeByIdList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/alerts/employee/{employee_id}',
  ];

  static AlertsEmployeeByIdList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AlertsEmployeeByIdList(
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

/// One page of what `getAlertsLabourById` lists, under `data`.
class AlertsLabourByIdList extends Dto {
  const AlertsLabourByIdList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/alerts/labour/{labour_id}',
  ];

  static AlertsLabourByIdList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AlertsLabourByIdList(
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
