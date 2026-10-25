# exsited - Dart

Dart client for the Exsited v4 REST API. Handles OAuth2 with a cross-process token
cache, retry with backoff, corporate TLS and proxies, content-type decoding, a typed
error hierarchy, secret redaction and terminal diagnostics. The core (config, errors,
response, DTO base, transport, retry, URL and query building, multipart, logging,
console, redaction, registry and client) is shared by every family; what is specific
to the Exsited v4 API is listed under [Architecture](#architecture).

**The wire is untouched.** No key is renamed or case-folded in either direction: the
names you send are the names on the wire, and the names the API answers with are the
names on `response.map`. A `Map` payload, a form and a query **are** encoded, as JSON,
as `application/x-www-form-urlencoded` and as a query string. A raw JSON `String` is
not re-encoded: it goes out byte for byte, which is what makes a body pasted from an
API client arrive as the document it was. Optional typed views sit **over** that:
send a map, a raw JSON string or a DTO, and read the same response as `.map`, `.json`
or `.dto`. See [Bodies, both ways](#bodies-both-ways).

**Async is native here.** I/O returns a `Future`; pagination is a `Stream` consumed
with `await for`.

```dart
import 'package:exsited/exsited.dart';

Future<void> main() async {
  final client = ExsitedClient(SdkConfig(
    AuthConfig(
      clientName: 'default', // required: which instance this is
      baseUrl: 'https://your-instance.exsited.com',
      clientId: '...',
      clientSecret: '...',
      redirectUri: 'https://your-app.example/callback',
    ),
    raiseOnError: true,
  ));

  try {
    final response = await client.accounts.getAccount('W13ZGY');
    print(response.map);       // the body as it arrived
    print(response.dto?.name); // the typed view
  } finally {
    client.close(); // release the HTTP client when you are done
  }
}
```

`close()` is a one-way latch: it is idempotent, and any request issued afterwards is
refused with an `SdkUsageError` naming the client, before any I/O. A closed client is
not reopened; build a new one.

A failure comes back as a response rather than throwing, which is right for
application code and wrong for a script that must stop. `raiseOnError: true` above
flips it. "Failure" is a non-2xx **or** a 2xx whose body names itself
`"object": "error"`; see [Responses](#responses).

> **Security note.** `clientSecret` is a server credential. Never embed it in a
> shipped mobile or web app, where it can be extracted. The SDK's safe home is a
> server, a backend-for-frontend, or a CLI, even though the code *runs* everywhere.

| | |
|---|---|
| Package | [`exsited`](https://pub.dev/packages/exsited) on pub.dev |
| Import | `package:exsited/exsited.dart`, plus one library per family |
| Dart | 3.5+ (developed on 3.12.2) |
| Dependencies | `http` ^1.6.0, `http_parser` ^4.1.0 |
| Endpoints | 864 in 91 families, documented at [exsited.mintlify.app](https://exsited.mintlify.app/introduction) |
| Author | Ashiq Rahman <ashiq@webalive.com.au> |
| License | MIT, see [LICENSE](LICENSE) |

## Contents

- [Install](#install)
- [Credentials](#credentials)
- [Configuration](#configuration)
- [Bodies, both ways](#bodies-both-ways)
- [Multiple instances](#multiple-instances)
- [Authentication](#authentication)
- [Requests](#requests)
- [Pagination](#pagination)
- [Responses](#responses)
- [Errors](#errors)
- [Diagnostics](#diagnostics)
- [Timeouts](#timeouts)
- [Retries](#retries)
- [Transport](#transport)
- [Endpoints](#endpoints)
- [Architecture](#architecture)
- [Platform notes](#platform-notes)
- [Behaviour worth knowing](#behaviour-worth-knowing)
- [Troubleshooting](#troubleshooting)
- [Public API](#public-api)
- [License](#license)

## Install

```bash
dart pub add exsited
```

**Prerequisites.** Dart 3.5 or newer; `pubspec.yaml` declares `environment: sdk: ^3.5.0`.
Get it from [dart.dev/get-dart](https://dart.dev/get-dart); the Flutter SDK bundles Dart,
so a Flutter install works too, and `flutter pub add exsited` is the same command there.

The command adds the dependency to your `pubspec.yaml` and fetches it:

```yaml
dependencies:
  exsited: ^4.0.0
```

Then import the core library, plus a family library wherever you call one of the
other 89 families:

```dart
import 'package:exsited/exsited.dart';
import 'package:exsited/payments.dart' as payments;
```

## Credentials

**The SDK never reads a credential from the environment**: not from `.env`, not at
any point. Build an `AuthConfig` from wherever your credentials live and hand it in.
(One non-secret presentation setting *is* read from the environment,
`EXSITED_RESPONSE_FORMAT`, and it is the only one: it changes how a body is presented
to you, never what is sent. See [Bodies, both ways](#bodies-both-ways).)

```dart
import 'dart:io';
import 'package:exsited/exsited.dart';

AuthConfig loadAuth() => AuthConfig(
      clientName: 'default',
      baseUrl: Platform.environment['EXSITED_BASE_URL']!,
      clientId: Platform.environment['EXSITED_CLIENT_ID']!,
      clientSecret: Platform.environment['EXSITED_CLIENT_SECRET']!,
      redirectUri: Platform.environment['EXSITED_REDIRECT_URI']!,
    );
```

Validation runs at construction and reports every problem at once:

```
SdkConfigError: instance default: clientId: must not be blank; clientSecret: must not be blank
```

| Field | Required | Default | Notes |
|---|---|---|---|
| `clientName` | yes | | Label in logs and output; selects the instance by name. Use `'default'` for a single-instance setup |
| `baseUrl` | yes | | `http://` or `https://`; trailing `/` stripped; a sub-path is allowed; a query, fragment, embedded `user:pass@` or a port outside 1 to 65535 is refused |
| `clientId` | yes | | |
| `clientSecret` | yes | | Redacted in `toString()` |
| `redirectUri` | yes | | Sent in the token request body |
| `grantType` | | `'client_credentials'` | |
| `tokenCachePath` | | `null` | `null` with `inMemoryToken: false` is the platform's per-user cache file; a blank string is refused |
| `inMemoryToken` | | `false` | Keep the token in memory for the life of the process |

The credential is `clientId`, `clientSecret`, `redirectUri` and `grantType`, and
nothing else: those four are what the Exsited token request carries.

## Configuration

`AuthConfig` is **who you are**; `SdkConfig` is **how the SDK behaves**, passed as named
arguments. Both are immutable, validated at construction with every problem reported
in one exception, and redact their secrets in `toString()`. Every setting has a
default, and each default is also a `SdkConfig.default*` constant:

```dart
final config = SdkConfig(auth, printApiInfo: true, maxRetries: 3, logLevel: 'DEBUG');
final quieter = config.withOverrides(printApiInfo: false);
```

| Setting | Default | Notes |
|---|---|---|
| `apiVersion` | `ApiVersion.v4` | Fills `{api_version}`. An enum that also carries the token path, `/api/v4/oauth2/token` |
| `timeoutSeconds` | `30.0` | A hard ceiling on **one attempt**; a retry starts a fresh one. See [Timeouts](#timeouts) |
| `connectTimeoutSeconds` | `10.0` | Connection setup alone, inside `timeoutSeconds` (native only) |
| `maxRetries` | `1` | Total attempts **including the first**, so `1` disables retry |
| `retryableHttpCodes` | `{429, 500, 502, 503, 504}` | Inert while `maxRetries` is `1` |
| `unsafeRetryableHttpCodes` | `{}` | The second gate every method outside `GET`/`HEAD`/`OPTIONS`/`TRACE` must also pass; empty, so no status alone replays a write |
| `retryBackoffSeconds` | `0.5` | Base for exponential backoff with full jitter |
| `retryBackoffMaxSeconds` | `20.0` | Ceiling for one sleep |
| `verifySsl` | `true` | Native only; the browser decides on web |
| `caBundle` | `null` | PEM path (native). **Replaces** the trust store. Contradicts `verifySsl: false`; a blank value reads as unset |
| `proxyUrl` | `null` | Applied to `http` and `https` (native), stored normalised so a password redacts; an `https://` proxy is refused |
| `poolMaxsize` | `10` | Connections the client aims to keep for reuse (native); a hint, not a ceiling on concurrency |
| `maxResponseBytes` | `64 << 20` | Ceiling on how much of one response body is buffered. Over it the call fails with an `SdkError` naming the cap, and is not retried |
| `maxRequestBytes` | `64 << 20` | Ceiling on the final wire body of one request, framing included |
| `maxRequestSourceBytes` | `64 << 20` | Ceiling on the source material one request is built from |
| `maxMultipartOverheadBytes` | `1 << 20` | Ceiling on a multipart body's metadata and framing alone |
| `maxTokenCacheBytes` | `1 << 20` | Ceiling on the token cache file |
| `maxCaBundleBytes` | `4 << 20` | Ceiling on the CA bundle file |
| `defaultHeaders` | `{}` | Sent on every request, stored as an unmodifiable copy |
| `raiseOnError` | `false` | `true` throws `SdkError` instead of answering the failed response |
| `userAgent` | `exsited-dart-sdk/<version>` | |
| `logLevel` | `'WARNING'` | `DEBUG`/`INFO`/`WARNING`/`ERROR`/`CRITICAL`, or `null` for none |
| `logBodies` | `false` | Payload and response in a DEBUG record, redacted |
| `logFile` | `null` | Also append log records to this path (native); shared between clients naming the same file, released on `close()`; blank reads as unset |
| `printApiInfo` | `false` | Client, api version, method, endpoint, params, status, attempt, elapsed, request id |
| `printRequestPayload` | `false` | Redacted |
| `printResponseBody` | `false` | Bytes summarised, never dumped |
| `printHeaders` | `false` | Redacted |
| `printCurl` | `false` | Copy-pasteable, token redacted |
| `printOnlyOnError` | `false` | Suppress the block when the call succeeded |
| `printFormat` | `'pretty'` | Or `'compact'`, one line per call |
| `printColor` | `false` | ANSI colour, forced off when stdout is not a terminal |
| `printMaxChars` | `0` | `0` is unlimited |
| `responseFormat` | `'map'` | Which form `response.data` takes: `'map'`, `'json'` or `'dto'`. Falls back to `EXSITED_RESPONSE_FORMAT`; an unrecognised value is refused naming all three |
| `httpClient` | `null` | An `http.Client` of your own; never closed by the SDK |

`SdkConfig.fromCredentials(list, instance: ..., <any setting>: ...)` builds one from a
list of credential blocks, each an `SdkConfig`, an `AuthConfig` or a mapping of
snake_case field names, chosen by index or `clientName`.

Two hooks live on the `ExsitedClient` constructor rather than the config, so the
config stays a printable value object: `onLog` (every log record, one
`'LEVEL message'` line, gated by `logLevel`) and `onWarning` (each
`InsecureTransportWarning`). Both are under [Diagnostics](#diagnostics).

## Bodies, both ways

**Three ways to send one**, and the same endpoint function takes all three:

```dart
// a map
await cancelAccount(client, id, {'account': {'effective_date': '2026-08-31'}});

// a JSON string, sent byte for byte, so a pasted body keeps its spacing and key
// order
await cancelAccount(client, id, '{"account": {"effective_date": "2026-08-31"}}');

// a DTO
await cancelAccount(client, id, const AccountCancelBody(effectiveDate: '2026-08-31'));
```

A payload is a non-null `Object`, so a missing one does not compile; `{}` is a legal
body. An invalid JSON string, a nested map in the query string and a blank path
parameter are all refused locally, before a socket opens.

**Three ways to read one**, and all three are always populated:

```dart
response.map    // the decoded body: Map, List, String, List<int>, or null on 204
response.json   // the text that arrived, spacing and key order intact
response.dto    // the typed view, or null when the endpoint names no type
response.data   // whichever of the three responseFormat selects
```

`map` is the only one that can tell a key the API **omitted** from one it sent as
**null**, which is why it is never traded away for the typed view.

`responseFormat` resolves through four tiers, highest first: the call, the client's
config, the `EXSITED_RESPONSE_FORMAT` environment variable, then `'map'`. The
environment sits *below* code on purpose: a project-wide variable that could override
a format written in source would silently change behaviour the source spells out. A
blank variable reads as unset. On the web there is no environment to read, so that
tier is empty.

```dart
await getAccount(client, 'W13ZGY', responseFormat: 'json');
await client.accounts.getAccount('W13ZGY', responseFormat: SdkConfig.responseFormatDto);
```

**A DTO converts nothing.** A field declared `String?` reads null when a number
arrives; only an int widening to a double is allowed. Each view has the same
shape: a `static X? fromMap(Object? body)` that answers null for a body
that is not a map, an `envelopeKey` where the API wraps the record, and one `fields`
map from which the base builds `toMap()` and a redacting `toString()`. A nested view
is written without its own envelope, as the API sends it. Every field type was
measured against live answers from every endpoint: a nested object is a view of its
own, a field that was always null is left untyped, and so is one whose records
disagreed on its type.

## Multiple instances

Declare each instance as its own `AuthConfig` (or `SdkConfig`) and select between them
by name or index. Built the ordinary way, each is isolated, with its own HTTP client,
token provider and token store. An instance you never ask for is never built, so it
never authenticates.

```dart
final instances = <Object>[staging, SdkConfig(production, raiseOnError: true)];

// Hold several open at once; the first is the default.
final registry = ClientRegistry(instances);
registry.getClient();              // the first, staging
registry.getClient(1);             // by index (negatives count from the end)
registry.getClient('production');  // by clientName
registry.listClientNames();        // ['staging', 'production']
await registry.closeAllClients();  // closes every client it built

// Or register once and build anywhere, per isolate.
registerInstances(instances);
buildClient();                               // the default
buildClient(instance: 'production');         // by clientName
buildClient(instance: 'staging', printCurl: true);
listInstanceNames();                         // ['staging', 'production']
```

Two entries cannot share a `clientName`; that is refused when the registry is built,
with the colliding positions reported. A client handed in through `addClient` is left
open by `closeAllClients()`. The earlier Exsited names (`ClientRegistry.fromAuth`,
`client`, `indexOf`, `clientNames`, `length`, `close`) still work.

## Authentication

Automatic, and Exsited's own. OAuth2 `client_credentials` against
`POST /api/v4/oauth2/token` on first use, cached, and reused while valid. A token is
renewed 60 seconds before it expires (`expirySkew`), a server-stated lifetime is
believed for at most 24 hours (`maxTokenTtl`), and a renewal tries the
`refresh_token` grant first, falling back to a full `client_credentials` request.

A `401` that means a stale token is handled compare-and-clear: the dead token is
invalidated only if the store still holds that same token, then the client refreshes
and replays the call **once**. If another worker refreshed first, its token is used
rather than minting a third. A `401` whose body names no token failure
(`unauthorized`, `invalid_access_token`, `invalid_token`, `expired_token`,
`invalid_request`, matched as whole words) is returned as-is, because replaying a
rejected write submits it twice; a non-JSON `401` is replayed only on a safe method.

**Token cache.** On native platforms the default is a file keyed by a SHA-256
fingerprint of the credentials, safe to share across processes:

| Platform | Path |
|---|---|
| Windows | `%LOCALAPPDATA%\exsited\exsited_dart_token.json` |
| macOS | `~/Library/Caches/exsited/exsited_dart_token.json` |
| Linux | `$XDG_CACHE_HOME/exsited/exsited_dart_token.json`, else `~/.cache/exsited/exsited_dart_token.json` |

When the variable a row names is unset, the system temp directory takes its place.
On **web** there is no file system, so the token is kept in memory, and a
`tokenCachePath` spelled out explicitly is refused rather than ignored.

```dart
AuthConfig(..., tokenCachePath: '/path/of/your/choosing/token.json'); // an explicit file
AuthConfig(..., inMemoryToken: true);                                 // memory only

// force a fresh authentication: delete the file, or inject a memory store
ExsitedClient(SdkConfig(auth), tokenStore: MemoryTokenStore());
```

Several processes sharing one cache file are serialised by a lock on a sidecar
`.lock` file, one per cache file, because a write rebuilds the whole file. A lock that
cannot be taken **fails the call** with `SdkTokenLockError` rather than running the
work with no exclusion. A cache file that is present but unusable is not treated as
empty: that is `SdkTokenCacheError`, since answering "empty" and rewriting it would
discard every other namespace's entry, refresh tokens included. The read is bounded
at 1 MiB.

## Requests

**Two ways to call, and they are the same call.** Every endpoint is a top-level
function taking the client first, and every one is also a method on the family bound
to that client. The bound method is a delegate to the function:

```dart
await getAccount(client, 'W13ZGY');           // the function
await client.accounts.getAccount('W13ZGY');   // the same call, bound
```

`client.<family>` works for all 91 families and needs only
`package:exsited/exsited.dart`; each getter builds its family once and caches
it. To choose a family by a name that is not a literal in your source, look it up:

```dart
client.listResourceNames();                    // ['abaFiles', 'accountEmails', ...]
final accounts = client.resourceByName('accounts') as AccountsResource;
```

An unknown name raises `SdkAttributeError` naming what is available.
`registerResourceModule` adds a family of your own.

**The resource libraries.** The main library carries the core plus the `accounts` and
`items` families. Each other family is its own library, imported **with a prefix**,
because families declare some of the same names (`Reference`, `User`, `CustomForm`,
`Note`, `Pagination`) and `export` can neither rename nor prefix:

```dart
import 'package:exsited/payments.dart' as payments;

await payments.getPayments(client);
```

The bound style needs none of that; the prefixed import is only needed to name a view
or a path constant.

**Per call** an endpoint function takes `raiseOnError` and `responseFormat`, and
nothing else. Everything else a request is built from belongs to the client, reached
through `client.sendGetRequest`, `sendPostRequest`, `sendPutRequest`,
`sendPatchRequest`, `sendDeleteRequest` and `sendApiRequest`, which take flat named
parameters: `pathParams`, `queryParams`, `jsonBody`,
`formData`, `files`, `headers`, `authenticated`, `raiseOnError`, `responseFormat` and
`dtoDecoder`. The earlier `options: CallOptions(...)` still compiles, and a flat
argument wins over it.

**A body is a map, a JSON string or a DTO**, whichever you have (see
[Bodies, both ways](#bodies-both-ways)). `files` sends multipart: each entry is bytes,
or a list of the bytes, a filename and a content type.

**`X-Idempotency-Key` on every POST.** v4 answers a POST without one 400 `x.idempotency.key.header.required`, so the SDK generates a fresh version 4 uuid
per call, JSON, form and multipart alike, and a retry or the 401 replay sends the same
key again. A caller's own key, in any spelling, wins; PUT, PATCH and DELETE carry none.

**Query helpers.** v4 filters and sorts are spelled by helpers, so the wire names are
never typed by hand:

```dart
await getAccounts(client, queryParams: {
  filterParam('status'): 'ACTIVE',
  filterParam('created_at', 'gte'): '2026-01-01',
  'sort': sortParam('created_at', SortDirection.desc),   // sort=-created_at
});
```

`filterParam` refuses an operator the API does not accept, and `filterValues` renders
the value list for the `in` and `nin` operators.

## Pagination

```dart
await for (final account in iterRecords(client, AccountsUrls.accounts,
    queryParams: {filterParam('status'): 'ACTIVE'})) {
  print((account! as Map)['id']);
}
```

`iterPages` yields each page's response and `iterRecords` each record. `queryParams`
is re-sent with every page: a cursor is a position *within one filtered listing*, so
the filters travel with it.

The account and item families page by **cursor** (`pagination.next_cursor`); most
other v4 listings page by **offset**. Both walkers detect which one each page uses, so
nothing is configured. Some listings key their records by resource name rather than
`data`, so pass `recordKey:` when they do; each family's `<Family>Urls.dataKey` names
the key its listing views read. At the end of an offset listing `next_page` is the
literal string `"NULL"`, which the walkers read as the end.

## Responses

`ApiResponse` carries the request's outcome and never throws on its own:

| Member | What it is |
|---|---|
| `statusCode`, `headers` | as received |
| `map`, `json`, `dto`, `data` | the body in each form (see [Bodies, both ways](#bodies-both-ways)) |
| `succeeded` | a 2xx whose body does not name itself `"object": "error"` |
| `errorType` | an `ErrorType`: `none`, `redirect`, `validation`, `authentication`, `authorization`, `notFound`, `methodNotAllowed`, `conflict`, `rateLimit`, `server`, `network`, `timeout`, `unknown` |
| `getErrorMessages()` | the problems an error body reports, most specific first: `errors[]`, then `message`, then `code` |
| `errorCode`, `requestId`, `docUrl`, `fieldErrors` | the v4 error envelope, Exsited's own |
| `requestInfo` | a `RequestInfo`: client name, method, url, `endpointTemplate`, query params, attempt count and elapsed seconds |
| `raiseForStatus()` | the response, or an `SdkError` if it did not succeed |

```dart
if (!response.succeeded) {
  print(response.statusCode);          // 400
  print(response.errorCode);           // "validation_error"
  print(response.requestId);           // "req_..."
  print(response.fieldErrors);         // [FieldError(field: "effective_date", ...)]
  print(response.getErrorMessages());  // ["effective_date: ..."]
}
```

**A 2xx can deny its own success.** Every v4 body names what it is under `object`,
and an error names itself `error`, so a `200` carrying that is not a success.

## Errors

`raiseOnError: true`, on the config or per call, throws instead:

```
SdkError
  SdkConfigError       the configuration is wrong; costs no request
  SdkUsageError        the SDK refused before sending; costs no request
    SdkAttributeError  an unknown resource or attribute name
  SdkAuthError         the token grant failed
  SdkTokenCacheError   a token cache that is there and unusable (Exsited)
  SdkTokenLockError    a token cache that could not be locked (Exsited)
```

A raised error's message is `HTTP <status>` alone: the server's words are on
`getErrorMessages()`, and `explain(includeSensitive: true)` renders the whole
exchange, while `explain()` renders only its shape. `statusCode`, `errorType`,
`requestInfo`, `rawResponse`, `cause` and `getHint()` are on every one, and a raised
response error also carries the v4 envelope (`errorCode`, `requestId`, `docUrl`,
`fieldErrors`). A network or timeout failure withholds the platform's own text and
keeps it on `cause`. The earlier `...Exception` names (`SdkException` and the rest)
are type aliases of these.

## Diagnostics

The `print*` flags render each exchange to the console, secrets redacted:

```dart
SdkConfig(auth,
  printApiInfo: true,          // client, method, endpoint, params, status, timing
  printRequestPayload: true,   // the body sent
  printResponseBody: true,     // the body received (bytes summarised, never dumped)
  printHeaders: true,          // request and response headers
  printCurl: true,             // a copy-pasteable POSIX-shell curl, token redacted
  printOnlyOnError: true,      // only when a call fails
  printFormat: 'pretty');      // or 'compact' for one line per call
```

No box and no `|` gutter, so a JSON body lifts out of a terminal as it is and the
`curl` block pastes and runs:

```
Exsited  GET  200  0.231s
client      : default
api version : v4
method      : GET
endpoint    : https://your-instance.exsited.com/api/v4/accounts
params      : {"limit":1}
status      : 200
attempt     : 1 / 1
elapsed     : 0.231s
-- response --------------------------------------------------
{ ... }
```

`compact` collapses the whole exchange onto one `exsited | ...` line.
`printOnlyOnError` is what makes these usable across a full run: leave everything on,
see nothing until something breaks.

Glyphs are probed, not assumed: `resolveBoxGlyphs()` tests whether the console's
encoding can carry each Unicode glyph and falls back to ASCII for the whole set when
it cannot. What the terminal **obeys** is a separate guard: control characters in any
value that came from outside the SDK (the method, the url, the query, a body, an error
message, a request id) are escaped before the block is assembled, so a response body
cannot move the cursor or erase the rows already printed.

The client takes an optional `onLog` hook, structured single-line records each opening
with its level, filtered by `logLevel`, and an `onWarning` hook that receives each
`InsecureTransportWarning` (an `http://` base URL to a host that is not loopback, once
per origin) instead of stderr:

```dart
final client = ExsitedClient(config,
    onLog: (line) => myLogger.info(line), onWarning: (w) => report(w.message));
```

For a file, name a `logFile`: records are appended, filtered by the same `logLevel`,
shared between clients naming the same path, and the handle is released when the last
of them calls `close()` (native only; on web a `logFile` is refused at construction).

Console and log lines share one redactor: a key whose name carries one of the
eighteen markers (`secret`, `password`, `token`, `bearer`, `jwt`, `authorization`,
`apikey`, `cookie`, `session`, `signature`, `privatekey` and the rest in
`sensitiveKeyMarkers`) prints as `***`, matched as substrings ignoring case and
separators, and URLs and query strings inside free text have their secret parameters
and userinfo stripped.

## Timeouts

`timeoutSeconds` is a **hard ceiling on one attempt**, not an idle read timeout and
not a ceiling on the call:

| Budget | Setting | Bounds |
|---|---|---|
| connect | `connectTimeoutSeconds` | DNS, TCP connect and TLS handshake (native; inert on web) |
| read | `timeoutSeconds` | the response headers, then the body, both drawing on the same budget |
| overall | `timeoutSeconds` | one attempt, start to finish |

A request that runs out of budget is aborted, not abandoned, so it does not keep
running behind the error. **A retry starts a fresh ceiling**, so `maxRetries: 3` is
bounded by three ceilings plus the backoff between them.

## Retries

Off by default: `maxRetries` counts the first attempt.

```dart
SdkConfig(auth, maxRetries: 3);
```

Exponential backoff with full jitter, capped by `retryBackoffMaxSeconds`. A
`Retry-After` beats the jitter but is clamped by the same ceiling; delay-seconds and
all three HTTP-date forms are read, and a date already past reads as zero. `400` and
`401` are not in the retryable set: repeating a malformed request cannot succeed, and
a `401` is refresh-and-replayed one layer up.

**A status that came back:**

| Method | Retried on |
|---|---|
| `GET` `HEAD` `OPTIONS` `TRACE` (safe) | `retryableHttpCodes` |
| anything else, an unknown verb included | `retryableHttpCodes` **and** `unsafeRetryableHttpCodes`, the second empty by default |

The safe row is an allow-list, so a method it does not name is treated as a write.
`unsafeRetryableHttpCodes: {429, 503}` is the explicit opt-in for a deployment you
know.

**A failure with no status:**

| Failure | Retried on |
|---|---|
| zero request bytes transmitted, measured rather than inferred | any method |
| the request may already have been delivered | `GET` `HEAD` `OPTIONS` `TRACE` `PUT` `DELETE` only |

A `POST` that timed out awaiting its response is not retried; a `POST` that never
reached a socket is. On web nothing is classified as never-sent, so a `POST` is never
replayed after a transport failure there. The `X-Idempotency-Key` a retried `POST`
carries is the first attempt's.

## Transport

```dart
SdkConfig(auth,
  caBundle: '/path/to/corporate-ca.pem',  // native
  proxyUrl: 'http://proxy.internal:8080', // native
  poolMaxsize: 10);                        // native
```

One `http.Client` per client, so two with different TLS or proxy settings never
contend; an `httpClient` you pass in is used as it is and never closed. `caBundle`
**replaces** the trust store rather than extending it. Setting both `caBundle` and
`verifySsl: false` is refused at construction.

**Redirects are not followed.** A `3xx` comes back like any other non-2xx, with its
`Location` header intact.

**Absolute URLs stay on the configured origin.** A path given as a full URL to
another origin is refused, so the bearer token never leaves for a host it was not
minted for.

## Endpoints

91 families and 864 endpoints; the largest are `accounts` (65), `items` (41) and
`invoices` (30). Every endpoint, with its request and response bodies, is documented
at [exsited.mintlify.app](https://exsited.mintlify.app/introduction). Each endpoint has one function, in the family that owns
the first segment of its path.

| Library | Families |
|---|---|
| `exsited.dart` | `accounts`, `items` |
| `invoices.dart` | `invoices` |
| `<family>.dart` | `aba_files`, `account_emails`, `account_groups`, `accounting_codes`, `action_scripts`, `additional_codes`, `alert_responsibilities`, `alert_responsibility`, `alerts`, `applications`, `approval_profiles`, `approval_user_groups`, `approvals`, `attribute_attachments`, `billing_periods`, `bookings`, `charging_periods`, `communication_profiles`, `communications`, `countries`, `credit_note_applications`, `credit_notes`, `custom_attributes`, `custom_components`, `custom_events`, `custom_features`, `custom_fields`, `custom_forms`, `day_of_month`, `departments`, `designations`, `document_templates`, `email_templates`, `employees`, `events`, `express`, `external_databases`, `fulfillment_profiles`, `fulfillment_terms`, `gift_certificates`, `integration_connections`, `inventory_adjustments`, `invoice_terms`, `item_fulfillments`, `item_receipts`, `labours`, `milestones`, `note_attachments`, `note_groups`, `orders`, `organisation`, `organisations`, `payments`, `portals`, `pricing_periods`, `proforma_invoices`, `purchase_credit_note_applications`, `purchase_credit_notes`, `purchase_express`, `purchase_invoices`, `purchase_orders`, `purchase_payments`, `purchase_refunds`, `quote_orders`, `receive_terms`, `reconciliations`, `refunds`, `rental_assets`, `reports`, `return_merchandise_authorisations`, `return_vendor_authorizations`, `roles`, `sales_reps`, `salutations`, `settings`, `settings_workflows`, `shipping_packages`, `shipping_rules`, `system_events`, `tasks`, `teams`, `time_periods`, `timesheets`, `uom`, `usages`, `webhooks`, `workflows`, `zones` |

Each family is four files: `<family>.dart` (the endpoint functions),
`<family>_urls.dart` (a `<Family>Urls` class of path templates and body keys),
`<family>_dto.dart` (the views) and `<family>_bound.dart` (the class `client.<family>`
answers). Eight families have no typed views, because none of their endpoints
answered a 2xx that could be measured: `aba_files`, `alert_responsibilities`,
`attribute_attachments`, `communications`, `organisations`, `proforma_invoices`,
`reconciliations` and `webhooks`.

## Architecture

**Two layers.** The core (`lib/src/client`, `config`, `http`, `errors.dart`,
`redaction.dart`) holds the files, public names, options, defaults and behaviour
every family shares. The resource layer (`lib/src/resources`) is plain functions over
the client, four files per family: the functions, the `Urls` class, the views and
the bound class.

**The wiring.** An endpoint function hands `ExsitedClient.send*Request` a path
template and its parts. The client validates the headers, builds the URL through
`UrlBuilder` and the query through `QueryParams`, attaches the token from
`TokenProvider`, adds the `X-Idempotency-Key` on a POST, and passes a
`TransportRequest` to `Transport.sendHttpRequest`, which runs the attempts under
`RetryPolicy` and answers an `ApiResponse`. The console and the log sink observe the
exchange; `Redaction` is applied to everything they print.

**The Exsited-specific parts:**

- **Auth**: `lib/src/auth/`, `AuthConfig`, the token stores, the token path, and
  the compare-and-clear 401 replay. `TokenProvider(config, store, client)` is built by
  the client; `CallOptions`, `buildDto` and the `ApiResponse<T>` type argument are
  what the token layer names.
- **The v4 conventions**: the cursor envelope and shared `Pagination` view, the error
  envelope accessors, the `"object": "error"` denial, `X-Idempotency-Key`, the filter
  and sort helpers, and the `ApiVersion` enum.
- **Names**: `ExsitedClient`, the `EXSITED_` environment prefix, the
  `exsited-dart-sdk/<version>` user agent, and the `exsited` console prefix.
- **The endpoint set**, the per-family prefixed libraries and the
  `<Family>Resource` bound classes.
- **Safeguards**: `media_type.dart`, the once-per-origin insecure
  transport warning and the console's control-character guard.

## Platform notes

- **Conditional imports are the platform seam.** Anything needing `dart:io` (the file
  token cache, the native HTTP client factory, the `logFile` sink, the file probe, the
  terminal check, the environment read) ships as an `_io`/`_web` pair selected by
  `if (dart.library.io)`, so one package compiles for the VM, Flutter and web.
- **Web caveats.** No file system: the token is kept in memory and a configured
  `logFile` or `tokenCachePath` is refused. TLS, proxies and pooling are the
  browser's. `int` is a JS double, so very large ids lose precision on web.
- **Async throughout.** No `Async` name suffix; pagination is a lazy `Stream`.
- **Logging is a hook, not a framework**: `onLog`, `onWarning` and `logFile`.
- **The version the SDK reports** is `Sdk.version` (also `sdkVersion`), and the
  User-Agent sends it as `exsited-dart-sdk/<version>`.

## Behaviour worth knowing

- **Overrides are typed, not maps.** `SdkConfig.withOverrides(...)` is a `copyWith`
  whose result is re-validated. `buildClient` and `SdkConfig.fromCredentials` take
  every override as its own named parameter.
- **A blank path parameter is refused before any I/O**, with the template and the
  slot named, and a null payload does not compile.
- **A header no HTTP layer could send is refused** before any I/O, naming the header
  and never its value; a query parameter given both in the path and in
  `queryParams` is refused rather than sent twice.
- **An account is created with `createAccount`.** `POST /api/v4/accounts` answers
  201 for an `account` body carrying `name` and `type`. Items are created directly
  too, with `createItem`.
- **`id`, not `uuid`.** A response carries both; only `id` addresses the record in a
  path. The uuid answers 404; filter on `filter_uuid` instead.
- **Reads are nested, writes are flat.** `currency` reads back as an object and is
  written as `"AUD"`. Posting a response body back unchanged is a 400.
- **A locked account's delete is a 409 with code `internal_error`**, a business rule
  wearing a server fault's name. Not retryable.
- **`external_databases/{db_name}` answers 200 with the whole collection** for a name that
  cannot exist, so nothing in the response says anything went wrong.

## Troubleshooting

| Symptom | Fix |
|---|---|
| `dart: command not found` | Put the Dart SDK's `bin` on `PATH` |
| `SdkConfigError: instance default: clientId: must not be blank` | A credential arrived blank: the variable is unset, or its name differs |
| `SdkConfigError: ... baseUrl: needs an http:// or https:// scheme` | Scheme missing, or a query, fragment or `user:pass@` is present |
| A listing stops after the first page | You passed the wrong `recordKey`; `<Family>Urls.dataKey` names it |
| `SdkTokenLockError` | The cache directory cannot be locked; set `inMemoryToken: true` or point `tokenCachePath` at a filesystem where locking works |
| A redirect is not followed | By design; read `Location` off `response.headers` and re-issue deliberately |
| Want a fresh token | Delete the token file, or inject `MemoryTokenStore()` |

## Public API

`lib/exsited.dart` is an **allow-list**: every `export` in it carries a `show`, so
the importable surface is exactly what that file names.

| Group | Names |
|---|---|
| Entry points | `ExsitedClient` (`listResourceNames`, `resourceByName`, `close`, `closeClient`, `isClosed`) `ClientRegistry` `buildClient` `registerInstances` `getRegisteredInstances` `listInstanceNames` |
| Configuration | `AuthConfig` `SdkConfig` `Sdk` `ApiVersion` `ResponseFormat` `readClientName` `selectCredentials` `sdkVersion` `defaultUserAgent` `defaultMaxResponseBytes` `responseFormatEnvVar` |
| Requests | `CallOptions` (kept for the token layer), `idempotencyHeader` `idempotencyKeyMethods` `idempotentMethods`; the senders take named parameters |
| Responses | `ApiResponse` `RequestInfo` `ErrorType` `deriveEndpointTemplate` `Dto` `DtoDecoder` |
| Errors | `SdkError` `SdkConfigError` `SdkUsageError` `SdkAttributeError` `SdkAuthError` `SdkTokenCacheError` `SdkTokenLockError` `InsecureTransportWarning` `FieldError` `RequestDetail` `ErrorCategory`, and the `...Exception` aliases |
| Resources | the `accounts` and `items` functions, views, `AccountsUrls`, `ItemsUrls`, `AccountsResource`, `ItemsResource`, `itemFilterParam`; `BoundResource` `ResourceFactory` `registerResourceModule` `registeredResourceNames` `resolveResourceModule` `registerGeneratedResources`; the other 89 families in their own libraries |
| Pagination | `iterPages` `iterRecords` `readNextCursor` `cursorParam` `limitParam` `offsetParam` `defaultRecordKey` `noNextPage` |
| Tokens | `TokenProvider` `TokenRecord` `TokenStore` `MemoryTokenStore` `FileTokenStore` `buildCredentialsNamespace` `defaultTokenCachePath` `defaultTokenCacheFilename` `defaultLockWait` `staleLockDuration` `maxTokenCacheBytes` `expirySkew` `maxTokenTtl` and the token grammar checks |
| HTTP | `Transport` `TransportRequest` `RetryPolicy` `TransportFailureKind` `UrlBuilder` `QueryParams` `SortDirection` `buildUrl` `substitutePathParams` `buildQueryParams` `filterParam` `filterValues` `filterOperators` `listOperators` `presenceOperators` `sortParam` `safeMethods` `defaultRetryableHttpCodes` `defaultUnsafeRetryableHttpCodes` `isJsonContentType` `isJsonMediaType` `jsonMediaType` `mediaTypeOf` |
| Diagnostics | `Console` `renderExchange` `buildCurlCommand` `resolveBoxGlyphs` |
| Redaction | `Redaction` `maxRedactionDepth` `redacted` `tooDeep` `circular` `sensitiveKeyMarkers` `shouldRedact` `redactValue` `redactMapping` `redactText` |

## License

MIT. See [LICENSE](LICENSE).
