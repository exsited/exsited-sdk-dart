/// The v4 invoice terms endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'invoice_terms.dart' as endpoints;
import 'invoice_terms_dto.dart' as views;

/// The invoice terms endpoints with [client] already applied.
class InvoiceTermsResource {
  /// Bind the resource to a client; normally reached via `client.invoiceTerms`.
  const InvoiceTermsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/invoice_terms`
  Future<ApiResponse<views.SettingsInvoiceTermList>> getSettingsInvoiceTerms({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsInvoiceTerms(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/invoice_terms`
  Future<ApiResponse<views.SettingsInvoiceTermWrite>> createSettingsInvoiceTerm(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsInvoiceTerm(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/invoice_terms/{invoice_term_id}`
  Future<ApiResponse<views.SettingsInvoiceTerm>> getSettingsInvoiceTerm(
    Object invoiceTermId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsInvoiceTerm(
        client,
        invoiceTermId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/invoice_terms/{invoice_term_id}`
  Future<ApiResponse<Object?>> deleteSettingsInvoiceTerm(
    Object invoiceTermId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsInvoiceTerm(
        client,
        invoiceTermId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/invoice_terms/{invoice_term_id}`
  Future<ApiResponse<views.SettingsInvoiceTermWrite>> updateSettingsInvoiceTerm(
    Object invoiceTermId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsInvoiceTerm(
        client,
        invoiceTermId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
