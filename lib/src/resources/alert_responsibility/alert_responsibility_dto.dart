/// Typed views over the v4 alert responsibility bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The alert responsibility body, under `alert_responsibility`; `activity_logs`
/// comes on the create answer only.
class AlertResponsibility extends Dto {
  const AlertResponsibility({
    this.activityLogs,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/alert_responsibility',
    'GET /api/{api_version}/alert_responsibility/{alert_responsibility_id}',
    'POST /api/{api_version}/alert_responsibility',
    'PATCH /api/{api_version}/alert_responsibility/{alert_responsibility_id}',
  ];

  static AlertResponsibility? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'alert_responsibility');
    if (source == null) return null;
    return AlertResponsibility(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
    );
  }

  final List<Object?>? activityLogs;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  @override
  String? get envelopeKey => 'alert_responsibility';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
      };
}

/// One page of `AlertResponsibility` records, under `data`.
class AlertResponsibilityList extends Dto {
  const AlertResponsibilityList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/alert_responsibility',
  ];

  static AlertResponsibilityList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AlertResponsibilityList(
      data: readList<AlertResponsibility>(
          source['data'], AlertResponsibility.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<AlertResponsibility?>? data;

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
