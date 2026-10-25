/// The v4 credit note applications endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'credit_note_applications.dart' as endpoints;
import 'credit_note_applications_dto.dart' as views;

/// The credit note applications endpoints with [client] already applied.
class CreditNoteApplicationsResource {
  /// Bind the resource to a client; normally reached via `client.creditNoteApplications`.
  const CreditNoteApplicationsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/credit_note_applications`
  Future<ApiResponse<views.CreditNoteApplicationList>>
      getCreditNoteApplications({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getCreditNoteApplications(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/credit_note_applications/{credit_note_application_id}`
  Future<ApiResponse<views.CreditNoteApplicationRead>> getCreditNoteApplication(
    Object creditNoteApplicationId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getCreditNoteApplication(
        client,
        creditNoteApplicationId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/credit_note_applications`
  Future<ApiResponse<views.InvoiceCreditNoteApplications>>
      getInvoiceCreditNoteApplications(
    Object invoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getInvoiceCreditNoteApplications(
            client,
            invoiceId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );
}
