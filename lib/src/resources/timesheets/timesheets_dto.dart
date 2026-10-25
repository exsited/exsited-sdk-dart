/// Typed views over the v4 timesheets bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The timesheet body.
class Timesheet extends Dto {
  const Timesheet({
    this.createdBy,
    this.createdOn,
    this.endTime,
    this.href,
    this.id,
    this.labour,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.saleOrder,
    this.saleOrderItem,
    this.startTime,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/timesheets',
  ];

  static Timesheet? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return Timesheet(
      createdBy: TimesheetCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      endTime: readText(source['end_time']),
      href: readText(source['href']),
      id: readText(source['id']),
      labour: TimesheetLabour.fromMap(source['labour']),
      lastUpdatedBy: TimesheetLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      saleOrder: TimesheetSaleOrder.fromMap(source['sale_order']),
      saleOrderItem: TimesheetSaleOrderItem.fromMap(source['sale_order_item']),
      startTime: readText(source['start_time']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final TimesheetCreatedBy? createdBy;

  final String? createdOn;

  final String? endTime;

  final String? href;

  final String? id;

  final TimesheetLabour? labour;

  final TimesheetLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final TimesheetSaleOrder? saleOrder;

  final TimesheetSaleOrderItem? saleOrderItem;

  final String? startTime;

  final String? status;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'end_time': endTime,
        'href': href,
        'id': id,
        'labour': labour,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'sale_order': saleOrder,
        'sale_order_item': saleOrderItem,
        'start_time': startTime,
        'status': status,
        'version': version,
      };
}

/// A page of Timesheet records.
class TimesheetList extends Dto {
  const TimesheetList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/timesheets',
  ];

  static TimesheetList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TimesheetList(
      data: readList<Timesheet>(source['data'], Timesheet.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Timesheet?>? data;

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

/// What `createTimesheet` answers, under `timesheet`.
class Timesheets extends Dto {
  const Timesheets({
    this.activityLogs,
    this.createdBy,
    this.createdOn,
    this.endTime,
    this.href,
    this.id,
    this.labour,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.saleOrder,
    this.saleOrderItem,
    this.startTime,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'POST /api/{api_version}/timesheets',
    'PATCH /api/{api_version}/timesheets/{timesheet_id}',
  ];

  static Timesheets? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'timesheet');
    if (source == null) return null;
    return Timesheets(
      activityLogs: readList<TimesheetsActivityLog>(
          source['activity_logs'], TimesheetsActivityLog.fromMap),
      createdBy: TimesheetsCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      endTime: readText(source['end_time']),
      href: readText(source['href']),
      id: readText(source['id']),
      labour: TimesheetsLabour.fromMap(source['labour']),
      lastUpdatedBy: TimesheetsLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      saleOrder: TimesheetsSaleOrder.fromMap(source['sale_order']),
      saleOrderItem: TimesheetsSaleOrderItem.fromMap(source['sale_order_item']),
      startTime: readText(source['start_time']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  final List<TimesheetsActivityLog?>? activityLogs;

  final TimesheetsCreatedBy? createdBy;

  final String? createdOn;

  final String? endTime;

  final String? href;

  final String? id;

  final TimesheetsLabour? labour;

  final TimesheetsLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  final TimesheetsSaleOrder? saleOrder;

  final TimesheetsSaleOrderItem? saleOrderItem;

  final String? startTime;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'timesheet';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'created_by': createdBy,
        'created_on': createdOn,
        'end_time': endTime,
        'href': href,
        'id': id,
        'labour': labour,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'sale_order': saleOrder,
        'sale_order_item': saleOrderItem,
        'start_time': startTime,
        'status': status,
        'version': version,
      };
}

/// A [Timesheet]'s `labour`.
class TimesheetLabour extends Dto {
  const TimesheetLabour({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static TimesheetLabour? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TimesheetLabour(
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

/// A [Timesheet]'s `sale_order_item`.
class TimesheetSaleOrderItem extends Dto {
  const TimesheetSaleOrderItem({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static TimesheetSaleOrderItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TimesheetSaleOrderItem(
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

/// A [Timesheet]'s `sale_order`.
class TimesheetSaleOrder extends Dto {
  const TimesheetSaleOrder({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static TimesheetSaleOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TimesheetSaleOrder(
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

/// A [Timesheet]'s `created_by`.
class TimesheetCreatedBy extends Dto {
  const TimesheetCreatedBy({
    this.name,
    this.object,
  });

  static TimesheetCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TimesheetCreatedBy(
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

/// A [Timesheet]'s `last_updated_by`.
class TimesheetLastUpdatedBy extends Dto {
  const TimesheetLastUpdatedBy({
    this.name,
    this.object,
  });

  static TimesheetLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TimesheetLastUpdatedBy(
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

/// A [Timesheets]'s `labour`.
class TimesheetsLabour extends Dto {
  const TimesheetsLabour({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static TimesheetsLabour? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TimesheetsLabour(
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

/// A [Timesheets]'s `sale_order_item`.
class TimesheetsSaleOrderItem extends Dto {
  const TimesheetsSaleOrderItem({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static TimesheetsSaleOrderItem? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TimesheetsSaleOrderItem(
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

/// A [Timesheets]'s `sale_order`.
class TimesheetsSaleOrder extends Dto {
  const TimesheetsSaleOrder({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static TimesheetsSaleOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TimesheetsSaleOrder(
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

/// A [Timesheets]'s `created_by`.
class TimesheetsCreatedBy extends Dto {
  const TimesheetsCreatedBy({
    this.name,
    this.object,
  });

  static TimesheetsCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TimesheetsCreatedBy(
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

/// A [Timesheets]'s `last_updated_by`.
class TimesheetsLastUpdatedBy extends Dto {
  const TimesheetsLastUpdatedBy({
    this.name,
    this.object,
  });

  static TimesheetsLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TimesheetsLastUpdatedBy(
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

/// One entry of a [Timesheets]'s `activity_logs`.
class TimesheetsActivityLog extends Dto {
  const TimesheetsActivityLog({
    this.activity,
  });

  static TimesheetsActivityLog? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return TimesheetsActivityLog(
      activity: readText(source['activity']),
    );
  }

  final String? activity;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity': activity,
      };
}
