/// Typed views over the v4 fulfillment profiles bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings fulfillment profile body, under `fulfillment_profile`.
class SettingsFulfillmentProfile extends Dto {
  const SettingsFulfillmentProfile({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
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
    'GET /api/{api_version}/settings/fulfillment_profiles',
    'GET /api/{api_version}/settings/fulfillment_profiles/{fulfillment_profile_id}',
    'POST /api/{api_version}/settings/fulfillment_profiles',
    'PATCH /api/{api_version}/settings/fulfillment_profiles/{fulfillment_profile_id}',
  ];

  static SettingsFulfillmentProfile? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'fulfillment_profile');
    if (source == null) return null;
    return SettingsFulfillmentProfile(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
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

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

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
  String? get envelopeKey => 'fulfillment_profile';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
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

/// One page of `SettingsFulfillmentProfile` records, under `data`.
class SettingsFulfillmentProfileList extends Dto {
  const SettingsFulfillmentProfileList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/fulfillment_profiles',
  ];

  static SettingsFulfillmentProfileList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsFulfillmentProfileList(
      data: readList<SettingsFulfillmentProfile>(
          source['data'], SettingsFulfillmentProfile.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsFulfillmentProfile?>? data;

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
