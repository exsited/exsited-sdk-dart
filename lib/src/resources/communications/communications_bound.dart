/// The v4 communications endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'communications.dart' as endpoints;

/// The communications endpoints with [client] already applied.
class CommunicationsResource {
  /// Bind the resource to a client; normally reached via `client.communications`.
  const CommunicationsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `POST /api/{api_version}/communications/send_email`
  Future<ApiResponse<Object?>> sendEmail(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.sendEmail(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
