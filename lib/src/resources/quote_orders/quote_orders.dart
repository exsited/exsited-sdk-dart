/// The v4 quote orders endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'quote_orders_dto.dart';
import 'quote_orders_urls.dart';

/// `GET /api/{api_version}/quote_orders/{quote_order_id}/invoices`
///
/// List the invoices raised from a quote; an order that is not a quote answers
/// `404`.
Future<ApiResponse<QuoteOrderInvoiceList>> getQuoteOrderInvoices(
  ExsitedClient client,
  Object quoteOrderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(QuoteOrdersUrls.quoteOrderInvoices,
        pathParams: {'quote_order_id': quoteOrderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: QuoteOrderInvoiceList.fromMap);
