/// Secret handling: the one place that decides what counts as a secret.
library;

import 'dart:convert';

/// The secret redactor: one static surface over every redaction rule.
class Redaction {
  Redaction._();

  /// What a redacted value is replaced with.
  static const String redacted = '***';

  /// What replaces a structure nested deeper than [maxDepth].
  static const String tooDeep = '<...>';

  /// What replaces a container that contains itself.
  static const String circular = '<circular>';

  /// What replaces a JSON document the redactor could not finish; fails closed.
  static const String unredactable = '<unredactable>';

  /// A value that opens like a structured document and is not one, rendered as
  /// its type and size and none of its text: `<unparsed String(1234 chars)>`.
  static String withheldStructure(String text) =>
      '<unparsed String(${text.length} chars)>';

  /// How deep [redactValue] walks before writing [tooDeep].
  static const int maxDepth = 64;

  /// Key-name markers, matched case-insensitively and ignoring separators.
  static const List<String> sensitiveKeyMarkers = _markers;

  static const List<String> _markers = <String>[
    'secret',
    'password',
    'passphrase',
    'passwd',
    'pwd',
    'token',
    'bearer',
    'jwt',
    'authorization',
    'authstring',
    'apikey',
    'assertion',
    'credential',
    'verifier',
    'cookie',
    'session',
    'signature',
    'privatekey',
  ];

  static const Set<String> _nonSecretTail = <String>{
    'amount',
    'at',
    'consent',
    'count',
    'duration',
    // `customer_password_expired` is a boolean flag, never a password.
    'expired',
    'level',
    'path',
    'policy',
    'remaining',
    'status',
    'type',
  };

  static const Set<String> _nonSecretLead = <String>{'has', 'is', 'was'};

  // Split camelCase without a lookbehind, which is not portable.
  static final RegExp _camelBoundary = RegExp(r'([a-z0-9])([A-Z])');
  static final RegExp _nonAlnum = RegExp(r'[^A-Za-z0-9]+');

  // Judged run by run; the 32-char scheme bound keeps this linear.
  static final RegExp _urlRun =
      RegExp('[A-Za-z][A-Za-z0-9+.\\-]{0,31}://[^\\s<>"\']*');

  static final RegExp _pathQueryRun = RegExp('/[^\\s<>"\'?#]*[?#][^\\s<>"\']+');

  /// Whether a key's name means its value must not be shown.
  static bool shouldRedact(String key) {
    final words = _keyWords(key);
    if (words.isNotEmpty &&
        (_nonSecretLead.contains(words.first) ||
            _nonSecretTail.contains(words.last))) {
      return false;
    }
    final normalised = words.join();
    for (final marker in _markers) {
      if (normalised.contains(marker)) return true;
    }
    return false;
  }

  static List<String> _keyWords(String key) {
    final spaced = key.replaceAllMapped(
        _camelBoundary, (match) => '${match[1]} ${match[2]}');
    final words = <String>[];
    for (final word in spaced.split(_nonAlnum)) {
      if (word.isNotEmpty) words.add(word.toLowerCase());
    }
    return words;
  }

  /// A redacted copy of a JSON-shaped value: secret-named entries become [redacted],
  /// and any other opaque object becomes a type label, never rendered.
  static Object? redactValue(Object? value) =>
      _redact(value, 0, Set<Object>.identity());

  static Object? _redact(Object? value, int depth, Set<Object> seen) {
    if (value is Map) {
      if (depth >= maxDepth) return tooDeep;
      if (!seen.add(value)) return circular;
      try {
        final copy = <String, Object?>{};
        value.forEach((rawKey, item) {
          // A non-text key is named by its type, never asked to render itself.
          final key = _keyText(rawKey);
          copy[key] =
              shouldRedact(key) ? redacted : _redact(item, depth + 1, seen);
        });
        return copy;
      } finally {
        seen.remove(value);
      }
    }
    // Bytes are a leaf, keeping the console's `<N bytes>` summary.
    if (value is List<int>) return value;
    if (value is Iterable) {
      if (depth >= maxDepth) return tooDeep;
      if (!seen.add(value)) return circular;
      try {
        final copy = <Object?>[];
        for (final entry in value) {
          copy.add(_redactEntry(entry, depth + 1, seen));
        }
        return copy;
      } finally {
        seen.remove(value);
      }
    }
    // In nesting order: JSON that arrived as text, then any URL left in it.
    if (value is String) return redactText(_redactJsonText(value, depth, seen));
    // An unsupported object becomes a type label, so its toString() never runs.
    if (value == null || value is num || value is bool) return value;
    return '<${value.runtimeType}>';
  }

  /// A map key as text, without asking a caller's object to render itself.
  static String _keyText(Object? rawKey) {
    if (rawKey is String) return rawKey;
    if (rawKey is int || rawKey is double || rawKey is bool || rawKey == null) {
      return '$rawKey';
    }
    return '<${rawKey.runtimeType}>';
  }

  /// Redact a JSON document that arrived as text, rewriting it only if redaction
  /// changed it; text that opens like one but does not parse is withheld.
  static String _redactJsonText(String text, int depth, Set<Object> seen) {
    final trimmed = text.trimLeft();
    if (!trimmed.startsWith('{') && !trimmed.startsWith('[')) return text;
    final Object? parsed;
    try {
      parsed = _OrderedJsonParser(text).parseDocument();
    } on FormatException {
      // A document that fails to parse still carries its secrets, so it is withheld.
      return withheldStructure(text);
    } on StackOverflowError {
      // A nesting overflow is withheld too: an unwalked document is an unredacted one.
      return withheldStructure(text);
    }
    // Fails closed: the parse proved this is JSON, so the input may hold secrets.
    try {
      final redactedTree = _redactOrdered(parsed, depth + 1, seen);
      final after = _encodeSpacedJson(redactedTree);
      return after == _encodeSpacedJson(parsed) ? text : after;
    } on Object {
      return unredactable;
    }
  }

  /// [_redact]'s rules applied to the ordered tree the local parser yields.
  static Object? _redactOrdered(Object? value, int depth, Set<Object> seen) {
    if (value is _JsonObject) {
      if (depth >= maxDepth) return tooDeep;
      final copy = _JsonObject();
      for (var i = 0; i < value.keys.length; i++) {
        final key = value.keys[i];
        copy.put(
            key,
            shouldRedact(key)
                ? redacted
                : _redactOrdered(value.values[i], depth + 1, seen));
      }
      return copy;
    }
    if (value is List<Object?>) {
      if (depth >= maxDepth) return tooDeep;
      final copy = <Object?>[];
      for (final entry in value) {
        copy.add(_redactOrderedEntry(entry, depth + 1, seen));
      }
      return copy;
    }
    if (value is String) return redactText(_redactJsonText(value, depth, seen));
    return value;
  }

  static Object? _redactOrderedEntry(
      Object? entry, int depth, Set<Object> seen) {
    if (entry is List<Object?> &&
        entry.length == 2 &&
        entry[0] is String &&
        shouldRedact(entry[0] as String)) {
      return <Object?>[entry[0], redacted];
    }
    return _redactOrdered(entry, depth, seen);
  }

  /// Re-serialise with spaced separators, so a redacted body stays diffable.
  static String _encodeSpacedJson(Object? value) {
    final out = StringBuffer();
    _writeSpacedJson(out, value);
    return out.toString();
  }

  static void _writeSpacedJson(StringBuffer out, Object? value) {
    if (value is _JsonObject) {
      out.write('{');
      for (var i = 0; i < value.keys.length; i++) {
        if (i > 0) out.write(', ');
        _writeSpacedJson(out, value.keys[i]);
        out.write(': ');
        _writeSpacedJson(out, value.values[i]);
      }
      out.write('}');
      return;
    }
    if (value is List) {
      out.write('[');
      var first = true;
      for (final entry in value) {
        if (!first) out.write(', ');
        first = false;
        _writeSpacedJson(out, entry);
      }
      out.write(']');
      return;
    }
    if (value is _JsonNumber) {
      out.write(_renderNumberToken(value.raw));
      return;
    }
    out.write(jsonEncode(value));
  }

  /// Render a raw number token; it must never throw, as that would skip redaction.
  static String _renderNumberToken(String raw) {
    // Three literals outside RFC 8259 that real bodies carry, re-emitted verbatim.
    if (raw == 'NaN' || raw == 'Infinity' || raw == '-Infinity') return raw;
    if (!raw.contains('.') && !raw.contains('e') && !raw.contains('E')) {
      if (raw == '-0') return '0';
      return raw;
    }
    final floatValue = double.parse(raw);
    if (floatValue.isInfinite) return floatValue > 0 ? 'Infinity' : '-Infinity';
    return _renderShortestFloat(floatValue);
  }

  /// The shared float spelling: shortest round-trip digits, fixed or exponent form.
  static String _renderShortestFloat(double floatValue) {
    var formatted = floatValue.toStringAsExponential();
    var sign = '';
    if (formatted.startsWith('-')) {
      sign = '-';
      formatted = formatted.substring(1);
    }
    final exponentIndex = formatted.indexOf('e');
    final mantissa = formatted.substring(0, exponentIndex);
    final digits = mantissa.replaceFirst('.', '');
    final exponent = int.parse(formatted.substring(exponentIndex + 1));
    final decpt = exponent + 1;
    if (-4 < decpt && decpt <= 16) {
      if (decpt <= 0) return '${sign}0.${'0' * -decpt}$digits';
      if (decpt >= digits.length) {
        return '$sign$digits${'0' * (decpt - digits.length)}.0';
      }
      return '$sign${digits.substring(0, decpt)}.${digits.substring(decpt)}';
    }
    var head = digits.substring(0, 1);
    if (digits.length > 1) head += '.${digits.substring(1)}';
    final exponentSign = exponent < 0 ? '-' : '+';
    final exponentDigits = exponent.abs().toString().padLeft(2, '0');
    return '$sign${head}e$exponentSign$exponentDigits';
  }

  // Honour a [name, value] pair, the form header lists and form bodies use.
  static Object? _redactEntry(Object? entry, int depth, Set<Object> seen) {
    if (entry is List &&
        entry.length == 2 &&
        entry[0] is String &&
        shouldRedact(entry[0] as String)) {
      return <Object?>[entry[0], redacted];
    }
    return _redact(entry, depth, seen);
  }

  /// Redact a flat mapping such as request or response headers.
  static Map<String, String> redactMapping(Map<String, String>? headers) {
    final shown = <String, String>{};
    if (headers == null) return shown;
    headers.forEach((key, value) {
      shown[key] = shouldRedact(key) ? redacted : redactText(value);
    });
    return shown;
  }

  /// Redact every URL and every schemeless path?query inside free text.
  static String redactText(String value) {
    var cleaned = value;
    if (value.contains('://')) {
      cleaned = cleaned.replaceAllMapped(
          _urlRun, (match) => _redactOneUrl(match[0]!));
    }
    if (cleaned.contains('/') &&
        (cleaned.contains('?') || cleaned.contains('#'))) {
      cleaned = cleaned.replaceAllMapped(
          _pathQueryRun, (match) => _redactOneUrl(match[0]!));
    }
    return cleaned;
  }

  static String _redactOneUrl(String url) {
    // Split by hand so a malformed URL degrades to "unchanged", never throws.
    var rest = url;
    var scheme = '';
    var authority = '';
    var redactedAuthority = '';
    var hasAuthority = false;
    final schemeEnd = rest.indexOf('://');
    // A leading `//` opens a schemeless authority, whose password must still go.
    final schemeless = schemeEnd < 0 && rest.startsWith('//');
    final authorityStart =
        schemeEnd >= 0 ? schemeEnd + 3 : (schemeless ? 2 : -1);
    if (authorityStart >= 0) {
      final authorityEnd =
          _indexOfAny(rest, authorityStart, const <String>['/', '?', '#']);
      scheme = schemeEnd >= 0 ? rest.substring(0, schemeEnd) : '';
      authority = rest.substring(authorityStart, authorityEnd);
      redactedAuthority = _redactUserinfo(authority);
      hasAuthority = true;
      rest = rest.substring(authorityEnd);
    }
    // Query and fragment are judged separately, e.g. `#access_token=…`.
    final hash = rest.indexOf('#');
    final head = hash < 0 ? rest : rest.substring(0, hash);
    final fragment = hash < 0 ? null : rest.substring(hash + 1);
    final mark = head.indexOf('?');
    final path = mark < 0 ? head : head.substring(0, mark);
    final query = mark < 0 ? null : head.substring(mark + 1);
    final redactedQuery = query == null ? null : _redactQueryString(query);
    final redactedFragment =
        fragment == null ? null : _redactQueryString(fragment);
    // Rebuilt only when something matched, so a URL with no secret is untouched.
    if (redactedAuthority == authority &&
        redactedQuery == query &&
        redactedFragment == fragment) {
      return url;
    }
    final out = StringBuffer();
    if (hasAuthority) {
      out.write(schemeless
          ? '//$redactedAuthority'
          : '${scheme.toLowerCase()}://$redactedAuthority');
    }
    out.write(path);
    if (redactedQuery != null && redactedQuery.isNotEmpty) {
      out.write('?$redactedQuery');
    }
    if (redactedFragment != null && redactedFragment.isNotEmpty) {
      out.write('#$redactedFragment');
    }
    return out.toString();
  }

  static int _indexOfAny(String text, int from, List<String> targets) {
    for (var i = from; i < text.length; i++) {
      if (targets.contains(text[i])) return i;
    }
    return text.length;
  }

  static String _redactUserinfo(String authority) {
    final markerIndex = authority.lastIndexOf('@');
    if (markerIndex < 0) return authority;
    final userinfo = authority.substring(0, markerIndex);
    final colon = userinfo.indexOf(':');
    if (colon < 0) return authority;
    return '${userinfo.substring(0, colon)}:$redacted${authority.substring(markerIndex)}';
  }

  /// Replace the value of every secret-named parameter, leaving the rest byte-exact.
  static String _redactQueryString(String query) {
    if (query.isEmpty) return query;
    final chunks = query.split('&');
    var matched = false;
    for (var i = 0; i < chunks.length; i++) {
      final equals = chunks[i].indexOf('=');
      if (equals < 0) continue;
      final name = _safeDecode(chunks[i].substring(0, equals));
      if (shouldRedact(name)) {
        chunks[i] = '${chunks[i].substring(0, equals)}=$redacted';
        matched = true;
      }
    }
    return matched ? chunks.join('&') : query;
  }

  /// Render a name=value pair for a representation, redacting secret-named fields.
  static Object? redactForDisplay(String name, Object? value) =>
      value != null && shouldRedact(name) ? redacted : redactValue(value);

  static String _safeDecode(String text) {
    try {
      return Uri.decodeQueryComponent(text);
    } on ArgumentError {
      return text;
    } on FormatException {
      return text;
    }
  }
}

/// A JSON number kept as its source text, so an over-64-bit integer stays exact.
class _JsonNumber {
  const _JsonNumber(this.raw);

  /// The number token exactly as it appeared in the source document.
  final String raw;
}

/// A decoded JSON object as an ordered member list that can hold [_JsonNumber]s.
class _JsonObject {
  /// Member keys, in first-appearance order.
  final List<String> keys = <String>[];

  /// Member values, parallel to [keys].
  final List<Object?> values = <Object?>[];

  final Map<String, int> _index = <String, int>{};

  /// Add or overwrite one member.
  void put(String key, Object? value) {
    final existing = _index[key];
    if (existing != null) {
      values[existing] = value;
    } else {
      _index[key] = keys.length;
      keys.add(key);
      values.add(value);
    }
  }
}

/// An order-preserving JSON parser for the redact-json-text path, also accepting
/// `NaN`, `Infinity` and `-Infinity` so it never refuses a body it must redact.
class _OrderedJsonParser {
  _OrderedJsonParser(this._text);

  final String _text;
  int _position = 0;

  static const int _quote = 0x22;
  static const int _backslash = 0x5c;

  /// Parse the whole document.
  Object? parseDocument() {
    final value = _parseValue();
    _skipWhitespace();
    if (_position != _text.length) {
      throw const FormatException('trailing content after the JSON document');
    }
    return value;
  }

  void _skipWhitespace() {
    while (_position < _text.length) {
      final codeUnit = _text.codeUnitAt(_position);
      if (codeUnit != 0x20 &&
          codeUnit != 0x09 &&
          codeUnit != 0x0a &&
          codeUnit != 0x0d) {
        return;
      }
      _position++;
    }
  }

  Never _fail(String reason) => throw FormatException(reason, _text, _position);

  Object? _parseValue() {
    _skipWhitespace();
    if (_position >= _text.length) _fail('unexpected end of input');
    final codeUnit = _text.codeUnitAt(_position);
    switch (codeUnit) {
      case 0x7b: // {
        return _parseObject();
      case 0x5b: // [
        return _parseArray();
      case _quote:
        return _parseString();
      case 0x74: // t
        _expectLiteral('true');
        return true;
      case 0x66: // f
        _expectLiteral('false');
        return false;
      case 0x6e: // n
        _expectLiteral('null');
        return null;
      case 0x4e: // N - NaN
        _expectLiteral('NaN');
        return const _JsonNumber('NaN');
      case 0x49: // I - Infinity
        _expectLiteral('Infinity');
        return const _JsonNumber('Infinity');
      default:
        if (codeUnit == 0x2d /* - */ ||
            (codeUnit >= 0x30 && codeUnit <= 0x39)) {
          return _parseNumber();
        }
        _fail('unexpected character');
    }
  }

  void _expectLiteral(String literal) {
    if (!_text.startsWith(literal, _position)) _fail('malformed literal');
    _position += literal.length;
  }

  _JsonObject _parseObject() {
    _position++; // consume '{'
    final object = _JsonObject();
    _skipWhitespace();
    if (_position < _text.length &&
        _text.codeUnitAt(_position) == 0x7d /* } */) {
      _position++;
      return object;
    }
    while (true) {
      _skipWhitespace();
      if (_position >= _text.length || _text.codeUnitAt(_position) != _quote) {
        _fail('expected a string key');
      }
      final key = _parseString();
      _skipWhitespace();
      if (_position >= _text.length ||
          _text.codeUnitAt(_position) != 0x3a /* : */) {
        _fail("expected ':'");
      }
      _position++;
      object.put(key, _parseValue());
      _skipWhitespace();
      if (_position >= _text.length) _fail('unterminated object');
      final codeUnit = _text.codeUnitAt(_position);
      if (codeUnit == 0x2c /* , */) {
        _position++;
        continue;
      }
      if (codeUnit == 0x7d /* } */) {
        _position++;
        return object;
      }
      _fail("expected ',' or '}'");
    }
  }

  List<Object?> _parseArray() {
    _position++; // consume '['
    final array = <Object?>[];
    _skipWhitespace();
    if (_position < _text.length &&
        _text.codeUnitAt(_position) == 0x5d /* ] */) {
      _position++;
      return array;
    }
    while (true) {
      array.add(_parseValue());
      _skipWhitespace();
      if (_position >= _text.length) _fail('unterminated array');
      final codeUnit = _text.codeUnitAt(_position);
      if (codeUnit == 0x2c /* , */) {
        _position++;
        continue;
      }
      if (codeUnit == 0x5d /* ] */) {
        _position++;
        return array;
      }
      _fail("expected ',' or ']'");
    }
  }

  String _parseString() {
    _position++; // consume '"'
    final out = StringBuffer();
    while (true) {
      if (_position >= _text.length) _fail('unterminated string');
      final codeUnit = _text.codeUnitAt(_position);
      if (codeUnit == _quote) {
        _position++;
        return out.toString();
      }
      if (codeUnit == _backslash) {
        _position++;
        if (_position >= _text.length) _fail('unterminated escape');
        final escape = _text.codeUnitAt(_position);
        _position++;
        switch (escape) {
          case _quote:
            out.write('"');
          case _backslash:
            out.write(r'\');
          case 0x2f: // /
            out.write('/');
          case 0x62: // b
            out.write('\b');
          case 0x66: // f
            out.write('\f');
          case 0x6e: // n
            out.write('\n');
          case 0x72: // r
            out.write('\r');
          case 0x74: // t
            out.write('\t');
          case 0x75: // u
            if (_position + 4 > _text.length) _fail('truncated \\u escape');
            var code = 0;
            for (var i = 0; i < 4; i++) {
              final hexCodeUnit = _text.codeUnitAt(_position + i);
              final digit = switch (hexCodeUnit) {
                >= 0x30 && <= 0x39 => hexCodeUnit - 0x30, // 0-9
                >= 0x41 && <= 0x46 => hexCodeUnit - 0x41 + 10, // A-F
                >= 0x61 && <= 0x66 => hexCodeUnit - 0x61 + 10, // a-f
                _ => _fail('malformed \\u escape'),
              };
              code = code * 16 + digit;
            }
            out.writeCharCode(code);
            _position += 4;
          default:
            _fail('invalid escape');
        }
        continue;
      }
      if (codeUnit < 0x20) _fail('raw control character in string');
      out.writeCharCode(codeUnit);
      _position++;
    }
  }

  _JsonNumber _parseNumber() {
    final start = _position;
    if (_text.codeUnitAt(_position) == 0x2d /* - */) {
      _position++;
      // `-Infinity`: a leading `-` is the only sign accepted on one.
      if (_position < _text.length &&
          _text.codeUnitAt(_position) == 0x49 /* I */) {
        _expectLiteral('Infinity');
        return _JsonNumber(_text.substring(start, _position));
      }
    }
    // Integer part: one 0, or 1-9 followed by digits - leading zeros invalid.
    if (_position >= _text.length) _fail('malformed number');
    final first = _text.codeUnitAt(_position);
    if (first == 0x30) {
      _position++;
    } else if (first >= 0x31 && first <= 0x39) {
      _position++;
      _skipDigits();
    } else {
      _fail('malformed number');
    }
    // Fraction.
    if (_position < _text.length &&
        _text.codeUnitAt(_position) == 0x2e /* . */) {
      _position++;
      if (!_isDigit()) _fail('malformed number');
      _skipDigits();
    }
    // Exponent.
    if (_position < _text.length) {
      final marker = _text.codeUnitAt(_position);
      if (marker == 0x65 /* e */ || marker == 0x45 /* E */) {
        _position++;
        if (_position < _text.length) {
          final sign = _text.codeUnitAt(_position);
          if (sign == 0x2b /* + */ || sign == 0x2d /* - */) _position++;
        }
        if (!_isDigit()) _fail('malformed number');
        _skipDigits();
      }
    }
    return _JsonNumber(_text.substring(start, _position));
  }

  bool _isDigit() {
    if (_position >= _text.length) return false;
    final codeUnit = _text.codeUnitAt(_position);
    return codeUnit >= 0x30 && codeUnit <= 0x39;
  }

  void _skipDigits() {
    while (_isDigit()) {
      _position++;
    }
  }
}

/// How deep [Redaction.redactValue] walks before writing [Redaction.tooDeep].
const int maxRedactionDepth = Redaction.maxDepth;

/// What a redacted value is replaced with.
const String redacted = Redaction.redacted;

/// What replaces a structure nested deeper than [maxRedactionDepth].
const String tooDeep = Redaction.tooDeep;

/// What replaces a container that contains itself.
const String circular = Redaction.circular;

/// The key-name markers that make a field a secret.
const List<String> sensitiveKeyMarkers = Redaction.sensitiveKeyMarkers;

/// Whether a key names a secret.
bool shouldRedact(String key) => Redaction.shouldRedact(key);

/// A JSON-shaped copy of [value] with every secret replaced.
Object? redactValue(Object? value) => Redaction.redactValue(value);

/// A copy of [headers] with every secret value replaced.
Map<String, String> redactMapping(Map<String, String>? headers) =>
    Redaction.redactMapping(headers);

/// [value] with any secret inside a URL or a JSON fragment replaced.
String redactText(String value) => Redaction.redactText(value);
