/// The v4 payments endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../../errors.dart';
import '../accounts/accounts_dto.dart' show NoteFileList;
import 'payments_dto.dart';
import 'payments_urls.dart';

/// `GET /api/{api_version}/payments`
Future<ApiResponse<PaymentList>> getPayments(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PaymentsUrls.payments,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PaymentList.fromMap);

/// `GET /api/{api_version}/payments/notes`
Future<ApiResponse<PaymentsNoteList>> getPaymentsNotes(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PaymentsUrls.paymentsNotes,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PaymentsNoteList.fromMap);

/// `DELETE /api/{api_version}/payments/{payment_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deletePayment(
  ExsitedClient client,
  Object paymentId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(PaymentsUrls.payment,
        pathParams: {'payment_id': paymentId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/payments/{payment_id}`
Future<ApiResponse<PaymentRead>> updatePayment(
  ExsitedClient client,
  Object paymentId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(PaymentsUrls.payment,
        pathParams: {'payment_id': paymentId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PaymentRead.fromMap);

/// `GET /api/{api_version}/payments/{payment_id}`
Future<ApiResponse<PaymentRead>> getPayment(
  ExsitedClient client,
  Object paymentId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PaymentsUrls.payment,
        pathParams: {'payment_id': paymentId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PaymentRead.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/payments`
Future<ApiResponse<PaymentList>> getInvoicePayments(
  ExsitedClient client,
  Object invoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PaymentsUrls.invoicePayments,
        pathParams: {'invoice_id': invoiceId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PaymentList.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/payments`
Future<ApiResponse<PaymentList>> getOrderPayments(
  ExsitedClient client,
  Object orderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PaymentsUrls.orderPayments,
        pathParams: {'order_id': orderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PaymentList.fromMap);

/// `GET /api/{api_version}/payments/{payment_id}/notes`
Future<ApiResponse<PaymentNoteList>> getPaymentNotes(
  ExsitedClient client,
  Object paymentId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PaymentsUrls.paymentNotes,
        pathParams: {'payment_id': paymentId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PaymentNoteList.fromMap);

/// `POST /api/{api_version}/payments/{payment_id}/notes`
///
/// Sent as a form, the text as the `note` field, and as multipart with any
/// [files] beside it: the endpoint reads no JSON body.
Future<ApiResponse<PaymentNoteRead>> createPaymentNote(
  ExsitedClient client,
  Object paymentId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPostRequest(PaymentsUrls.paymentNotes,
      pathParams: {'payment_id': paymentId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: PaymentNoteRead.fromMap);
}

/// `GET /api/{api_version}/payments/{payment_id}/notes/{payment_note_id}`
Future<ApiResponse<PaymentNoteRead>> getPaymentNote(
  ExsitedClient client,
  Object paymentId,
  Object paymentNoteId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PaymentsUrls.paymentNote,
        pathParams: {'payment_id': paymentId, 'payment_note_id': paymentNoteId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PaymentNoteRead.fromMap);

/// `DELETE /api/{api_version}/payments/{payment_id}/notes/{payment_note_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deletePaymentNote(
  ExsitedClient client,
  Object paymentId,
  Object paymentNoteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(PaymentsUrls.paymentNote,
        pathParams: {'payment_id': paymentId, 'payment_note_id': paymentNoteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/payments/{payment_id}/notes/{payment_note_id}/files/{payment_file_id}`
Future<ApiResponse<PaymentNoteFile>> getPaymentNoteFile(
  ExsitedClient client,
  Object paymentId,
  Object paymentNoteId,
  Object paymentFileId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PaymentsUrls.paymentNoteFile,
        pathParams: {
          'payment_id': paymentId,
          'payment_note_id': paymentNoteId,
          'payment_file_id': paymentFileId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PaymentNoteFile.fromMap);

/// `POST /api/{api_version}/payments`
///
/// Record a payment, wrapped in `payment`; `201`, answered as `getPayment`
/// reads it. A `payment_applied` processor with a card token charges the card.
Future<ApiResponse<PaymentRead>> createPayment(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PaymentsUrls.payments,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PaymentRead.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/payments/{payment_id}`
///
/// Retrieve one payment through an invoice; the payment is not checked against
/// the invoice, only the invoice's existence is.
Future<ApiResponse<PaymentRead>> getInvoicePayment(
  ExsitedClient client,
  Object invoiceId,
  Object paymentId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PaymentsUrls.invoicePayment,
        pathParams: {'invoice_id': invoiceId, 'payment_id': paymentId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PaymentRead.fromMap);

/// `GET /api/{api_version}/payments/{payment_id}/notes/{payment_note_id}/files`
///
/// List a note's attachments, under `data`.
Future<ApiResponse<NoteFileList>> getPaymentNoteFiles(
  ExsitedClient client,
  Object paymentId,
  Object paymentNoteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PaymentsUrls.paymentNoteFiles,
        pathParams: {'payment_id': paymentId, 'payment_note_id': paymentNoteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: NoteFileList.fromMap);
