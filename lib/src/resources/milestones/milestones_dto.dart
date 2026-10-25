/// Typed views over the v4 milestones bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The milestones body.
class Milestones extends Dto {
  const Milestones({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/milestones',
    'GET /api/{api_version}/milestones/account/{account_id}',
  ];

  static Milestones? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return Milestones(
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

/// One page of what `getMilestonesLabourById` lists, under `data`.
class MilestonesLabourByIdList extends Dto {
  const MilestonesLabourByIdList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/milestones/labour/{labour_id}',
  ];

  static MilestonesLabourByIdList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return MilestonesLabourByIdList(
      data: readList<Object>(source['data'], readAny),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  /// Untyped entries: empty in every record measured.
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
