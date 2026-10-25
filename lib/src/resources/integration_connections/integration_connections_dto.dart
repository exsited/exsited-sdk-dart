/// Typed views over the v4 integration connections bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The integration connections body.
class IntegrationConnections extends Dto {
  const IntegrationConnections({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/integration_connections',
  ];

  static IntegrationConnections? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return IntegrationConnections(
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
