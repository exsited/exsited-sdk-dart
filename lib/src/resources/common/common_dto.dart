/// Typed views that more than one resource family reads.
///
/// Each is the union of what the account and item families measured: a body fills
/// one shape and the rest reads null. A family whose own version diverges
/// declares its own, named for the family.
library;

import '../../client/dto.dart';

/// v4's standard embedded pointer to another record.
class Reference extends Dto {
  const Reference({
    this.object,
    this.id,
    this.name,
    this.code,
    this.href,
    this.rate,
  });

  static Reference? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return Reference(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      code: readText(source['code']),
      href: readText(source['href']),
      rate: readDecimal(source['rate']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  /// Sent on the account family only; null on an item.
  final String? code;

  final String? href;

  final double? rate;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'code': code,
        'href': href,
        'rate': rate,
      };
}

/// Whoever created or last updated a record. The invoice family sends
/// `created_by` as a plain string and does not use this type.
class User extends Dto {
  const User({this.object, this.id, this.name, this.email, this.href});

  static User? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return User(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      email: readText(source['email']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? email;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'email': email,
        'href': href,
      };
}

/// The paging block, either shape: a response fills one and the other reads null.
///
/// The cursor shape (the account and item families) carries [hasMore], which is
/// authoritative over a possibly stale [nextCursor]. The offset shape carries
/// [records], the total rather than the page's length, and a [nextPage] that is
/// the literal string `"NULL"` when there is none, so never truth-test it.
class Pagination extends Dto {
  const Pagination({
    this.limit,
    this.hasMore,
    this.nextCursor,
    this.prevCursor,
    this.links,
    this.records,
    this.offset,
    this.nextPage,
    this.previousPage,
    this.perPage,
    this.hasNext,
    this.hasPrev,
  });

  static Pagination? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return Pagination(
      limit: readInteger(source['limit']),
      hasMore: readFlag(source['has_more']),
      nextCursor: readText(source['next_cursor']),
      prevCursor: readText(source['prev_cursor']),
      links: PaginationLinks.fromMap(source['links']),
      records: readInteger(source['records']),
      offset: readInteger(source['offset']),
      nextPage: readText(source['next_page']),
      previousPage: readText(source['previous_page']),
      perPage: readInteger(source['per_page']),
      hasNext: readFlag(source['has_next']),
      hasPrev: readFlag(source['has_prev']),
    );
  }

  final int? limit;

  final bool? hasMore;

  final String? nextCursor;

  final String? prevCursor;

  final PaginationLinks? links;

  final int? records;

  final int? offset;

  final String? nextPage;

  final String? previousPage;

  final int? perPage;

  final bool? hasNext;

  final bool? hasPrev;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'limit': limit,
        'has_more': hasMore,
        'next_cursor': nextCursor,
        'prev_cursor': prevCursor,
        'links': links,
        'records': records,
        'offset': offset,
        'next_page': nextPage,
        'previous_page': previousPage,
        'per_page': perPage,
        'has_next': hasNext,
        'has_prev': hasPrev,
      };
}

/// A [Pagination]'s `links`.
class PaginationLinks extends Dto {
  const PaginationLinks({
    this.next,
    this.prev,
  });

  static PaginationLinks? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaginationLinks(
      next: readText(source['next']),
      prev: readText(source['prev']),
    );
  }

  final String? next;

  final String? prev;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'next': next,
        'prev': prev,
      };
}
