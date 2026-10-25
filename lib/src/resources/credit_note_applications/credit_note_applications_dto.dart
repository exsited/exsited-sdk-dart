/// Typed views over the v4 credit note applications bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The credit note application body.
class CreditNoteApplication extends Dto {
  const CreditNoteApplication({
    this.amount,
    this.createdBy,
    this.createdOn,
    this.creditNote,
    this.creditNoteId,
    this.date,
    this.href,
    this.id,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.payment,
    this.paymentId,
    this.primaryid,
    this.refund,
    this.refundId,
    this.remainingBalance,
    this.status,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/credit_note_applications',
  ];

  static CreditNoteApplication? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteApplication(
      amount: readAny(source['amount']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNote:
          CreditNoteApplicationCreditNote.fromMap(source['credit_note']),
      creditNoteId: readText(source['credit_note_id']),
      date: readText(source['date']),
      href: readText(source['href']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      payment: CreditNoteApplicationPayment.fromMap(source['payment']),
      paymentId: readText(source['payment_id']),
      primaryid: readInteger(source['primaryId']),
      refund: CreditNoteApplicationRefund.fromMap(source['refund']),
      refundId: readText(source['refund_id']),
      remainingBalance: readAny(source['remaining_balance']),
      status: readText(source['status']),
      uuid: readText(source['uuid']),
      version: readAny(source['version']),
    );
  }

  /// Untyped: a String on some records and a double on others.
  final Object? amount;

  /// Untyped: a String on some records and a map on others.
  final Object? createdBy;

  final String? createdOn;

  final CreditNoteApplicationCreditNote? creditNote;

  final String? creditNoteId;

  final String? date;

  final String? href;

  final String? id;

  final String? issueDate;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final CreditNoteApplicationPayment? payment;

  final String? paymentId;

  final int? primaryid;

  final CreditNoteApplicationRefund? refund;

  final String? refundId;

  /// Untyped: a String on some records and a double on others.
  final Object? remainingBalance;

  final String? status;

  final String? uuid;

  /// Untyped: a String on some records and an int on others.
  final Object? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note': creditNote,
        'credit_note_id': creditNoteId,
        'date': date,
        'href': href,
        'id': id,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'payment': payment,
        'payment_id': paymentId,
        'primaryId': primaryid,
        'refund': refund,
        'refund_id': refundId,
        'remaining_balance': remainingBalance,
        'status': status,
        'uuid': uuid,
        'version': version,
      };
}

/// A page of CreditNoteApplication records.
class CreditNoteApplicationList extends Dto {
  const CreditNoteApplicationList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/credit_note_applications',
  ];

  static CreditNoteApplicationList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteApplicationList(
      data: readList<CreditNoteApplication>(
          source['data'], CreditNoteApplication.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<CreditNoteApplication?>? data;

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

/// The credit note application read body.
class CreditNoteApplicationRead extends Dto {
  const CreditNoteApplicationRead({
    this.amount,
    this.createdBy,
    this.createdOn,
    this.creditNote,
    this.href,
    this.id,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.payment,
    this.primaryid,
    this.refund,
    this.remainingBalance,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/credit_note_applications/{credit_note_application_id}',
  ];

  static CreditNoteApplicationRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'credit_note_application');
    if (source == null) return null;
    return CreditNoteApplicationRead(
      amount: readDecimal(source['amount']),
      createdBy:
          CreditNoteApplicationReadCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      creditNote:
          CreditNoteApplicationReadCreditNote.fromMap(source['credit_note']),
      href: readText(source['href']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      payment: CreditNoteApplicationReadPayment.fromMap(source['payment']),
      primaryid: readInteger(source['primaryId']),
      refund: CreditNoteApplicationReadRefund.fromMap(source['refund']),
      remainingBalance: readDecimal(source['remaining_balance']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final double? amount;

  final CreditNoteApplicationReadCreatedBy? createdBy;

  final String? createdOn;

  final CreditNoteApplicationReadCreditNote? creditNote;

  final String? href;

  final String? id;

  final String? issueDate;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final CreditNoteApplicationReadPayment? payment;

  final int? primaryid;

  final CreditNoteApplicationReadRefund? refund;

  final double? remainingBalance;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'credit_note_application';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note': creditNote,
        'href': href,
        'id': id,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'payment': payment,
        'primaryId': primaryid,
        'refund': refund,
        'remaining_balance': remainingBalance,
        'status': status,
        'version': version,
      };
}

/// The invoice credit note applications body.
class InvoiceCreditNoteApplications extends Dto {
  const InvoiceCreditNoteApplications({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/invoices/{invoice_id}/credit_note_applications',
  ];

  static InvoiceCreditNoteApplications? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceCreditNoteApplications(
      data: readList<InvoiceCreditNoteApplicationsData>(
          source['data'], InvoiceCreditNoteApplicationsData.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<InvoiceCreditNoteApplicationsData?>? data;

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

/// A [CreditNoteApplicationRead]'s `credit_note`.
class CreditNoteApplicationReadCreditNote extends Dto {
  const CreditNoteApplicationReadCreditNote({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static CreditNoteApplicationReadCreditNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteApplicationReadCreditNote(
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

/// A [CreditNoteApplicationRead]'s `payment`.
class CreditNoteApplicationReadPayment extends Dto {
  const CreditNoteApplicationReadPayment({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static CreditNoteApplicationReadPayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteApplicationReadPayment(
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

/// A [CreditNoteApplicationRead]'s `refund`.
class CreditNoteApplicationReadRefund extends Dto {
  const CreditNoteApplicationReadRefund({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static CreditNoteApplicationReadRefund? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteApplicationReadRefund(
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

/// A [CreditNoteApplicationRead]'s `created_by`.
class CreditNoteApplicationReadCreatedBy extends Dto {
  const CreditNoteApplicationReadCreatedBy({
    this.id,
    this.name,
    this.object,
  });

  static CreditNoteApplicationReadCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteApplicationReadCreatedBy(
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

/// One entry of a [InvoiceCreditNoteApplications]'s `data`.
class InvoiceCreditNoteApplicationsData extends Dto {
  const InvoiceCreditNoteApplicationsData({
    this.amount,
    this.createdBy,
    this.createdOn,
    this.creditNote,
    this.href,
    this.id,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.payment,
    this.primaryId,
    this.refund,
    this.remainingBalance,
    this.status,
    this.version,
  });

  static InvoiceCreditNoteApplicationsData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceCreditNoteApplicationsData(
      amount: readDecimal(source['amount']),
      createdBy: InvoiceCreditNoteApplicationsDataCreatedBy.fromMap(
          source['created_by']),
      createdOn: readText(source['created_on']),
      creditNote: InvoiceCreditNoteApplicationsDataCreditNote.fromMap(
          source['credit_note']),
      href: readText(source['href']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      payment:
          InvoiceCreditNoteApplicationsDataPayment.fromMap(source['payment']),
      primaryId: readInteger(source['primaryId']),
      refund: readAny(source['refund']),
      remainingBalance: readDecimal(source['remaining_balance']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final double? amount;

  final InvoiceCreditNoteApplicationsDataCreatedBy? createdBy;

  final String? createdOn;

  final InvoiceCreditNoteApplicationsDataCreditNote? creditNote;

  final String? href;

  final String? id;

  final String? issueDate;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final InvoiceCreditNoteApplicationsDataPayment? payment;

  final int? primaryId;

  /// Untyped: null in every record measured.
  final Object? refund;

  final double? remainingBalance;

  final String? status;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'created_by': createdBy,
        'created_on': createdOn,
        'credit_note': creditNote,
        'href': href,
        'id': id,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'payment': payment,
        'primaryId': primaryId,
        'refund': refund,
        'remaining_balance': remainingBalance,
        'status': status,
        'version': version,
      };
}

/// A [CreditNoteApplication]'s `credit_note`.
class CreditNoteApplicationCreditNote extends Dto {
  const CreditNoteApplicationCreditNote({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static CreditNoteApplicationCreditNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteApplicationCreditNote(
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

/// A [CreditNoteApplication]'s `payment`.
class CreditNoteApplicationPayment extends Dto {
  const CreditNoteApplicationPayment({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static CreditNoteApplicationPayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteApplicationPayment(
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

/// A [CreditNoteApplication]'s `refund`.
class CreditNoteApplicationRefund extends Dto {
  const CreditNoteApplicationRefund({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static CreditNoteApplicationRefund? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CreditNoteApplicationRefund(
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

/// A [InvoiceCreditNoteApplicationsData]'s `credit_note`.
class InvoiceCreditNoteApplicationsDataCreditNote extends Dto {
  const InvoiceCreditNoteApplicationsDataCreditNote({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static InvoiceCreditNoteApplicationsDataCreditNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceCreditNoteApplicationsDataCreditNote(
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

/// A [InvoiceCreditNoteApplicationsData]'s `payment`.
class InvoiceCreditNoteApplicationsDataPayment extends Dto {
  const InvoiceCreditNoteApplicationsDataPayment({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static InvoiceCreditNoteApplicationsDataPayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceCreditNoteApplicationsDataPayment(
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

/// A [InvoiceCreditNoteApplicationsData]'s `created_by`.
class InvoiceCreditNoteApplicationsDataCreatedBy extends Dto {
  const InvoiceCreditNoteApplicationsDataCreatedBy({
    this.id,
    this.name,
    this.object,
  });

  static InvoiceCreditNoteApplicationsDataCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return InvoiceCreditNoteApplicationsDataCreatedBy(
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
