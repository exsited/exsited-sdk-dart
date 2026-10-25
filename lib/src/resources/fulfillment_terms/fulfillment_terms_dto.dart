/// Typed views over the v4 fulfillment terms bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings fulfillment term body, under `fulfillment_term`.
class SettingsFulfillmentTerm extends Dto {
  const SettingsFulfillmentTerm({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.duration,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.period,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/fulfillment_terms',
    'GET /api/{api_version}/settings/fulfillment_terms/{fulfillment_term_id}',
    'POST /api/{api_version}/settings/fulfillment_terms',
    'PATCH /api/{api_version}/settings/fulfillment_terms/{fulfillment_term_id}',
  ];

  static SettingsFulfillmentTerm? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'fulfillment_term');
    if (source == null) return null;
    return SettingsFulfillmentTerm(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      duration: readInteger(source['duration']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      period: readText(source['period']),
      status: readText(source['status']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final int? duration;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? period;

  final String? status;

  @override
  String? get envelopeKey => 'fulfillment_term';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'duration': duration,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'period': period,
        'status': status,
      };
}

/// One page of `SettingsFulfillmentTerm` records, under `data`.
class SettingsFulfillmentTermList extends Dto {
  const SettingsFulfillmentTermList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/fulfillment_terms',
  ];

  static SettingsFulfillmentTermList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFulfillmentTermList(
      data: readList<SettingsFulfillmentTerm>(
          source['data'], SettingsFulfillmentTerm.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsFulfillmentTerm?>? data;

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
