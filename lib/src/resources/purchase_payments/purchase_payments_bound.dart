/// The v4 purchase payments endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../purchase_credit_notes/purchase_credit_notes_dto.dart' as views
    show PurchaseCreditNoteList;
import 'purchase_payments.dart' as endpoints;
import 'purchase_payments_dto.dart' as views;

/// The purchase payments endpoints with [client] already applied.
class PurchasePaymentsResource {
  /// Bind the resource to a client; normally reached via `client.purchasePayments`.
  const PurchasePaymentsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/purchase_payments`
  Future<ApiResponse<views.PurchasePaymentList>> getPurchasePayments({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchasePayments(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_payments`
  Future<ApiResponse<views.PurchasePayments>> createPurchasePayment(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPurchasePayment(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/purchase_payments/{purchase_payment_id}`
  Future<ApiResponse<Object?>> deletePurchasePayment(
    Object purchasePaymentId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deletePurchasePayment(
        client,
        purchasePaymentId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_payments/{purchase_payment_id}`
  Future<ApiResponse<views.PurchasePaymentRead>> getPurchasePayment(
    Object purchasePaymentId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchasePayment(
        client,
        purchasePaymentId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/purchase_payments/{purchase_payment_id}`
  Future<ApiResponse<views.PurchasePaymentUpdated>> updatePurchasePayment(
    Object purchasePaymentId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updatePurchasePayment(
        client,
        purchasePaymentId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_payments`
  Future<ApiResponse<views.PurchasePayments>>
      createPurchaseInvoicePurchasePayment(
    Object purchaseInvoiceId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createPurchaseInvoicePurchasePayment(
            client,
            purchaseInvoiceId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes`
  Future<ApiResponse<views.PurchasePaymentNoteList>> getPurchasePaymentNotes(
    Object purchasePaymentId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchasePaymentNotes(
        client,
        purchasePaymentId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_payments/{purchase_payment_id}/notes`
  Future<ApiResponse<views.PurchasePaymentNotes>> createPurchasePaymentNote(
    Object purchasePaymentId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPurchasePaymentNote(
        client,
        purchasePaymentId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}`
  Future<ApiResponse<views.PurchasePaymentNoteView>> getPurchasePaymentNote(
    Object purchasePaymentId,
    Object ppNoteId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchasePaymentNote(
        client,
        purchasePaymentId,
        ppNoteId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}`
  Future<ApiResponse<Object?>> deletePurchasePaymentNote(
    Object purchasePaymentId,
    Object ppNoteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deletePurchasePaymentNote(
        client,
        purchasePaymentId,
        ppNoteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}/files`
  Future<ApiResponse<views.PurchasePaymentNoteFileList>>
      getPurchasePaymentNoteFiles(
    Object purchasePaymentId,
    Object ppNoteId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getPurchasePaymentNoteFiles(
            client,
            purchasePaymentId,
            ppNoteId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}/files/{file_id}`
  Future<ApiResponse<views.PurchasePaymentNoteFile>> getPurchasePaymentNoteFile(
    Object purchasePaymentId,
    Object ppNoteId,
    Object fileId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchasePaymentNoteFile(
        client,
        purchasePaymentId,
        ppNoteId,
        fileId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_payments/{purchase_payment_id}/purchase_credit_notes`
  Future<ApiResponse<views.PurchaseCreditNoteList>>
      getPurchasePaymentPurchaseCreditNotes(
    Object purchasePaymentId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getPurchasePaymentPurchaseCreditNotes(
            client,
            purchasePaymentId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}`
  Future<ApiResponse<views.PurchasePaymentNoteUpdated>>
      updatePurchasePaymentNote(
    Object purchasePaymentId,
    Object ppNoteId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updatePurchasePaymentNote(
            client,
            purchasePaymentId,
            ppNoteId,
            note,
            files: files,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}/files/{file_id}`
  Future<ApiResponse<Object?>> deletePurchasePaymentNoteFile(
    Object purchasePaymentId,
    Object ppNoteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deletePurchasePaymentNoteFile(
        client,
        purchasePaymentId,
        ppNoteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
