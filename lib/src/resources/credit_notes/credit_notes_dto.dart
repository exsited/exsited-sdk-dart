/// Typed views over the v4 credit notes bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The credit note body.
class CreditNote extends Dto {
  const CreditNote({
    this.account,
    this.accountId,
    this.amount,
    this.code,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customAttributes,
    this.customObjects,
    this.date,
    this.href,
    this.id,
    this.initialAmount,
    this.invoiceId,
    this.invoices,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.payment,
    this.paymentId,
    this.refundAmount,
    this.refundable,
    this.remainingAmount,
    this.remainingBalance,
    this.status,
    this.updatedBy,
    this.updatedOn,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/credit_notes',
  ];

  static CreditNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNote(
      account: CreditNoteAccount.fromMap(source['account']),
      accountId: readText(source['account_id']),
      amount: readText(source['amount']),
      code: readText(source['code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: CreditNoteCurrency.fromMap(source['currency']),
      customAttributes: readList<CreditNoteCustomAttribute>(
          source['custom_attributes'], CreditNoteCustomAttribute.fromMap),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      date: readText(source['date']),
      href: readText(source['href']),
      id: readText(source['id']),
      initialAmount: readText(source['initial_amount']),
      invoiceId: readText(source['invoice_id']),
      invoices: readList<CreditNoteInvoice>(
          source['invoices'], CreditNoteInvoice.fromMap),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: CreditNoteLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      payment: CreditNotePayment.fromMap(source['payment']),
      paymentId: readText(source['payment_id']),
      refundAmount: readText(source['refund_amount']),
      refundable: readAny(source['refundable']),
      remainingAmount: readText(source['remaining_amount']),
      remainingBalance: readText(source['remaining_balance']),
      status: readText(source['status']),
      updatedBy: readText(source['updated_by']),
      updatedOn: readText(source['updated_on']),
      uuid: readText(source['uuid']),
      version: readAny(source['version']),
    );
  }

  final CreditNoteAccount? account;

  final String? accountId;

  final String? amount;

  final String? code;

  /// Untyped: a String on some records and a map on others.
  final Object? createdBy;

  final String? createdOn;

  final CreditNoteCurrency? currency;

  final List<CreditNoteCustomAttribute?>? customAttributes;

  final List<Object?>? customObjects;

  final String? date;

  final String? href;

  final String? id;

  final String? initialAmount;

  final String? invoiceId;

  final List<CreditNoteInvoice?>? invoices;

  final String? issueDate;

  final CreditNoteLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final CreditNotePayment? payment;

  final String? paymentId;

  final String? refundAmount;

  /// Untyped: a String on some records and a bool on others.
  final Object? refundable;

  final String? remainingAmount;

  final String? remainingBalance;

  final String? status;

  final String? updatedBy;

  final String? updatedOn;

  final String? uuid;

  /// Untyped: a String on some records and an int on others.
  final Object? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'account_id': accountId,
        'amount': amount,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_attributes': customAttributes,
        'custom_objects': customObjects,
        'date': date,
        'href': href,
        'id': id,
        'initial_amount': initialAmount,
        'invoice_id': invoiceId,
        'invoices': invoices,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'payment': payment,
        'payment_id': paymentId,
        'refund_amount': refundAmount,
        'refundable': refundable,
        'remaining_amount': remainingAmount,
        'remaining_balance': remainingBalance,
        'status': status,
        'updated_by': updatedBy,
        'updated_on': updatedOn,
        'uuid': uuid,
        'version': version,
      };
}

/// A page of CreditNote records.
class CreditNoteList extends Dto {
  const CreditNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/credit_notes',
  ];

  static CreditNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteList(
      data: readList<CreditNote>(source['data'], CreditNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<CreditNote?>? data;

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

/// The credit note read body.
class CreditNoteRead extends Dto {
  const CreditNoteRead({
    this.account,
    this.code,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customAttributes,
    this.href,
    this.id,
    this.initialAmount,
    this.invoices,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.payment,
    this.refundAmount,
    this.refundable,
    this.remainingAmount,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/credit_notes/{credit_note_id}',
  ];

  static CreditNoteRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'credit_note');
    if (source == null) return null;
    return CreditNoteRead(
      account: CreditNoteReadAccount.fromMap(source['account']),
      code: readText(source['code']),
      createdBy: CreditNoteReadCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: CreditNoteReadCurrency.fromMap(source['currency']),
      customAttributes: readList<CreditNoteReadCustomAttribute>(
          source['custom_attributes'], CreditNoteReadCustomAttribute.fromMap),
      href: readText(source['href']),
      id: readText(source['id']),
      initialAmount: readText(source['initial_amount']),
      invoices: readList<CreditNoteReadInvoice>(
          source['invoices'], CreditNoteReadInvoice.fromMap),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy:
          CreditNoteReadLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      payment: CreditNoteReadPayment.fromMap(source['payment']),
      refundAmount: readText(source['refund_amount']),
      refundable: readFlag(source['refundable']),
      remainingAmount: readText(source['remaining_amount']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final CreditNoteReadAccount? account;

  final String? code;

  final CreditNoteReadCreatedBy? createdBy;

  final String? createdOn;

  final CreditNoteReadCurrency? currency;

  final List<CreditNoteReadCustomAttribute?>? customAttributes;

  final String? href;

  final String? id;

  final String? initialAmount;

  final List<CreditNoteReadInvoice?>? invoices;

  final String? issueDate;

  final CreditNoteReadLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final CreditNoteReadPayment? payment;

  final String? refundAmount;

  final bool? refundable;

  final String? remainingAmount;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'credit_note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_attributes': customAttributes,
        'href': href,
        'id': id,
        'initial_amount': initialAmount,
        'invoices': invoices,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'payment': payment,
        'refund_amount': refundAmount,
        'refundable': refundable,
        'remaining_amount': remainingAmount,
        'status': status,
        'version': version,
      };
}

/// What `updateCreditNote` answers, under `credit_note`.
class CreditNoteUpdated extends Dto {
  const CreditNoteUpdated({
    this.code,
    this.href,
    this.id,
    this.issueDate,
    this.object,
    this.refundable,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/credit_notes/{credit_note_id}',
  ];

  static CreditNoteUpdated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'credit_note');
    if (source == null) return null;
    return CreditNoteUpdated(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      object: readText(source['object']),
      refundable: readFlag(source['refundable']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? issueDate;

  final String? object;

  final bool? refundable;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'credit_note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'issue_date': issueDate,
        'object': object,
        'refundable': refundable,
        'status': status,
        'version': version,
      };
}

/// A [CreditNoteRead]'s `account`.
class CreditNoteReadAccount extends Dto {
  const CreditNoteReadAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static CreditNoteReadAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteReadAccount(
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

/// A [CreditNoteRead]'s `currency`.
class CreditNoteReadCurrency extends Dto {
  const CreditNoteReadCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static CreditNoteReadCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteReadCurrency(
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

/// A [CreditNoteRead]'s `payment`.
class CreditNoteReadPayment extends Dto {
  const CreditNoteReadPayment({
    this.href,
    this.id,
    this.object,
  });

  static CreditNoteReadPayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteReadPayment(
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

/// One entry of a [CreditNoteRead]'s `invoices`.
class CreditNoteReadInvoice extends Dto {
  const CreditNoteReadInvoice({
    this.href,
    this.id,
    this.object,
  });

  static CreditNoteReadInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteReadInvoice(
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

/// One entry of a [CreditNoteRead]'s `custom_attributes`.
class CreditNoteReadCustomAttribute extends Dto {
  const CreditNoteReadCustomAttribute({
    this.href,
    this.id,
    this.name,
    this.object,
    this.type,
    this.value,
  });

  static CreditNoteReadCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteReadCustomAttribute(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      type: readText(source['type']),
      value: readAny(source['value']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? type;

  /// Untyped: the records measured disagree on its type.
  final Object? value;

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

/// A [CreditNoteRead]'s `created_by`.
class CreditNoteReadCreatedBy extends Dto {
  const CreditNoteReadCreatedBy({
    this.name,
    this.object,
  });

  static CreditNoteReadCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteReadCreatedBy(
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

/// A [CreditNoteRead]'s `last_updated_by`.
class CreditNoteReadLastUpdatedBy extends Dto {
  const CreditNoteReadLastUpdatedBy({
    this.name,
    this.object,
  });

  static CreditNoteReadLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteReadLastUpdatedBy(
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

/// A [CreditNote]'s `account`.
class CreditNoteAccount extends Dto {
  const CreditNoteAccount({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static CreditNoteAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteAccount(
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

/// A [CreditNote]'s `currency`.
class CreditNoteCurrency extends Dto {
  const CreditNoteCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static CreditNoteCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteCurrency(
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

/// A [CreditNote]'s `payment`.
class CreditNotePayment extends Dto {
  const CreditNotePayment({
    this.href,
    this.id,
    this.object,
  });

  static CreditNotePayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNotePayment(
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

/// One entry of a [CreditNote]'s `invoices`.
class CreditNoteInvoice extends Dto {
  const CreditNoteInvoice({
    this.href,
    this.id,
    this.object,
  });

  static CreditNoteInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteInvoice(
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

/// One entry of a [CreditNote]'s `custom_attributes`.
class CreditNoteCustomAttribute extends Dto {
  const CreditNoteCustomAttribute({
    this.href,
    this.id,
    this.name,
    this.object,
    this.type,
    this.value,
  });

  static CreditNoteCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteCustomAttribute(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      type: readText(source['type']),
      value: readAny(source['value']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? type;

  /// Untyped: the records measured disagree on its type.
  final Object? value;

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

/// A [CreditNote]'s `last_updated_by`.
class CreditNoteLastUpdatedBy extends Dto {
  const CreditNoteLastUpdatedBy({
    this.name,
    this.object,
  });

  static CreditNoteLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteLastUpdatedBy(
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

/// A credit note's balance rows, under `credit_note`.
class CreditNoteItems extends Dto {
  const CreditNoteItems({
    this.href,
    this.items,
    this.object,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/credit_notes/{credit_note_id}/items',
  ];

  static CreditNoteItems? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'credit_note');
    if (source == null) return null;
    return CreditNoteItems(
      href: readText(source['href']),
      items: readList<CreditNoteItem>(source['items'], CreditNoteItem.fromMap),
      object: readText(source['object']),
    );
  }

  final String? href;

  final List<CreditNoteItem?>? items;

  final String? object;

  @override
  String? get envelopeKey => 'credit_note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'items': items,
        'object': object,
      };
}

/// One entry of a [CreditNoteItems]'s `items`: what was credited and refunded,
/// by source, each amount a string.
class CreditNoteItem extends Dto {
  const CreditNoteItem({
    this.creditNoteFromBlankMethod,
    this.creditNoteFromCreditNote,
    this.creditNoteFromGiftCertificate,
    this.creditNoteFromInvoiceCredit,
    this.creditNoteFromPaymentMethod,
    this.creditNoteTotal,
    this.invoice,
    this.object,
    this.refundFromBlankMethod,
    this.refundFromCreditNote,
    this.refundFromGiftCertificate,
    this.refundFromInvoiceCredit,
    this.refundFromPaymentMethod,
    this.refundTotal,
  });

  static CreditNoteItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteItem(
      creditNoteFromBlankMethod:
          readText(source['credit_note_from_blank_method']),
      creditNoteFromCreditNote:
          readText(source['credit_note_from_credit_note']),
      creditNoteFromGiftCertificate:
          readText(source['credit_note_from_gift_certificate']),
      creditNoteFromInvoiceCredit:
          readText(source['credit_note_from_invoice_credit']),
      creditNoteFromPaymentMethod:
          readText(source['credit_note_from_payment_method']),
      creditNoteTotal: readText(source['credit_note_total']),
      invoice: readAny(source['invoice']),
      object: readText(source['object']),
      refundFromBlankMethod: readText(source['refund_from_blank_method']),
      refundFromCreditNote: readText(source['refund_from_credit_note']),
      refundFromGiftCertificate:
          readText(source['refund_from_gift_certificate']),
      refundFromInvoiceCredit: readText(source['refund_from_invoice_credit']),
      refundFromPaymentMethod: readText(source['refund_from_payment_method']),
      refundTotal: readText(source['refund_total']),
    );
  }

  final String? creditNoteFromBlankMethod;

  final String? creditNoteFromCreditNote;

  final String? creditNoteFromGiftCertificate;

  final String? creditNoteFromInvoiceCredit;

  final String? creditNoteFromPaymentMethod;

  final String? creditNoteTotal;

  /// Null in every record measured, so untyped.
  final Object? invoice;

  final String? object;

  final String? refundFromBlankMethod;

  final String? refundFromCreditNote;

  final String? refundFromGiftCertificate;

  final String? refundFromInvoiceCredit;

  final String? refundFromPaymentMethod;

  final String? refundTotal;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'credit_note_from_blank_method': creditNoteFromBlankMethod,
        'credit_note_from_credit_note': creditNoteFromCreditNote,
        'credit_note_from_gift_certificate': creditNoteFromGiftCertificate,
        'credit_note_from_invoice_credit': creditNoteFromInvoiceCredit,
        'credit_note_from_payment_method': creditNoteFromPaymentMethod,
        'credit_note_total': creditNoteTotal,
        'invoice': invoice,
        'object': object,
        'refund_from_blank_method': refundFromBlankMethod,
        'refund_from_credit_note': refundFromCreditNote,
        'refund_from_gift_certificate': refundFromGiftCertificate,
        'refund_from_invoice_credit': refundFromInvoiceCredit,
        'refund_from_payment_method': refundFromPaymentMethod,
        'refund_total': refundTotal,
      };
}

/// A credit note's applications, under `credit_note`.
class CreditNoteApplications extends Dto {
  const CreditNoteApplications({
    this.applications,
    this.href,
    this.object,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/credit_notes/{credit_note_id}/credit_note_applications',
  ];

  static CreditNoteApplications? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'credit_note');
    if (source == null) return null;
    return CreditNoteApplications(
      applications: readList<Object>(source['applications'], readAny),
      href: readText(source['href']),
      object: readText(source['object']),
    );
  }

  /// Empty in every record measured, so its entries are untyped.
  final List<Object?>? applications;

  final String? href;

  final String? object;

  @override
  String? get envelopeKey => 'credit_note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'applications': applications,
        'href': href,
        'object': object,
      };
}

/// One note on a credit note, under `note`.
class CreditNoteNote extends Dto {
  const CreditNoteNote({
    this.attachments,
    this.content,
    this.createdBy,
    this.createdOn,
    this.creditNote,
    this.group,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/credit_notes/{credit_note_id}/notes',
    'GET /api/{api_version}/credit_notes/{credit_note_id}/notes/{note_id}',
  ];

  static CreditNoteNote? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return CreditNoteNote(
      attachments: readList<Object>(source['attachments'], readAny),
      content: readText(source['content']),
      createdBy: CreditNoteNoteCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNote: CreditNoteNoteDetail.fromMap(source['credit_note']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<Object>(source['watchers'], readAny),
    );
  }

  /// Empty in every record measured, so its entries are untyped.
  final List<Object?>? attachments;

  final String? content;

  final CreditNoteNoteCreatedBy? createdBy;

  final String? createdOn;

  final CreditNoteNoteDetail? creditNote;

  /// Null in every record measured, so untyped.
  final Object? group;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedOn;

  final String? object;

  /// Null in every record measured, so untyped.
  final Object? user;

  final int? version;

  /// Empty in every record measured, so its entries are untyped.
  final List<Object?>? watchers;

  @override
  String? get envelopeKey => 'note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'attachments': attachments,
        'content': content,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note': creditNote,
        'group': group,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// One page of `CreditNoteNote` records, under `data`.
class CreditNoteNoteList extends Dto {
  const CreditNoteNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/credit_notes/{credit_note_id}/notes',
  ];

  static CreditNoteNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteNoteList(
      data: readList<CreditNoteNote>(source['data'], CreditNoteNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<CreditNoteNote?>? data;

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

/// A [CreditNoteNote]'s `credit_note`.
class CreditNoteNoteDetail extends Dto {
  const CreditNoteNoteDetail({
    this.href,
    this.id,
    this.object,
  });

  static CreditNoteNoteDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteNoteDetail(
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

/// A [CreditNoteNote]'s `created_by`.
class CreditNoteNoteCreatedBy extends Dto {
  const CreditNoteNoteCreatedBy({
    this.id,
    this.name,
    this.object,
  });

  static CreditNoteNoteCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteNoteCreatedBy(
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'name': name,
        'object': object,
      };
}
