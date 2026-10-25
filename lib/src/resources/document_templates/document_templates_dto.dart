/// Typed views over the v4 document templates bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings document template body, under `document_template`.
class SettingsDocumentTemplate extends Dto {
  const SettingsDocumentTemplate({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.isCustomTemplate,
    this.isDefault,
    this.isEdited,
    this.isSystemTemplate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
    this.type,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/document_templates',
    'GET /api/{api_version}/settings/document_templates/{document_template_id}',
    'POST /api/{api_version}/settings/document_templates',
    'PATCH /api/{api_version}/settings/document_templates/{document_template_id}',
  ];

  static SettingsDocumentTemplate? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'document_template');
    if (source == null) return null;
    return SettingsDocumentTemplate(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      isCustomTemplate: readFlag(source['is_custom_template']),
      isDefault: readFlag(source['is_default']),
      isEdited: readFlag(source['is_edited']),
      isSystemTemplate: readFlag(source['is_system_template']),
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

  final bool? isCustomTemplate;

  final bool? isDefault;

  final bool? isEdited;

  final bool? isSystemTemplate;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  final String? type;

  final int? version;

  @override
  String? get envelopeKey => 'document_template';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'is_custom_template': isCustomTemplate,
        'is_default': isDefault,
        'is_edited': isEdited,
        'is_system_template': isSystemTemplate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
        'type': type,
        'version': version,
      };
}

/// One page of `SettingsDocumentTemplate` records, under `data`.
class SettingsDocumentTemplateList extends Dto {
  const SettingsDocumentTemplateList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/document_templates',
  ];

  static SettingsDocumentTemplateList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsDocumentTemplateList(
      data: readList<SettingsDocumentTemplate>(
          source['data'], SettingsDocumentTemplate.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsDocumentTemplate?>? data;

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
