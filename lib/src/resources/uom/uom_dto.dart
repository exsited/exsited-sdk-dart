/// Typed views over the v4 uom bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings unit of measurement body, under `uom`.
class SettingsUom extends Dto {
  const SettingsUom({
    this.createdBy,
    this.createdOn,
    this.customType,
    this.decimalPlaces,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.rounding,
    this.status,
    this.type,
    this.typeDisplayText,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/uom',
    'GET /api/{api_version}/settings/uom/{uom_id}',
  ];

  static SettingsUom? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'uom');
    if (source == null) return null;
    return SettingsUom(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      customType: readAny(source['custom_type']),
      decimalPlaces: readInteger(source['decimal_places']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      rounding: readText(source['rounding']),
      status: readText(source['status']),
      type: readText(source['type']),
      typeDisplayText: readText(source['type_display_text']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? customType;

  final int? decimalPlaces;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? rounding;

  final String? status;

  final String? type;

  final String? typeDisplayText;

  @override
  String? get envelopeKey => 'uom';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_type': customType,
        'decimal_places': decimalPlaces,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'rounding': rounding,
        'status': status,
        'type': type,
        'type_display_text': typeDisplayText,
      };
}

/// One page of `SettingsUom` records, under `data`.
class SettingsUomList extends Dto {
  const SettingsUomList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/uom',
  ];

  static SettingsUomList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsUomList(
      data: readList<SettingsUom>(source['data'], SettingsUom.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsUom?>? data;

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
