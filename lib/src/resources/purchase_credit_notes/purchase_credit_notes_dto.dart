/// Typed views over the v4 purchase credit notes bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The purchase credit note body.
class PurchaseCreditNote extends Dto {
  const PurchaseCreditNote({
    this.account,
    this.amount,
    this.code,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customAttributes,
    this.date,
    this.href,
    this.id,
    this.initialAmount,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.paymentId,
    this.purchaseCreditNoteRows,
    this.purchasePayment,
    this.refundAmount,
    this.refundable,
    this.remainingAmount,
    this.remainingBalance,
    this.status,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_credit_notes',
  ];

  static PurchaseCreditNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNote(
      account: PurchaseCreditNoteAccount.fromMap(source['account']),
      amount: readText(source['amount']),
      code: readText(source['code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: PurchaseCreditNoteCurrency.fromMap(source['currency']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      date: readText(source['date']),
      href: readText(source['href']),
      id: readText(source['id']),
      initialAmount: readText(source['initial_amount']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      paymentId: readText(source['payment_id']),
      purchaseCreditNoteRows: readList<PurchaseCreditNotePurchaseCreditNoteRow>(
          source['purchase_credit_note_rows'],
          PurchaseCreditNotePurchaseCreditNoteRow.fromMap),
      purchasePayment:
          PurchaseCreditNotePurchasePayment.fromMap(source['purchase_payment']),
      refundAmount: readText(source['refund_amount']),
      refundable: readAny(source['refundable']),
      remainingAmount: readText(source['remaining_amount']),
      remainingBalance: readText(source['remaining_balance']),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
      version: readAny(source['version']),
    );
  }

  final PurchaseCreditNoteAccount? account;

  final String? amount;

  final String? code;

  /// Untyped: a String on some records and a map on others.
  final Object? createdBy;

  final String? createdOn;

  final PurchaseCreditNoteCurrency? currency;

  final List<Object?>? customAttributes;

  final String? date;

  final String? href;

  final String? id;

  final String? initialAmount;

  final String? issueDate;

  /// Untyped: a String on some records and a map on others.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? paymentId;

  final List<PurchaseCreditNotePurchaseCreditNoteRow?>? purchaseCreditNoteRows;

  final PurchaseCreditNotePurchasePayment? purchasePayment;

  final String? refundAmount;

  /// Untyped: a String on some records and a bool on others.
  final Object? refundable;

  final String? remainingAmount;

  final String? remainingBalance;

  final String? status;

  final String? uuid;

  /// Untyped: a String on some records and an int on others.
  final Object? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'amount': amount,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_attributes': customAttributes,
        'date': date,
        'href': href,
        'id': id,
        'initial_amount': initialAmount,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'payment_id': paymentId,
        'purchase_credit_note_rows': purchaseCreditNoteRows,
        'purchase_payment': purchasePayment,
        'refund_amount': refundAmount,
        'refundable': refundable,
        'remaining_amount': remainingAmount,
        'remaining_balance': remainingBalance,
        'status': status,
        'uuid': uuid,
        'version': version,
      };
}

/// A page of PurchaseCreditNote records.
class PurchaseCreditNoteList extends Dto {
  const PurchaseCreditNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_credit_notes',
  ];

  static PurchaseCreditNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteList(
      data: readList<PurchaseCreditNote>(
          source['data'], PurchaseCreditNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PurchaseCreditNote?>? data;

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

/// The purchase credit note read body.
class PurchaseCreditNoteRead extends Dto {
  const PurchaseCreditNoteRead({
    this.account,
    this.code,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.href,
    this.id,
    this.initialAmount,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.purchaseCreditNoteRows,
    this.purchasePayment,
    this.refundAmount,
    this.refundable,
    this.remainingAmount,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}',
  ];

  static PurchaseCreditNoteRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_credit_note');
    if (source == null) return null;
    return PurchaseCreditNoteRead(
      account: PurchaseCreditNoteReadAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy: PurchaseCreditNoteReadCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: PurchaseCreditNoteReadCurrency.fromMap(source['currency']),
      href: readText(source['href']),
      id: readText(source['id']),
      initialAmount: readText(source['initial_amount']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: PurchaseCreditNoteReadLastUpdatedBy.fromMap(
          source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      purchaseCreditNoteRows:
          readList<PurchaseCreditNoteReadPurchaseCreditNoteRow>(
              source['purchase_credit_note_rows'],
              PurchaseCreditNoteReadPurchaseCreditNoteRow.fromMap),
      purchasePayment: PurchaseCreditNoteReadPurchasePayment.fromMap(
          source['purchase_payment']),
      refundAmount: readText(source['refund_amount']),
      refundable: readFlag(source['refundable']),
      remainingAmount: readText(source['remaining_amount']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final PurchaseCreditNoteReadAccount? account;

  final String? code;

  final PurchaseCreditNoteReadCreatedBy? createdBy;

  final String? createdOn;

  final PurchaseCreditNoteReadCurrency? currency;

  final String? href;

  final String? id;

  final String? initialAmount;

  final String? issueDate;

  final PurchaseCreditNoteReadLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final List<PurchaseCreditNoteReadPurchaseCreditNoteRow?>?
      purchaseCreditNoteRows;

  final PurchaseCreditNoteReadPurchasePayment? purchasePayment;

  final String? refundAmount;

  final bool? refundable;

  final String? remainingAmount;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'purchase_credit_note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'href': href,
        'id': id,
        'initial_amount': initialAmount,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'purchase_credit_note_rows': purchaseCreditNoteRows,
        'purchase_payment': purchasePayment,
        'refund_amount': refundAmount,
        'refundable': refundable,
        'remaining_amount': remainingAmount,
        'status': status,
        'version': version,
      };
}

/// What `updatePurchaseCreditNote` answers, under `purchase_credit_note`.
class PurchaseCreditNoteUpdated extends Dto {
  const PurchaseCreditNoteUpdated({
    this.code,
    this.href,
    this.id,
    this.object,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}',
  ];

  static PurchaseCreditNoteUpdated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_credit_note');
    if (source == null) return null;
    return PurchaseCreditNoteUpdated(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
      status: PurchaseCreditNoteUpdatedStatus.fromMap(source['status']),
      version: readInteger(source['version']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? object;

  final PurchaseCreditNoteUpdatedStatus? status;

  final int? version;

  @override
  String? get envelopeKey => 'purchase_credit_note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'object': object,
        'status': status,
        'version': version,
      };
}

/// A [PurchaseCreditNoteRead]'s `account`.
class PurchaseCreditNoteReadAccount extends Dto {
  const PurchaseCreditNoteReadAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseCreditNoteReadAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteReadAccount(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [PurchaseCreditNoteRead]'s `currency`.
class PurchaseCreditNoteReadCurrency extends Dto {
  const PurchaseCreditNoteReadCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseCreditNoteReadCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteReadCurrency(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [PurchaseCreditNoteRead]'s `purchase_payment`.
class PurchaseCreditNoteReadPurchasePayment extends Dto {
  const PurchaseCreditNoteReadPurchasePayment({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static PurchaseCreditNoteReadPurchasePayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteReadPurchasePayment(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'object': object,
      };
}

/// One entry of a [PurchaseCreditNoteRead]'s `purchase_credit_note_rows`.
class PurchaseCreditNoteReadPurchaseCreditNoteRow extends Dto {
  const PurchaseCreditNoteReadPurchaseCreditNoteRow({
    this.creditNoteFromBlankMethod,
    this.creditNoteFromCreditNote,
    this.creditNoteFromPaymentMethod,
    this.creditNoteTotal,
    this.paymentMethod,
    this.paymentProcessor,
    this.refundFromBlankMethod,
    this.refundFromCreditNote,
    this.refundFromPaymentMethod,
    this.refundTotal,
  });

  static PurchaseCreditNoteReadPurchaseCreditNoteRow? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteReadPurchaseCreditNoteRow(
      creditNoteFromBlankMethod:
          readText(source['credit_note_from_blank_method']),
      creditNoteFromCreditNote:
          readText(source['credit_note_from_credit_note']),
      creditNoteFromPaymentMethod:
          readText(source['credit_note_from_payment_method']),
      creditNoteTotal: readText(source['credit_note_total']),
      paymentMethod:
          PurchaseCreditNoteReadPurchaseCreditNoteRowPaymentMethod.fromMap(
              source['payment_method']),
      paymentProcessor:
          PurchaseCreditNoteReadPurchaseCreditNoteRowPaymentProcessor.fromMap(
              source['payment_processor']),
      refundFromBlankMethod: readText(source['refund_from_blank_method']),
      refundFromCreditNote: readText(source['refund_from_credit_note']),
      refundFromPaymentMethod: readText(source['refund_from_payment_method']),
      refundTotal: readText(source['refund_total']),
    );
  }

  final String? creditNoteFromBlankMethod;

  final String? creditNoteFromCreditNote;

  final String? creditNoteFromPaymentMethod;

  final String? creditNoteTotal;

  final PurchaseCreditNoteReadPurchaseCreditNoteRowPaymentMethod? paymentMethod;

  final PurchaseCreditNoteReadPurchaseCreditNoteRowPaymentProcessor?
      paymentProcessor;

  final String? refundFromBlankMethod;

  final String? refundFromCreditNote;

  final String? refundFromPaymentMethod;

  final String? refundTotal;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'credit_note_from_blank_method': creditNoteFromBlankMethod,
        'credit_note_from_credit_note': creditNoteFromCreditNote,
        'credit_note_from_payment_method': creditNoteFromPaymentMethod,
        'credit_note_total': creditNoteTotal,
        'payment_method': paymentMethod,
        'payment_processor': paymentProcessor,
        'refund_from_blank_method': refundFromBlankMethod,
        'refund_from_credit_note': refundFromCreditNote,
        'refund_from_payment_method': refundFromPaymentMethod,
        'refund_total': refundTotal,
      };
}

/// A [PurchaseCreditNoteRead]'s `created_by`.
class PurchaseCreditNoteReadCreatedBy extends Dto {
  const PurchaseCreditNoteReadCreatedBy({
    this.name,
    this.object,
  });

  static PurchaseCreditNoteReadCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteReadCreatedBy(
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

/// A [PurchaseCreditNoteRead]'s `last_updated_by`.
class PurchaseCreditNoteReadLastUpdatedBy extends Dto {
  const PurchaseCreditNoteReadLastUpdatedBy({
    this.name,
    this.object,
  });

  static PurchaseCreditNoteReadLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteReadLastUpdatedBy(
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

/// A [PurchaseCreditNote]'s `account`.
class PurchaseCreditNoteAccount extends Dto {
  const PurchaseCreditNoteAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseCreditNoteAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteAccount(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [PurchaseCreditNote]'s `currency`.
class PurchaseCreditNoteCurrency extends Dto {
  const PurchaseCreditNoteCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseCreditNoteCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteCurrency(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [PurchaseCreditNote]'s `purchase_payment`.
class PurchaseCreditNotePurchasePayment extends Dto {
  const PurchaseCreditNotePurchasePayment({
    this.code,
    this.href,
    this.id,
    this.object,
  });

  static PurchaseCreditNotePurchasePayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNotePurchasePayment(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'object': object,
      };
}

/// One entry of a [PurchaseCreditNote]'s `purchase_credit_note_rows`.
class PurchaseCreditNotePurchaseCreditNoteRow extends Dto {
  const PurchaseCreditNotePurchaseCreditNoteRow({
    this.creditNoteFromBlankMethod,
    this.creditNoteFromCreditNote,
    this.creditNoteFromPaymentMethod,
    this.creditNoteTotal,
    this.paymentMethod,
    this.paymentProcessor,
    this.refundFromBlankMethod,
    this.refundFromCreditNote,
    this.refundFromPaymentMethod,
    this.refundTotal,
  });

  static PurchaseCreditNotePurchaseCreditNoteRow? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNotePurchaseCreditNoteRow(
      creditNoteFromBlankMethod:
          readText(source['credit_note_from_blank_method']),
      creditNoteFromCreditNote:
          readText(source['credit_note_from_credit_note']),
      creditNoteFromPaymentMethod:
          readText(source['credit_note_from_payment_method']),
      creditNoteTotal: readText(source['credit_note_total']),
      paymentMethod:
          PurchaseCreditNotePurchaseCreditNoteRowPaymentMethod.fromMap(
              source['payment_method']),
      paymentProcessor:
          PurchaseCreditNotePurchaseCreditNoteRowPaymentProcessor.fromMap(
              source['payment_processor']),
      refundFromBlankMethod: readText(source['refund_from_blank_method']),
      refundFromCreditNote: readText(source['refund_from_credit_note']),
      refundFromPaymentMethod: readText(source['refund_from_payment_method']),
      refundTotal: readText(source['refund_total']),
    );
  }

  final String? creditNoteFromBlankMethod;

  final String? creditNoteFromCreditNote;

  final String? creditNoteFromPaymentMethod;

  final String? creditNoteTotal;

  final PurchaseCreditNotePurchaseCreditNoteRowPaymentMethod? paymentMethod;

  final PurchaseCreditNotePurchaseCreditNoteRowPaymentProcessor?
      paymentProcessor;

  final String? refundFromBlankMethod;

  final String? refundFromCreditNote;

  final String? refundFromPaymentMethod;

  final String? refundTotal;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'credit_note_from_blank_method': creditNoteFromBlankMethod,
        'credit_note_from_credit_note': creditNoteFromCreditNote,
        'credit_note_from_payment_method': creditNoteFromPaymentMethod,
        'credit_note_total': creditNoteTotal,
        'payment_method': paymentMethod,
        'payment_processor': paymentProcessor,
        'refund_from_blank_method': refundFromBlankMethod,
        'refund_from_credit_note': refundFromCreditNote,
        'refund_from_payment_method': refundFromPaymentMethod,
        'refund_total': refundTotal,
      };
}

/// A [PurchaseCreditNoteUpdated]'s `status`.
class PurchaseCreditNoteUpdatedStatus extends Dto {
  const PurchaseCreditNoteUpdatedStatus({
    this.key,
    this.value,
  });

  static PurchaseCreditNoteUpdatedStatus? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteUpdatedStatus(
      key: readText(source['key']),
      value: readText(source['value']),
    );
  }

  final String? key;

  final String? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'key': key,
        'value': value,
      };
}

/// A [PurchaseCreditNoteReadPurchaseCreditNoteRow]'s `payment_method`.
class PurchaseCreditNoteReadPurchaseCreditNoteRowPaymentMethod extends Dto {
  const PurchaseCreditNoteReadPurchaseCreditNoteRowPaymentMethod({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseCreditNoteReadPurchaseCreditNoteRowPaymentMethod? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteReadPurchaseCreditNoteRowPaymentMethod(
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

/// A [PurchaseCreditNoteReadPurchaseCreditNoteRow]'s `payment_processor`.
class PurchaseCreditNoteReadPurchaseCreditNoteRowPaymentProcessor extends Dto {
  const PurchaseCreditNoteReadPurchaseCreditNoteRowPaymentProcessor({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseCreditNoteReadPurchaseCreditNoteRowPaymentProcessor? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteReadPurchaseCreditNoteRowPaymentProcessor(
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

/// A [PurchaseCreditNotePurchaseCreditNoteRow]'s `payment_method`.
class PurchaseCreditNotePurchaseCreditNoteRowPaymentMethod extends Dto {
  const PurchaseCreditNotePurchaseCreditNoteRowPaymentMethod({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseCreditNotePurchaseCreditNoteRowPaymentMethod? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNotePurchaseCreditNoteRowPaymentMethod(
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

/// A [PurchaseCreditNotePurchaseCreditNoteRow]'s `payment_processor`.
class PurchaseCreditNotePurchaseCreditNoteRowPaymentProcessor extends Dto {
  const PurchaseCreditNotePurchaseCreditNoteRowPaymentProcessor({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PurchaseCreditNotePurchaseCreditNoteRowPaymentProcessor? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNotePurchaseCreditNoteRowPaymentProcessor(
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

/// What `createPurchaseCreditNote` answers, under `purchase_credit_note`: a
/// shorter body than the reads, and `status` an object where they send a
/// string.
class PurchaseCreditNoteCreated extends Dto {
  const PurchaseCreditNoteCreated({
    this.activityLogs,
    this.code,
    this.href,
    this.id,
    this.initialAmount,
    this.issueDate,
    this.object,
    this.remainingAmount,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/purchase_credit_notes',
  ];

  static PurchaseCreditNoteCreated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'purchase_credit_note');
    if (source == null) return null;
    return PurchaseCreditNoteCreated(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      initialAmount: readText(source['initial_amount']),
      issueDate: readText(source['issue_date']),
      object: readText(source['object']),
      remainingAmount: readText(source['remaining_amount']),
      status: PurchaseCreditNoteCreatedStatus.fromMap(source['status']),
      version: readInteger(source['version']),
    );
  }

  /// Empty in every record measured, so its entries are untyped.
  final List<Object?>? activityLogs;

  final String? code;

  final String? href;

  final String? id;

  final String? initialAmount;

  final String? issueDate;

  final String? object;

  final String? remainingAmount;

  final PurchaseCreditNoteCreatedStatus? status;

  final int? version;

  @override
  String? get envelopeKey => 'purchase_credit_note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'code': code,
        'href': href,
        'id': id,
        'initial_amount': initialAmount,
        'issue_date': issueDate,
        'object': object,
        'remaining_amount': remainingAmount,
        'status': status,
        'version': version,
      };
}

/// A [PurchaseCreditNoteCreated]'s `status`.
class PurchaseCreditNoteCreatedStatus extends Dto {
  const PurchaseCreditNoteCreatedStatus({
    this.key,
    this.value,
  });

  static PurchaseCreditNoteCreatedStatus? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PurchaseCreditNoteCreatedStatus(
      key: readText(source['key']),
      value: readText(source['value']),
    );
  }

  final String? key;

  final String? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'key': key,
        'value': value,
      };
}
