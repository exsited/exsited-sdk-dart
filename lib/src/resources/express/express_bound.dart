/// The v4 express endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'express.dart' as endpoints;
import 'express_dto.dart' as views;

/// The express endpoints with [client] already applied.
class ExpressResource {
  /// Bind the resource to a client; normally reached via `client.express`.
  const ExpressResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `POST /api/{api_version}/express`
  Future<ApiResponse<views.Express>> createExpress(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createExpress(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
