/// Typed views over the v4 payments bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The payment body.
class Payment extends Dto {
  const Payment({
    this.account,
    this.createdBy,
    this.createdOn,
    this.creditApplied,
    this.giftCertificateApplied,
    this.id,
    this.invoices,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.origin,
    this.paymentApplied,
    this.paymentNote,
    this.reconcileStatus,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/invoices/{invoice_id}/payments',
    'GET /api/{api_version}/orders/{order_id}/payments',
    'GET /api/{api_version}/payments',
  ];

  static Payment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return Payment(
      account: PaymentAccount.fromMap(source['account']),
      createdBy: PaymentCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditApplied: readList<PaymentCreditApplied>(
          source['credit_applied'], PaymentCreditApplied.fromMap),
      giftCertificateApplied: readList<PaymentGiftCertificateApplied>(
          source['gift_certificate_applied'],
          PaymentGiftCertificateApplied.fromMap),
      id: readText(source['id']),
      invoices:
          readList<PaymentInvoice>(source['invoices'], PaymentInvoice.fromMap),
      lastUpdatedBy: PaymentLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      origin: readText(source['origin']),
      paymentApplied: readList<PaymentPaymentApplied>(
          source['payment_applied'], PaymentPaymentApplied.fromMap),
      paymentNote: readText(source['payment_note']),
      reconcileStatus: readText(source['reconcile_status']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final PaymentAccount? account;

  final PaymentCreatedBy? createdBy;

  final String? createdOn;

  final List<PaymentCreditApplied?>? creditApplied;

  final List<PaymentGiftCertificateApplied?>? giftCertificateApplied;

  final String? id;

  final List<PaymentInvoice?>? invoices;

  final PaymentLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? origin;

  final List<PaymentPaymentApplied?>? paymentApplied;

  final String? paymentNote;

  final String? reconcileStatus;

  final String? status;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_applied': creditApplied,
        'gift_certificate_applied': giftCertificateApplied,
        'id': id,
        'invoices': invoices,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'origin': origin,
        'payment_applied': paymentApplied,
        'payment_note': paymentNote,
        'reconcile_status': reconcileStatus,
        'status': status,
        'version': version,
      };
}

/// A page of Payment records.
class PaymentList extends Dto {
  const PaymentList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/invoices/{invoice_id}/payments',
    'GET /api/{api_version}/orders/{order_id}/payments',
    'GET /api/{api_version}/payments',
  ];

  static PaymentList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentList(
      data: readList<Payment>(source['data'], Payment.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Payment?>? data;

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

/// The payment note body.
class PaymentNote extends Dto {
  const PaymentNote({
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
    this.payment,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/payments/{payment_id}/notes',
  ];

  static PaymentNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentNote(
      attachments: readList<PaymentNoteAttachment>(
          source['attachments'], PaymentNoteAttachment.fromMap),
      content: readText(source['content']),
      createdBy: PaymentNoteCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      payment: PaymentNotePayment.fromMap(source['payment']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<PaymentNoteWatcher>(
          source['watchers'], PaymentNoteWatcher.fromMap),
    );
  }

  final List<PaymentNoteAttachment?>? attachments;

  final String? content;

  final PaymentNoteCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped: never populated in the records measured.
  final Object? group;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedOn;

  final String? object;

  final PaymentNotePayment? payment;

  /// Untyped: never populated in the records measured.
  final Object? user;

  final int? version;

  final List<PaymentNoteWatcher?>? watchers;

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
        'payment': payment,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// A page of PaymentNote records.
class PaymentNoteList extends Dto {
  const PaymentNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/payments/{payment_id}/notes',
  ];

  static PaymentNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentNoteList(
      data: readList<PaymentNote>(source['data'], PaymentNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PaymentNote?>? data;

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

/// The payments note body.
class PaymentsNote extends Dto {
  const PaymentsNote({
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
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/payments/notes',
  ];

  static PaymentsNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentsNote(
      attachments: readList<PaymentsNoteAttachment>(
          source['attachments'], PaymentsNoteAttachment.fromMap),
      content: readText(source['content']),
      createdBy: PaymentsNoteCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<PaymentsNoteWatcher>(
          source['watchers'], PaymentsNoteWatcher.fromMap),
    );
  }

  final List<PaymentsNoteAttachment?>? attachments;

  final String? content;

  final PaymentsNoteCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped: never populated in the records measured.
  final Object? group;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedOn;

  final String? object;

  /// Untyped: never populated in the records measured.
  final Object? user;

  final int? version;

  final List<PaymentsNoteWatcher?>? watchers;

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
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// A page of PaymentsNote records.
class PaymentsNoteList extends Dto {
  const PaymentsNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/payments/notes',
  ];

  static PaymentsNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentsNoteList(
      data: readList<PaymentsNote>(source['data'], PaymentsNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<PaymentsNote?>? data;

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

/// The payment read body.
class PaymentRead extends Dto {
  const PaymentRead({
    this.account,
    this.activityLogs,
    this.createdBy,
    this.createdOn,
    this.creditApplied,
    this.customAttributes,
    this.giftCertificateApplied,
    this.id,
    this.invoices,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.origin,
    this.paymentApplied,
    this.paymentNote,
    this.reconcileStatus,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/payments/{payment_id}',
    'PATCH /api/{api_version}/payments/{payment_id}',
  ];

  static PaymentRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'payment');
    if (source == null) return null;
    return PaymentRead(
      account: PaymentReadAccount.fromMap(source['account']),
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      createdBy: PaymentReadCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditApplied: readList<PaymentReadCreditApplied>(
          source['credit_applied'], PaymentReadCreditApplied.fromMap),
      customAttributes: readList<PaymentReadCustomAttribute>(
          source['custom_attributes'], PaymentReadCustomAttribute.fromMap),
      giftCertificateApplied: readList<PaymentReadGiftCertificateApplied>(
          source['gift_certificate_applied'],
          PaymentReadGiftCertificateApplied.fromMap),
      id: readText(source['id']),
      invoices: readList<PaymentReadInvoice>(
          source['invoices'], PaymentReadInvoice.fromMap),
      lastUpdatedBy:
          PaymentReadLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      origin: readText(source['origin']),
      paymentApplied: readList<PaymentReadPaymentApplied>(
          source['payment_applied'], PaymentReadPaymentApplied.fromMap),
      paymentNote: readText(source['payment_note']),
      reconcileStatus: readText(source['reconcile_status']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final PaymentReadAccount? account;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  final PaymentReadCreatedBy? createdBy;

  final String? createdOn;

  final List<PaymentReadCreditApplied?>? creditApplied;

  final List<PaymentReadCustomAttribute?>? customAttributes;

  final List<PaymentReadGiftCertificateApplied?>? giftCertificateApplied;

  final String? id;

  final List<PaymentReadInvoice?>? invoices;

  final PaymentReadLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? origin;

  final List<PaymentReadPaymentApplied?>? paymentApplied;

  final String? paymentNote;

  final String? reconcileStatus;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'payment';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'activity_logs': activityLogs,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_applied': creditApplied,
        'custom_attributes': customAttributes,
        'gift_certificate_applied': giftCertificateApplied,
        'id': id,
        'invoices': invoices,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'origin': origin,
        'payment_applied': paymentApplied,
        'payment_note': paymentNote,
        'reconcile_status': reconcileStatus,
        'status': status,
        'version': version,
      };
}

/// The account payments body.
class AccountPayments extends Dto {
  const AccountPayments({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/payments',
  ];

  static AccountPayments? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPayments(
      data: readList<AccountPaymentsData>(
          source['data'], AccountPaymentsData.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<AccountPaymentsData?>? data;

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

/// The payment note read body.
class PaymentNoteRead extends Dto {
  const PaymentNoteRead({
    this.attachments,
    this.content,
    this.createdBy,
    this.createdOn,
    this.group,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.note,
    this.object,
    this.payment,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/payments/{payment_id}/notes/{payment_note_id}',
    'POST /api/{api_version}/payments/{payment_id}/notes',
  ];

  static PaymentNoteRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return PaymentNoteRead(
      attachments: readList<PaymentNoteReadAttachment>(
          source['attachments'], PaymentNoteReadAttachment.fromMap),
      content: readText(source['content']),
      createdBy: PaymentNoteReadCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      note: readAny(source['note']),
      object: readText(source['object']),
      payment: PaymentNoteReadPayment.fromMap(source['payment']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<PaymentNoteReadWatcher>(
          source['watchers'], PaymentNoteReadWatcher.fromMap),
    );
  }

  final List<PaymentNoteReadAttachment?>? attachments;

  final String? content;

  final PaymentNoteReadCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped: null in every record measured.
  final Object? group;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final Object? note;

  final String? object;

  final PaymentNoteReadPayment? payment;

  /// Untyped: null in every record measured.
  final Object? user;

  final int? version;

  final List<PaymentNoteReadWatcher?>? watchers;

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
        'note': note,
        'object': object,
        'payment': payment,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// What `getPaymentNoteFile` answers, under `file`.
class PaymentNoteFile extends Dto {
  const PaymentNoteFile({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/payments/{payment_id}/notes/{payment_note_id}/files/{payment_file_id}',
  ];

  static PaymentNoteFile? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'file');
    if (source == null) return null;
    return PaymentNoteFile(
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

/// One entry of a [AccountPayments]'s `data`.
class AccountPaymentsData extends Dto {
  const AccountPaymentsData({
    this.account,
    this.createdBy,
    this.createdOn,
    this.creditApplied,
    this.giftCertificateApplied,
    this.id,
    this.invoices,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.origin,
    this.paymentApplied,
    this.paymentNote,
    this.reconcileStatus,
    this.status,
    this.version,
  });

  static AccountPaymentsData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPaymentsData(
      account: AccountPaymentsDataAccount.fromMap(source['account']),
      createdBy: AccountPaymentsDataCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditApplied: readList<AccountPaymentsDataCreditApplied>(
          source['credit_applied'], AccountPaymentsDataCreditApplied.fromMap),
      giftCertificateApplied:
          readList<AccountPaymentsDataGiftCertificateApplied>(
              source['gift_certificate_applied'],
              AccountPaymentsDataGiftCertificateApplied.fromMap),
      id: readText(source['id']),
      invoices: readList<AccountPaymentsDataInvoice>(
          source['invoices'], AccountPaymentsDataInvoice.fromMap),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      origin: readAny(source['origin']),
      paymentApplied: readList<AccountPaymentsDataPaymentApplied>(
          source['payment_applied'], AccountPaymentsDataPaymentApplied.fromMap),
      paymentNote: readText(source['payment_note']),
      reconcileStatus: readText(source['reconcile_status']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final AccountPaymentsDataAccount? account;

  final AccountPaymentsDataCreatedBy? createdBy;

  final String? createdOn;

  final List<AccountPaymentsDataCreditApplied?>? creditApplied;

  final List<AccountPaymentsDataGiftCertificateApplied?>?
      giftCertificateApplied;

  final String? id;

  final List<AccountPaymentsDataInvoice?>? invoices;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  final String? object;

  /// Untyped: null in every record measured.
  final Object? origin;

  final List<AccountPaymentsDataPaymentApplied?>? paymentApplied;

  final String? paymentNote;

  final String? reconcileStatus;

  final String? status;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_applied': creditApplied,
        'gift_certificate_applied': giftCertificateApplied,
        'id': id,
        'invoices': invoices,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'origin': origin,
        'payment_applied': paymentApplied,
        'payment_note': paymentNote,
        'reconcile_status': reconcileStatus,
        'status': status,
        'version': version,
      };
}

/// A [PaymentRead]'s `account`.
class PaymentReadAccount extends Dto {
  const PaymentReadAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PaymentReadAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentReadAccount(
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

/// One entry of a [PaymentRead]'s `payment_applied`.
class PaymentReadPaymentApplied extends Dto {
  const PaymentReadPaymentApplied({
    this.amount,
    this.gatewayResponse,
    this.method,
    this.processor,
    this.reference,
  });

  static PaymentReadPaymentApplied? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentReadPaymentApplied(
      amount: readText(source['amount']),
      gatewayResponse: readAny(source['gateway_response']),
      method: readText(source['method']),
      processor: readText(source['processor']),
      reference: readText(source['reference']),
    );
  }

  final String? amount;

  /// Untyped: null in every record measured.
  final Object? gatewayResponse;

  final String? method;

  final String? processor;

  final String? reference;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'gateway_response': gatewayResponse,
        'method': method,
        'processor': processor,
        'reference': reference,
      };
}

/// One entry of a [PaymentRead]'s `credit_applied`.
class PaymentReadCreditApplied extends Dto {
  const PaymentReadCreditApplied({
    this.amount,
    this.code,
  });

  static PaymentReadCreditApplied? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentReadCreditApplied(
      amount: readText(source['amount']),
      code: readText(source['code']),
    );
  }

  final String? amount;

  final String? code;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'code': code,
      };
}

/// One entry of a [PaymentRead]'s `gift_certificate_applied`.
class PaymentReadGiftCertificateApplied extends Dto {
  const PaymentReadGiftCertificateApplied({
    this.amount,
    this.code,
  });

  static PaymentReadGiftCertificateApplied? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentReadGiftCertificateApplied(
      amount: readText(source['amount']),
      code: readText(source['code']),
    );
  }

  final String? amount;

  final String? code;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'code': code,
      };
}

/// One entry of a [PaymentRead]'s `invoices`.
class PaymentReadInvoice extends Dto {
  const PaymentReadInvoice({
    this.applied,
    this.dueDate,
    this.id,
    this.issueDate,
    this.outstanding,
    this.total,
  });

  static PaymentReadInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentReadInvoice(
      applied: readText(source['applied']),
      dueDate: readText(source['due_date']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      outstanding: readText(source['outstanding']),
      total: readText(source['total']),
    );
  }

  final String? applied;

  final String? dueDate;

  final String? id;

  final String? issueDate;

  final String? outstanding;

  final String? total;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'applied': applied,
        'due_date': dueDate,
        'id': id,
        'issue_date': issueDate,
        'outstanding': outstanding,
        'total': total,
      };
}

/// One entry of a [PaymentRead]'s `custom_attributes`.
class PaymentReadCustomAttribute extends Dto {
  const PaymentReadCustomAttribute({
    this.href,
    this.id,
    this.name,
    this.object,
    this.type,
    this.value,
  });

  static PaymentReadCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentReadCustomAttribute(
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

/// A [PaymentRead]'s `created_by`.
class PaymentReadCreatedBy extends Dto {
  const PaymentReadCreatedBy({
    this.name,
    this.object,
  });

  static PaymentReadCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentReadCreatedBy(
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

/// A [PaymentRead]'s `last_updated_by`.
class PaymentReadLastUpdatedBy extends Dto {
  const PaymentReadLastUpdatedBy({
    this.name,
    this.object,
  });

  static PaymentReadLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentReadLastUpdatedBy(
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

/// A [PaymentNoteRead]'s `payment`.
class PaymentNoteReadPayment extends Dto {
  const PaymentNoteReadPayment({
    this.href,
    this.id,
    this.object,
  });

  static PaymentNoteReadPayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentNoteReadPayment(
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

/// One entry of a [PaymentNoteRead]'s `attachments`.
class PaymentNoteReadAttachment extends Dto {
  const PaymentNoteReadAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PaymentNoteReadAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentNoteReadAttachment(
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

/// One entry of a [PaymentNoteRead]'s `watchers`.
class PaymentNoteReadWatcher extends Dto {
  const PaymentNoteReadWatcher({
    this.email,
    this.name,
    this.type,
  });

  static PaymentNoteReadWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentNoteReadWatcher(
      email: readText(source['email']),
      name: readText(source['name']),
      type: readText(source['type']),
    );
  }

  final String? email;

  final String? name;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'email': email,
        'name': name,
        'type': type,
      };
}

/// A [PaymentNoteRead]'s `created_by`.
class PaymentNoteReadCreatedBy extends Dto {
  const PaymentNoteReadCreatedBy({
    this.name,
    this.object,
  });

  static PaymentNoteReadCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentNoteReadCreatedBy(
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

/// A [Payment]'s `account`.
class PaymentAccount extends Dto {
  const PaymentAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static PaymentAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentAccount(
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

/// One entry of a [Payment]'s `payment_applied`.
class PaymentPaymentApplied extends Dto {
  const PaymentPaymentApplied({
    this.amount,
    this.gatewayResponse,
    this.method,
    this.processor,
    this.reference,
  });

  static PaymentPaymentApplied? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentPaymentApplied(
      amount: readText(source['amount']),
      gatewayResponse: readAny(source['gateway_response']),
      method: readText(source['method']),
      processor: readText(source['processor']),
      reference: readText(source['reference']),
    );
  }

  final String? amount;

  /// Untyped: null in every record measured.
  final Object? gatewayResponse;

  final String? method;

  final String? processor;

  final String? reference;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'gateway_response': gatewayResponse,
        'method': method,
        'processor': processor,
        'reference': reference,
      };
}

/// One entry of a [Payment]'s `credit_applied`.
class PaymentCreditApplied extends Dto {
  const PaymentCreditApplied({
    this.amount,
    this.code,
  });

  static PaymentCreditApplied? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentCreditApplied(
      amount: readText(source['amount']),
      code: readText(source['code']),
    );
  }

  final String? amount;

  final String? code;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'code': code,
      };
}

/// One entry of a [Payment]'s `gift_certificate_applied`.
class PaymentGiftCertificateApplied extends Dto {
  const PaymentGiftCertificateApplied({
    this.amount,
    this.code,
  });

  static PaymentGiftCertificateApplied? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentGiftCertificateApplied(
      amount: readText(source['amount']),
      code: readText(source['code']),
    );
  }

  final String? amount;

  final String? code;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'code': code,
      };
}

/// One entry of a [Payment]'s `invoices`.
class PaymentInvoice extends Dto {
  const PaymentInvoice({
    this.applied,
    this.dueDate,
    this.id,
    this.issueDate,
    this.outstanding,
    this.total,
  });

  static PaymentInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentInvoice(
      applied: readText(source['applied']),
      dueDate: readText(source['due_date']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      outstanding: readText(source['outstanding']),
      total: readText(source['total']),
    );
  }

  final String? applied;

  final String? dueDate;

  final String? id;

  final String? issueDate;

  final String? outstanding;

  final String? total;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'applied': applied,
        'due_date': dueDate,
        'id': id,
        'issue_date': issueDate,
        'outstanding': outstanding,
        'total': total,
      };
}

/// A [Payment]'s `created_by`.
class PaymentCreatedBy extends Dto {
  const PaymentCreatedBy({
    this.name,
    this.object,
  });

  static PaymentCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentCreatedBy(
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

/// A [Payment]'s `last_updated_by`.
class PaymentLastUpdatedBy extends Dto {
  const PaymentLastUpdatedBy({
    this.name,
    this.object,
  });

  static PaymentLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentLastUpdatedBy(
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

/// A [PaymentNote]'s `payment`.
class PaymentNotePayment extends Dto {
  const PaymentNotePayment({
    this.href,
    this.id,
    this.object,
  });

  static PaymentNotePayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentNotePayment(
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

/// One entry of a [PaymentNote]'s `attachments`.
class PaymentNoteAttachment extends Dto {
  const PaymentNoteAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PaymentNoteAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentNoteAttachment(
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

/// One entry of a [PaymentNote]'s `watchers`.
class PaymentNoteWatcher extends Dto {
  const PaymentNoteWatcher({
    this.email,
    this.name,
    this.type,
  });

  static PaymentNoteWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentNoteWatcher(
      email: readText(source['email']),
      name: readText(source['name']),
      type: readText(source['type']),
    );
  }

  final String? email;

  final String? name;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'email': email,
        'name': name,
        'type': type,
      };
}

/// A [PaymentNote]'s `created_by`.
class PaymentNoteCreatedBy extends Dto {
  const PaymentNoteCreatedBy({
    this.name,
    this.object,
  });

  static PaymentNoteCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentNoteCreatedBy(
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

/// One entry of a [PaymentsNote]'s `attachments`.
class PaymentsNoteAttachment extends Dto {
  const PaymentsNoteAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static PaymentsNoteAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentsNoteAttachment(
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

/// One entry of a [PaymentsNote]'s `watchers`.
class PaymentsNoteWatcher extends Dto {
  const PaymentsNoteWatcher({
    this.email,
    this.name,
    this.type,
  });

  static PaymentsNoteWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentsNoteWatcher(
      email: readText(source['email']),
      name: readText(source['name']),
      type: readText(source['type']),
    );
  }

  final String? email;

  final String? name;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'email': email,
        'name': name,
        'type': type,
      };
}

/// A [PaymentsNote]'s `created_by`.
class PaymentsNoteCreatedBy extends Dto {
  const PaymentsNoteCreatedBy({
    this.name,
    this.object,
  });

  static PaymentsNoteCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentsNoteCreatedBy(
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

/// A [AccountPaymentsData]'s `account`.
class AccountPaymentsDataAccount extends Dto {
  const AccountPaymentsDataAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static AccountPaymentsDataAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPaymentsDataAccount(
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

/// One entry of a [AccountPaymentsData]'s `payment_applied`.
class AccountPaymentsDataPaymentApplied extends Dto {
  const AccountPaymentsDataPaymentApplied({
    this.amount,
    this.gatewayResponse,
    this.method,
    this.processor,
    this.reference,
  });

  static AccountPaymentsDataPaymentApplied? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPaymentsDataPaymentApplied(
      amount: readText(source['amount']),
      gatewayResponse: readAny(source['gateway_response']),
      method: readText(source['method']),
      processor: readText(source['processor']),
      reference: readText(source['reference']),
    );
  }

  final String? amount;

  /// Untyped: null in every record measured.
  final Object? gatewayResponse;

  final String? method;

  final String? processor;

  final String? reference;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'gateway_response': gatewayResponse,
        'method': method,
        'processor': processor,
        'reference': reference,
      };
}

/// One entry of a [AccountPaymentsData]'s `credit_applied`.
class AccountPaymentsDataCreditApplied extends Dto {
  const AccountPaymentsDataCreditApplied({
    this.amount,
    this.code,
  });

  static AccountPaymentsDataCreditApplied? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPaymentsDataCreditApplied(
      amount: readText(source['amount']),
      code: readText(source['code']),
    );
  }

  final String? amount;

  final String? code;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'code': code,
      };
}

/// One entry of a [AccountPaymentsData]'s `gift_certificate_applied`.
class AccountPaymentsDataGiftCertificateApplied extends Dto {
  const AccountPaymentsDataGiftCertificateApplied({
    this.amount,
    this.code,
  });

  static AccountPaymentsDataGiftCertificateApplied? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPaymentsDataGiftCertificateApplied(
      amount: readText(source['amount']),
      code: readText(source['code']),
    );
  }

  final String? amount;

  final String? code;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'code': code,
      };
}

/// One entry of a [AccountPaymentsData]'s `invoices`.
class AccountPaymentsDataInvoice extends Dto {
  const AccountPaymentsDataInvoice({
    this.applied,
    this.dueDate,
    this.id,
    this.issueDate,
    this.outstanding,
    this.total,
  });

  static AccountPaymentsDataInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPaymentsDataInvoice(
      applied: readText(source['applied']),
      dueDate: readText(source['due_date']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      outstanding: readText(source['outstanding']),
      total: readText(source['total']),
    );
  }

  final String? applied;

  final String? dueDate;

  final String? id;

  final String? issueDate;

  final String? outstanding;

  final String? total;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'applied': applied,
        'due_date': dueDate,
        'id': id,
        'issue_date': issueDate,
        'outstanding': outstanding,
        'total': total,
      };
}

/// A [AccountPaymentsData]'s `created_by`.
class AccountPaymentsDataCreatedBy extends Dto {
  const AccountPaymentsDataCreatedBy({
    this.name,
    this.object,
  });

  static AccountPaymentsDataCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPaymentsDataCreatedBy(
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
