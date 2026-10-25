/// The v4 proforma invoices endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'proforma_invoices.dart' as endpoints;

/// The proforma invoices endpoints with [client] already applied.
class ProformaInvoicesResource {
  /// Bind the resource to a client; normally reached via `client.proformaInvoices`.
  const ProformaInvoicesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/proforma_invoices`
  Future<ApiResponse<Object?>> getProformaInvoices({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getProformaInvoices(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/proforma_invoices/{proforma_id}`
  Future<ApiResponse<Object?>> getProformaInvoice(
    Object proformaId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getProformaInvoice(
        client,
        proformaId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/proforma_invoices/{proforma_id}`
  Future<ApiResponse<Object?>> deleteProformaInvoice(
    Object proformaId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteProformaInvoice(
        client,
        proformaId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/proforma_invoices/{proforma_id}/payments`
  Future<ApiResponse<Object?>> createProformaInvoicePayment(
    Object proformaId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createProformaInvoicePayment(
        client,
        proformaId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
