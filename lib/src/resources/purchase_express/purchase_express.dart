/// The v4 purchase express endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'purchase_express_dto.dart';
import 'purchase_express_urls.dart';

/// `POST /api/{api_version}/purchase_express`
///
/// Create a purchase order, and its purchase invoice and payment if the body
/// nests them, in one call, body `account.purchase_order`; `201`.
Future<ApiResponse<PurchaseExpress>> createPurchaseExpress(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PurchaseExpressUrls.purchaseExpress,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseExpress.fromMap);
