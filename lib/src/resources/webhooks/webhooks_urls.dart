/// Webhooks path templates and body keys; the client fills `{api_version}`.
library;

class WebhooksUrls {
  WebhooksUrls._();

  static const String webhook = '/api/{api_version}/webhooks/{webhook_id}';

  /// The envelopes one record arrives under, read off this family's views.
  static const String webhookKey = 'webhook';
}
