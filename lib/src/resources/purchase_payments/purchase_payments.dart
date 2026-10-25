/// The v4 purchase payments endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../../errors.dart';
import '../purchase_credit_notes/purchase_credit_notes_dto.dart'
    show PurchaseCreditNoteList;
import 'purchase_payments_dto.dart';
import 'purchase_payments_urls.dart';

/// `GET /api/{api_version}/purchase_payments`
Future<ApiResponse<PurchasePaymentList>> getPurchasePayments(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchasePaymentsUrls.purchasePayments,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchasePaymentList.fromMap);

/// `POST /api/{api_version}/purchase_payments`
Future<ApiResponse<PurchasePayments>> createPurchasePayment(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PurchasePaymentsUrls.purchasePayments,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchasePayments.fromMap);

/// `DELETE /api/{api_version}/purchase_payments/{purchase_payment_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deletePurchasePayment(
  ExsitedClient client,
  Object purchasePaymentId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(PurchasePaymentsUrls.purchasePayment,
        pathParams: {'purchase_payment_id': purchasePaymentId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/purchase_payments/{purchase_payment_id}`
Future<ApiResponse<PurchasePaymentRead>> getPurchasePayment(
  ExsitedClient client,
  Object purchasePaymentId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchasePaymentsUrls.purchasePayment,
        pathParams: {'purchase_payment_id': purchasePaymentId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchasePaymentRead.fromMap);

/// `PATCH /api/{api_version}/purchase_payments/{purchase_payment_id}`
Future<ApiResponse<PurchasePaymentUpdated>> updatePurchasePayment(
  ExsitedClient client,
  Object purchasePaymentId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(PurchasePaymentsUrls.purchasePayment,
        pathParams: {'purchase_payment_id': purchasePaymentId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchasePaymentUpdated.fromMap);

/// `POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_payments`
Future<ApiResponse<PurchasePayments>> createPurchaseInvoicePurchasePayment(
  ExsitedClient client,
  Object purchaseInvoiceId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PurchasePaymentsUrls.purchaseInvoicePurchasePayments,
        pathParams: {'purchase_invoice_id': purchaseInvoiceId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchasePayments.fromMap);

/// `GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes`
Future<ApiResponse<PurchasePaymentNoteList>> getPurchasePaymentNotes(
  ExsitedClient client,
  Object purchasePaymentId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchasePaymentsUrls.purchasePaymentNotes,
        pathParams: {'purchase_payment_id': purchasePaymentId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchasePaymentNoteList.fromMap);

/// `POST /api/{api_version}/purchase_payments/{purchase_payment_id}/notes`
///
/// Sent as a form, the text as the `note` field, and as multipart with any
/// [files] beside it: the endpoint reads no JSON body.
Future<ApiResponse<PurchasePaymentNotes>> createPurchasePaymentNote(
  ExsitedClient client,
  Object purchasePaymentId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPostRequest(PurchasePaymentsUrls.purchasePaymentNotes,
      pathParams: {'purchase_payment_id': purchasePaymentId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: PurchasePaymentNotes.fromMap);
}

/// `GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}`
Future<ApiResponse<PurchasePaymentNoteView>> getPurchasePaymentNote(
  ExsitedClient client,
  Object purchasePaymentId,
  Object ppNoteId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchasePaymentsUrls.purchasePaymentNote,
        pathParams: {
          'purchase_payment_id': purchasePaymentId,
          'pp_note_id': ppNoteId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchasePaymentNoteView.fromMap);

/// `DELETE /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deletePurchasePaymentNote(
  ExsitedClient client,
  Object purchasePaymentId,
  Object ppNoteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(PurchasePaymentsUrls.purchasePaymentNote,
        pathParams: {
          'purchase_payment_id': purchasePaymentId,
          'pp_note_id': ppNoteId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}/files`
Future<ApiResponse<PurchasePaymentNoteFileList>> getPurchasePaymentNoteFiles(
  ExsitedClient client,
  Object purchasePaymentId,
  Object ppNoteId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchasePaymentsUrls.purchasePaymentNoteFiles,
        pathParams: {
          'purchase_payment_id': purchasePaymentId,
          'pp_note_id': ppNoteId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchasePaymentNoteFileList.fromMap);

/// `GET /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}/files/{file_id}`
Future<ApiResponse<PurchasePaymentNoteFile>> getPurchasePaymentNoteFile(
  ExsitedClient client,
  Object purchasePaymentId,
  Object ppNoteId,
  Object fileId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchasePaymentsUrls.purchasePaymentNoteFile,
        pathParams: {
          'purchase_payment_id': purchasePaymentId,
          'pp_note_id': ppNoteId,
          'file_id': fileId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchasePaymentNoteFile.fromMap);

/// `GET /api/{api_version}/purchase_payments/{purchase_payment_id}/purchase_credit_notes`
///
/// The purchase credit notes a payment raised; a paged listing.
Future<ApiResponse<PurchaseCreditNoteList>>
    getPurchasePaymentPurchaseCreditNotes(
  ExsitedClient client,
  Object purchasePaymentId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            PurchasePaymentsUrls.purchasePaymentPurchaseCreditNotes,
            pathParams: {'purchase_payment_id': purchasePaymentId},
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: PurchaseCreditNoteList.fromMap);

/// `PATCH /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}`
///
/// Update a note; a form, the text as the `note` field, answered under `note`.
Future<ApiResponse<PurchasePaymentNoteUpdated>> updatePurchasePaymentNote(
  ExsitedClient client,
  Object purchasePaymentId,
  Object ppNoteId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPatchRequest(PurchasePaymentsUrls.purchasePaymentNote,
      pathParams: {
        'purchase_payment_id': purchasePaymentId,
        'pp_note_id': ppNoteId
      },
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: PurchasePaymentNoteUpdated.fromMap);
}

/// `DELETE /api/{api_version}/purchase_payments/{purchase_payment_id}/notes/{pp_note_id}/files/{file_id}`
///
/// Delete one attachment, by the attachment's `uuid`; `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deletePurchasePaymentNoteFile(
  ExsitedClient client,
  Object purchasePaymentId,
  Object ppNoteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(PurchasePaymentsUrls.purchasePaymentNoteFile,
        pathParams: {
          'purchase_payment_id': purchasePaymentId,
          'pp_note_id': ppNoteId,
          'file_id': fileId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
