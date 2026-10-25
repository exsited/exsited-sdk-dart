import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' show MediaType;

import '../client/api_response.dart';
import '../client/dto.dart';
import '../config/sdk_config.dart';
import '../errors.dart';
import '../redaction.dart';
import 'client_factory_web.dart' if (dart.library.io) 'client_factory_io.dart';
import 'media_type.dart';
import 'retry_policy.dart';

/// Refuse a `files` entry that is not bytes, a contents `String`, or
/// `[filename, contents, contentType?]`.
void validateFilePart(String field, Object? value) {
  // The field name is checked first: the other refusals quote it.
  _refusePartLabelBytes(
      'a files part name of ${field.length} code unit(s)', field);
  if (value is List<int>) return;
  if (value is String) return;
  if (value is List &&
      value.length >= 2 &&
      value[0] is String &&
      (value[1] is List<int> || value[1] is String)) {
    _validatePartLabels(field, value);
    return;
  }
  throw SdkUsageError(
      "files: '$field' must be a List<int> of bytes or a String of contents, or "
      '[filename, bytes-or-String, contentType?]. A String is the file CONTENTS, '
      'not a path: a path is not read here (web has no file system), so read the '
      'bytes yourself first.');
}

// Parsed here: MediaType.parse throws a FormatException no SdkError handler covers.
void _validatePartLabels(String field, List<Object?> entry) {
  _refusePartLabelBytes("the filename on part '$field'", entry[0]! as String);
  if (entry.length < 3) return;
  final declared = entry[2];
  if (declared is! String) return;
  _refusePartLabelBytes("the contentType on part '$field'", declared);
  try {
    MediaType.parse(declared);
  } on FormatException catch (error) {
    throw SdkUsageError(
        "files: '$field' contentType is not a media type, got "
        '${jsonEncode(declared)} - use a `type/subtype` value such as '
        "'text/csv', or drop the third element to send "
        "'application/octet-stream'",
        cause: error);
  }
}

// Refuse CR, LF or NUL in a label that becomes multipart part header text.
void _refusePartLabelBytes(String what, String value) {
  for (var index = 0; index < value.length; index++) {
    final String? found = switch (value.codeUnitAt(index)) {
      0x0d => 'a carriage return',
      0x0a => 'a newline',
      0x00 => 'a NUL',
      _ => null,
    };
    if (found == null) continue;
    throw SdkUsageError(
        '$what carries $found at code unit $index, which would forge a header '
        'on the multipart part this SDK sends. The value is not shown: it may '
        'be attacker-chosen. Strip CR, LF and NUL from an upload filename '
        'before passing it on');
  }
}

// Percent form, not backslash: most servers do not honour a backslash escape.
String _escapePartParameter(String value) =>
    value.replaceAll(r'\', '%5C').replaceAll('"', '%22');

// RFC 9110 token symbols: ``!#$%&'*+-.^_`|~``. SdkConfig keeps an identical
// copy of this header grammar; change both together.
const Set<int> _headerNameSymbols = <int>{
  0x21, 0x23, 0x24, 0x25, 0x26, 0x27, 0x2a, 0x2b, //
  0x2d, 0x2e, 0x5e, 0x5f, 0x60, 0x7c, 0x7e
};

bool _sendableHeaderName(String name) {
  if (name.isEmpty) return false;
  for (final codeUnit in name.codeUnits) {
    final alphanumeric = (codeUnit >= 0x30 && codeUnit <= 0x39) ||
        (codeUnit >= 0x41 && codeUnit <= 0x5a) ||
        (codeUnit >= 0x61 && codeUnit <= 0x7a);
    if (!alphanumeric && !_headerNameSymbols.contains(codeUnit)) return false;
  }
  return true;
}

bool _sendableHeaderValue(String value) {
  if (value.isEmpty) return true;
  final first = value.codeUnitAt(0);
  if (first < 0x21 || first > 0x7e) return false;
  final last = value.codeUnitAt(value.length - 1);
  if (last == 0x20 || last == 0x09) return false;
  for (final codeUnit in value.codeUnits) {
    // HTAB is a field character between the ends only; both were judged above.
    if (codeUnit == 0x09) continue;
    if (codeUnit < 0x20 || codeUnit > 0x7e) return false;
  }
  return true;
}

/// Refuse a header no HTTP layer can safely send; the value is never quoted.
void validateRequestHeaders(Map<String, String>? headers) {
  if (headers == null) return;
  for (final entry in headers.entries) {
    if (_sendableHeaderName(entry.key) && _sendableHeaderValue(entry.value)) {
      continue;
    }
    throw SdkUsageError(
        'header ${jsonEncode(entry.key)}: not something the transport can '
        'send - a name or value carrying a carriage return, a newline, a NUL, '
        'another control character, a colon in the name, a blank name, '
        'leading or trailing whitespace in the value, or a character outside '
        'printable ASCII. An internal tab is allowed. The value is not shown: '
        'it may be a credential');
  }
}

// A rough per-element charge: it makes an unbounded producer terminate.
const int _perElementSourceBytes = 16;

// Charged while the request is built, before any I/O, hence an SdkUsageError.
class _ByteBudget {
  _ByteBudget(this.limit, this.what, this.field);

  /// The ceiling, in bytes.
  final int limit;

  /// What is being counted, as it reads in the refusal.
  final String what;

  /// The `SdkConfig` field a caller raises to accept it.
  final String field;

  int _spent = 0;

  int get spent => _spent;

  /// Charge [bytes], refusing once the running total passes [limit].
  void charge(int bytes) {
    _spent += bytes;
    if (_spent > limit) {
      throw SdkUsageError('$what passes the $limit-byte $field ceiling at '
          '$_spent byte(s); raise SdkConfig.$field to accept it, or send less. '
          'The value is not shown: it is the payload');
    }
  }
}

// UTF-8 length of [text], capped at `limit + 1`, without encoding it.
int _utf8LengthCapped(String text, int limit) {
  var total = 0;
  for (var index = 0; index < text.length; index++) {
    final unit = text.codeUnitAt(index);
    if (unit < 0x80) {
      total += 1;
    } else if (unit < 0x800) {
      total += 2;
    } else if (unit >= 0xd800 && unit < 0xdc00 && index + 1 < text.length) {
      final low = text.codeUnitAt(index + 1);
      if (low >= 0xdc00 && low < 0xe000) {
        // One 4-byte sequence; the low half is consumed rather than recounted.
        total += 4;
        index++;
      } else {
        // A lone high surrogate: `utf8.encode` substitutes U+FFFD, three bytes.
        total += 3;
      }
    } else {
      total += 3;
    }
    if (total > limit) return limit + 1;
  }
  return total;
}

// Charges every write before appending, so the buffer never exceeds its ceiling.
class _BodyWriter {
  _BodyWriter(this._wire, [this._framing]);

  final _ByteBudget _wire;

  // The framing ceiling, for a multipart body; `null` for every other body.
  final _ByteBudget? _framing;

  final BytesBuilder _collected = BytesBuilder(copy: false);

  // A delimiter, a part header or the closing marker. Charged against both.
  void writeFraming(String text) {
    final bytes = utf8.encode(text);
    _framing?.charge(bytes.length);
    _append(bytes);
  }

  void writeContent(List<int> bytes) => _append(bytes);

  void writeContentText(String text) => _append(utf8.encode(text));

  void _append(List<int> bytes) {
    _wire.charge(bytes.length);
    _collected.add(bytes);
  }

  Uint8List takeBytes() => _collected.takeBytes().asUnmodifiableView();
}

// Charges each encoded chunk, so an oversize JSON body is abandoned mid-encode.
class _CappedJsonSink implements Sink<List<int>> {
  _CappedJsonSink(this._writer);

  final _BodyWriter _writer;

  @override
  void add(List<int> chunk) => _writer.writeContent(chunk);

  @override
  void close() {}
}

// Distinct from a network failure, which is retryable.
class _ResponseOverCap implements Exception {
  _ResponseOverCap(this.limitBytes, [this.declaredBytes]);

  final int limitBytes;

  // The over-cap Content-Length declared, or null if the running total stopped it.
  final int? declaredBytes;
}

// Records whether the body has begun streaming, so a socket failure can be told
// apart from one raised before any request byte was written.
class _PhaseAwareRequest extends http.Request with http.Abortable {
  _PhaseAwareRequest(super.method, super.url, this.abortTrigger);

  @override
  final Future<void>? abortTrigger;

  // Whether anything has begun reading this body.
  bool get writeBegun => _writeBegun;
  bool _writeBegun = false;

  @override
  http.ByteStream finalize() {
    final inner = super.finalize();
    late StreamSubscription<List<int>> subscription;
    // sync: the flag must be set in the microtask the client starts reading in.
    final controller = StreamController<List<int>>(sync: true);
    controller
      ..onListen = () {
        _writeBegun = true;
        subscription = inner.listen(controller.add,
            onError: controller.addError, onDone: controller.close);
      }
      ..onPause = () {
        subscription.pause();
      }
      ..onResume = () {
        subscription.resume();
      }
      ..onCancel = () => subscription.cancel();
    return http.ByteStream(controller.stream);
  }
}

/// HTTP execution over `package:http`: retries, per-attempt timeouts and
/// decoding. Redirects are not followed.
class Transport {
  /// Build a transport sending through [client], or through a default it owns.
  Transport(
    this._config, {
    RetryPolicy? retryPolicy,
    http.Client? client,
    void Function(String message)? onProgress,
  })  : _retryPolicy = retryPolicy ?? RetryPolicy.fromConfig(_config),
        _onProgress = onProgress ?? _noop,
        _ownsClient = client == null,
        _client = client ?? createDefaultClient(_config);

  final SdkConfig _config;
  final RetryPolicy _retryPolicy;
  final void Function(String message) _onProgress;

  // Whether this transport built its own client, and so may close one; a
  // supplied client can be shared, and closing it would break every other user.
  final bool _ownsClient;

  final http.Client _client;

  static void _noop(String _) {}

  Duration get _timeout =>
      Duration(milliseconds: (_config.timeoutSeconds * 1000).round());

  /// Send one request, retried per the policy, and return its decoded [ApiResponse].
  Future<ApiResponse<T>> sendHttpRequest<T>(TransportRequest request) async {
    final method = request.httpMethod;
    final url = request.wireUrl;
    validateRequestHeaders(request.headers);
    final started = Stopwatch()..start();
    var attempt = 0;
    Object? lastError;

    while (attempt < _retryPolicy.maxAttempts) {
      attempt++;
      _onProgress('$method ${_endpointOf(request, url)} sending '
          '(attempt $attempt/${_retryPolicy.maxAttempts})');

      // Outside the try, whose catch would misfile a caller error as a network one.
      final abortGate = Completer<void>();
      final prepared = _buildRequest(method, url, request, abortGate.future);

      final attemptClock = Stopwatch()..start();
      // Headers arrived, or writeBegun, means the request may have reached the wire.
      var responseHeadersArrived = false;

      final http.StreamedResponse raw;
      final List<int> bodyBytes;
      try {
        raw = await _sendUnderBudget(prepared, abortGate, attemptClock);
        responseHeadersArrived = true;
        bodyBytes = await _readBodyUnderBudget(raw, abortGate, attemptClock);
      } on _ResponseOverCap catch (error) {
        // Not retried: a replay would only exceed the cap again.
        throw SdkError(
            'the response body is larger than the ${error.limitBytes}-byte cap '
            'this client buffers'
            '${error.declaredBytes == null ? '' : ' (Content-Length ${error.declaredBytes})'}'
            '; raise SdkConfig.maxResponseBytes to accept it',
            errorType: ErrorType.unknown,
            requestInfo: _requestInfo(method, request.url, request, attempt,
                _retryPolicy.maxAttempts, started));
      } on Object catch (error) {
        lastError = error;
        if (attempt >= _retryPolicy.maxAttempts ||
            !_retryPolicy.shouldRetryAfterException(
                error, method, responseHeadersArrived || prepared.writeBegun)) {
          break;
        }
        await _delaySeconds(_retryPolicy.computeBackoffSeconds(attempt, null));
        continue;
      }

      final status = raw.statusCode;
      final contentType = raw.headers['content-type'];

      if (attempt < _retryPolicy.maxAttempts &&
          _retryPolicy.shouldRetryStatusCode(status, method)) {
        await _delaySeconds(_retryPolicy.computeBackoffSeconds(
            attempt, raw.headers['retry-after']));
        continue;
      }

      final decoded = decodeResponseBody(status, bodyBytes, contentType);
      // The recorded url is the pre-merge one; queryParams travel separately.
      return _buildResponse<T>(raw, decoded, bodyBytes, contentType, method,
          request.url, request, attempt, _retryPolicy.maxAttempts, started);
    }

    final timedOut = _isTimeout(lastError);
    // Platform text is withheld, as it can echo a rejected value; it rides on cause.
    throw SdkError(
      'the request ${timedOut ? 'timed out' : 'failed'} after $attempt '
      'attempt(s) (${lastError.runtimeType})',
      errorType: timedOut ? ErrorType.timeout : ErrorType.network,
      requestInfo: _requestInfo(method, request.url, request, attempt,
          _retryPolicy.maxAttempts, started),
      cause: lastError,
    );
  }

  /// Close the underlying HTTP client, releasing its pooled connections; a client
  /// this transport was handed is left open.
  void close() {
    if (_ownsClient) _client.close();
  }

  /// Release pooled connections. An alias for [close].
  void closeTransport() => close();

  // Both timeout phases complete the abort gate: Future.timeout alone leaks the socket.

  // What is left of this attempt's ceiling, never negative; headers and body share it.
  Duration _remainingBudget(Stopwatch attemptClock) {
    final left = _timeout - attemptClock.elapsed;
    return left.isNegative ? Duration.zero : left;
  }

  Future<http.StreamedResponse> _sendUnderBudget(http.BaseRequest prepared,
      Completer<void> abortGate, Stopwatch attemptClock) {
    final pending = _client.send(prepared);
    // Swallow the abort on pending so it cannot surface as an unhandled async error.
    unawaited(pending.then<void>((late) {}).catchError((Object _) {}));
    return pending.timeout(_remainingBudget(attemptClock), onTimeout: () {
      _abort(abortGate);
      // The configured ceiling, not the remainder: it is the number a caller set.
      throw TimeoutException('no response headers', _timeout);
    });
  }

  // Read the body under the attempt's remaining time and the byte cap; a declared
  // over-cap Content-Length is refused before any body byte is read.
  Future<List<int>> _readBodyUnderBudget(http.StreamedResponse raw,
      Completer<void> abortGate, Stopwatch attemptClock) {
    final limit = _config.maxResponseBytes;
    final declared = raw.contentLength;
    if (declared != null && declared > limit) {
      // Abort to release the connection; listen-and-cancel so nothing is buffered.
      _abort(abortGate);
      unawaited(raw.stream
          .listen(null, cancelOnError: true)
          .cancel()
          .catchError((Object _) {}));
      return Future<List<int>>.error(_ResponseOverCap(limit, declared));
    }
    final completer = Completer<List<int>>();
    final collected = BytesBuilder(copy: false);
    late final StreamSubscription<List<int>> subscription;
    void stopWith(Object error) {
      _abort(abortGate);
      unawaited(subscription.cancel().catchError((Object _) {}));
      completer.completeError(error);
    }

    final budget = Timer(_remainingBudget(attemptClock), () {
      if (completer.isCompleted) return;
      stopWith(TimeoutException('the response body did not finish', _timeout));
    });
    subscription = raw.stream.listen(
      (List<int> chunk) {
        if (completer.isCompleted) return;
        // Measured before adding, so one oversize chunk is never buffered.
        if (collected.length + chunk.length > limit) {
          budget.cancel();
          stopWith(_ResponseOverCap(limit));
          return;
        }
        collected.add(chunk);
      },
      onDone: () {
        budget.cancel();
        if (!completer.isCompleted) completer.complete(collected.takeBytes());
      },
      onError: (Object error, StackTrace stack) {
        budget.cancel();
        if (!completer.isCompleted) completer.completeError(error, stack);
      },
      cancelOnError: true,
    );
    return completer.future;
  }

  // The identifier-free name for a call, since this text is printed and logged.
  static String _endpointOf(TransportRequest request, String url) =>
      request.endpointTemplate ?? deriveEndpointTemplate(url);

  static void _abort(Completer<void> abortGate) {
    if (!abortGate.isCompleted) abortGate.complete();
  }

  // Every fragment was resolved at construction, so each attempt sends the same bytes.
  _PhaseAwareRequest _buildRequest(String method, String url,
      TransportRequest request, Future<void> abortTrigger) {
    final uri = Uri.parse(url);
    final httpRequest = _PhaseAwareRequest(method, uri, abortTrigger)
      ..followRedirects = false;
    if (request.headers != null) httpRequest.headers.addAll(request.headers!);
    final encoded = request.encodedBody;
    if (encoded != null) {
      final contentType = request.encodedContentType;
      if (contentType != null) {
        if (request.ownsContentType) {
          // A multipart label names the boundary the body was framed with, so it wins.
          httpRequest.headers['content-type'] = contentType;
        } else {
          // Deferring keeps a caller's deliberate Content-Type, e.g. application/vnd.api+json.
          httpRequest.headers.putIfAbsent('content-type', () => contentType);
        }
      }
      // bodyBytes, not body/bodyFields, which re-encode and append a charset.
      httpRequest.bodyBytes = encoded;
    }
    return httpRequest;
  }

  ApiResponse<T> _buildResponse<T>(
      http.StreamedResponse raw,
      Object? decoded,
      List<int> bodyBytes,
      String? contentType,
      String method,
      String url,
      TransportRequest request,
      int attempt,
      int maxAttempts,
      Stopwatch started) {
    return ApiResponse<T>(
      statusCode: raw.statusCode,
      data: decoded,
      headers: raw.headers,
      contentType: contentType,
      errorType: ErrorType.classify(raw.statusCode),
      requestInfo:
          _requestInfo(method, url, request, attempt, maxAttempts, started),
      // The bytes as received, so ApiResponse.json is the API's own text.
      bodyBytes: bodyBytes,
      dtoDecoder: request.dtoDecoder,
      responseFormat: request.responseFormat,
    );
  }

  RequestInfo _requestInfo(String method, String url, TransportRequest request,
          int attempt, int maxAttempts, Stopwatch started) =>
      RequestInfo(
        clientName: _config.clientName,
        apiVersion: _config.apiVersion.pathSegment,
        httpMethod: method,
        url: url,
        endpointTemplate: request.endpointTemplate,
        queryParams: request.queryParams,
        body: request.requestInfoBody,
        headers: request.requestInfoHeaders ?? const <String, String>{},
        attemptCount: attempt,
        maxAttempts: maxAttempts,
        elapsedSeconds: (started.elapsedMicroseconds / 1e6 * 1e4).round() / 1e4,
      );

  // HttpClient.connectionTimeout raises SocketException, hence isConnectTimeout.
  static bool _isTimeout(Object? error) =>
      error is TimeoutException || (error != null && isConnectTimeout(error));

  static Future<void> _delaySeconds(double seconds) async {
    // `!(seconds > 0)` rather than `seconds <= 0`, so NaN cannot reach Duration.
    if (!(seconds > 0)) return;
    await Future<void>.delayed(
        Duration(milliseconds: (seconds * 1000).round()));
  }
}

/// One request, snapshotted at construction: method normalised, query merged into
/// [wireUrl] and body encoded, so every attempt and replay sends the same bytes.
final class TransportRequest {
  /// Name only the method and URL; set the rest with named arguments.
  factory TransportRequest(
    String httpMethod,
    String url, {
    Map<String, Object?>? queryParams,
    Object? jsonBody,
    Map<String, Object?>? formData,
    Map<String, Object?>? files,
    Map<String, String>? headers,
    Map<String, String>? requestInfoHeaders,
    Object? requestInfoBody,
    String responseFormat = SdkConfig.responseFormatMap,
    DtoDecoder? dtoDecoder,
    String? endpointTemplate,
    int maxRequestBytes = SdkConfig.defaultMaxRequestBytes,
    int maxRequestSourceBytes = SdkConfig.defaultMaxRequestSourceBytes,
    int maxMultipartOverheadBytes = SdkConfig.defaultMaxMultipartOverheadBytes,
  }) {
    // One budget across the three body sources, because they are one payload.
    final sourceBudget = _ByteBudget(
        maxRequestSourceBytes, 'the request payload', 'maxRequestSourceBytes');
    final frozenJson = _frozenValue(jsonBody, sourceBudget);
    final frozenForm = _frozenMap(formData, sourceBudget);
    final frozenFiles = _frozenMap(files, sourceBudget);
    // Separate budgets at the same ceiling: neither is part of the payload.
    final frozenQuery = _frozenMap(
        queryParams,
        _ByteBudget(maxRequestSourceBytes, 'the query parameters',
            'maxRequestSourceBytes'));
    final frozenRequestInfoBody = _frozenValue(
        requestInfoBody,
        _ByteBudget(maxRequestSourceBytes, 'the recorded request body',
            'maxRequestSourceBytes'));
    final multipart = frozenFiles != null && frozenFiles.isNotEmpty;
    if (multipart && frozenForm != null) {
      // A multipart formData name becomes part header text, so it is held to that rule.
      for (final name in frozenForm.keys) {
        _refusePartLabelBytes(
            'a formData name of ${name.length} code unit(s)', name);
      }
    }
    // Parts are resolved before the boundary is chosen, so the scanned bytes are framed.
    final wireBudget =
        _ByteBudget(maxRequestBytes, 'the request body', 'maxRequestBytes');
    final Map<String, String>? fields =
        multipart ? _materialiseFields(frozenForm) : null;
    final List<_MultipartPart> parts = frozenFiles == null || !multipart
        ? const <_MultipartPart>[]
        : _materialiseParts(frozenFiles);
    final String? boundary =
        multipart ? _chooseMultipartBoundary(fields, parts) : null;
    return TransportRequest._(
      httpMethod: normaliseHttpMethod(httpMethod),
      url: url,
      wireUrl: _materialiseWireUrl(url, frozenQuery),
      endpointTemplate: endpointTemplate,
      queryParams: frozenQuery,
      jsonBody: frozenJson,
      formData: frozenForm,
      files: frozenFiles,
      headers: _frozenHeaders(headers),
      requestInfoHeaders: _frozenHeaders(requestInfoHeaders),
      requestInfoBody: frozenRequestInfoBody,
      responseFormat: responseFormat,
      dtoDecoder: dtoDecoder,
      encodedBody: boundary == null
          ? _encodeBody(frozenJson, frozenForm, wireBudget)
          : _frameMultipartBody(
              boundary,
              fields,
              parts,
              wireBudget,
              _ByteBudget(maxMultipartOverheadBytes, 'the multipart framing',
                  'maxMultipartOverheadBytes')),
      encodedContentType: boundary == null
          ? _encodedContentType(frozenJson, frozenForm)
          : '$_multipartMediaType; boundary=$boundary',
      ownsContentType: boundary != null,
    );
  }

  const TransportRequest._({
    required this.httpMethod,
    required this.url,
    required this.wireUrl,
    required this.endpointTemplate,
    required this.queryParams,
    required this.jsonBody,
    required this.formData,
    required this.files,
    required this.headers,
    required this.requestInfoHeaders,
    required this.requestInfoBody,
    required this.responseFormat,
    required this.dtoDecoder,
    required this.encodedBody,
    required this.encodedContentType,
    required this.ownsContentType,
  });

  /// The HTTP method, trimmed and upper-cased once at construction.
  final String httpMethod;

  /// The absolute request URL, without [queryParams].
  final String url;

  /// [url] with [queryParams] appended and percent-encoded, resolved once.
  final String wireUrl;

  /// The endpoint with path parameters unsubstituted, or `null` if none was named.
  final String? endpointTemplate;

  /// Query parameters to append, already normalised by the caller - an unmodifiable copy.
  final Map<String, Object?>? queryParams;

  /// The JSON body to send, as an unmodifiable snapshot.
  final Object? jsonBody;

  /// Form-encoded data to send - an unmodifiable copy.
  final Map<String, Object?>? formData;

  /// Multipart files to send - an unmodifiable copy, each part's bytes copied.
  final Map<String, Object?>? files;

  /// Headers for this request - an unmodifiable copy.
  final Map<String, String>? headers;

  /// Already-redacted headers to record on the response's request info.
  final Map<String, String>? requestInfoHeaders;

  /// An already-redacted body to record on the response's request info.
  final Object? requestInfoBody;

  /// The body's bytes, encoded once so every attempt and replay sends these.
  final List<int>? encodedBody;

  /// The `Content-Type` [encodedBody] was encoded as, or `null` without a body.
  final String? encodedContentType;

  /// Whether [encodedContentType] replaces a caller's own; true only for multipart.
  final bool ownsContentType;

  /// Which form the response's `data` takes, already resolved by the client.
  final String responseFormat;

  /// The typed view this call produces, or `null` where it produces none.
  final DtoDecoder? dtoDecoder;

  /// The same request under different headers, reusing the frozen URL and body.
  TransportRequest withHeaders(Map<String, String>? headers,
          {Map<String, String>? requestInfoHeaders}) =>
      TransportRequest._(
        httpMethod: httpMethod,
        url: url,
        wireUrl: wireUrl,
        endpointTemplate: endpointTemplate,
        queryParams: queryParams,
        jsonBody: jsonBody,
        formData: formData,
        files: files,
        headers: _frozenHeaders(headers),
        requestInfoHeaders: _frozenHeaders(requestInfoHeaders),
        requestInfoBody: requestInfoBody,
        responseFormat: responseFormat,
        dtoDecoder: dtoDecoder,
        encodedBody: encodedBody,
        encodedContentType: encodedContentType,
        ownsContentType: ownsContentType,
      );
}

// Plain bytes, not a MultipartFile, whose single-subscription stream sends once.
class _MultipartPart {
  const _MultipartPart(this.name, this.filename, this.bytes, this.contentType);

  // Escaped for its quoted parameter.
  final String name;

  // Escaped for its quoted parameter.
  final String filename;

  final List<int> bytes;

  // `null` means `application/octet-stream`.
  final MediaType? contentType;
}

/// The trimmed, upper-cased method, refusing one that is not an RFC 9110 `token`.
String normaliseHttpMethod(String httpMethod) {
  final method = httpMethod.trim().toUpperCase();
  if (method.isEmpty) {
    throw SdkUsageError('httpMethod must name a verb');
  }
  if (!_sendableHeaderName(method)) {
    throw SdkUsageError(
        'httpMethod ${jsonEncode(httpMethod)} is not an HTTP method: RFC 9110 '
        'makes a method a token, which excludes whitespace, a line break, a '
        'control character, a separator and every non-ASCII byte');
  }
  return method;
}

String _materialiseWireUrl(String url, Map<String, Object?>? queryParams) {
  final parsed = Uri.tryParse(url);
  if (parsed == null ||
      (!parsed.isScheme('http') && !parsed.isScheme('https'))) {
    // Withheld: a resolved URL names the instance and carries path values.
    throw SdkUsageError(
        'not a valid http(s) URL - a String of ${url.length} char(s). The '
        'value is not shown: a resolved URL names the instance and carries the '
        "path's own identifiers, and this message renders by default. Check "
        'the base URL and the path passed to the call');
  }
  // Tested on the raw string: Uri.hasFragment misses a trailing '#'.
  if (url.contains('#')) {
    throw SdkUsageError(
        'request URL ${deriveEndpointTemplate(url)} carries a fragment, which '
        'no server receives and which any query parameters would be appended '
        'after rather than before; strip everything from the # onwards. The '
        'resolved URL is not shown: it names the instance and carries the path\'s '
        'own identifiers');
  }
  if (queryParams == null || queryParams.isEmpty) return url;

  final buffer = StringBuffer(url);
  var first = !url.contains('?');
  queryParams.forEach((key, value) {
    for (final single in _expandValue(value)) {
      buffer
        ..write(first ? '?' : '&')
        ..write(Uri.encodeQueryComponent(key))
        ..write('=')
        ..write(Uri.encodeQueryComponent(single));
      first = false;
    }
  });
  return buffer.toString();
}

Iterable<String> _expandValue(Object? value) sync* {
  if (value is String) {
    yield value;
  } else if (value is Iterable) {
    for (final item in value) {
      yield _stringify(item);
    }
  } else {
    yield _stringify(value);
  }
}

String _stringify(Object? value) => value == null ? '' : value.toString();

// Validated again here, so the entries resolved are the entries judged.
List<_MultipartPart> _materialiseParts(Map<String, Object?> files) {
  final parts = <_MultipartPart>[];
  files.forEach((field, value) {
    validateFilePart(field, value);
    // Escaped here rather than left to `package:http`, which handles `"` not `\`.
    final name = _escapePartParameter(field);
    if (value is List<int> || value is String) {
      // The field name stands in, since a file part must carry a filename.
      parts.add(_MultipartPart(name, name, _partBytes(value), null));
      return;
    }
    final entry = value as List;
    parts.add(_MultipartPart(
        name,
        _escapePartParameter(entry[0] as String),
        _partBytes(entry[1]),
        entry.length >= 3 && entry[2] is String
            ? MediaType.parse(entry[2] as String)
            : null));
  });
  return List<_MultipartPart>.unmodifiable(parts);
}

// A field name is escaped like a part label; its value is rendered once here.
Map<String, String>? _materialiseFields(Map<String, Object?>? formData) {
  if (formData == null) return null;
  return Map<String, String>.unmodifiable(<String, String>{
    for (final entry in formData.entries)
      _escapePartParameter(entry.key): _stringify(entry.value)
  });
}

// A String is encoded UTF-8; a List<int> is already wire bytes.
List<int> _partBytes(Object? contents) =>
    contents is String ? utf8.encode(contents) : contents as List<int>;

const String _multipartMediaType = 'multipart/form-data';

// What a part with no declared type is labelled.
const String _defaultPartMediaType = 'application/octet-stream';

// RFC 2046 bchars minus those that need quoting.
const String _boundaryAlphabet =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

// About 190 bits, within RFC 2046's 70-character ceiling.
const int _boundaryRandomChars = 32;

// One candidate normally suffices; the cap keeps the loop finite.
const int _boundaryAttempts = 8;

// Random.secure(): a predictable boundary lets content plant a delimiter.
final Random _boundaryRandom = Random.secure();

// One boundary per logical request, reused by every attempt.
String _generateMultipartBoundary() {
  final buffer = StringBuffer('exsited-sdk-boundary-');
  for (var index = 0; index < _boundaryRandomChars; index++) {
    buffer.write(
        _boundaryAlphabet[_boundaryRandom.nextInt(_boundaryAlphabet.length)]);
  }
  return buffer.toString();
}

// A random boundary absent from every part it delimits.
String _chooseMultipartBoundary(
    Map<String, String>? fields, List<_MultipartPart> parts) {
  for (var attempt = 0; attempt < _boundaryAttempts; attempt++) {
    final candidate = _generateMultipartBoundary();
    if (!_bodyCarries(candidate, fields, parts)) return candidate;
  }
  // Only reachable when the content contains every candidate drawn.
  throw SdkUsageError(
      'no multipart boundary could be chosen: $_boundaryAttempts candidates '
      'each appeared somewhere in the parts being sent, so none of them can '
      'delimit this body unambiguously. The content is not shown');
}

// An ASCII token matches in UTF-8 bytes exactly where it matches the text.
bool _bodyCarries(
    String boundary, Map<String, String>? fields, List<_MultipartPart> parts) {
  if (fields != null) {
    for (final entry in fields.entries) {
      if (entry.key.contains(boundary) || entry.value.contains(boundary)) {
        return true;
      }
    }
  }
  for (final part in parts) {
    if (part.name.contains(boundary) ||
        part.filename.contains(boundary) ||
        (part.contentType?.toString().contains(boundary) ?? false)) {
      return true;
    }
    if (_bytesCarry(part.bytes, boundary)) return true;
  }
  return false;
}

// Scanned directly rather than decoded, which would copy every upload.
bool _bytesCarry(List<int> haystack, String needle) {
  final length = needle.length;
  if (length == 0 || haystack.length < length) return false;
  final first = needle.codeUnitAt(0);
  final last = haystack.length - length;
  for (var start = 0; start <= last; start++) {
    if (haystack[start] != first) continue;
    var index = 1;
    while (
        index < length && haystack[start + index] == needle.codeUnitAt(index)) {
      index++;
    }
    if (index == length) return true;
  }
  return false;
}

// Framed here: package:http picks a new boundary in every finalize().
List<int> _frameMultipartBody(String boundary, Map<String, String>? fields,
    List<_MultipartPart> parts, _ByteBudget wire, _ByteBudget framing) {
  final body = _BodyWriter(wire, framing);
  fields?.forEach((name, value) {
    body.writeFraming('--$boundary\r\n'
        'content-disposition: form-data; name="$name"\r\n');
    if (!_isPlainAscii(value)) {
      body.writeFraming('content-type: text/plain; charset=utf-8\r\n'
          'content-transfer-encoding: binary\r\n');
    }
    body
      ..writeFraming('\r\n')
      ..writeContentText(value)
      ..writeFraming('\r\n');
  });
  for (final part in parts) {
    body.writeFraming('--$boundary\r\n'
        'content-type: ${part.contentType ?? _defaultPartMediaType}\r\n'
        'content-disposition: form-data; name="${part.name}"; '
        'filename="${part.filename}"\r\n\r\n');
    body
      ..writeContent(part.bytes)
      ..writeFraming('\r\n');
  }
  body.writeFraming('--$boundary--\r\n');
  return body.takeBytes();
}

// Decides whether a form field's part carries a charset label of its own.
bool _isPlainAscii(String value) =>
    value.codeUnits.every((codeUnit) => codeUnit <= 0x7f);

Map<String, Object?>? _frozenMap(
    Map<String, Object?>? source, _ByteBudget budget) {
  if (source == null) return null;
  final copied = <String, Object?>{};
  for (final entry in source.entries) {
    budget.charge(_perElementSourceBytes +
        _utf8LengthCapped(entry.key, budget.limit - budget.spent));
    copied[entry.key] = _frozenValue(entry.value, budget);
  }
  return Map<String, Object?>.unmodifiable(copied);
}

// The values are `String`s, which are already immutable.
Map<String, String>? _frozenHeaders(Map<String, String>? source) =>
    source == null ? null : Map<String, String>.unmodifiable(source);

// A detached, unmodifiable snapshot of one request value, each step charged to
// [budget] first so an endless Iterable is refused rather than copied forever.
Object? _frozenValue(Object? value, _ByteBudget budget, [int depth = 0]) {
  if (depth >= Redaction.maxDepth) {
    throw SdkUsageError(
        'a request value nests more than ${Redaction.maxDepth} levels deep, so '
        'it cannot be detached from the caller; flatten it before sending');
  }
  if (value is List<int>) {
    budget.charge(value.length);
    return _frozenIntList(value);
  }
  if (value is String) {
    budget.charge(_utf8LengthCapped(value, budget.limit - budget.spent));
    return value;
  }
  if (value is Map) {
    final copied = <String, Object?>{};
    for (final entry in value.entries) {
      budget.charge(_perElementSourceBytes);
      copied['${entry.key}'] = _frozenValue(entry.value, budget, depth + 1);
    }
    return Map<String, Object?>.unmodifiable(copied);
  }
  if (value is Iterable) {
    // A loop, not .map(): each element is charged before a lazy producer is drained.
    final copied = <Object?>[];
    for (final item in value) {
      budget.charge(_perElementSourceBytes);
      copied.add(_frozenValue(item, budget, depth + 1));
    }
    return List<Object?>.unmodifiable(copied);
  }
  budget.charge(_perElementSourceBytes);
  return value;
}

// A Uint8List only when every element is a byte; narrowing would truncate.
List<int> _frozenIntList(List<int> value) {
  for (final element in value) {
    if (element < 0 || element > 0xff) return List<int>.unmodifiable(value);
  }
  return Uint8List.fromList(value).asUnmodifiableView();
}

// A String JSON body goes out byte for byte; a structured one is chunk-encoded.
List<int>? _encodeBody(
    Object? jsonBody, Map<String, Object?>? formData, _ByteBudget wire) {
  if (jsonBody is String) {
    // Measured before encoding, stopping one byte past the ceiling.
    wire.charge(_utf8LengthCapped(jsonBody, wire.limit));
    return utf8.encode(jsonBody).asUnmodifiableView();
  }
  if (jsonBody != null) {
    final writer = _BodyWriter(wire);
    JsonUtf8Encoder().startChunkedConversion(_CappedJsonSink(writer))
      ..add(jsonBody)
      ..close();
    return writer.takeBytes();
  }
  if (formData != null) {
    final writer = _BodyWriter(wire);
    var first = true;
    for (final entry in formData.entries) {
      // Fragment by fragment: a `join` would build the whole string uncharged.
      if (!first) writer.writeContentText('&');
      first = false;
      writer
        ..writeContentText(Uri.encodeQueryComponent(entry.key))
        ..writeContentText('=')
        ..writeContentText(Uri.encodeQueryComponent(_stringify(entry.value)));
    }
    return writer.takeBytes();
  }
  return null;
}

String? _encodedContentType(Object? jsonBody, Map<String, Object?>? formData) {
  if (jsonBody != null) return 'application/json; charset=utf-8';
  if (formData != null) {
    return 'application/x-www-form-urlencoded; charset=utf-8';
  }
  return null;
}

/// Decode a body by Content-Type: JSON to Maps and Lists, `text/*` to text, other
/// types as bytes, and a 204 or empty body as `null`.
Object? decodeResponseBody(int status, List<int> body, String? contentType) {
  if (status == 204 || body.isEmpty) return null;
  final lowered = (contentType ?? '').toLowerCase();
  if (isJsonContentType(contentType)) {
    try {
      return jsonDecode(utf8.decode(body));
    } on Object {
      return utf8.decode(body, allowMalformed: true);
    }
  }
  if (lowered.startsWith('text/')) {
    return _decodeTextBody(body, lowered);
  }
  return body;
}

// Matched as a substring so a malformed parameter list cannot raise here.
const String _charsetParameter = 'charset=';

// A declared codec, else strict UTF-8, else ISO-8859-1, which cannot fail.
String _decodeTextBody(List<int> body, String loweredContentType) {
  final declared = _declaredCharsetDecoder(loweredContentType);
  if (declared != null) return declared(body);
  try {
    return utf8.decode(body);
  } on FormatException {
    return latin1.decode(body);
  }
}

// null when no charset is declared or dart:convert has no codec for it.
String Function(List<int> body)? _declaredCharsetDecoder(
    String loweredContentType) {
  final index = loweredContentType.indexOf(_charsetParameter);
  if (index < 0) return null;
  var name = loweredContentType.substring(index + _charsetParameter.length);
  final end = name.indexOf(';');
  if (end >= 0) name = name.substring(0, end);
  name = name.trim();
  if (name.length >= 2 && name.startsWith('"') && name.endsWith('"')) {
    name = name.substring(1, name.length - 1).trim();
  }
  switch (name) {
    case 'utf-8':
    case 'utf8':
      return (body) => utf8.decode(body, allowMalformed: true);
    case 'iso-8859-1':
    case 'iso8859-1':
    case 'latin-1':
    case 'latin1':
      return latin1.decode;
    case 'us-ascii':
    case 'ascii':
      return (body) => ascii.decode(body, allowInvalid: true);
  }
  return null;
}
