/// Typed views over the v4 countries bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings country body, under `country`.
class SettingsCountry extends Dto {
  const SettingsCountry({
    this.code,
    this.createdBy,
    this.createdOn,
    this.defaultAreaCode,
    this.defaultCity,
    this.defaultPostCode,
    this.defaultState,
    this.description,
    this.displayName,
    this.flagExists,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/countries',
    'GET /api/{api_version}/settings/countries/{country_id}',
    'PATCH /api/{api_version}/settings/countries/{country_id}',
  ];

  static SettingsCountry? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'country');
    if (source == null) return null;
    return SettingsCountry(
      code: readText(source['code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      defaultAreaCode: readAny(source['default_area_code']),
      defaultCity: readText(source['default_city']),
      defaultPostCode: readText(source['default_post_code']),
      defaultState: readText(source['default_state']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      flagExists: readFlag(source['flag_exists']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
    );
  }

  final String? code;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? defaultAreaCode;

  final String? defaultCity;

  final String? defaultPostCode;

  final String? defaultState;

  final String? description;

  final String? displayName;

  final bool? flagExists;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  @override
  String? get envelopeKey => 'country';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'default_area_code': defaultAreaCode,
        'default_city': defaultCity,
        'default_post_code': defaultPostCode,
        'default_state': defaultState,
        'description': description,
        'display_name': displayName,
        'flag_exists': flagExists,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
      };
}

/// One page of `SettingsCountry` records, under `data`.
class SettingsCountryList extends Dto {
  const SettingsCountryList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/countries',
  ];

  static SettingsCountryList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsCountryList(
      data: readList<SettingsCountry>(source['data'], SettingsCountry.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsCountry?>? data;

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
