/// The v4 webhooks endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'webhooks.dart' as endpoints;

/// The webhooks endpoints with [client] already applied.
class WebhooksResource {
  /// Bind the resource to a client; normally reached via `client.webhooks`.
  const WebhooksResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/webhooks/{webhook_id}`
  Future<ApiResponse<Object?>> getWebhook(
    Object webhookId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getWebhook(
        client,
        webhookId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
