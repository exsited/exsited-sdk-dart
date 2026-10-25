/// Typed views over the v4 accounting codes bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings accounting code body.
class SettingsAccountingCode extends Dto {
  const SettingsAccountingCode({
    this.accountCodeType,
    this.createdBy,
    this.createdOn,
    this.defaultMatchKey,
    this.description,
    this.displayName,
    this.glAccountName,
    this.glAccountNumber,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/accounting_codes',
    'GET /api/{api_version}/settings/accounting_codes/{accounting_code_id}',
    'POST /api/{api_version}/settings/accounting_codes',
    'PATCH /api/{api_version}/settings/accounting_codes/{accounting_code_id}',
  ];

  static SettingsAccountingCode? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'accounting_code');
    if (source == null) return null;
    return SettingsAccountingCode(
      accountCodeType: readText(source['account_code_type']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      defaultMatchKey: readText(source['default_match_key']),
      description: readAny(source['description']),
      displayName: readText(source['display_name']),
      glAccountName: readText(source['gl_account_name']),
      glAccountNumber: readText(source['gl_account_number']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final String? accountCodeType;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final String? defaultMatchKey;

  /// Untyped: never populated in the records measured.
  final Object? description;

  final String? displayName;

  final String? glAccountName;

  final String? glAccountNumber;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'accounting_code';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account_code_type': accountCodeType,
        'created_by': createdBy,
        'created_on': createdOn,
        'default_match_key': defaultMatchKey,
        'description': description,
        'display_name': displayName,
        'gl_account_name': glAccountName,
        'gl_account_number': glAccountNumber,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
        'version': version,
      };
}

/// A page of SettingsAccountingCode records.
class SettingsAccountingCodeList extends Dto {
  const SettingsAccountingCodeList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/accounting_codes',
  ];

  static SettingsAccountingCodeList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsAccountingCodeList(
      data: readList<SettingsAccountingCode>(
          source['data'], SettingsAccountingCode.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsAccountingCode?>? data;

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
