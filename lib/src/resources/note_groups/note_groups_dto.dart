/// Typed views over the v4 note groups bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The note group body.
class NoteGroup extends Dto {
  const NoteGroup({
    this.activityLogs,
    this.createdBy,
    this.createdOn,
    this.description,
    this.displayName,
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
    'GET /api/{api_version}/note_groups',
    'GET /api/{api_version}/note_groups/{note_group_id}',
    'POST /api/{api_version}/note_groups',
    'PATCH /api/{api_version}/note_groups/{note_group_id}',
  ];

  static NoteGroup? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note_group');
    if (source == null) return null;
    return NoteGroup(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
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

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  /// Untyped: never populated in the records measured.
  final Object? createdBy;

  final String? createdOn;

  final String? description;

  final String? displayName;

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
  String? get envelopeKey => 'note_group';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'display_name': displayName,
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

/// A page of NoteGroup records.
class NoteGroupList extends Dto {
  const NoteGroupList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/note_groups',
  ];

  static NoteGroupList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return NoteGroupList(
      data: readList<NoteGroup>(source['data'], NoteGroup.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<NoteGroup?>? data;

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

/// The note group notes body.
class NoteGroupNotes extends Dto {
  const NoteGroupNotes({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/note_groups/{note_group_id}/notes',
  ];

  static NoteGroupNotes? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return NoteGroupNotes(
      data: readList<Object>(source['data'], readAny),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Object?>? data;

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
