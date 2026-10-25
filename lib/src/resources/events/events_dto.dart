/// Typed views over the v4 events bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The event body.
class Event extends Dto {
  const Event({
    this.createdOn,
    this.eventName,
    this.executedOn,
    this.href,
    this.id,
    this.object,
    this.resourceType,
    this.resourceUuid,
    this.scheduledToExecuteOn,
    this.status,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/events',
    'GET /api/{api_version}/events/{event_uuid}',
    'POST /api/{api_version}/events/{event_uuid}/remove',
  ];

  static Event? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'event');
    if (source == null) return null;
    return Event(
      createdOn: readText(source['created_on']),
      eventName: readText(source['event_name']),
      executedOn: readText(source['executed_on']),
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
      resourceType: readText(source['resource_type']),
      resourceUuid: readText(source['resource_uuid']),
      scheduledToExecuteOn: readText(source['scheduled_to_execute_on']),
      status: readText(source['status']),
    );
  }

  final String? createdOn;

  final String? eventName;

  final String? executedOn;

  final String? href;

  final String? id;

  final String? object;

  final String? resourceType;

  final String? resourceUuid;

  final String? scheduledToExecuteOn;

  final String? status;

  @override
  String? get envelopeKey => 'event';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_on': createdOn,
        'event_name': eventName,
        'executed_on': executedOn,
        'href': href,
        'id': id,
        'object': object,
        'resource_type': resourceType,
        'resource_uuid': resourceUuid,
        'scheduled_to_execute_on': scheduledToExecuteOn,
        'status': status,
      };
}

/// A page of Event records.
class EventList extends Dto {
  const EventList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/events',
  ];

  static EventList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return EventList(
      data: readList<Event>(source['data'], Event.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Event?>? data;

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
