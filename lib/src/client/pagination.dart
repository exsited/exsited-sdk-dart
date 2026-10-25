/// Walks v4's two paging shapes, cursor and offset, split by resource.
library;

import '../errors.dart';
import 'api_response.dart';
import 'exsited_client.dart';

/// The query parameters the pager owns.
const String cursorParam = 'cursor';
const String offsetParam = 'offset';
const String limitParam = 'limit';

/// The envelope key holding a page's records; some listings use the resource name.
const String defaultRecordKey = 'data';

/// The string the offset shape uses to mean "no next page".
const String noNextPage = 'NULL';

/// One [ApiResponse] per page; `queryParams` rides every page, as a position is
/// only valid within its filtered, sorted listing.
Stream<ApiResponse<Object?>> iterPages(
  ExsitedClient client,
  String path, {
  Map<String, String> pathParams = const {},
  Map<String, Object?>? queryParams,
  int? maxPages,
  String recordKey = defaultRecordKey,
}) async* {
  for (final owned in [cursorParam, offsetParam]) {
    if (queryParams != null && queryParams.containsKey(owned)) {
      throw SdkUsageError('queryParams: "$owned" is owned by the pager, '
          'which sets it from each page; to resume from a saved position call the '
          'endpoint directly with it');
    }
  }
  if (maxPages != null && maxPages < 1) {
    throw SdkUsageError('maxPages: expected a positive integer, got $maxPages');
  }

  final base = <String, Object?>{...?queryParams};
  var next = <String, Object?>{...base};
  final seenCursors = <String>{};
  var pages = 0;

  while (true) {
    final response = await client.sendGetRequest<Object?>(path,
        options: CallOptions(pathParams: pathParams, queryParams: next));
    yield response;
    pages++;

    if (!response.succeeded) return;
    if (maxPages != null && pages >= maxPages) return;

    final block = _paginationBlock(response.map);
    if (block == null) return;

    final cursor = readNextCursor(block);
    if (cursor != null) {
      if (!seenCursors.add(cursor)) {
        throw SdkError('pagination loop: the API handed back the same '
            'next_cursor a second time, so following it again would never '
            'terminate - the pages already yielded are good');
      }
      next = {...base, cursorParam: cursor};
      continue;
    }

    var onPage = 0;
    final body = response.map;
    if (body is Map && body[recordKey] is List) {
      onPage = (body[recordKey]! as List).length;
    }
    final offset = readNextOffset(block, onPage);
    if (offset == null) return;
    next = {...base, offsetParam: offset};
  }
}

/// Each record of a listing, across every page.
Stream<Object?> iterRecords(
  ExsitedClient client,
  String path, {
  Map<String, String> pathParams = const {},
  Map<String, Object?>? queryParams,
  int? maxPages,
  String recordKey = defaultRecordKey,
}) async* {
  if (recordKey.trim().isEmpty) {
    throw SdkUsageError(
        'recordKey: expected the envelope key holding the records');
  }
  var index = 0;
  await for (final page in iterPages(client, path,
      pathParams: pathParams,
      queryParams: queryParams,
      maxPages: maxPages,
      recordKey: recordKey)) {
    page.raiseForStatus();
    final body = page.map;
    final records = body is Map ? body[recordKey] : null;
    if (records is! List) {
      if (index > 0) {
        // After the first page, no list under the key is the end, not a wrong key.
        index++;
        continue;
      }
      final available = body is Map
          ? (body.keys.map((key) => '$key').toList()..sort()).join(', ')
          : 'a ${body.runtimeType} body';
      throw SdkUsageError('recordKey "$recordKey": this page has no list '
          'under that key; it carries $available');
    }
    index++;
    for (final record in records) {
      yield record;
    }
  }
}

/// The next cursor, or null; `has_more` wins, as some last pages keep a stale one.
String? readNextCursor(Map<String, Object?> block) {
  if (block.containsKey('has_more') && block['has_more'] != true) return null;
  final cursor = block['next_cursor'];
  if (cursor is! String || cursor.trim().isEmpty) return null;
  return cursor;
}

/// The next offset, or null at the end. `next_page` may be the literal `"NULL"`,
/// and the offset is computed because a link can point at another path.
int? readNextOffset(Map<String, Object?> block, int recordsOnPage) {
  if (!block.containsKey('next_page')) return null;
  final next = block['next_page'];
  if (next == null) return null;
  if (next is String &&
      (next.trim().isEmpty || next.trim().toUpperCase() == noNextPage)) {
    return null;
  }
  final offset = block[offsetParam];
  final limit = block[limitParam];
  final current = offset is num ? offset.toInt() : 0;
  final step = limit is num && limit > 0 ? limit.toInt() : recordsOnPage;
  if (step <= 0) return null;
  return current + step;
}

Map<String, Object?>? _paginationBlock(Object? body) {
  if (body is! Map) return null;
  final block = body['pagination'];
  if (block is! Map) return null;
  return Map<String, Object?>.from(block);
}
