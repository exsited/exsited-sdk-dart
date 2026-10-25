import 'dart:convert';

import '../errors.dart';
import '../redaction.dart';

/// URL assembly for Exsited paths with `{name}` placeholders. A dot-only
/// value is refused: `..` would still resolve to another endpoint.
class UrlBuilder {
  UrlBuilder._();

  static final RegExp _placeholder = RegExp(r'\{([a-z_][a-z0-9_]*)\}');
  static final RegExp _queryOrFragment = RegExp('[?#]');

  // One name=*** pair anchored on a delimiter, trailing whitespace included.
  static final RegExp _redactedParameter = RegExp(
      '[?#&]([^?#&=]*)=${RegExp.escape(Redaction.redacted)}(?=[&#]|\\s|\$)');

  /// The `{name}` placeholders in a template, first-seen order, query part excluded.
  static List<String> findPathParamNames(String pathTemplate) {
    final names = <String>[];
    final seen = <String>{};
    for (final match
        in _placeholder.allMatches(_splitTemplate(pathTemplate).template)) {
      final name = match[1]!;
      if (seen.add(name)) names.add(name);
    }
    return names;
  }

  /// Fill `{name}` placeholders; every problem reported in one exception.
  static String substitutePathParams(
      String pathTemplate, Map<String, Object?>? pathParams) {
    final split = _splitTemplate(pathTemplate);
    final expected = findPathParamNames(pathTemplate);
    final supplied = pathParams ?? const <String, Object?>{};

    final problems = <String>[];
    final missing =
        expected.where((name) => !supplied.containsKey(name)).toList()..sort();
    if (missing.isNotEmpty) {
      problems.add('missing path params: ${missing.join(', ')}');
    }
    final unknown = supplied.keys
        .where((name) => !expected.contains(name))
        .toList()
      ..sort();
    if (unknown.isNotEmpty) {
      problems.add('unknown path params: ${unknown.join(', ')}');
    }

    final blank = <String>[];
    final wrongTyped = <String>[];
    final dotOnly = <String>[];
    for (final name in expected) {
      if (!supplied.containsKey(name)) continue;
      final value = supplied[name];
      if (value == null || (value is String && value.trim().isEmpty)) {
        blank.add(name);
      } else if (!_usablePathParam(value)) {
        wrongTyped.add('$name (${value.runtimeType})');
      } else if (_isDotOnly(_substitutionText(value))) {
        dotOnly.add(name);
      }
    }
    if (blank.isNotEmpty) {
      problems.add('blank path params: ${(blank..sort()).join(', ')}');
    }
    if (wrongTyped.isNotEmpty) {
      problems
          .add('wrong-typed path params: ${(wrongTyped..sort()).join(', ')}');
    }
    if (dotOnly.isNotEmpty) {
      problems.add('dot-only path params: ${(dotOnly..sort()).join(', ')} - a '
          'value of only dots is a relative path segment rather than an '
          'identifier, and the URL layer removes it, so the request would '
          'reach a different endpoint with this call\'s token and payload');
    }
    if (problems.isNotEmpty) {
      throw SdkUsageError('$pathTemplate -> ${problems.join('; ')}');
    }

    final substituted = split.template.replaceAllMapped(_placeholder,
        (match) => percentEncode(_substitutionText(supplied[match[1]]!)));
    if (substituted.contains('{') || substituted.contains('}')) {
      // The template, never the substituted path, which now carries the values.
      throw SdkUsageError(
          '$pathTemplate -> malformed placeholder: a brace survived '
          'substitution, so a `{name}` in the template is not one this SDK '
          'recognises - a placeholder is lower case, starts with a letter or an '
          'underscore, and is closed. The substituted path is not shown: it '
          'carries the values that did fill');
    }
    return substituted + split.queryAndFragment;
  }

  /// Join a base URL and a path; an empty path or one carrying a fragment is
  /// refused, since neither names the endpoint the caller wrote.
  static String buildUrl(String baseUrl, String path) {
    if (path.trim().isEmpty) {
      throw SdkUsageError('path must name an endpoint - an empty path requests '
          'the instance root');
    }
    if (path.contains('#')) {
      throw SdkUsageError('path must not carry a fragment - a "#" and '
          'everything after it is never sent, so the request would reach the '
          'truncated URL, which is a different endpoint');
    }
    _rejectARedactedValue(path);
    final lowered = path.toLowerCase();
    if (lowered.startsWith('http://') || lowered.startsWith('https://')) {
      _requireSameOrigin(baseUrl, path);
      return path;
    }
    final trimmedBase = _stripTrailingSlashes(baseUrl);
    return trimmedBase + (path.startsWith('/') ? '' : '/') + path;
  }

  /// RFC 3986 percent-encoding with an empty safe set: unreserved characters only.
  static String percentEncode(String text) {
    final bytes = utf8.encode(text);
    final buffer = StringBuffer();
    for (final byteValue in bytes) {
      final unreserved = (byteValue >= 0x41 && byteValue <= 0x5a) ||
          (byteValue >= 0x61 && byteValue <= 0x7a) ||
          (byteValue >= 0x30 && byteValue <= 0x39) ||
          byteValue == 0x2d ||
          byteValue == 0x2e ||
          byteValue == 0x5f ||
          byteValue == 0x7e;
      if (unreserved) {
        buffer.writeCharCode(byteValue);
      } else {
        buffer.write(
            '%${byteValue.toRadixString(16).toUpperCase().padLeft(2, '0')}');
      }
    }
    return buffer.toString();
  }

  static void _rejectARedactedValue(String path) {
    final found = _redactedParameter.firstMatch(path);
    if (found != null) {
      throw SdkUsageError(
          "path: parameter '${found[1]}' holds only the redaction marker "
          '${Redaction.redacted}, so this URL is a printed or logged copy and the '
          'real value is not in it - read the value off the response itself');
    }
  }

  // Refuse an absolute URL for another instance, naming neither origin.
  static void _requireSameOrigin(String baseUrl, String url) {
    // Userinfo is tested on the raw string: a failed parse would quote the password.
    final authority = _rawAuthority(url);
    if (authority.contains('@')) {
      throw SdkUsageError(
          'an absolute URL carrying embedded credentials would replace the '
          'bearer token; strip the userinfo before following it. Neither the '
          'URL nor its host is echoed: the password is in the one, the instance '
          'is named by the other, and this message renders by default');
    }
    final target = _parse(url);
    final configured = _parse(baseUrl);
    if (_origin(target) != _origin(configured)) {
      throw SdkUsageError('an absolute URL is not on the configured origin '
          '(${_originDifference(target, configured)}); an absolute URL '
          "is requested with the access token attached, so only the instance's "
          'own links may be passed back. Neither origin is echoed: each names '
          'an instance, and this message renders by default');
    }
  }

  static String _originDifference(Uri target, Uri configured) {
    final differing = <String>[
      if (target.scheme.toLowerCase() != configured.scheme.toLowerCase())
        'the scheme',
      if (target.host.toLowerCase() != configured.host.toLowerCase())
        'the host',
      if (_effectivePort(target) != _effectivePort(configured)) 'the port',
    ];
    return '${differing.join(' and ')} '
        '${differing.length > 1 ? 'differ' : 'differs'}';
  }

  static String _rawAuthority(String url) {
    const marker = '://';
    final start = url.indexOf(marker) + marker.length;
    final end = url.indexOf(RegExp(r'[/?#]'), start);
    return end < 0 ? url.substring(start) : url.substring(start, end);
  }

  static Uri _parse(String url) {
    // hasScheme, not isAbsolute, which is false for any URI with a fragment.
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme) {
      throw SdkUsageError('not a parseable absolute URL. Deliberately not '
          'echoing it: an unparseable URL can still carry credentials');
    }
    return uri;
  }

  // scheme://host:port with the scheme's implied port made explicit.
  static String _origin(Uri uri) =>
      '${uri.scheme.toLowerCase()}://${uri.host.toLowerCase()}:'
      '${_effectivePort(uri)}';

  // The one written, or the scheme's own, or `-1` for a scheme with no default.
  static int _effectivePort(Uri uri) {
    if (uri.hasPort) return uri.port;
    return switch (uri.scheme.toLowerCase()) {
      'https' => 443,
      'http' => 80,
      _ => -1,
    };
  }

  static ({String template, String queryAndFragment}) _splitTemplate(
      String pathTemplate) {
    final boundary = _queryOrFragment.firstMatch(pathTemplate);
    if (boundary == null) return (template: pathTemplate, queryAndFragment: '');
    return (
      template: pathTemplate.substring(0, boundary.start),
      queryAndFragment: pathTemplate.substring(boundary.start),
    );
  }

  static String _stripTrailingSlashes(String text) {
    var end = text.length;
    while (end > 0 && text[end - 1] == '/') {
      end--;
    }
    return text.substring(0, end);
  }

  static bool _usablePathParam(Object value) => value is String || value is int;

  // Read in one place, so the dot-only check judges the text that would be encoded.
  static String _substitutionText(Object value) =>
      value is String ? value.trim() : value.toString();

  // `.hidden` and `a..b` are not dot-only.
  static bool _isDotOnly(String text) =>
      text.isNotEmpty && text.codeUnits.every((codeUnit) => codeUnit == 0x2e);
}

/// Join a base URL and a path, refusing another origin.
String buildUrl(String baseUrl, String path) =>
    UrlBuilder.buildUrl(baseUrl, path);

/// Fill the `{name}` placeholders in a path template.
String substitutePathParams(
        String pathTemplate, Map<String, Object?>? pathParams) =>
    UrlBuilder.substitutePathParams(pathTemplate, pathParams);
