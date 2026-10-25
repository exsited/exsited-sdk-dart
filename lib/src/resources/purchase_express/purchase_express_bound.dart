/// The v4 purchase express endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'purchase_express.dart' as endpoints;
import 'purchase_express_dto.dart' as views;

/// The purchase express endpoints with [client] already applied.
class PurchaseExpressResource {
  /// Bind the resource to a client; normally reached via `client.purchaseExpress`.
  const PurchaseExpressResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `POST /api/{api_version}/purchase_express`
  Future<ApiResponse<views.PurchaseExpress>> createPurchaseExpress(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPurchaseExpress(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
