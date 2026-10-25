/// Typed views over the v4 gift certificates bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The gift certificate body.
class GiftCertificate extends Dto {
  const GiftCertificate({
    this.accountingCode,
    this.activityLogs,
    this.allocations,
    this.amount,
    this.code,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.expiryDate,
    this.href,
    this.id,
    this.issueDate,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.linkedItem,
    this.object,
    this.remainingBalance,
    this.status,
    this.transactions,
    this.usedAmount,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/gift_certificates',
    'GET /api/{api_version}/gift_certificates/{gc_id}',
    'POST /api/{api_version}/gift_certificates',
    'PATCH /api/{api_version}/gift_certificates/{gc_id}',
  ];

  static GiftCertificate? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'gift_certificate');
    if (source == null) return null;
    return GiftCertificate(
      accountingCode:
          GiftCertificateAccountingCode.fromMap(source['accounting_code']),
      activityLogs: readList<GiftCertificateActivityLog>(
          source['activity_logs'], GiftCertificateActivityLog.fromMap),
      allocations: readList<GiftCertificateAllocation>(
          source['allocations'], GiftCertificateAllocation.fromMap),
      amount: readText(source['amount']),
      code: readText(source['code']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: GiftCertificateCurrency.fromMap(source['currency']),
      expiryDate: readText(source['expiry_date']),
      href: readText(source['href']),
      id: readText(source['id']),
      issueDate: readText(source['issue_date']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      linkedItem: readAny(source['linked_item']),
      object: readText(source['object']),
      remainingBalance: readText(source['remaining_balance']),
      status: readText(source['status']),
      transactions: readList<GiftCertificateTransactionEntry>(
          source['transactions'], GiftCertificateTransactionEntry.fromMap),
      usedAmount: readText(source['used_amount']),
      version: readInteger(source['version']),
    );
  }

  final GiftCertificateAccountingCode? accountingCode;

  final List<GiftCertificateActivityLog?>? activityLogs;

  final List<GiftCertificateAllocation?>? allocations;

  final String? amount;

  final String? code;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final GiftCertificateCurrency? currency;

  final String? expiryDate;

  final String? href;

  final String? id;

  final String? issueDate;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  /// Untyped: never populated in the records measured.
  final Object? linkedItem;

  final String? object;

  final String? remainingBalance;

  final String? status;

  final List<GiftCertificateTransactionEntry?>? transactions;

  final String? usedAmount;

  final int? version;

  @override
  String? get envelopeKey => 'gift_certificate';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'activity_logs': activityLogs,
        'allocations': allocations,
        'amount': amount,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'expiry_date': expiryDate,
        'href': href,
        'id': id,
        'issue_date': issueDate,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'linked_item': linkedItem,
        'object': object,
        'remaining_balance': remainingBalance,
        'status': status,
        'transactions': transactions,
        'used_amount': usedAmount,
        'version': version,
      };
}

/// A page of GiftCertificate records.
class GiftCertificateList extends Dto {
  const GiftCertificateList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/gift_certificates',
  ];

  static GiftCertificateList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateList(
      data: readList<GiftCertificate>(source['data'], GiftCertificate.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<GiftCertificate?>? data;

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

/// The gift certificate transaction body.
class GiftCertificateTransaction extends Dto {
  const GiftCertificateTransaction({
    this.accountingCode,
    this.amount,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.date,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.reference,
    this.status,
    this.type,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/gift_certificates/{gc_id}/transactions',
  ];

  static GiftCertificateTransaction? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateTransaction(
      accountingCode: GiftCertificateTransactionAccountingCode.fromMap(
          source['accounting_code']),
      amount: readText(source['amount']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: GiftCertificateTransactionCurrency.fromMap(source['currency']),
      date: readText(source['date']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      reference: readAny(source['reference']),
      status: readText(source['status']),
      type: readText(source['type']),
      version: readInteger(source['version']),
    );
  }

  final GiftCertificateTransactionAccountingCode? accountingCode;

  final String? amount;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final GiftCertificateTransactionCurrency? currency;

  final String? date;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  /// Untyped: never populated in the records measured.
  final Object? reference;

  final String? status;

  final String? type;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'amount': amount,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'date': date,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'reference': reference,
        'status': status,
        'type': type,
        'version': version,
      };
}

/// A page of GiftCertificateTransaction records.
class GiftCertificateTransactionList extends Dto {
  const GiftCertificateTransactionList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/gift_certificates/{gc_id}/transactions',
  ];

  static GiftCertificateTransactionList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateTransactionList(
      data: readList<GiftCertificateTransaction>(
          source['data'], GiftCertificateTransaction.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<GiftCertificateTransaction?>? data;

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

/// The gift certificate allocations body.
class GiftCertificateAllocations extends Dto {
  const GiftCertificateAllocations({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/gift_certificates/{gc_id}/allocations',
  ];

  static GiftCertificateAllocations? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateAllocations(
      data: readList<GiftCertificateAllocationsData>(
          source['data'], GiftCertificateAllocationsData.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<GiftCertificateAllocationsData?>? data;

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

/// A [GiftCertificate]'s `currency`.
class GiftCertificateCurrency extends Dto {
  const GiftCertificateCurrency({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static GiftCertificateCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateCurrency(
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

/// A [GiftCertificate]'s `accounting_code`.
class GiftCertificateAccountingCode extends Dto {
  const GiftCertificateAccountingCode({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static GiftCertificateAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateAccountingCode(
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

/// One entry of a [GiftCertificate]'s `allocations`.
class GiftCertificateAllocation extends Dto {
  const GiftCertificateAllocation({
    this.account,
    this.createdBy,
    this.createdOn,
    this.date,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.status,
    this.type,
    this.version,
  });

  static GiftCertificateAllocation? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateAllocation(
      account: GiftCertificateAllocationAccount.fromMap(source['account']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      date: readText(source['date']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      status: readText(source['status']),
      type: readText(source['type']),
      version: readInteger(source['version']),
    );
  }

  final GiftCertificateAllocationAccount? account;

  /// Untyped: null in every record measured.
  final Object? createdBy;

  final String? createdOn;

  final String? date;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? status;

  final String? type;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'created_by': createdBy,
        'created_on': createdOn,
        'date': date,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'status': status,
        'type': type,
        'version': version,
      };
}

/// One entry of a [GiftCertificate]'s `transactions`.
class GiftCertificateTransactionEntry extends Dto {
  const GiftCertificateTransactionEntry({
    this.accountingCode,
    this.amount,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.date,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.reference,
    this.status,
    this.type,
    this.version,
  });

  static GiftCertificateTransactionEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateTransactionEntry(
      accountingCode: GiftCertificateTransactionEntryAccountingCode.fromMap(
          source['accounting_code']),
      amount: readText(source['amount']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency:
          GiftCertificateTransactionEntryCurrency.fromMap(source['currency']),
      date: readText(source['date']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      reference: readAny(source['reference']),
      status: readText(source['status']),
      type: readText(source['type']),
      version: readInteger(source['version']),
    );
  }

  final GiftCertificateTransactionEntryAccountingCode? accountingCode;

  final String? amount;

  /// Untyped: null in every record measured.
  final Object? createdBy;

  final String? createdOn;

  final GiftCertificateTransactionEntryCurrency? currency;

  final String? date;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  /// Untyped: null in every record measured.
  final Object? reference;

  final String? status;

  final String? type;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'amount': amount,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'date': date,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'reference': reference,
        'status': status,
        'type': type,
        'version': version,
      };
}

/// One entry of a [GiftCertificate]'s `activity_logs`.
class GiftCertificateActivityLog extends Dto {
  const GiftCertificateActivityLog({
    this.activity,
  });

  static GiftCertificateActivityLog? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateActivityLog(
      activity: readText(source['activity']),
    );
  }

  final String? activity;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity': activity,
      };
}

/// One entry of a [GiftCertificateAllocations]'s `data`.
class GiftCertificateAllocationsData extends Dto {
  const GiftCertificateAllocationsData({
    this.account,
    this.createdBy,
    this.createdOn,
    this.date,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.status,
    this.type,
    this.version,
  });

  static GiftCertificateAllocationsData? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateAllocationsData(
      account: GiftCertificateAllocationsDataAccount.fromMap(source['account']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      date: readText(source['date']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      status: readText(source['status']),
      type: readText(source['type']),
      version: readInteger(source['version']),
    );
  }

  final GiftCertificateAllocationsDataAccount? account;

  /// Untyped: null in every record measured.
  final Object? createdBy;

  final String? createdOn;

  final String? date;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? status;

  final String? type;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'created_by': createdBy,
        'created_on': createdOn,
        'date': date,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'status': status,
        'type': type,
        'version': version,
      };
}

/// A [GiftCertificateTransaction]'s `currency`.
class GiftCertificateTransactionCurrency extends Dto {
  const GiftCertificateTransactionCurrency({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static GiftCertificateTransactionCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateTransactionCurrency(
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

/// A [GiftCertificateTransaction]'s `accounting_code`.
class GiftCertificateTransactionAccountingCode extends Dto {
  const GiftCertificateTransactionAccountingCode({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static GiftCertificateTransactionAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateTransactionAccountingCode(
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

/// A [GiftCertificateAllocation]'s `account`.
class GiftCertificateAllocationAccount extends Dto {
  const GiftCertificateAllocationAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static GiftCertificateAllocationAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateAllocationAccount(
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

/// A [GiftCertificateTransactionEntry]'s `currency`.
class GiftCertificateTransactionEntryCurrency extends Dto {
  const GiftCertificateTransactionEntryCurrency({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static GiftCertificateTransactionEntryCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateTransactionEntryCurrency(
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

/// A [GiftCertificateTransactionEntry]'s `accounting_code`.
class GiftCertificateTransactionEntryAccountingCode extends Dto {
  const GiftCertificateTransactionEntryAccountingCode({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static GiftCertificateTransactionEntryAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateTransactionEntryAccountingCode(
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

/// A [GiftCertificateAllocationsData]'s `account`.
class GiftCertificateAllocationsDataAccount extends Dto {
  const GiftCertificateAllocationsDataAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static GiftCertificateAllocationsDataAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return GiftCertificateAllocationsDataAccount(
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

/// One allocation, under `gift_certificate_allocation`: the fields an
/// allocation carries in `allocations`.
class GiftCertificateAllocationRead extends Dto {
  const GiftCertificateAllocationRead({
    this.account,
    this.createdBy,
    this.createdOn,
    this.date,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.status,
    this.type,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/gift_certificates/{gc_id}/allocations/{allocation_id}',
  ];

  static GiftCertificateAllocationRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'gift_certificate_allocation');
    if (source == null) return null;
    return GiftCertificateAllocationRead(
      account: GiftCertificateAllocationAccount.fromMap(source['account']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      date: readText(source['date']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      status: readText(source['status']),
      type: readText(source['type']),
      version: readInteger(source['version']),
    );
  }

  final GiftCertificateAllocationAccount? account;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? date;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? status;

  final String? type;

  final int? version;

  @override
  String? get envelopeKey => 'gift_certificate_allocation';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'created_by': createdBy,
        'created_on': createdOn,
        'date': date,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'status': status,
        'type': type,
        'version': version,
      };
}

/// One transaction, under `gift_certificate_transaction`: the fields a
/// transaction carries in `transactions`.
class GiftCertificateTransactionRead extends Dto {
  const GiftCertificateTransactionRead({
    this.accountingCode,
    this.amount,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.date,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.reference,
    this.status,
    this.type,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/gift_certificates/{gc_id}/transactions/{transaction_id}',
  ];

  static GiftCertificateTransactionRead? fromMap(Object? body) {
    final source =
        readRecord(body, envelopeKey: 'gift_certificate_transaction');
    if (source == null) return null;
    return GiftCertificateTransactionRead(
      accountingCode: GiftCertificateTransactionAccountingCode.fromMap(
          source['accounting_code']),
      amount: readText(source['amount']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: GiftCertificateTransactionCurrency.fromMap(source['currency']),
      date: readText(source['date']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      reference: readAny(source['reference']),
      status: readText(source['status']),
      type: readText(source['type']),
      version: readInteger(source['version']),
    );
  }

  final GiftCertificateTransactionAccountingCode? accountingCode;

  final String? amount;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final GiftCertificateTransactionCurrency? currency;

  final String? date;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  /// Null in every record measured, so untyped.
  final Object? reference;

  final String? status;

  final String? type;

  final int? version;

  @override
  String? get envelopeKey => 'gift_certificate_transaction';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounting_code': accountingCode,
        'amount': amount,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'date': date,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'reference': reference,
        'status': status,
        'type': type,
        'version': version,
      };
}
