import '../errors.dart';

/// Sort direction for query parameters; serialises to its wire value.
enum SortDirection {
  /// Ascending.
  asc('asc'),

  /// Descending.
  desc('desc');

  const SortDirection(this.value);

  /// The value sent on the wire.
  final String value;
}

/// Normalises each query parameter to its wire form; a nested object or a nested
/// sequence throws [SdkUsageError].
class QueryParams {
  QueryParams._();

  /// Apply the value table to every parameter; `null` values are dropped.
  static Map<String, Object?> build(Map<String, Object?>? params) {
    final out = <String, Object?>{};
    if (params == null) return out;
    params.forEach((key, value) {
      if (value == null) return;
      out[key] = _normalise(key, value, 0);
    });
    return out;
  }

  static Object? _normalise(String key, Object? value, int depth) {
    if (value is bool) return value ? 'true' : 'false';
    if (value is SortDirection) return value.value;
    // The Dart name verbatim; an enum with a different wire form carries a value field.
    if (value is Enum) return value.name;
    if (value is num) return value;
    if (value is DateTime) return _iso(value);
    if (value is String) return value;
    if (value is Map) {
      throw SdkUsageError(
          "query param '$key': a nested object is not a query value - flatten it, "
          'or pass a scalar');
    }
    if (value is Iterable) {
      if (depth >= 1) {
        throw SdkUsageError(
            "query param '$key': a sequence inside a sequence is not a query value");
      }
      final list = <Object?>[];
      for (final item in value) {
        if (item == null) continue;
        list.add(_normalise(key, item, depth + 1));
      }
      return list;
    }
    return value.toString();
  }

  // Offset and sub-second digits are kept: without them the API bounds rows differently.
  static String _iso(DateTime dateTime) {
    String two(int component) => component.toString().padLeft(2, '0');
    final text = StringBuffer('${dateTime.year.toString().padLeft(4, '0')}-'
        '${two(dateTime.month)}-${two(dateTime.day)}'
        'T${two(dateTime.hour)}:${two(dateTime.minute)}:${two(dateTime.second)}');
    final microseconds = dateTime.millisecond * 1000 + dateTime.microsecond;
    if (microseconds > 0) {
      text.write('.${microseconds.toString().padLeft(6, '0')}');
    }
    if (dateTime.isUtc) return (text..write('Z')).toString();
    final offsetMinutes = dateTime.timeZoneOffset.inMinutes;
    final magnitude = offsetMinutes.abs();
    text.write('${offsetMinutes < 0 ? '-' : '+'}'
        '${two(magnitude ~/ 60)}:${two(magnitude % 60)}');
    return text.toString();
  }
}

/// Apply the query-value table to every parameter; `null` values are dropped.
Map<String, Object?> buildQueryParams([Map<String, Object?>? params]) =>
    QueryParams.build(params);

/// The v4 filter operators, the union of the per-type lists the API serves; `eq`
/// is spelled by no suffix at all.
const List<String> filterOperators = [
  'eq', 'neq', 'in', 'nin', 'contains', 'not_contains', 'starts_with', //
  'gt', 'gte', 'lt', 'lte', 'has_value', 'does_not_have_value',
];

/// The presence checks, which read no value: pair one with `true`, never `null`,
/// since a null parameter is dropped and the listing comes back unfiltered.
const List<String> presenceOperators = ['has_value', 'does_not_have_value'];

/// The operators that take a comma-separated list in one parameter; see [filterValues].
const List<String> listOperators = ['in', 'nin'];

/// The flat v4 filter name, `filter_<field>[_<operator>]`. Only the operator name
/// is checked: the API answers a wrong operator for the field's type better.
String filterParam(String field, [String operator = 'eq']) {
  if (field.trim().isEmpty) {
    throw SdkUsageError(
        "filter field: expected a name like 'status', got \"$field\"");
  }
  final resolved = operator.toLowerCase();
  if (!filterOperators.contains(resolved)) {
    throw SdkUsageError('filter operator "$operator": expected one of '
        '${filterOperators.join(', ')}');
  }
  final stem = 'filter_${field.trim()}';
  return resolved == 'eq' ? stem : '${stem}_$resolved';
}

/// The value of an `in` or `nin` filter: comma separated in one parameter, since
/// a repeated key is answered 200 with the wrong rows.
String filterValues(Iterable<Object?> values) {
  final rendered = <String>[];
  for (final value in values) {
    if (value == null) {
      throw SdkUsageError('filter values: a member is null, which has no value '
          "to match; drop it, or use the 'does_not_have_value' operator if what "
          "was meant is 'this field is unset'");
    }
    final normalised = QueryParams.build({'filter values': value});
    final single = normalised['filter values'];
    if (single is List) {
      throw SdkUsageError('filter values: a member is itself a list, which has '
          'no single value to match; flatten it to one list of scalars');
    }
    final text = '$single';
    // The API splits on commas, so a member carrying one would match two values.
    if (text.contains(',')) {
      throw SdkUsageError('filter values: the member "$text" contains a comma, '
          'which the API reads as the separator between two values');
    }
    rendered.add(text);
  }
  if (rendered.isEmpty) {
    throw SdkUsageError('filter values: expected at least one value; an empty '
        "'in' filter is answered 200 with no rows");
  }
  return rendered.join(',');
}

/// A `sort` value: the field name, prefixed `-` to descend. The families that
/// take `order_by` and `direction` instead ignore it silently.
String sortParam(String field, [SortDirection direction = SortDirection.asc]) {
  if (field.trim().isEmpty) {
    throw SdkUsageError(
        "sort field: expected a name like 'created_on', got \"$field\"");
  }
  return direction == SortDirection.desc ? '-${field.trim()}' : field.trim();
}
