/// Typed views over the v4 approvals bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The approvals account body.
class ApprovalsAccount extends Dto {
  const ApprovalsAccount({
    this.createdOn,
    this.description,
    this.displayName,
    this.entity,
    this.event,
    this.href,
    this.id,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/approvals/account',
  ];

  static ApprovalsAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ApprovalsAccount(
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      entity: readText(source['entity']),
      event: readText(source['event']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
    );
  }

  final String? createdOn;

  /// Untyped: never populated in the records measured.
  final Object? description;

  final String? displayName;

  final String? entity;

  final String? event;

  final String? href;

  final String? id;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'entity': entity,
        'event': event,
        'href': href,
        'id': id,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
      };
}

/// A page of ApprovalsAccount records.
class ApprovalsAccountList extends Dto {
  const ApprovalsAccountList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/approvals/account',
  ];

  static ApprovalsAccountList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ApprovalsAccountList(
      data:
          readList<ApprovalsAccount>(source['data'], ApprovalsAccount.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<ApprovalsAccount?>? data;

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

/// The approvals saleorder body.
class ApprovalsSaleorder extends Dto {
  const ApprovalsSaleorder({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/approvals/saleOrder',
  ];

  static ApprovalsSaleorder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ApprovalsSaleorder(
      data: readList<Object>(source['data'], readAny),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Object?>? data;

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
