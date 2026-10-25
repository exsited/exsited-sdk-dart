/// Typed views over the v4 refunds bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The refund body.
class Refund extends Dto {
  const Refund({
    this.account,
    this.amount,
    this.createdBy,
    this.createdOn,
    this.creditNote,
    this.customAttributes,
    this.gatewayResponse,
    this.id,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.note,
    this.object,
    this.paymentMethod,
    this.paymentProcessor,
    this.reconcileStatus,
    this.reference,
    this.status,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/refunds',
    'GET /api/{api_version}/refunds/{refund_id}',
  ];

  static Refund? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'refund');
    if (source == null) return null;
    return Refund(
      account: RefundAccount.fromMap(source['account']),
      amount: readText(source['amount']),
      createdBy: readText(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNote: RefundCreditNote.fromMap(source['credit_note']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      gatewayResponse: readAny(source['gateway_response']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      note: readAny(source['note']),
      object: readText(source['object']),
      paymentMethod: readText(source['payment_method']),
      paymentProcessor: readText(source['payment_processor']),
      reconcileStatus: readText(source['reconcile_status']),
      reference: readText(source['reference']),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final RefundAccount? account;

  final String? amount;

  final String? createdBy;

  final String? createdOn;

  final RefundCreditNote? creditNote;

  final List<Object?>? customAttributes;

  /// Untyped: never populated in the records measured.
  final Object? gatewayResponse;

  final String? id;

  final String? issueDate;

  final String? lastUpdatedBy;

  final String? lastUpdatedOn;

  /// Untyped: never populated in the records measured.
  final Object? note;

  final String? object;

  final String? paymentMethod;

  final String? paymentProcessor;

  final String? reconcileStatus;

  final String? reference;

  final String? status;

  final String? uuid;

  final int? version;

  @override
  String? get envelopeKey => 'refund';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'amount': amount,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note': creditNote,
        'custom_attributes': customAttributes,
        'gateway_response': gatewayResponse,
        'id': id,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'note': note,
        'object': object,
        'payment_method': paymentMethod,
        'payment_processor': paymentProcessor,
        'reconcile_status': reconcileStatus,
        'reference': reference,
        'status': status,
        'uuid': uuid,
        'version': version,
      };
}

/// A page of Refund records.
class RefundList extends Dto {
  const RefundList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/refunds',
  ];

  static RefundList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RefundList(
      data: readList<Refund>(source['data'], Refund.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Refund?>? data;

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

/// The refund updated body.
class RefundUpdated extends Dto {
  const RefundUpdated({
    this.account,
    this.amount,
    this.createdBy,
    this.createdOn,
    this.creditNote,
    this.creditNoteId,
    this.customAttributes,
    this.gatewayResponse,
    this.id,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.note,
    this.object,
    this.paymentMethod,
    this.paymentProcessor,
    this.reconcileStatus,
    this.reference,
    this.status,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/credit_notes/{credit_note_id}/refunds',
    'PATCH /api/{api_version}/refunds/{refund_id}',
  ];

  static RefundUpdated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'refund');
    if (source == null) return null;
    return RefundUpdated(
      account: RefundUpdatedAccount.fromMap(source['account']),
      amount: readText(source['amount']),
      createdBy: readText(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNote: RefundUpdatedCreditNote.fromMap(source['credit_note']),
      creditNoteId: readText(source['credit_note_id']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      gatewayResponse: readText(source['gateway_response']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      note: readText(source['note']),
      object: readText(source['object']),
      paymentMethod: readText(source['payment_method']),
      paymentProcessor: readText(source['payment_processor']),
      reconcileStatus: readText(source['reconcile_status']),
      reference: readText(source['reference']),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final RefundUpdatedAccount? account;

  final String? amount;

  final String? createdBy;

  final String? createdOn;

  final RefundUpdatedCreditNote? creditNote;

  final String? creditNoteId;

  final List<Object?>? customAttributes;

  final String? gatewayResponse;

  final String? id;

  final String? issueDate;

  final String? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? note;

  final String? object;

  final String? paymentMethod;

  final String? paymentProcessor;

  final String? reconcileStatus;

  final String? reference;

  final String? status;

  final String? uuid;

  final int? version;

  @override
  String? get envelopeKey => 'refund';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'amount': amount,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note': creditNote,
        'credit_note_id': creditNoteId,
        'custom_attributes': customAttributes,
        'gateway_response': gatewayResponse,
        'id': id,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'note': note,
        'object': object,
        'payment_method': paymentMethod,
        'payment_processor': paymentProcessor,
        'reconcile_status': reconcileStatus,
        'reference': reference,
        'status': status,
        'uuid': uuid,
        'version': version,
      };
}

/// The account refunds body.
class AccountRefunds extends Dto {
  const AccountRefunds({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/refunds',
  ];

  static AccountRefunds? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountRefunds(
      data: readList<AccountRefundsData>(
          source['data'], AccountRefundsData.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<AccountRefundsData?>? data;

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

/// One entry of a [AccountRefunds]'s `data`.
class AccountRefundsData extends Dto {
  const AccountRefundsData({
    this.account,
    this.amount,
    this.createdBy,
    this.createdOn,
    this.creditNote,
    this.customAttributes,
    this.gatewayResponse,
    this.id,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.note,
    this.object,
    this.paymentMethod,
    this.paymentProcessor,
    this.reconcileStatus,
    this.reference,
    this.status,
    this.uuid,
    this.version,
  });

  static AccountRefundsData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountRefundsData(
      account: AccountRefundsDataAccount.fromMap(source['account']),
      amount: readText(source['amount']),
      createdBy: readText(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNote: AccountRefundsDataCreditNote.fromMap(source['credit_note']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      gatewayResponse: readAny(source['gateway_response']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      note: readAny(source['note']),
      object: readText(source['object']),
      paymentMethod: readText(source['payment_method']),
      paymentProcessor: readText(source['payment_processor']),
      reconcileStatus: readText(source['reconcile_status']),
      reference: readText(source['reference']),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final AccountRefundsDataAccount? account;

  final String? amount;

  final String? createdBy;

  final String? createdOn;

  final AccountRefundsDataCreditNote? creditNote;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? customAttributes;

  /// Untyped: null in every record measured.
  final Object? gatewayResponse;

  final String? id;

  final String? issueDate;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  /// Untyped: null in every record measured.
  final Object? note;

  final String? object;

  final String? paymentMethod;

  final String? paymentProcessor;

  final String? reconcileStatus;

  final String? reference;

  final String? status;

  final String? uuid;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'amount': amount,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note': creditNote,
        'custom_attributes': customAttributes,
        'gateway_response': gatewayResponse,
        'id': id,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'note': note,
        'object': object,
        'payment_method': paymentMethod,
        'payment_processor': paymentProcessor,
        'reconcile_status': reconcileStatus,
        'reference': reference,
        'status': status,
        'uuid': uuid,
        'version': version,
      };
}

/// A [Refund]'s `account`.
class RefundAccount extends Dto {
  const RefundAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static RefundAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RefundAccount(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [Refund]'s `credit_note`.
class RefundCreditNote extends Dto {
  const RefundCreditNote({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static RefundCreditNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RefundCreditNote(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [RefundUpdated]'s `account`.
class RefundUpdatedAccount extends Dto {
  const RefundUpdatedAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static RefundUpdatedAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RefundUpdatedAccount(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [RefundUpdated]'s `credit_note`.
class RefundUpdatedCreditNote extends Dto {
  const RefundUpdatedCreditNote({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static RefundUpdatedCreditNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RefundUpdatedCreditNote(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [AccountRefundsData]'s `account`.
class AccountRefundsDataAccount extends Dto {
  const AccountRefundsDataAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountRefundsDataAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountRefundsDataAccount(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [AccountRefundsData]'s `credit_note`.
class AccountRefundsDataCreditNote extends Dto {
  const AccountRefundsDataCreditNote({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountRefundsDataCreditNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountRefundsDataCreditNote(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// One note on a refund, under `note`.
class RefundNote extends Dto {
  const RefundNote({
    this.attachments,
    this.content,
    this.createdBy,
    this.createdOn,
    this.group,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.refund,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/refunds/{refund_id}/notes',
    'GET /api/{api_version}/refunds/{refund_id}/notes',
    'GET /api/{api_version}/refunds/{refund_id}/notes/{note_id}',
  ];

  static RefundNote? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return RefundNote(
      attachments: readList<RefundNoteAttachment>(
          source['attachments'], RefundNoteAttachment.fromMap),
      content: readText(source['content']),
      createdBy: RefundNoteCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      refund: RefundNoteDetail.fromMap(source['refund']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<RefundNoteWatcher>(
          source['watchers'], RefundNoteWatcher.fromMap),
    );
  }

  final List<RefundNoteAttachment?>? attachments;

  final String? content;

  final RefundNoteCreatedBy? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? group;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedOn;

  final String? object;

  final RefundNoteDetail? refund;

  /// Null in every record measured, so untyped.
  final Object? user;

  final int? version;

  final List<RefundNoteWatcher?>? watchers;

  @override
  String? get envelopeKey => 'note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'attachments': attachments,
        'content': content,
        'created_by': createdBy,
        'created_on': createdOn,
        'group': group,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'refund': refund,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// One page of `RefundNote` records, under `data`.
class RefundNoteList extends Dto {
  const RefundNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/refunds/{refund_id}/notes',
  ];

  static RefundNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RefundNoteList(
      data: readList<RefundNote>(source['data'], RefundNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<RefundNote?>? data;

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

/// One attachment's descriptor, under `file`.
class RefundNoteFile extends Dto {
  const RefundNoteFile({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/refunds/{refund_id}/notes/{note_id}/files/{file_id}',
  ];

  static RefundNoteFile? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'file');
    if (source == null) return null;
    return RefundNoteFile(
      contentType: readText(source['content_type']),
      filename: readText(source['filename']),
      href: readText(source['href']),
      size: readInteger(source['size']),
      uuid: readText(source['uuid']),
    );
  }

  final String? contentType;

  final String? filename;

  final String? href;

  final int? size;

  final String? uuid;

  @override
  String? get envelopeKey => 'file';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'content_type': contentType,
        'filename': filename,
        'href': href,
        'size': size,
        'uuid': uuid,
      };
}

/// A [RefundNote]'s `refund`.
class RefundNoteDetail extends Dto {
  const RefundNoteDetail({
    this.href,
    this.id,
    this.object,
  });

  static RefundNoteDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RefundNoteDetail(
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'object': object,
      };
}

/// One entry of a [RefundNote]'s `attachments`.
class RefundNoteAttachment extends Dto {
  const RefundNoteAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static RefundNoteAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RefundNoteAttachment(
      contentType: readText(source['content_type']),
      filename: readText(source['filename']),
      href: readText(source['href']),
      size: readInteger(source['size']),
      uuid: readText(source['uuid']),
    );
  }

  final String? contentType;

  final String? filename;

  final String? href;

  final int? size;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'content_type': contentType,
        'filename': filename,
        'href': href,
        'size': size,
        'uuid': uuid,
      };
}

/// One entry of a [RefundNote]'s `watchers`.
class RefundNoteWatcher extends Dto {
  const RefundNoteWatcher({
    this.email,
    this.name,
    this.type,
  });

  static RefundNoteWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RefundNoteWatcher(
      email: readAny(source['email']),
      name: readText(source['name']),
      type: readText(source['type']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? email;

  final String? name;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'email': email,
        'name': name,
        'type': type,
      };
}

/// A [RefundNote]'s `created_by`.
class RefundNoteCreatedBy extends Dto {
  const RefundNoteCreatedBy({
    this.name,
    this.object,
  });

  static RefundNoteCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RefundNoteCreatedBy(
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'object': object,
      };
}
