/// Typed views over the v4 usages bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The usage body.
class Usage extends Dto {
  const Usage({
    this.chargeItem,
    this.chargingEndDate,
    this.chargingPeriod,
    this.chargingStartDate,
    this.createdBy,
    this.createdOn,
    this.customAttributes,
    this.endTime,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.quantity,
    this.source,
    this.startTime,
    this.status,
    this.type,
    this.uom,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/usages',
    'GET /api/{api_version}/usages/{usage_id}',
  ];

  static Usage? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'usage');
    if (source == null) return null;
    return Usage(
      chargeItem: UsageChargeItem.fromMap(source['charge_item']),
      chargingEndDate: readText(source['charging_end_date']),
      chargingPeriod: readText(source['charging_period']),
      chargingStartDate: readText(source['charging_start_date']),
      createdBy: UsageCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      customAttributes: readList<UsageCustomAttribute>(
          source['custom_attributes'], UsageCustomAttribute.fromMap),
      endTime: readText(source['end_time']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: UsageLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      quantity: readDecimal(source['quantity']),
      source: readAny(source['source']),
      startTime: readText(source['start_time']),
      status: readText(source['status']),
      type: readText(source['type']),
      uom: readAny(source['uom']),
      version: readInteger(source['version']),
    );
  }

  final UsageChargeItem? chargeItem;

  final String? chargingEndDate;

  final String? chargingPeriod;

  final String? chargingStartDate;

  final UsageCreatedBy? createdBy;

  final String? createdOn;

  final List<UsageCustomAttribute?>? customAttributes;

  final String? endTime;

  final String? href;

  final String? id;

  final UsageLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final double? quantity;

  /// Untyped: never populated in the records measured.
  final Object? source;

  final String? startTime;

  final String? status;

  final String? type;

  /// Untyped: never populated in the records measured.
  final Object? uom;

  final int? version;

  @override
  String? get envelopeKey => 'usage';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'charge_item': chargeItem,
        'charging_end_date': chargingEndDate,
        'charging_period': chargingPeriod,
        'charging_start_date': chargingStartDate,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_attributes': customAttributes,
        'end_time': endTime,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'quantity': quantity,
        'source': source,
        'start_time': startTime,
        'status': status,
        'type': type,
        'uom': uom,
        'version': version,
      };
}

/// A page of Usage records.
class UsageList extends Dto {
  const UsageList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/usages',
  ];

  static UsageList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return UsageList(
      data: readList<Usage>(source['data'], Usage.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Usage?>? data;

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

/// The usages body.
class Usages extends Dto {
  const Usages({
    this.activityLogs,
    this.chargeItemName,
    this.chargeItemUuid,
    this.chargeStatus,
    this.chargingPeriod,
    this.createdBy,
    this.createdOn,
    this.customAttributes,
    this.endTime,
    this.eventId,
    this.failed,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.quantity,
    this.source,
    this.startTime,
    this.success,
    this.type,
    this.uom,
    this.usages,
    this.uuid,
    this.version,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/usages',
  ];

  static Usages? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'usage');
    if (source == null) return null;
    return Usages(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      chargeItemName: readText(source['charge_item_name']),
      chargeItemUuid: readText(source['charge_item_uuid']),
      chargeStatus: readText(source['charge_status']),
      chargingPeriod: readText(source['charging_period']),
      createdBy: readText(source['created_by']),
      createdOn: readText(source['created_on']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      endTime: readText(source['end_time']),
      eventId: readText(source['event_id']),
      failed: readList<Object>(source['failed'], readAny),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readText(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      quantity: readText(source['quantity']),
      source: readText(source['source']),
      startTime: readText(source['start_time']),
      success: readList<Object>(source['success'], readAny),
      type: readText(source['type']),
      uom: readText(source['uom']),
      usages: UsagesUsages.fromMap(source['usages']),
      uuid: readText(source['uuid']),
      version: readText(source['version']),
    );
  }

  final List<Object?>? activityLogs;

  final String? chargeItemName;

  final String? chargeItemUuid;

  final String? chargeStatus;

  final String? chargingPeriod;

  final String? createdBy;

  final String? createdOn;

  final List<Object?>? customAttributes;

  final String? endTime;

  final String? eventId;

  final List<Object?>? failed;

  final String? href;

  final String? id;

  final String? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final String? quantity;

  final String? source;

  final String? startTime;

  final List<Object?>? success;

  final String? type;

  final String? uom;

  final UsagesUsages? usages;

  final String? uuid;

  final String? version;

  @override
  String? get envelopeKey => 'usage';

  @override
  Set<String> get topLevelFields => const <String>{
        'usages',
      };

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'charge_item_name': chargeItemName,
        'charge_item_uuid': chargeItemUuid,
        'charge_status': chargeStatus,
        'charging_period': chargingPeriod,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_attributes': customAttributes,
        'end_time': endTime,
        'event_id': eventId,
        'failed': failed,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'quantity': quantity,
        'source': source,
        'start_time': startTime,
        'success': success,
        'type': type,
        'uom': uom,
        'usages': usages,
        'uuid': uuid,
        'version': version,
      };
}

/// The usage updated body.
class UsageUpdated extends Dto {
  const UsageUpdated({
    this.href,
    this.id,
    this.note,
    this.object,
    this.status,
  });

  static const List<String> measuredFrom = [
    'PATCH /api/{api_version}/usages/{usage_id}',
    'PUT /api/{api_version}/usages/{usage_id}',
  ];

  static UsageUpdated? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'usage');
    if (source == null) return null;
    return UsageUpdated(
      href: readText(source['href']),
      id: readText(source['id']),
      note: readText(source['note']),
      object: readText(source['object']),
      status: readText(source['status']),
    );
  }

  final String? href;

  final String? id;

  final String? note;

  final String? object;

  final String? status;

  @override
  String? get envelopeKey => 'usage';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'note': note,
        'object': object,
        'status': status,
      };
}

/// A [Usage]'s `charge_item`.
class UsageChargeItem extends Dto {
  const UsageChargeItem({
    this.id,
    this.name,
    this.object,
  });

  static UsageChargeItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return UsageChargeItem(
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

/// One entry of a [Usage]'s `custom_attributes`.
class UsageCustomAttribute extends Dto {
  const UsageCustomAttribute({
    this.href,
    this.id,
    this.name,
    this.object,
    this.type,
    this.value,
  });

  static UsageCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return UsageCustomAttribute(
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

/// A [Usage]'s `created_by`.
class UsageCreatedBy extends Dto {
  const UsageCreatedBy({
    this.name,
    this.object,
  });

  static UsageCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return UsageCreatedBy(
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

/// A [Usage]'s `last_updated_by`.
class UsageLastUpdatedBy extends Dto {
  const UsageLastUpdatedBy({
    this.name,
    this.object,
  });

  static UsageLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return UsageLastUpdatedBy(
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

/// A [Usages]'s `usages`.
class UsagesUsages extends Dto {
  const UsagesUsages({
    this.activityLogs,
    this.failed,
    this.success,
  });

  static UsagesUsages? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return UsagesUsages(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      failed: readList<UsagesUsagesFailed>(
          source['failed'], UsagesUsagesFailed.fromMap),
      success: readList<UsagesUsagesSuccess>(
          source['success'], UsagesUsagesSuccess.fromMap),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  final List<UsagesUsagesFailed?>? failed;

  final List<UsagesUsagesSuccess?>? success;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'failed': failed,
        'success': success,
      };
}

/// One entry of a [UsagesUsages]'s `success`.
class UsagesUsagesSuccess extends Dto {
  const UsagesUsagesSuccess({
    this.href,
    this.id,
    this.object,
  });

  static UsagesUsagesSuccess? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return UsagesUsagesSuccess(
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

/// One entry of a [UsagesUsages]'s `failed`.
class UsagesUsagesFailed extends Dto {
  const UsagesUsagesFailed({
    this.chargeItemId,
    this.chargingPeriod,
    this.error,
  });

  static UsagesUsagesFailed? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return UsagesUsagesFailed(
      chargeItemId: readText(source['charge_item_id']),
      chargingPeriod: readText(source['charging_period']),
      error: UsagesUsagesFailedError.fromMap(source['error']),
    );
  }

  final String? chargeItemId;

  final String? chargingPeriod;

  final UsagesUsagesFailedError? error;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'charge_item_id': chargeItemId,
        'charging_period': chargingPeriod,
        'error': error,
      };
}

/// A [UsagesUsagesFailed]'s `error`.
class UsagesUsagesFailedError extends Dto {
  const UsagesUsagesFailedError({
    this.code,
    this.fieldsValue,
    this.message,
  });

  static UsagesUsagesFailedError? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return UsagesUsagesFailedError(
      code: readText(source['code']),
      fieldsValue: readList<UsagesUsagesFailedErrorField>(
          source['fields'], UsagesUsagesFailedErrorField.fromMap),
      message: readText(source['message']),
    );
  }

  final String? code;

  final List<UsagesUsagesFailedErrorField?>? fieldsValue;

  final String? message;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'fields': fieldsValue,
        'message': message,
      };
}

/// One entry of a [UsagesUsagesFailedError]'s `fields`.
class UsagesUsagesFailedErrorField extends Dto {
  const UsagesUsagesFailedErrorField({
    this.code,
    this.docUrl,
    this.field,
    this.message,
  });

  static UsagesUsagesFailedErrorField? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return UsagesUsagesFailedErrorField(
      code: readText(source['code']),
      docUrl: readText(source['doc_url']),
      field: readText(source['field']),
      message: readText(source['message']),
    );
  }

  final String? code;

  final String? docUrl;

  final String? field;

  final String? message;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'doc_url': docUrl,
        'field': field,
        'message': message,
      };
}
