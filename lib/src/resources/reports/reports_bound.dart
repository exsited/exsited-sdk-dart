/// The v4 reports endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'reports.dart' as endpoints;
import 'reports_dto.dart' as views;

/// The reports endpoints with [client] already applied.
class ReportsResource {
  /// Bind the resource to a client; normally reached via `client.reports`.
  const ReportsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/reports/accounts/account_overview`
  Future<ApiResponse<views.ReportsAccountsAccountOverview>>
      getReportsAccountsAccountOverview({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getReportsAccountsAccountOverview(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/reports/invoices/invoice_overview`
  Future<ApiResponse<views.ReportsInvoicesInvoiceOverview>>
      getReportsInvoicesInvoiceOverview({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getReportsInvoicesInvoiceOverview(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/reports/orders/order_overview`
  Future<ApiResponse<views.ReportsOrdersOrderOverview>>
      getReportsOrdersOrderOverview({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getReportsOrdersOrderOverview(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/reports/purchase_invoices/purchase_invoice_overview`
  Future<ApiResponse<views.ReportsPurchaseInvoicesPurchaseInvoiceOverview>>
      getReportsPurchaseInvoicesPurchaseInvoiceOverview({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getReportsPurchaseInvoicesPurchaseInvoiceOverview(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/reports/purchase_orders/purchase_order_overview`
  Future<ApiResponse<views.ReportsPurchaseOrdersPurchaseOrderOverview>>
      getReportsPurchaseOrdersPurchaseOrderOverview({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getReportsPurchaseOrdersPurchaseOrderOverview(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/reports/purchase_transactions/purchase_payment_and_refund_overview`
  Future<
          ApiResponse<
              views
              .ReportsPurchaseTransactionsPurchasePaymentAndRefundOverview>>
      getReportsPurchaseTransactionsPurchasePaymentAndRefundOverview({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints
              .getReportsPurchaseTransactionsPurchasePaymentAndRefundOverview(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/reports/transactions/payment_and_refund_overview`
  Future<ApiResponse<views.ReportsTransactionsPaymentAndRefundOverview>>
      getReportsTransactionsPaymentAndRefundOverview({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getReportsTransactionsPaymentAndRefundOverview(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );
}
