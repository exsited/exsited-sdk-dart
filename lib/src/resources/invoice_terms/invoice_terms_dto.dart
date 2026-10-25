/// Typed views over the v4 invoice terms bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings invoice term body, under `invoice_term`.
class SettingsInvoiceTerm extends Dto {
  const SettingsInvoiceTerm({
    this.description,
    this.displayName,
    this.duration,
    this.href,
    this.id,
    this.name,
    this.object,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/invoice_terms',
    'GET /api/{api_version}/settings/invoice_terms/{invoice_term_id}',
  ];

  static SettingsInvoiceTerm? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'invoice_term');
    if (source == null) return null;
    return SettingsInvoiceTerm(
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      duration: SettingsInvoiceTermDuration.fromMap(source['duration']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
    );
  }

  final String? description;

  final String? displayName;

  final SettingsInvoiceTermDuration? duration;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final String? status;

  @override
  String? get envelopeKey => 'invoice_term';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'description': description,
        'display_name': displayName,
        'duration': duration,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'status': status,
      };
}

/// One page of `SettingsInvoiceTerm` records, under `data`.
class SettingsInvoiceTermList extends Dto {
  const SettingsInvoiceTermList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/invoice_terms',
  ];

  static SettingsInvoiceTermList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsInvoiceTermList(
      data: readList<SettingsInvoiceTerm>(
          source['data'], SettingsInvoiceTerm.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsInvoiceTerm?>? data;

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

/// A [SettingsInvoiceTerm]'s `duration`.
class SettingsInvoiceTermDuration extends Dto {
  const SettingsInvoiceTermDuration({
    this.count,
    this.period,
  });

  static SettingsInvoiceTermDuration? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsInvoiceTermDuration(
      count: readInteger(source['count']),
      period: readText(source['period']),
    );
  }

  final int? count;

  final String? period;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'count': count,
        'period': period,
      };
}

/// The settings invoice term body a create or an update answers, under
/// `invoice_term`.
class SettingsInvoiceTermWrite extends Dto {
  const SettingsInvoiceTermWrite({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.duration,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.ordering,
    this.period,
    this.status,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/settings/invoice_terms',
    'PATCH /api/{api_version}/settings/invoice_terms/{invoice_term_id}',
  ];

  static SettingsInvoiceTermWrite? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'invoice_term');
    if (source == null) return null;
    return SettingsInvoiceTermWrite(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      duration: readInteger(source['duration']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      ordering: readInteger(source['ordering']),
      period: readText(source['period']),
      status: readText(source['status']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final int? duration;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final int? ordering;

  final String? period;

  final String? status;

  @override
  String? get envelopeKey => 'invoice_term';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'duration': duration,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'ordering': ordering,
        'period': period,
        'status': status,
      };
}
