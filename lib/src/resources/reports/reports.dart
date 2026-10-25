/// The v4 reports endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'reports_dto.dart';
import 'reports_urls.dart';

/// `GET /api/{api_version}/reports/accounts/account_overview`
Future<ApiResponse<ReportsAccountsAccountOverview>>
    getReportsAccountsAccountOverview(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(ReportsUrls.reportsAccountsAccountOverview,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReportsAccountsAccountOverview.fromMap);

/// `GET /api/{api_version}/reports/invoices/invoice_overview`
Future<ApiResponse<ReportsInvoicesInvoiceOverview>>
    getReportsInvoicesInvoiceOverview(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(ReportsUrls.reportsInvoicesInvoiceOverview,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReportsInvoicesInvoiceOverview.fromMap);

/// `GET /api/{api_version}/reports/orders/order_overview`
Future<ApiResponse<ReportsOrdersOrderOverview>> getReportsOrdersOrderOverview(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ReportsUrls.reportsOrdersOrderOverview,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ReportsOrdersOrderOverview.fromMap);

/// `GET /api/{api_version}/reports/purchase_invoices/purchase_invoice_overview`
Future<ApiResponse<ReportsPurchaseInvoicesPurchaseInvoiceOverview>>
    getReportsPurchaseInvoicesPurchaseInvoiceOverview(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            ReportsUrls.reportsPurchaseInvoicesPurchaseInvoiceOverview,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReportsPurchaseInvoicesPurchaseInvoiceOverview.fromMap);

/// `GET /api/{api_version}/reports/purchase_orders/purchase_order_overview`
Future<ApiResponse<ReportsPurchaseOrdersPurchaseOrderOverview>>
    getReportsPurchaseOrdersPurchaseOrderOverview(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            ReportsUrls.reportsPurchaseOrdersPurchaseOrderOverview,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReportsPurchaseOrdersPurchaseOrderOverview.fromMap);

/// `GET /api/{api_version}/reports/purchase_transactions/purchase_payment_and_refund_overview`
Future<ApiResponse<ReportsPurchaseTransactionsPurchasePaymentAndRefundOverview>>
    getReportsPurchaseTransactionsPurchasePaymentAndRefundOverview(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            ReportsUrls
                .reportsPurchaseTransactionsPurchasePaymentAndRefundOverview,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder:
                ReportsPurchaseTransactionsPurchasePaymentAndRefundOverview
                    .fromMap);

/// `GET /api/{api_version}/reports/transactions/payment_and_refund_overview`
Future<ApiResponse<ReportsTransactionsPaymentAndRefundOverview>>
    getReportsTransactionsPaymentAndRefundOverview(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            ReportsUrls.reportsTransactionsPaymentAndRefundOverview,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReportsTransactionsPaymentAndRefundOverview.fromMap);
