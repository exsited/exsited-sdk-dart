/// The v4 invoices endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../credit_note_applications/credit_note_applications_dto.dart' as views
    show CreditNoteApplicationRead;
import 'invoices.dart' as endpoints;
import 'invoices_dto.dart' as views;

/// The invoices endpoints with [client] already applied.
class InvoicesResource {
  /// Bind the resource to a client; normally reached via `client.invoices`.
  const InvoicesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/invoices`
  Future<ApiResponse<views.InvoiceList>> getInvoices({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoices(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/invoices`
  Future<ApiResponse<views.Invoice>> createInvoice(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createInvoice(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/invoices/{invoice_id}`
  Future<ApiResponse<views.Invoice>> deleteInvoice(
    Object invoiceId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteInvoice(
        client,
        invoiceId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}`
  Future<ApiResponse<views.Invoice>> getInvoice(
    Object invoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoice(
        client,
        invoiceId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/invoices/{invoice_id}/amend`
  Future<ApiResponse<views.Invoice>> amendInvoice(
    Object invoiceId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.amendInvoice(
        client,
        invoiceId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/invoices/{invoice_id}/cancel`
  Future<ApiResponse<views.Invoice>> cancelInvoice(
    Object invoiceId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.cancelInvoice(
        client,
        invoiceId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/invoices/{invoice_id}/information`
  Future<ApiResponse<views.Invoice>> updateInvoiceInformation(
    Object invoiceId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateInvoiceInformation(
        client,
        invoiceId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/information`
  Future<ApiResponse<views.Invoice>> getInvoiceInformation(
    Object invoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoiceInformation(
        client,
        invoiceId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/item_fulfillments`
  Future<ApiResponse<views.InvoiceItemFulfillmentList>>
      getInvoiceItemFulfillments(
    Object invoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getInvoiceItemFulfillments(
            client,
            invoiceId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/invoices/{invoice_id}/notes`
  Future<ApiResponse<views.InvoiceNoteList>> getInvoiceNotes(
    Object invoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoiceNotes(
        client,
        invoiceId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/invoices/{invoice_id}/notes`
  Future<ApiResponse<views.InvoiceNote>> createInvoiceNote(
    Object invoiceId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createInvoiceNote(
        client,
        invoiceId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/pdf`
  Future<ApiResponse<views.InvoicePdf>> getInvoicePdf(
    Object invoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoicePdf(
        client,
        invoiceId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/invoices/{invoice_id}/reactivate`
  Future<ApiResponse<views.Invoice>> reactivateInvoice(
    Object invoiceId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.reactivateInvoice(
        client,
        invoiceId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations`
  Future<ApiResponse<views.InvoiceReturnMerchandiseAuthorisationList>>
      getInvoiceReturnMerchandiseAuthorisations(
    Object invoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getInvoiceReturnMerchandiseAuthorisations(
            client,
            invoiceId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/orders/{order_id}/invoices`
  Future<ApiResponse<views.OrderInvoiceList>> getOrderInvoices(
    Object orderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderInvoices(
        client,
        orderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/invoices`
  Future<ApiResponse<views.Invoice>> createOrderInvoice(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createOrderInvoice(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/item_fulfillments/{fulfillment_id}`
  Future<ApiResponse<views.InvoiceItemFulfillment>> getInvoiceItemFulfillment(
    Object invoiceId,
    Object fulfillmentId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoiceItemFulfillment(
        client,
        invoiceId,
        fulfillmentId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/notes/{invoice_note_id}`
  Future<ApiResponse<views.InvoiceNote>> getInvoiceNote(
    Object invoiceId,
    Object invoiceNoteId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoiceNote(
        client,
        invoiceId,
        invoiceNoteId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/invoices/{invoice_id}/notes/{invoice_note_id}`
  Future<ApiResponse<Object?>> deleteInvoiceNote(
    Object invoiceId,
    Object invoiceNoteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteInvoiceNote(
        client,
        invoiceId,
        invoiceNoteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations/{rma_id}`
  Future<ApiResponse<views.InvoiceReturnMerchandiseAuthorisation>>
      getInvoiceReturnMerchandiseAuthorisation(
    Object invoiceId,
    Object rmaId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getInvoiceReturnMerchandiseAuthorisation(
            client,
            invoiceId,
            rmaId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/invoices/{invoice_id}/notes/{invoice_note_id}/files`
  Future<ApiResponse<views.InvoiceNoteFileList>> getInvoiceNoteFiles(
    Object invoiceId,
    Object invoiceNoteId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoiceNoteFiles(
        client,
        invoiceId,
        invoiceNoteId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/notes/{invoice_note_id}/files/{invoice_file_id}`
  Future<ApiResponse<views.InvoiceNoteFile>> getInvoiceNoteFile(
    Object invoiceId,
    Object invoiceNoteId,
    Object invoiceFileId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoiceNoteFile(
        client,
        invoiceId,
        invoiceNoteId,
        invoiceFileId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/kpis`
  Future<ApiResponse<views.InvoiceKpisRead>> getInvoiceKpis(
    Object invoiceId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoiceKpis(
        client,
        invoiceId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/lines`
  Future<ApiResponse<views.InvoiceLines>> getInvoiceLines(
    Object invoiceId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoiceLines(
        client,
        invoiceId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/lines/{line_id}`
  Future<ApiResponse<views.InvoiceLineRead>> getInvoiceLine(
    Object invoiceId,
    Object lineId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoiceLine(
        client,
        invoiceId,
        lineId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/credit_note_applications/{credit_note_application_id}`
  Future<ApiResponse<views.CreditNoteApplicationRead>>
      getInvoiceCreditNoteApplication(
    Object invoiceId,
    Object creditNoteApplicationId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getInvoiceCreditNoteApplication(
            client,
            invoiceId,
            creditNoteApplicationId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/invoices/{invoice_id}/custom_objects`
  Future<ApiResponse<Object?>> getInvoiceCustomObjects(
    Object invoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoiceCustomObjects(
        client,
        invoiceId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/custom_objects/{custom_object_id}`
  Future<ApiResponse<Object?>> getInvoiceCustomObject(
    Object invoiceId,
    Object customObjectId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoiceCustomObject(
        client,
        invoiceId,
        customObjectId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/custom_objects/{custom_object_id}/instances/{instance_id}`
  Future<ApiResponse<Object?>> getInvoiceCustomObjectInstance(
    Object invoiceId,
    Object customObjectId,
    Object instanceId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoiceCustomObjectInstance(
        client,
        invoiceId,
        customObjectId,
        instanceId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/invoices/{invoice_id}/notes/{invoice_note_id}/files/{invoice_file_id}`
  Future<ApiResponse<Object?>> deleteInvoiceNoteFile(
    Object invoiceId,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteInvoiceNoteFile(
        client,
        invoiceId,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
