/// Typed views over the v4 email templates bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings email template body, under `email_template`.
class SettingsEmailTemplate extends Dto {
  const SettingsEmailTemplate({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.entity,
    this.href,
    this.id,
    this.isEdited,
    this.isSystemTemplate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.replyAddress,
    this.richEditor,
    this.senderAddress,
    this.senderName,
    this.status,
    this.subject,
    this.trackEmailOpen,
    this.trackLinkClick,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/email_templates',
    'GET /api/{api_version}/settings/email_templates/{email_template_id}',
    'POST /api/{api_version}/settings/email_templates',
    'PATCH /api/{api_version}/settings/email_templates/{email_template_id}',
  ];

  static SettingsEmailTemplate? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'email_template');
    if (source == null) return null;
    return SettingsEmailTemplate(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      entity: readAny(source['entity']),
      href: readText(source['href']),
      id: readText(source['id']),
      isEdited: readFlag(source['is_edited']),
      isSystemTemplate: readFlag(source['is_system_template']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      replyAddress: readAny(source['reply_address']),
      richEditor: readFlag(source['rich_editor']),
      senderAddress: readAny(source['sender_address']),
      senderName: readAny(source['sender_name']),
      status: readText(source['status']),
      subject: readText(source['subject']),
      trackEmailOpen: readFlag(source['track_email_open']),
      trackLinkClick: readFlag(source['track_link_click']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  /// Null in every record measured, so untyped.
  final Object? entity;

  final String? href;

  final String? id;

  final bool? isEdited;

  final bool? isSystemTemplate;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  /// Null in every record measured, so untyped.
  final Object? replyAddress;

  final bool? richEditor;

  /// Null in every record measured, so untyped.
  final Object? senderAddress;

  /// Null in every record measured, so untyped.
  final Object? senderName;

  final String? status;

  final String? subject;

  final bool? trackEmailOpen;

  final bool? trackLinkClick;

  @override
  String? get envelopeKey => 'email_template';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'entity': entity,
        'href': href,
        'id': id,
        'is_edited': isEdited,
        'is_system_template': isSystemTemplate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'reply_address': replyAddress,
        'rich_editor': richEditor,
        'sender_address': senderAddress,
        'sender_name': senderName,
        'status': status,
        'subject': subject,
        'track_email_open': trackEmailOpen,
        'track_link_click': trackLinkClick,
      };
}

/// One page of `SettingsEmailTemplate` records, under `data`.
class SettingsEmailTemplateList extends Dto {
  const SettingsEmailTemplateList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/email_templates',
  ];

  static SettingsEmailTemplateList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsEmailTemplateList(
      data: readList<SettingsEmailTemplate>(
          source['data'], SettingsEmailTemplate.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsEmailTemplate?>? data;

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
