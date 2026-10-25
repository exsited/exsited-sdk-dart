/// Typed views over the v4 sales reps bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings sales rep body, under `sales_rep`.
class SettingsSalesRep extends Dto {
  const SettingsSalesRep({
    this.createdBy,
    this.createdOn,
    this.emailAddress,
    this.firstName,
    this.href,
    this.id,
    this.lastName,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/sales_reps',
    'GET /api/{api_version}/settings/sales_reps/{sales_rep_id}',
  ];

  static SettingsSalesRep? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'sales_rep');
    if (source == null) return null;
    return SettingsSalesRep(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      emailAddress: readText(source['email_address']),
      firstName: readText(source['first_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastName: readText(source['last_name']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? emailAddress;

  final String? firstName;

  final String? href;

  final String? id;

  final String? lastName;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'sales_rep';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'email_address': emailAddress,
        'first_name': firstName,
        'href': href,
        'id': id,
        'last_name': lastName,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
        'version': version,
      };
}

/// One page of `SettingsSalesRep` records, under `data`.
class SettingsSalesRepList extends Dto {
  const SettingsSalesRepList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/sales_reps',
  ];

  static SettingsSalesRepList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsSalesRepList(
      data:
          readList<SettingsSalesRep>(source['data'], SettingsSalesRep.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsSalesRep?>? data;

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
