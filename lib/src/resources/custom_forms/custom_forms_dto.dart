/// Typed views over the v4 custom forms bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings custom form body, under `custom_form`.
class SettingsCustomForm extends Dto {
  const SettingsCustomForm({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.forDefaultTemplate,
    this.href,
    this.id,
    this.isSystemTemplate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/custom_forms',
    'GET /api/{api_version}/settings/custom_forms/{custom_form_id}',
    'POST /api/{api_version}/settings/custom_forms',
    'PATCH /api/{api_version}/settings/custom_forms/{custom_form_id}',
  ];

  static SettingsCustomForm? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_form');
    if (source == null) return null;
    return SettingsCustomForm(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      forDefaultTemplate: readFlag(source['for_default_template']),
      href: readText(source['href']),
      id: readText(source['id']),
      isSystemTemplate: readFlag(source['is_system_template']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final bool? forDefaultTemplate;

  final String? href;

  final String? id;

  final bool? isSystemTemplate;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  @override
  String? get envelopeKey => 'custom_form';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'for_default_template': forDefaultTemplate,
        'href': href,
        'id': id,
        'is_system_template': isSystemTemplate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
      };
}

/// One page of `SettingsCustomForm` records, under `data`.
class SettingsCustomFormList extends Dto {
  const SettingsCustomFormList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/custom_forms',
  ];

  static SettingsCustomFormList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsCustomFormList(
      data: readList<SettingsCustomForm>(
          source['data'], SettingsCustomForm.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsCustomForm?>? data;

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
