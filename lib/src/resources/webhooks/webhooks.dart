/// The v4 webhooks endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'webhooks_urls.dart';

/// `GET /api/{api_version}/webhooks/{webhook_id}`
///
/// One webhook delivery, the `whk_` id a delivery carries; no route lists them,
/// so `.dto` is null and the body is read through `.map`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getWebhook(
  ExsitedClient client,
  Object webhookId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(WebhooksUrls.webhook,
        pathParams: {'webhook_id': webhookId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
