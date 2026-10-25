/// Typed views over the v4 departments bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings department body, under `department`.
class SettingsDepartment extends Dto {
  const SettingsDepartment({
    this.code,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.division,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/departments',
    'GET /api/{api_version}/settings/departments/{department_id}',
  ];

  static SettingsDepartment? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'department');
    if (source == null) return null;
    return SettingsDepartment(
      code: readText(source['code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      division: SettingsDepartmentDivision.fromMap(source['division']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final String? code;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final SettingsDepartmentDivision? division;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'department';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'division': division,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
        'version': version,
      };
}

/// One page of `SettingsDepartment` records, under `data`.
class SettingsDepartmentList extends Dto {
  const SettingsDepartmentList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/departments',
  ];

  static SettingsDepartmentList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsDepartmentList(
      data: readList<SettingsDepartment>(
          source['data'], SettingsDepartment.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsDepartment?>? data;

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

/// A [SettingsDepartment]'s `division`.
class SettingsDepartmentDivision extends Dto {
  const SettingsDepartmentDivision({
    this.id,
    this.name,
    this.object,
  });

  static SettingsDepartmentDivision? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsDepartmentDivision(
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'object': object,
      };
}
