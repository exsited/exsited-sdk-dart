/// The v4 payments endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../accounts/accounts_dto.dart' as views show NoteFileList;
import 'payments.dart' as endpoints;
import 'payments_dto.dart' as views;

/// The payments endpoints with [client] already applied.
class PaymentsResource {
  /// Bind the resource to a client; normally reached via `client.payments`.
  const PaymentsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/payments`
  Future<ApiResponse<views.PaymentList>> getPayments({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPayments(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/payments/notes`
  Future<ApiResponse<views.PaymentsNoteList>> getPaymentsNotes({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPaymentsNotes(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/payments/{payment_id}`
  Future<ApiResponse<Object?>> deletePayment(
    Object paymentId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deletePayment(
        client,
        paymentId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/payments/{payment_id}`
  Future<ApiResponse<views.PaymentRead>> updatePayment(
    Object paymentId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updatePayment(
        client,
        paymentId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/payments/{payment_id}`
  Future<ApiResponse<views.PaymentRead>> getPayment(
    Object paymentId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPayment(
        client,
        paymentId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/payments`
  Future<ApiResponse<views.PaymentList>> getInvoicePayments(
    Object invoiceId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoicePayments(
        client,
        invoiceId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/payments`
  Future<ApiResponse<views.PaymentList>> getOrderPayments(
    Object orderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderPayments(
        client,
        orderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/payments/{payment_id}/notes`
  Future<ApiResponse<views.PaymentNoteList>> getPaymentNotes(
    Object paymentId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPaymentNotes(
        client,
        paymentId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/payments/{payment_id}/notes`
  Future<ApiResponse<views.PaymentNoteRead>> createPaymentNote(
    Object paymentId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPaymentNote(
        client,
        paymentId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/payments/{payment_id}/notes/{payment_note_id}`
  Future<ApiResponse<views.PaymentNoteRead>> getPaymentNote(
    Object paymentId,
    Object paymentNoteId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPaymentNote(
        client,
        paymentId,
        paymentNoteId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/payments/{payment_id}/notes/{payment_note_id}`
  Future<ApiResponse<Object?>> deletePaymentNote(
    Object paymentId,
    Object paymentNoteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deletePaymentNote(
        client,
        paymentId,
        paymentNoteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/payments/{payment_id}/notes/{payment_note_id}/files/{payment_file_id}`
  Future<ApiResponse<views.PaymentNoteFile>> getPaymentNoteFile(
    Object paymentId,
    Object paymentNoteId,
    Object paymentFileId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPaymentNoteFile(
        client,
        paymentId,
        paymentNoteId,
        paymentFileId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/payments`
  Future<ApiResponse<views.PaymentRead>> createPayment(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPayment(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/invoices/{invoice_id}/payments/{payment_id}`
  Future<ApiResponse<views.PaymentRead>> getInvoicePayment(
    Object invoiceId,
    Object paymentId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInvoicePayment(
        client,
        invoiceId,
        paymentId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/payments/{payment_id}/notes/{payment_note_id}/files`
  Future<ApiResponse<views.NoteFileList>> getPaymentNoteFiles(
    Object paymentId,
    Object paymentNoteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPaymentNoteFiles(
        client,
        paymentId,
        paymentNoteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
