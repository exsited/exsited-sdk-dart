/// Typed views over the v4 shipping packages bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The settings shipping package body, under `shipping_package`.
class SettingsShippingPackage extends Dto {
  const SettingsShippingPackage({
    this.createdBy,
    this.createdOn,
    this.cubic,
    this.cubicUom,
    this.description,
    this.displayName,
    this.height,
    this.heightUom,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.length,
    this.lengthUom,
    this.name,
    this.object,
    this.status,
    this.weight,
    this.weightUom,
    this.width,
    this.widthUom,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/shipping_packages',
    'GET /api/{api_version}/settings/shipping_packages/{shipping_package_id}',
    'POST /api/{api_version}/settings/shipping_packages',
    'PATCH /api/{api_version}/settings/shipping_packages/{shipping_package_id}',
  ];

  static SettingsShippingPackage? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'shipping_package');
    if (source == null) return null;
    return SettingsShippingPackage(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      cubic: readAny(source['cubic']),
      cubicUom: readAny(source['cubic_uom']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      height: readDecimal(source['height']),
      heightUom: readAny(source['height_uom']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      length: readDecimal(source['length']),
      lengthUom: readAny(source['length_uom']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
      weight: readDecimal(source['weight']),
      weightUom: readAny(source['weight_uom']),
      width: readDecimal(source['width']),
      widthUom: readAny(source['width_uom']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? cubic;

  /// Null in every record measured, so untyped.
  final Object? cubicUom;

  final String? description;

  final String? displayName;

  final double? height;

  /// Null in every record measured, so untyped.
  final Object? heightUom;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final double? length;

  /// Null in every record measured, so untyped.
  final Object? lengthUom;

  final String? name;

  final String? object;

  final String? status;

  final double? weight;

  /// Null in every record measured, so untyped.
  final Object? weightUom;

  final double? width;

  /// Null in every record measured, so untyped.
  final Object? widthUom;

  @override
  String? get envelopeKey => 'shipping_package';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'cubic': cubic,
        'cubic_uom': cubicUom,
        'description': description,
        'display_name': displayName,
        'height': height,
        'height_uom': heightUom,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'length': length,
        'length_uom': lengthUom,
        'name': name,
        'object': object,
        'status': status,
        'weight': weight,
        'weight_uom': weightUom,
        'width': width,
        'width_uom': widthUom,
      };
}

/// One page of `SettingsShippingPackage` records, under `data`.
class SettingsShippingPackageList extends Dto {
  const SettingsShippingPackageList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/shipping_packages',
  ];

  static SettingsShippingPackageList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsShippingPackageList(
      data: readList<SettingsShippingPackage>(
          source['data'], SettingsShippingPackage.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<SettingsShippingPackage?>? data;

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
