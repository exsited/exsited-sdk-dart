import 'dart:convert';

import '../config/sdk_config.dart';
import '../errors.dart';
import '../redaction.dart';
import 'dto.dart';

/// Classification of a failed call, from the HTTP status and, for a 2xx, a v4
/// body that names itself an error.
enum ErrorType implements ErrorCategory {
  /// 2xx - no error.
  none('none'),

  /// 3xx - an unfollowed redirect.
  redirect('redirect'),

  /// 400/422 - the request was malformed or failed validation.
  validation('validation'),

  /// 401 - credentials were missing, rejected or expired.
  authentication('authentication'),

  /// 403 - authenticated but not permitted.
  authorization('authorization'),

  /// 404 - no such record.
  notFound('not_found'),

  /// 405 - wrong method for the path.
  methodNotAllowed('method_not_allowed'),

  /// 409 - a conflict with existing data.
  conflict('conflict'),

  /// 429 - rate limited.
  rateLimit('rate_limit'),

  /// 5xx - the server failed.
  server('server'),

  /// A transport-level failure with no HTTP status.
  network('network'),

  /// The request timed out.
  timeout('timeout'),

  /// Any other non-2xx status, and a 2xx whose body names itself an error.
  unknown('unknown');

  const ErrorType(this.value);

  /// The stable string form, safe to log or persist.
  final String value;

  /// The wire spelling, as [value].
  @override
  String toString() => value;

  /// The wire spelling, as [value], read through [ErrorCategory].
  @override
  String get wireName => value;

  /// Map an HTTP status to a classification.
  static ErrorType classify(int statusCode, {bool bodyDeniesSuccess = false}) {
    if (statusCode >= 200 && statusCode < 300) {
      return bodyDeniesSuccess ? ErrorType.unknown : ErrorType.none;
    }
    if (statusCode >= 300 && statusCode < 400) return ErrorType.redirect;
    return switch (statusCode) {
      400 || 422 => ErrorType.validation,
      401 => ErrorType.authentication,
      403 => ErrorType.authorization,
      404 => ErrorType.notFound,
      405 => ErrorType.methodNotAllowed,
      409 => ErrorType.conflict,
      429 => ErrorType.rateLimit,
      _ => (statusCode >= 500 && statusCode < 600)
          ? ErrorType.server
          : ErrorType.unknown,
    };
  }
}

/// An immutable record of the request behind a response: secrets redacted and
/// containers detached at construction.
final class RequestInfo implements RequestDetail {
  /// Build a record, redacting and detaching what is supplied.
  RequestInfo({
    this.clientName,
    this.apiVersion,
    this.httpMethod,
    String? url,
    String? endpointTemplate,
    Map<String, Object?>? queryParams,
    Object? body,
    Map<String, String>? headers,
    this.attemptCount = 1,
    this.maxAttempts = 1,
    this.elapsedSeconds = 0,
  })  : url = url == null ? null : Redaction.redactText(url),
        endpointTemplate = endpointTemplate ??
            (url == null ? null : deriveEndpointTemplate(url)),
        queryParams = _redactQueryParams(queryParams),
        body = _redactedSnapshot(body),
        headers = headers == null
            ? const <String, String>{}
            : Map<String, String>.unmodifiable(
                Redaction.redactMapping(headers));

  /// The logical instance name.
  final String? clientName;

  /// The API version segment.
  final String? apiVersion;

  /// The HTTP method.
  @override
  final String? httpMethod;

  /// The request URL, resolved, with secret query parameters redacted.
  @override
  final String? url;

  /// The endpoint this call named, path parameters unsubstituted.
  @override
  final String? endpointTemplate;

  /// The query parameters, secret keys and values redacted; unmodifiable.
  @override
  final Map<String, Object?> queryParams;

  /// The request body, redacted and detached at construction.
  final Object? body;

  /// The request headers, redacted at construction and unmodifiable.
  final Map<String, String> headers;

  /// Which attempt produced the response (1-based).
  @override
  final int attemptCount;

  /// The attempt ceiling in force.
  @override
  final int maxAttempts;

  /// Wall-clock seconds the exchange took.
  @override
  final double elapsedSeconds;

  static Map<String, Object?> _redactQueryParams(Map<String, Object?>? param) {
    if (param == null) return const <String, Object?>{};
    final shown = <String, Object?>{};
    param.forEach((key, value) {
      shown[key] = Redaction.shouldRedact(key)
          ? Redaction.redacted
          : _redactedSnapshot(value);
    });
    return Map<String, Object?>.unmodifiable(shown);
  }

  // Redaction alone leaves an editable map; detachment alone leaves a secret.
  static Object? _redactedSnapshot(Object? value) =>
      _detached(Redaction.redactValue(value), 0);

  // A deep immutable snapshot; anything not JSON-shaped becomes its type name.
  static Object? _detached(Object? value, int depth) {
    if (depth >= Redaction.maxDepth) return Redaction.tooDeep;
    if (value == null || value is String || value is num || value is bool) {
      return value;
    }
    if (value is List<int>) return List<int>.unmodifiable(value);
    if (value is Map) {
      return Map<String, Object?>.unmodifiable(<String, Object?>{
        for (final entry in value.entries)
          '${entry.key}': _detached(entry.value, depth + 1)
      });
    }
    if (value is Iterable) {
      return List<Object?>.unmodifiable(
          value.map((item) => _detached(item, depth + 1)));
    }
    return '<${value.runtimeType}>';
  }
}

final RegExp _identifyingSegment =
    RegExp(r'^([0-9]+|[0-9a-fA-F-]{16,})$', caseSensitive: false);

/// The path of a resolved URL with every identifying segment replaced by `{id}`
/// and the query dropped.
String deriveEndpointTemplate(String url) {
  var path = url;
  final scheme = path.indexOf('://');
  if (scheme >= 0) {
    final slash = path.indexOf('/', scheme + 3);
    path = slash < 0 ? '/' : path.substring(slash);
  }
  for (final delimiter in const <String>['?', '#']) {
    final mark = path.indexOf(delimiter);
    if (mark >= 0) path = path.substring(0, mark);
  }
  return path.split('/').map(_templateSegment).join('/');
}

String _templateSegment(String segment) {
  if (segment.isEmpty) return segment;
  final lower = segment.toLowerCase();
  if (lower.contains('@') || lower.contains('%40')) return '{id}';
  return _identifyingSegment.hasMatch(segment) ? '{id}' : segment;
}

/// One HTTP exchange, readable four ways: [data] follows `responseFormat`,
/// while [map], [json] and [dto] always answer their own form. [T] is the typed
/// view the endpoint names; [dto] is `null` on a call that failed.
class ApiResponse<T> {
  /// Build a response.
  ApiResponse({
    required this.statusCode,
    // A plain parameter, not `this.map`: the initialiser list has to read it.
    required Object? data,
    required Map<String, String>? headers,
    required this.contentType,
    required this.requestInfo,
    ErrorType errorType = ErrorType.none,
    List<int>? bodyBytes,
    DtoDecoder? dtoDecoder,
    this.responseFormat = SdkConfig.responseFormatMap,
  })  : map = data,
        _bodyBytes = bodyBytes,
        _dtoDecoder = dtoDecoder,
        headers = headers == null
            ? const <String, String>{}
            : Map<String, String>.unmodifiable(headers),
        errorType = _deriveErrorType(statusCode, data, errorType);

  static const int _maxReportedMessages = 50;
  static const int _maxMessageDepth = 4;

  /// The HTTP status.
  final int statusCode;

  /// The decoded body, live and always in this form whatever `responseFormat`
  /// says: `Map`/`List` for JSON, `String` for text, `List<int>` for bytes.
  final Object? map;

  /// The response headers.
  final Map<String, String> headers;

  /// Which form [data] takes on this response: one of [SdkConfig.responseFormats].
  final String responseFormat;

  final List<int>? _bodyBytes;
  final DtoDecoder? _dtoDecoder;
  bool _jsonResolved = false;
  String? _jsonText;
  bool _dtoResolved = false;
  T? _dtoValue;

  /// The response content type, or `null`.
  final String? contentType;

  /// The failure classification.
  final ErrorType errorType;

  /// What produced this response, for logging and diagnostics.
  final RequestInfo? requestInfo;

  /// The body in the form [responseFormat] resolved to, [map] by default, and
  /// `null` where that form has nothing to answer with - never another form.
  Object? get data => switch (responseFormat) {
        SdkConfig.responseFormatJson => json,
        SdkConfig.responseFormatDto => dto,
        _ => map,
      };

  /// The server's own body text, never a re-serialisation of [map]; `null` for
  /// a binary or empty body.
  String? get json {
    if (_jsonResolved) return _jsonText;
    _jsonResolved = true;
    final decoded = map;
    // Already decoded through its declared charset; UTF-8 would corrupt latin-1.
    if (decoded is String) return _jsonText = decoded;
    if (decoded == null || decoded is List<int>) return _jsonText = null;
    final bytes = _bodyBytes;
    if (bytes == null) return _jsonText = null;
    return _jsonText = utf8.decode(bytes, allowMalformed: true);
  }

  /// The typed view of this body, its type the endpoint's own answer, or `null`
  /// where the body cannot be typed, the endpoint declared no type, or the call
  /// failed: an error envelope is not a record of the named type.
  T? get dto {
    if (_dtoResolved) return _dtoValue;
    _dtoResolved = true;
    final decoder = _dtoDecoder;
    if (decoder == null || !succeeded) return _dtoValue = null;
    final decoded = decoder(map);
    return _dtoValue = decoded is T ? decoded : null;
  }

  /// Whether the call succeeded: a 2xx whose v4 body does not name itself `error`.
  bool get succeeded => succeededFor(statusCode, map);

  /// The same verdict, for a status and a body that are not yet a response.
  static bool succeededFor(int statusCode, Object? body) =>
      statusCode >= 200 && statusCode < 300 && !_bodyDeniesSuccess(body);

  /// The v4 envelope's machine-readable `code` (or `error`), or `null`.
  String? get errorCode => _errorField('code') ?? _errorField('error');

  /// The v4 envelope's `request_id`, or `null`.
  String? get requestId => _errorField('request_id');

  /// The v4 envelope's `doc_url`, or `null`.
  String? get docUrl => _errorField('doc_url');

  /// The v4 envelope's per-field failures; only entries naming a `field`.
  List<FieldError> get fieldErrors {
    final body = map;
    if (body is! Map) return const <FieldError>[];
    final entries = body['errors'];
    if (entries is! List) return const <FieldError>[];
    final out = <FieldError>[];
    for (final entry in entries) {
      if (entry is! Map) continue;
      final field = entry['field'];
      if (field == null || '$field'.trim().isEmpty) continue;
      out.add(FieldError(
        field: '$field',
        code: entry['code']?.toString(),
        message: entry['message']?.toString(),
        docUrl: entry['doc_url']?.toString(),
      ));
    }
    return out;
  }

  // Guarded on failure: a successful record can carry its own `code` field.
  String? _errorField(String key) {
    if (succeeded) return null;
    final body = map;
    if (body is! Map) return null;
    final value = body[key];
    if (value is! String || value.trim().isEmpty) return null;
    return value;
  }

  // An explicit classification wins.
  static ErrorType _deriveErrorType(
      int statusCode, Object? data, ErrorType supplied) {
    if (supplied != ErrorType.none) return supplied;
    return ErrorType.classify(statusCode,
        bodyDeniesSuccess: _bodyDeniesSuccess(data));
  }

  // Every v4 body names what it is under `object`, and an error names itself `error`.
  static bool _bodyDeniesSuccess(Object? data) {
    if (data is! Map) return false;
    final name = data['object'];
    return name is String && name.trim().toLowerCase() == 'error';
  }

  /// Extract human-readable problems from an error body, most specific first:
  /// `errors[]`, then `message`, then `code`/`error`.
  List<String> getErrorMessages() {
    Object? body = map;
    if (body is! Map) body = _parseJsonBody(body);
    if (body is! Map) return const <String>[];

    var messages = _readErrorEntries(body['errors']);
    if (messages.isEmpty) messages = _readMessageValue(body['message'], 0);
    if (messages.isEmpty) {
      // v4 names its machine-readable reason `code`; some bodies use `error`.
      messages = _readMessageValue(body['code'], 0);
      if (messages.isEmpty) messages = _readMessageValue(body['error'], 0);
    }
    if (messages.isEmpty) {
      // RFC 7807, for an intermediary answering instead of the API.
      messages = _readMessageValue(body['detail'], 0);
      if (messages.isEmpty) messages = _readMessageValue(body['title'], 0);
    }
    return _capMessages(messages);
  }

  /// Alias of [getErrorMessages].
  List<String> get errorMessages => getErrorMessages();

  /// Throw when the call failed, otherwise return this response; 401 and 403 raise
  /// [SdkAuthError], and the message carries the status alone.
  ApiResponse<T> raiseForStatus() {
    if (succeeded) return this;
    final messages = getErrorMessages();
    final summary = 'HTTP $statusCode';
    final redactedBody = Redaction.redactValue(map);
    final redactedHeaders = Redaction.redactMapping(headers);
    final SdkError error = statusCode == 401 || statusCode == 403
        ? SdkAuthError(summary,
            statusCode: statusCode,
            errorType: errorType,
            rawResponse: redactedBody,
            responseHeaders: redactedHeaders,
            requestInfo: requestInfo,
            errorCode: errorCode,
            requestId: requestId,
            docUrl: docUrl,
            fieldErrors: fieldErrors)
        : SdkError(summary,
            statusCode: statusCode,
            errorType: errorType,
            rawResponse: redactedBody,
            responseHeaders: redactedHeaders,
            requestInfo: requestInfo,
            errorCode: errorCode,
            requestId: requestId,
            docUrl: docUrl,
            fieldErrors: fieldErrors);
    for (final message in messages) {
      error.addError(message);
    }
    throw error;
  }

  static Object? _parseJsonBody(Object? body) {
    String text;
    if (body is List<int>) {
      text = utf8.decode(body, allowMalformed: true);
    } else if (body is String) {
      text = body;
    } else {
      return null;
    }
    text = text.trim();
    if (text.isNotEmpty && text.codeUnitAt(0) == 0xFEFF) {
      text = text.substring(1);
    }
    if (!text.startsWith('{') && !text.startsWith('[')) return null;
    try {
      final parsed = jsonDecode(text);
      return parsed is Map ? parsed : null;
    } on FormatException {
      return null;
    }
  }

  static List<String> _readErrorEntries(Object? entries) {
    final messages = <String>[];
    if (entries is Map) {
      entries.forEach((field, value) {
        _prefixField(field, _readMessageValue(value, 0), messages);
      });
      return messages;
    }
    if (entries is List) {
      for (final entry in entries) {
        if (entry is Map) {
          final text = entry['message'] ?? entry['code'];
          _prefixField(entry['field'], _readMessageValue(text, 0), messages);
        } else {
          messages.addAll(_readMessageValue(entry, 0));
        }
      }
      return messages;
    }
    if (entries is String) return _readMessageValue(entries, 0);
    return messages;
  }

  static List<String> _readMessageValue(Object? value, int depth) {
    if (value == null || depth > _maxMessageDepth) return const <String>[];
    if (value is String) {
      return value.trim().isEmpty ? const <String>[] : <String>[value];
    }
    if (value is Map) {
      final text = value['message'] ?? value['code'];
      return _readMessageValue(text, depth + 1);
    }
    if (value is List) {
      final messages = <String>[];
      for (final item in value) {
        messages.addAll(_readMessageValue(item, depth + 1));
      }
      return messages;
    }
    final text = value.toString();
    return text.trim().isEmpty ? const <String>[] : <String>[text];
  }

  // Tested for presence, not truthiness: a bulk import's row 0 is a real field name.
  static void _prefixField(
      Object? fieldName, List<String> fieldMessages, List<String> out) {
    final name = fieldName == null ? '' : fieldName.toString().trim();
    for (final message in fieldMessages) {
      out.add(name.isEmpty ? message : '$name: $message');
    }
  }

  static List<String> _capMessages(List<String> messages) {
    if (messages.length <= _maxReportedMessages) return messages;
    return messages.sublist(0, _maxReportedMessages)
      ..add('+${messages.length - _maxReportedMessages} more problems');
  }
}
