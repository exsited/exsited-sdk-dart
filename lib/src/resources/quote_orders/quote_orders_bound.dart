/// The v4 quote orders endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'quote_orders.dart' as endpoints;
import 'quote_orders_dto.dart' as views;

/// The quote orders endpoints with [client] already applied.
class QuoteOrdersResource {
  /// Bind the resource to a client; normally reached via `client.quoteOrders`.
  const QuoteOrdersResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/quote_orders/{quote_order_id}/invoices`
  Future<ApiResponse<views.QuoteOrderInvoiceList>> getQuoteOrderInvoices(
    Object quoteOrderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getQuoteOrderInvoices(
        client,
        quoteOrderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
