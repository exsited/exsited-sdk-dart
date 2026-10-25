/// Typed views over the v4 purchase credit note applications bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The purchase credit note application body.
class PurchaseCreditNoteApplication extends Dto {
  const PurchaseCreditNoteApplication({
    this.amount,
    this.createdBy,
    this.createdOn,
    this.creditNoteId,
    this.date,
    this.href,
    this.id,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.paymentId,
    this.purchaseCreditNote,
    this.purchasePayment,
    this.remainingBalance,
    this.status,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_credit_note_applications',
  ];

  static PurchaseCreditNoteApplication? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteApplication(
      amount: readText(source['amount']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNoteId: readText(source['credit_note_id']),
      date: readText(source['date']),
      href: readText(source['href']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      paymentId: readText(source['payment_id']),
      purchaseCreditNote:
          PurchaseCreditNoteApplicationPurchaseCreditNote.fromMap(
              source['purchase_credit_note']),
      purchasePayment: PurchaseCreditNoteApplicationPurchasePayment.fromMap(
          source['purchase_payment']),
      remainingBalance: readText(source['remaining_balance']),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
      version: readAny(source['version']),
    );
  }

  final String? amount;

  /// Untyped: a String on some records and a map on others.
  final Object? createdBy;

  final String? createdOn;

  final String? creditNoteId;

  final String? date;

  final String? href;

  final String? id;

  final String? issueDate;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? paymentId;

  final PurchaseCreditNoteApplicationPurchaseCreditNote? purchaseCreditNote;

  final PurchaseCreditNoteApplicationPurchasePayment? purchasePayment;

  final String? remainingBalance;

  final String? status;

  final String? uuid;

  /// Untyped: a String on some records and an int on others.
  final Object? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note_id': creditNoteId,
        'date': date,
        'href': href,
        'id': id,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'payment_id': paymentId,
        'purchase_credit_note': purchaseCreditNote,
        'purchase_payment': purchasePayment,
        'remaining_balance': remainingBalance,
        'status': status,
        'uuid': uuid,
        'version': version,
      };
}

/// A page of PurchaseCreditNoteApplication records.
class PurchaseCreditNoteApplicationList extends Dto {
  const PurchaseCreditNoteApplicationList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_credit_note_applications',
  ];

  static PurchaseCreditNoteApplicationList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteApplicationList(
      data: readList<PurchaseCreditNoteApplication>(
          source['data'], PurchaseCreditNoteApplication.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchaseCreditNoteApplication?>? data;

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

/// The purchase credit note application read body.
class PurchaseCreditNoteApplicationRead extends Dto {
  const PurchaseCreditNoteApplicationRead({
    this.amount,
    this.createdBy,
    this.createdOn,
    this.href,
    this.id,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.purchaseCreditNote,
    this.purchasePayment,
    this.remainingBalance,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_credit_note_applications/{purchase_credit_note_application_id}',
  ];

  static PurchaseCreditNoteApplicationRead? fromMap(Object? body) {
    final source =
        readRecord(body, envelopeKey: 'purchase_credit_note_application');
    if (source == null) return null;
    return PurchaseCreditNoteApplicationRead(
      amount: readText(source['amount']),
      createdBy: PurchaseCreditNoteApplicationReadCreatedBy.fromMap(
          source['created_by']),
      createdOn: readText(source['created_on']),
      href: readText(source['href']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      purchaseCreditNote:
          PurchaseCreditNoteApplicationReadPurchaseCreditNote.fromMap(
              source['purchase_credit_note']),
      purchasePayment: PurchaseCreditNoteApplicationReadPurchasePayment.fromMap(
          source['purchase_payment']),
      remainingBalance: readText(source['remaining_balance']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final String? amount;

  final PurchaseCreditNoteApplicationReadCreatedBy? createdBy;

  final String? createdOn;

  final String? href;

  final String? id;

  final String? issueDate;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final PurchaseCreditNoteApplicationReadPurchaseCreditNote? purchaseCreditNote;

  final PurchaseCreditNoteApplicationReadPurchasePayment? purchasePayment;

  final String? remainingBalance;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'purchase_credit_note_application';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'created_by': createdBy,
        'created_on': createdOn,
        'href': href,
        'id': id,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'purchase_credit_note': purchaseCreditNote,
        'purchase_payment': purchasePayment,
        'remaining_balance': remainingBalance,
        'status': status,
        'version': version,
      };
}

/// A [PurchaseCreditNoteApplicationRead]'s `purchase_credit_note`.
class PurchaseCreditNoteApplicationReadPurchaseCreditNote extends Dto {
  const PurchaseCreditNoteApplicationReadPurchaseCreditNote({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseCreditNoteApplicationReadPurchaseCreditNote? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteApplicationReadPurchaseCreditNote(
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

/// A [PurchaseCreditNoteApplicationRead]'s `purchase_payment`.
class PurchaseCreditNoteApplicationReadPurchasePayment extends Dto {
  const PurchaseCreditNoteApplicationReadPurchasePayment({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseCreditNoteApplicationReadPurchasePayment? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteApplicationReadPurchasePayment(
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

/// A [PurchaseCreditNoteApplicationRead]'s `created_by`.
class PurchaseCreditNoteApplicationReadCreatedBy extends Dto {
  const PurchaseCreditNoteApplicationReadCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseCreditNoteApplicationReadCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteApplicationReadCreatedBy(
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

/// A [PurchaseCreditNoteApplication]'s `purchase_credit_note`.
class PurchaseCreditNoteApplicationPurchaseCreditNote extends Dto {
  const PurchaseCreditNoteApplicationPurchaseCreditNote({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseCreditNoteApplicationPurchaseCreditNote? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteApplicationPurchaseCreditNote(
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

/// A [PurchaseCreditNoteApplication]'s `purchase_payment`.
class PurchaseCreditNoteApplicationPurchasePayment extends Dto {
  const PurchaseCreditNoteApplicationPurchasePayment({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseCreditNoteApplicationPurchasePayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteApplicationPurchasePayment(
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
