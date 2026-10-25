/// Typed views over the v4 account emails bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The account communications email body.
class AccountCommunicationsEmail extends Dto {
  const AccountCommunicationsEmail({
    this.additionalTemplate,
    this.attachments,
    this.bcc,
    this.body,
    this.cc,
    this.createdBy,
    this.createdOn,
    this.from,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.mailType,
    this.messageType,
    this.object,
    this.status,
    this.subject,
    this.to,
    this.uuid,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/communications/emails',
    'GET /api/{api_version}/accounts/{account_id}/communications/emails/{email_uuid}',
    'GET /api/{api_version}/accounts/{account_id}/communications/emails/{email_id}',
  ];

  static AccountCommunicationsEmail? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'email');
    if (source == null) return null;
    return AccountCommunicationsEmail(
      additionalTemplate: readAny(source['additional_template']),
      attachments: readList<AccountCommunicationsEmailAttachment>(
          source['attachments'], AccountCommunicationsEmailAttachment.fromMap),
      bcc: readList<Object>(source['bcc'], readAny),
      body: readAny(source['body']),
      cc: readList<Object>(source['cc'], readAny),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      from: readAny(source['from']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      mailType: readText(source['mail_type']),
      messageType: readText(source['message_type']),
      object: readText(source['object']),
      status: readText(source['status']),
      subject: readAny(source['subject']),
      to: readText(source['to']),
      uuid: readText(source['uuid']),
    );
  }

  /// Untyped: never populated in the records measured.
  final Object? additionalTemplate;

  final List<AccountCommunicationsEmailAttachment?>? attachments;

  final List<Object?>? bcc;

  /// Untyped: never populated in the records measured.
  final Object? body;

  final List<Object?>? cc;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  /// Untyped: never populated in the records measured.
  final Object? from;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedOn;

  final String? mailType;

  final String? messageType;

  final String? object;

  final String? status;

  /// Untyped: never populated in the records measured.
  final Object? subject;

  final String? to;

  final String? uuid;

  @override
  String? get envelopeKey => 'email';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'additional_template': additionalTemplate,
        'attachments': attachments,
        'bcc': bcc,
        'body': body,
        'cc': cc,
        'created_by': createdBy,
        'created_on': createdOn,
        'from': from,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'mail_type': mailType,
        'message_type': messageType,
        'object': object,
        'status': status,
        'subject': subject,
        'to': to,
        'uuid': uuid,
      };
}

/// A page of AccountCommunicationsEmail records.
class AccountCommunicationsEmailList extends Dto {
  const AccountCommunicationsEmailList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/communications/emails',
  ];

  static AccountCommunicationsEmailList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCommunicationsEmailList(
      data: readList<AccountCommunicationsEmail>(
          source['data'], AccountCommunicationsEmail.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<AccountCommunicationsEmail?>? data;

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

/// One entry of a [AccountCommunicationsEmail]'s `attachments`.
class AccountCommunicationsEmailAttachment extends Dto {
  const AccountCommunicationsEmailAttachment({
    this.filePath,
    this.name,
    this.path,
    this.size,
    this.type,
  });

  static AccountCommunicationsEmailAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCommunicationsEmailAttachment(
      filePath: readText(source['file_path']),
      name: readText(source['name']),
      path: readText(source['path']),
      size: readInteger(source['size']),
      type: readText(source['type']),
    );
  }

  final String? filePath;

  final String? name;

  final String? path;

  final int? size;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'file_path': filePath,
        'name': name,
        'path': path,
        'size': size,
        'type': type,
      };
}
