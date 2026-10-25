/// Typed views over the v4 purchase refunds bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The purchase refunds body.
class PurchaseRefunds extends Dto {
  const PurchaseRefunds({
    this.alternateDate,
    this.amount,
    this.createdBy,
    this.createdOn,
    this.creditNoteId,
    this.customAttributes,
    this.data,
    this.date,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.note,
    this.object,
    this.pagination,
    this.paymentMethod,
    this.paymentProcessor,
    this.reference,
    this.status,
    this.url,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_refunds',
  ];

  static PurchaseRefunds? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseRefunds(
      alternateDate: readText(source['alternate_date']),
      amount: readText(source['amount']),
      createdBy: readText(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNoteId: readText(source['credit_note_id']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      data: readList<PurchaseRefundsData>(
          source['data'], PurchaseRefundsData.fromMap),
      date: readText(source['date']),
      id: readText(source['id']),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      note: readText(source['note']),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      paymentMethod: readText(source['payment_method']),
      paymentProcessor: readText(source['payment_processor']),
      reference: readText(source['reference']),
      status: readText(source['status']),
      url: readText(source['url']),
      uuid: readText(source['uuid']),
      version: readText(source['version']),
    );
  }

  final String? alternateDate;

  final String? amount;

  final String? createdBy;

  final String? createdOn;

  final String? creditNoteId;

  final List<Object?>? customAttributes;

  final List<PurchaseRefundsData?>? data;

  final String? date;

  final String? id;

  final String? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? note;

  final String? object;

  final Pagination? pagination;

  final String? paymentMethod;

  final String? paymentProcessor;

  final String? reference;

  final String? status;

  final String? url;

  final String? uuid;

  final String? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'alternate_date': alternateDate,
        'amount': amount,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note_id': creditNoteId,
        'custom_attributes': customAttributes,
        'data': data,
        'date': date,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'note': note,
        'object': object,
        'pagination': pagination,
        'payment_method': paymentMethod,
        'payment_processor': paymentProcessor,
        'reference': reference,
        'status': status,
        'url': url,
        'uuid': uuid,
        'version': version,
      };
}

/// The purchase refund body.
class PurchaseRefund extends Dto {
  const PurchaseRefund({
    this.account,
    this.alternateDate,
    this.amount,
    this.createdBy,
    this.createdOn,
    this.creditNote,
    this.creditNoteId,
    this.customAttributes,
    this.date,
    this.id,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.note,
    this.object,
    this.paymentMethod,
    this.paymentProcessor,
    this.purchaseRefund,
    this.reference,
    this.status,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_refunds/{purchase_refund_id}',
  ];

  static PurchaseRefund? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_refund');
    if (source == null) return null;
    return PurchaseRefund(
      account: PurchaseRefundAccount.fromMap(source['account']),
      alternateDate: readText(source['alternate_date']),
      amount: readText(source['amount']),
      createdBy: PurchaseRefundCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNote: PurchaseRefundCreditNote.fromMap(source['credit_note']),
      creditNoteId: readText(source['credit_note_id']),
      customAttributes: readList<PurchaseRefundCustomAttribute>(
          source['custom_attributes'], PurchaseRefundCustomAttribute.fromMap),
      date: readText(source['date']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      note: readText(source['note']),
      object: readText(source['object']),
      paymentMethod: readText(source['payment_method']),
      paymentProcessor: readText(source['payment_processor']),
      purchaseRefund: readAny(source['purchase_refund']),
      reference: readText(source['reference']),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final PurchaseRefundAccount? account;

  final String? alternateDate;

  final String? amount;

  final PurchaseRefundCreatedBy? createdBy;

  final String? createdOn;

  final PurchaseRefundCreditNote? creditNote;

  final String? creditNoteId;

  final List<PurchaseRefundCustomAttribute?>? customAttributes;

  final String? date;

  final String? id;

  final String? issueDate;

  final String? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? note;

  final String? object;

  final String? paymentMethod;

  final String? paymentProcessor;

  /// Untyped: never populated in the records measured.
  final Object? purchaseRefund;

  final String? reference;

  final String? status;

  final String? uuid;

  final int? version;

  @override
  String? get envelopeKey => 'purchase_refund';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'alternate_date': alternateDate,
        'amount': amount,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note': creditNote,
        'credit_note_id': creditNoteId,
        'custom_attributes': customAttributes,
        'date': date,
        'id': id,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'note': note,
        'object': object,
        'payment_method': paymentMethod,
        'payment_processor': paymentProcessor,
        'purchase_refund': purchaseRefund,
        'reference': reference,
        'status': status,
        'uuid': uuid,
        'version': version,
      };
}

/// The account purchase refunds body.
class AccountPurchaseRefunds extends Dto {
  const AccountPurchaseRefunds({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/purchase_refunds',
  ];

  static AccountPurchaseRefunds? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseRefunds(
      data: readList<AccountPurchaseRefundsData>(
          source['data'], AccountPurchaseRefundsData.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<AccountPurchaseRefundsData?>? data;

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

/// One entry of a [AccountPurchaseRefunds]'s `data`.
class AccountPurchaseRefundsData extends Dto {
  const AccountPurchaseRefundsData({
    this.account,
    this.amount,
    this.createdBy,
    this.createdOn,
    this.creditNote,
    this.customAttributes,
    this.id,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.note,
    this.object,
    this.paymentMethod,
    this.paymentProcessor,
    this.reference,
    this.status,
    this.uuid,
    this.version,
  });

  static AccountPurchaseRefundsData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseRefundsData(
      account: AccountPurchaseRefundsDataAccount.fromMap(source['account']),
      amount: readText(source['amount']),
      createdBy:
          AccountPurchaseRefundsDataCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNote:
          AccountPurchaseRefundsDataCreditNote.fromMap(source['credit_note']),
      customAttributes: readList<AccountPurchaseRefundsDataCustomAttribute>(
          source['custom_attributes'],
          AccountPurchaseRefundsDataCustomAttribute.fromMap),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      note: readText(source['note']),
      object: readText(source['object']),
      paymentMethod: readText(source['payment_method']),
      paymentProcessor: readText(source['payment_processor']),
      reference: readText(source['reference']),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final AccountPurchaseRefundsDataAccount? account;

  final String? amount;

  final AccountPurchaseRefundsDataCreatedBy? createdBy;

  final String? createdOn;

  final AccountPurchaseRefundsDataCreditNote? creditNote;

  final List<AccountPurchaseRefundsDataCustomAttribute?>? customAttributes;

  final String? id;

  final String? issueDate;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final String? note;

  final String? object;

  final String? paymentMethod;

  final String? paymentProcessor;

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
        'id': id,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'note': note,
        'object': object,
        'payment_method': paymentMethod,
        'payment_processor': paymentProcessor,
        'reference': reference,
        'status': status,
        'uuid': uuid,
        'version': version,
      };
}

/// One entry of a [PurchaseRefunds]'s `data`.
class PurchaseRefundsData extends Dto {
  const PurchaseRefundsData({
    this.account,
    this.amount,
    this.createdBy,
    this.createdOn,
    this.creditNote,
    this.customAttributes,
    this.id,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.note,
    this.object,
    this.paymentMethod,
    this.paymentProcessor,
    this.reference,
    this.status,
    this.uuid,
    this.version,
  });

  static PurchaseRefundsData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseRefundsData(
      account: PurchaseRefundsDataAccount.fromMap(source['account']),
      amount: readText(source['amount']),
      createdBy: PurchaseRefundsDataCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNote: PurchaseRefundsDataCreditNote.fromMap(source['credit_note']),
      customAttributes: readList<PurchaseRefundsDataCustomAttribute>(
          source['custom_attributes'],
          PurchaseRefundsDataCustomAttribute.fromMap),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      note: readText(source['note']),
      object: readText(source['object']),
      paymentMethod: readText(source['payment_method']),
      paymentProcessor: readText(source['payment_processor']),
      reference: readText(source['reference']),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final PurchaseRefundsDataAccount? account;

  final String? amount;

  final PurchaseRefundsDataCreatedBy? createdBy;

  final String? createdOn;

  final PurchaseRefundsDataCreditNote? creditNote;

  final List<PurchaseRefundsDataCustomAttribute?>? customAttributes;

  final String? id;

  final String? issueDate;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final String? note;

  final String? object;

  final String? paymentMethod;

  final String? paymentProcessor;

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
        'id': id,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'note': note,
        'object': object,
        'payment_method': paymentMethod,
        'payment_processor': paymentProcessor,
        'reference': reference,
        'status': status,
        'uuid': uuid,
        'version': version,
      };
}

/// A [PurchaseRefund]'s `account`.
class PurchaseRefundAccount extends Dto {
  const PurchaseRefundAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseRefundAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseRefundAccount(
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

/// A [PurchaseRefund]'s `credit_note`.
class PurchaseRefundCreditNote extends Dto {
  const PurchaseRefundCreditNote({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseRefundCreditNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseRefundCreditNote(
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

/// One entry of a [PurchaseRefund]'s `custom_attributes`.
class PurchaseRefundCustomAttribute extends Dto {
  const PurchaseRefundCustomAttribute({
    this.href,
    this.id,
    this.name,
    this.object,
    this.type,
    this.value,
  });

  static PurchaseRefundCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseRefundCustomAttribute(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      type: readText(source['type']),
      value: readText(source['value']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? type;

  final String? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'type': type,
        'value': value,
      };
}

/// A [PurchaseRefund]'s `created_by`.
class PurchaseRefundCreatedBy extends Dto {
  const PurchaseRefundCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseRefundCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseRefundCreatedBy(
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

/// A [AccountPurchaseRefundsData]'s `account`.
class AccountPurchaseRefundsDataAccount extends Dto {
  const AccountPurchaseRefundsDataAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountPurchaseRefundsDataAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseRefundsDataAccount(
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

/// A [AccountPurchaseRefundsData]'s `credit_note`.
class AccountPurchaseRefundsDataCreditNote extends Dto {
  const AccountPurchaseRefundsDataCreditNote({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountPurchaseRefundsDataCreditNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseRefundsDataCreditNote(
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

/// One entry of a [AccountPurchaseRefundsData]'s `custom_attributes`.
class AccountPurchaseRefundsDataCustomAttribute extends Dto {
  const AccountPurchaseRefundsDataCustomAttribute({
    this.href,
    this.id,
    this.name,
    this.object,
    this.type,
    this.value,
  });

  static AccountPurchaseRefundsDataCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseRefundsDataCustomAttribute(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      type: readText(source['type']),
      value: readText(source['value']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? type;

  final String? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'type': type,
        'value': value,
      };
}

/// A [AccountPurchaseRefundsData]'s `created_by`.
class AccountPurchaseRefundsDataCreatedBy extends Dto {
  const AccountPurchaseRefundsDataCreatedBy({
    this.name,
    this.object,
  });

  static AccountPurchaseRefundsDataCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPurchaseRefundsDataCreatedBy(
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

/// A [PurchaseRefundsData]'s `account`.
class PurchaseRefundsDataAccount extends Dto {
  const PurchaseRefundsDataAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseRefundsDataAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseRefundsDataAccount(
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

/// A [PurchaseRefundsData]'s `credit_note`.
class PurchaseRefundsDataCreditNote extends Dto {
  const PurchaseRefundsDataCreditNote({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseRefundsDataCreditNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseRefundsDataCreditNote(
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

/// One entry of a [PurchaseRefundsData]'s `custom_attributes`.
class PurchaseRefundsDataCustomAttribute extends Dto {
  const PurchaseRefundsDataCustomAttribute({
    this.href,
    this.id,
    this.name,
    this.object,
    this.type,
    this.value,
  });

  static PurchaseRefundsDataCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseRefundsDataCustomAttribute(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      type: readText(source['type']),
      value: readText(source['value']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? type;

  final String? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'type': type,
        'value': value,
      };
}

/// A [PurchaseRefundsData]'s `created_by`.
class PurchaseRefundsDataCreatedBy extends Dto {
  const PurchaseRefundsDataCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseRefundsDataCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseRefundsDataCreatedBy(
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
