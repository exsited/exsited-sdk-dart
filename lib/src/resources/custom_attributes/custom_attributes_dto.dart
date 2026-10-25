/// Typed views over the v4 custom attributes bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The custom attribute body.
class CustomAttribute extends Dto {
  const CustomAttribute({
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.encryptData,
    this.href,
    this.id,
    this.includeSeconds,
    this.isMandatory,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.maxLength,
    this.maxSize,
    this.maxValue,
    this.metaData,
    this.minValue,
    this.name,
    this.object,
    this.options,
    this.status,
    this.timeFormat,
    this.type,
    this.unit,
    this.uom,
    this.useIn,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/custom_attributes',
    'GET /api/{api_version}/custom_attributes/{custom_attribute_id}',
    'PATCH /api/{api_version}/custom_attributes/{custom_attribute_id}',
  ];

  static CustomAttribute? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_attribute');
    if (source == null) return null;
    return CustomAttribute(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      encryptData: readFlag(source['encrypt_data']),
      href: readText(source['href']),
      id: readText(source['id']),
      includeSeconds: readAny(source['include_seconds']),
      isMandatory: readFlag(source['is_mandatory']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      maxLength: readInteger(source['max_length']),
      maxSize: readAny(source['max_size']),
      maxValue: readAny(source['max_value']),
      metaData: readAny(source['meta_data']),
      minValue: readAny(source['min_value']),
      name: readText(source['name']),
      object: readText(source['object']),
      options: readList<CustomAttributeOption>(
          source['options'], CustomAttributeOption.fromMap),
      status: readText(source['status']),
      timeFormat: readAny(source['time_format']),
      type: readText(source['type']),
      unit: readAny(source['unit']),
      uom: readAny(source['uom']),
      useIn: readList<CustomAttributeUseIn>(
          source['use_in'], CustomAttributeUseIn.fromMap),
      version: readInteger(source['version']),
    );
  }

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final bool? encryptData;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? includeSeconds;

  final bool? isMandatory;

  /// Untyped: never populated in the records measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final int? maxLength;

  /// Untyped: never populated in the records measured.
  final Object? maxSize;

  /// Untyped: never populated in the records measured.
  final Object? maxValue;

  /// Untyped: never populated in the records measured.
  final Object? metaData;

  /// Untyped: never populated in the records measured.
  final Object? minValue;

  final String? name;

  final String? object;

  final List<CustomAttributeOption?>? options;

  final String? status;

  /// Untyped: never populated in the records measured.
  final Object? timeFormat;

  final String? type;

  /// Untyped: never populated in the records measured.
  final Object? unit;

  /// Untyped: never populated in the records measured.
  final Object? uom;

  final List<CustomAttributeUseIn?>? useIn;

  final int? version;

  @override
  String? get envelopeKey => 'custom_attribute';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'encrypt_data': encryptData,
        'href': href,
        'id': id,
        'include_seconds': includeSeconds,
        'is_mandatory': isMandatory,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'max_length': maxLength,
        'max_size': maxSize,
        'max_value': maxValue,
        'meta_data': metaData,
        'min_value': minValue,
        'name': name,
        'object': object,
        'options': options,
        'status': status,
        'time_format': timeFormat,
        'type': type,
        'unit': unit,
        'uom': uom,
        'use_in': useIn,
        'version': version,
      };
}

/// A page of CustomAttribute records.
class CustomAttributeList extends Dto {
  const CustomAttributeList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/custom_attributes',
  ];

  static CustomAttributeList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomAttributeList(
      data: readList<CustomAttribute>(source['data'], CustomAttribute.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<CustomAttribute?>? data;

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

/// The custom attributes body.
class CustomAttributes extends Dto {
  const CustomAttributes({
    this.activityLogs,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
    this.encryptData,
    this.href,
    this.id,
    this.includeSeconds,
    this.isMandatory,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.maxLength,
    this.maxSize,
    this.maxValue,
    this.metaData,
    this.minValue,
    this.name,
    this.object,
    this.options,
    this.status,
    this.timeFormat,
    this.type,
    this.unit,
    this.uom,
    this.useIn,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/custom_attributes',
  ];

  static CustomAttributes? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_attribute');
    if (source == null) return null;
    return CustomAttributes(
      activityLogs: readList<CustomAttributesActivityLog>(
          source['activity_logs'], CustomAttributesActivityLog.fromMap),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      encryptData: readFlag(source['encrypt_data']),
      href: readText(source['href']),
      id: readText(source['id']),
      includeSeconds: readAny(source['include_seconds']),
      isMandatory: readFlag(source['is_mandatory']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      maxLength: readInteger(source['max_length']),
      maxSize: readAny(source['max_size']),
      maxValue: readAny(source['max_value']),
      metaData: readText(source['meta_data']),
      minValue: readAny(source['min_value']),
      name: readText(source['name']),
      object: readText(source['object']),
      options: readList<CustomAttributesOption>(
          source['options'], CustomAttributesOption.fromMap),
      status: readText(source['status']),
      timeFormat: readAny(source['time_format']),
      type: readText(source['type']),
      unit: readAny(source['unit']),
      uom: readAny(source['uom']),
      useIn: readList<CustomAttributesUseIn>(
          source['use_in'], CustomAttributesUseIn.fromMap),
      uuid: readText(source['uuid']),
      version: readInteger(source['version']),
    );
  }

  final List<CustomAttributesActivityLog?>? activityLogs;

  /// Untyped: null in every record measured.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

  final bool? encryptData;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? includeSeconds;

  final bool? isMandatory;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final int? maxLength;

  /// Untyped: null in every record measured.
  final Object? maxSize;

  /// Untyped: null in every record measured.
  final Object? maxValue;

  final String? metaData;

  /// Untyped: null in every record measured.
  final Object? minValue;

  final String? name;

  final String? object;

  final List<CustomAttributesOption?>? options;

  final String? status;

  /// Untyped: null in every record measured.
  final Object? timeFormat;

  final String? type;

  /// Untyped: null in every record measured.
  final Object? unit;

  /// Untyped: null in every record measured.
  final Object? uom;

  final List<CustomAttributesUseIn?>? useIn;

  final String? uuid;

  final int? version;

  @override
  String? get envelopeKey => 'custom_attribute';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
        'encrypt_data': encryptData,
        'href': href,
        'id': id,
        'include_seconds': includeSeconds,
        'is_mandatory': isMandatory,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'max_length': maxLength,
        'max_size': maxSize,
        'max_value': maxValue,
        'meta_data': metaData,
        'min_value': minValue,
        'name': name,
        'object': object,
        'options': options,
        'status': status,
        'time_format': timeFormat,
        'type': type,
        'unit': unit,
        'uom': uom,
        'use_in': useIn,
        'uuid': uuid,
        'version': version,
      };
}

/// One entry of a [CustomAttribute]'s `options`.
class CustomAttributeOption extends Dto {
  const CustomAttributeOption({
    this.displayOrder,
    this.name,
  });

  static CustomAttributeOption? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomAttributeOption(
      displayOrder: readInteger(source['display_order']),
      name: readText(source['name']),
    );
  }

  final int? displayOrder;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_order': displayOrder,
        'name': name,
      };
}

/// One entry of a [CustomAttribute]'s `use_in`.
class CustomAttributeUseIn extends Dto {
  const CustomAttributeUseIn({
    this.associatedAccountGroups,
    this.associatedItemGroups,
    this.associatedUserGroups,
    this.enabled,
    this.requiredValue,
    this.resource,
    this.unique,
  });

  static CustomAttributeUseIn? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomAttributeUseIn(
      associatedAccountGroups:
          readList<Object>(source['associated_account_groups'], readAny),
      associatedItemGroups:
          readList<Object>(source['associated_item_groups'], readAny),
      associatedUserGroups:
          readList<Object>(source['associated_user_groups'], readAny),
      enabled: readFlag(source['enabled']),
      requiredValue: readFlag(source['required']),
      resource: readText(source['resource']),
      unique: readFlag(source['unique']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? associatedAccountGroups;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? associatedItemGroups;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? associatedUserGroups;

  final bool? enabled;

  final bool? requiredValue;

  final String? resource;

  final bool? unique;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'associated_account_groups': associatedAccountGroups,
        'associated_item_groups': associatedItemGroups,
        'associated_user_groups': associatedUserGroups,
        'enabled': enabled,
        'required': requiredValue,
        'resource': resource,
        'unique': unique,
      };
}

/// One entry of a [CustomAttributes]'s `options`.
class CustomAttributesOption extends Dto {
  const CustomAttributesOption({
    this.displayOrder,
    this.name,
  });

  static CustomAttributesOption? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomAttributesOption(
      displayOrder: readInteger(source['display_order']),
      name: readText(source['name']),
    );
  }

  final int? displayOrder;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_order': displayOrder,
        'name': name,
      };
}

/// One entry of a [CustomAttributes]'s `use_in`.
class CustomAttributesUseIn extends Dto {
  const CustomAttributesUseIn({
    this.associatedAccountGroups,
    this.associatedItemGroups,
    this.associatedUserGroups,
    this.enabled,
    this.requiredValue,
    this.resource,
    this.unique,
  });

  static CustomAttributesUseIn? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomAttributesUseIn(
      associatedAccountGroups:
          readList<Object>(source['associated_account_groups'], readAny),
      associatedItemGroups:
          readList<Object>(source['associated_item_groups'], readAny),
      associatedUserGroups:
          readList<Object>(source['associated_user_groups'], readAny),
      enabled: readFlag(source['enabled']),
      requiredValue: readFlag(source['required']),
      resource: readText(source['resource']),
      unique: readFlag(source['unique']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? associatedAccountGroups;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? associatedItemGroups;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? associatedUserGroups;

  final bool? enabled;

  final bool? requiredValue;

  final String? resource;

  final bool? unique;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'associated_account_groups': associatedAccountGroups,
        'associated_item_groups': associatedItemGroups,
        'associated_user_groups': associatedUserGroups,
        'enabled': enabled,
        'required': requiredValue,
        'resource': resource,
        'unique': unique,
      };
}

/// One entry of a [CustomAttributes]'s `activity_logs`.
class CustomAttributesActivityLog extends Dto {
  const CustomAttributesActivityLog({
    this.activity,
  });

  static CustomAttributesActivityLog? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return CustomAttributesActivityLog(
      activity: readText(source['activity']),
    );
  }

  final String? activity;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity': activity,
      };
}
