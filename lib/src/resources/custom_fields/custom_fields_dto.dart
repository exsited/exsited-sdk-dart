/// Typed views over the v4 custom fields bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings custom field body, under `custom_field`.
class SettingsCustomField extends Dto {
  const SettingsCustomField({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.isMandatory,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
    this.type,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/custom_fields',
    'GET /api/{api_version}/settings/custom_fields/{custom_field_id}',
  ];

  static SettingsCustomField? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_field');
    if (source == null) return null;
    return SettingsCustomField(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      isMandatory: readFlag(source['is_mandatory']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
      type: readText(source['type']),
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

  final bool? isMandatory;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  final String? type;

  final int? version;

  @override
  String? get envelopeKey => 'custom_field';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'is_mandatory': isMandatory,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
        'type': type,
        'version': version,
      };
}

/// One page of `SettingsCustomField` records, under `data`.
class SettingsCustomFieldList extends Dto {
  const SettingsCustomFieldList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/custom_fields',
  ];

  static SettingsCustomFieldList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsCustomFieldList(
      data: readList<SettingsCustomField>(
          source['data'], SettingsCustomField.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsCustomField?>? data;

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
