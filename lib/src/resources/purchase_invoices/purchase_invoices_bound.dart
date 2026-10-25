/// The v4 purchase invoices endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../purchase_credit_note_applications/purchase_credit_note_applications_dto.dart'
    as views show PurchaseCreditNoteApplicationRead;
import 'purchase_invoices.dart' as endpoints;
import 'purchase_invoices_dto.dart' as views;

/// The purchase invoices endpoints with [client] already applied.
class PurchaseInvoicesResource {
  /// Bind the resource to a client; normally reached via `client.purchaseInvoices`.
  const PurchaseInvoicesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/purchase_invoices`
  Future<ApiResponse<views.PurchaseInvoiceList>> getPurchaseInvoices({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseInvoices(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_invoices`
  Future<ApiResponse<views.PurchaseInvoiceRead>> createPurchaseInvoice(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPurchaseInvoice(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_invoices/notes`
  Future<ApiResponse<views.PurchaseInvoicesNoteList>> getPurchaseInvoicesNotes({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseInvoicesNotes(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/purchase_invoices/{purchase_invoice_id}`
  Future<ApiResponse<Object?>> deletePurchaseInvoice(
    Object purchaseInvoiceId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deletePurchaseInvoice(
        client,
        purchaseInvoiceId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}`
  Future<ApiResponse<views.PurchaseInvoiceRead>> getPurchaseInvoice(
    Object purchaseInvoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseInvoice(
        client,
        purchaseInvoiceId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/amend`
  Future<ApiResponse<views.PurchaseInvoiceRead>> amendPurchaseInvoice(
    Object purchaseInvoiceId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.amendPurchaseInvoice(
        client,
        purchaseInvoiceId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/cancel`
  Future<ApiResponse<views.PurchaseInvoiceCancel>> cancelPurchaseInvoice(
    Object purchaseInvoiceId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.cancelPurchaseInvoice(
        client,
        purchaseInvoiceId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/information`
  Future<ApiResponse<views.PurchaseInvoice>> getPurchaseInvoiceInformation(
    Object purchaseInvoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseInvoiceInformation(
        client,
        purchaseInvoiceId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/purchase_invoices/{purchase_invoice_id}/information`
  Future<ApiResponse<views.PurchaseInvoiceInformation>>
      updatePurchaseInvoiceInformation(
    Object purchaseInvoiceId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updatePurchaseInvoiceInformation(
            client,
            purchaseInvoiceId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/lines`
  Future<ApiResponse<views.PurchaseInvoiceLines>> getPurchaseInvoiceLines(
    Object purchaseInvoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseInvoiceLines(
        client,
        purchaseInvoiceId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes`
  Future<ApiResponse<views.PurchaseInvoiceNoteList>> getPurchaseInvoiceNotes(
    Object purchaseInvoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseInvoiceNotes(
        client,
        purchaseInvoiceId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes`
  Future<ApiResponse<views.PurchaseInvoiceNotes>> createPurchaseInvoiceNote(
    Object purchaseInvoiceId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPurchaseInvoiceNote(
        client,
        purchaseInvoiceId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/pdf`
  Future<ApiResponse<Object?>> getPurchaseInvoicePdf(
    Object purchaseInvoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseInvoicePdf(
        client,
        purchaseInvoiceId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_credit_note_applications`
  Future<ApiResponse<views.AccountPurchaseInvoices>>
      getPurchaseInvoicePurchaseCreditNoteApplications(
    Object purchaseInvoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getPurchaseInvoicePurchaseCreditNoteApplications(
            client,
            purchaseInvoiceId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_payments`
  Future<ApiResponse<views.PurchaseInvoicePurchasePaymentList>>
      getPurchaseInvoicePurchasePayments(
    Object purchaseInvoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getPurchaseInvoicePurchasePayments(
            client,
            purchaseInvoiceId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/reactivate`
  Future<ApiResponse<views.PurchaseInvoiceRead>> reactivatePurchaseInvoice(
    Object purchaseInvoiceId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.reactivatePurchaseInvoice(
        client,
        purchaseInvoiceId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/lines/{purchase_invoice_line_uuid}`
  Future<ApiResponse<views.PurchaseInvoiceLine>> getPurchaseInvoiceLine(
    Object purchaseInvoiceId,
    Object purchaseInvoiceLineUuid, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseInvoiceLine(
        client,
        purchaseInvoiceId,
        purchaseInvoiceLineUuid,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}`
  Future<ApiResponse<views.PurchaseInvoiceNoteView>> updatePurchaseInvoiceNote(
    Object purchaseInvoiceId,
    Object noteId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updatePurchaseInvoiceNote(
        client,
        purchaseInvoiceId,
        noteId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}`
  Future<ApiResponse<views.PurchaseInvoiceNoteView>> getPurchaseInvoiceNote(
    Object purchaseInvoiceId,
    Object noteId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseInvoiceNote(
        client,
        purchaseInvoiceId,
        noteId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}`
  Future<ApiResponse<Object?>> deletePurchaseInvoiceNote(
    Object purchaseInvoiceId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deletePurchaseInvoiceNote(
        client,
        purchaseInvoiceId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}/files`
  Future<ApiResponse<views.PurchaseInvoiceNoteFileList>>
      getPurchaseInvoiceNoteFiles(
    Object purchaseInvoiceId,
    Object noteId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getPurchaseInvoiceNoteFiles(
            client,
            purchaseInvoiceId,
            noteId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}/files/{file_id}`
  Future<ApiResponse<views.PurchaseInvoiceNoteFile>> getPurchaseInvoiceNoteFile(
    Object purchaseInvoiceId,
    Object noteId,
    Object fileId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseInvoiceNoteFile(
        client,
        purchaseInvoiceId,
        noteId,
        fileId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_credit_note_applications/{application_id}`
  Future<ApiResponse<views.PurchaseCreditNoteApplicationRead>>
      getPurchaseInvoicePurchaseCreditNoteApplication(
    Object purchaseInvoiceId,
    Object applicationId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getPurchaseInvoicePurchaseCreditNoteApplication(
            client,
            purchaseInvoiceId,
            applicationId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );
}
