/// The v4 purchase invoices endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../../errors.dart';
import '../purchase_credit_note_applications/purchase_credit_note_applications_dto.dart'
    show PurchaseCreditNoteApplicationRead;
import 'purchase_invoices_dto.dart';
import 'purchase_invoices_urls.dart';

/// `GET /api/{api_version}/purchase_invoices`
Future<ApiResponse<PurchaseInvoiceList>> getPurchaseInvoices(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseInvoicesUrls.purchaseInvoices,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseInvoiceList.fromMap);

/// `POST /api/{api_version}/purchase_invoices`
Future<ApiResponse<PurchaseInvoiceRead>> createPurchaseInvoice(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PurchaseInvoicesUrls.purchaseInvoices,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseInvoiceRead.fromMap);

/// `GET /api/{api_version}/purchase_invoices/notes`
Future<ApiResponse<PurchaseInvoicesNoteList>> getPurchaseInvoicesNotes(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseInvoicesUrls.purchaseInvoicesNotes,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseInvoicesNoteList.fromMap);

/// `DELETE /api/{api_version}/purchase_invoices/{purchase_invoice_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deletePurchaseInvoice(
  ExsitedClient client,
  Object purchaseInvoiceId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(PurchaseInvoicesUrls.purchaseInvoice,
        pathParams: {'purchase_invoice_id': purchaseInvoiceId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}`
Future<ApiResponse<PurchaseInvoiceRead>> getPurchaseInvoice(
  ExsitedClient client,
  Object purchaseInvoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseInvoicesUrls.purchaseInvoice,
        pathParams: {'purchase_invoice_id': purchaseInvoiceId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseInvoiceRead.fromMap);

/// `POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/amend`
Future<ApiResponse<PurchaseInvoiceRead>> amendPurchaseInvoice(
  ExsitedClient client,
  Object purchaseInvoiceId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PurchaseInvoicesUrls.purchaseInvoiceAmend,
        pathParams: {'purchase_invoice_id': purchaseInvoiceId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseInvoiceRead.fromMap);

/// `POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/cancel`
Future<ApiResponse<PurchaseInvoiceCancel>> cancelPurchaseInvoice(
  ExsitedClient client,
  Object purchaseInvoiceId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PurchaseInvoicesUrls.purchaseInvoiceCancel,
        pathParams: {'purchase_invoice_id': purchaseInvoiceId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseInvoiceCancel.fromMap);

/// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/information`
Future<ApiResponse<PurchaseInvoice>> getPurchaseInvoiceInformation(
  ExsitedClient client,
  Object purchaseInvoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseInvoicesUrls.purchaseInvoiceInformation,
        pathParams: {'purchase_invoice_id': purchaseInvoiceId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseInvoice.fromMap);

/// `PATCH /api/{api_version}/purchase_invoices/{purchase_invoice_id}/information`
Future<ApiResponse<PurchaseInvoiceInformation>>
    updatePurchaseInvoiceInformation(
  ExsitedClient client,
  Object purchaseInvoiceId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(PurchaseInvoicesUrls.purchaseInvoiceInformation,
            pathParams: {'purchase_invoice_id': purchaseInvoiceId},
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: PurchaseInvoiceInformation.fromMap);

/// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/lines`
Future<ApiResponse<PurchaseInvoiceLines>> getPurchaseInvoiceLines(
  ExsitedClient client,
  Object purchaseInvoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseInvoicesUrls.purchaseInvoiceLines,
        pathParams: {'purchase_invoice_id': purchaseInvoiceId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseInvoiceLines.fromMap);

/// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes`
Future<ApiResponse<PurchaseInvoiceNoteList>> getPurchaseInvoiceNotes(
  ExsitedClient client,
  Object purchaseInvoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseInvoicesUrls.purchaseInvoiceNotes,
        pathParams: {'purchase_invoice_id': purchaseInvoiceId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseInvoiceNoteList.fromMap);

/// `POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes`
///
/// Sent as a form, the text as the `note` field, and as multipart with any
/// [files] beside it: the endpoint reads no JSON body.
Future<ApiResponse<PurchaseInvoiceNotes>> createPurchaseInvoiceNote(
  ExsitedClient client,
  Object purchaseInvoiceId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPostRequest(PurchaseInvoicesUrls.purchaseInvoiceNotes,
      pathParams: {'purchase_invoice_id': purchaseInvoiceId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: PurchaseInvoiceNotes.fromMap);
}

/// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/pdf`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getPurchaseInvoicePdf(
  ExsitedClient client,
  Object purchaseInvoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseInvoicesUrls.purchaseInvoicePdf,
        pathParams: {'purchase_invoice_id': purchaseInvoiceId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_credit_note_applications`
Future<ApiResponse<AccountPurchaseInvoices>>
    getPurchaseInvoicePurchaseCreditNoteApplications(
  ExsitedClient client,
  Object purchaseInvoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            PurchaseInvoicesUrls.purchaseInvoicePurchaseCreditNoteApplications,
            pathParams: {'purchase_invoice_id': purchaseInvoiceId},
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: AccountPurchaseInvoices.fromMap);

/// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_payments`
Future<ApiResponse<PurchaseInvoicePurchasePaymentList>>
    getPurchaseInvoicePurchasePayments(
  ExsitedClient client,
  Object purchaseInvoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            PurchaseInvoicesUrls.purchaseInvoicePurchasePayments,
            pathParams: {'purchase_invoice_id': purchaseInvoiceId},
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: PurchaseInvoicePurchasePaymentList.fromMap);

/// `POST /api/{api_version}/purchase_invoices/{purchase_invoice_id}/reactivate`
Future<ApiResponse<PurchaseInvoiceRead>> reactivatePurchaseInvoice(
  ExsitedClient client,
  Object purchaseInvoiceId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PurchaseInvoicesUrls.purchaseInvoiceReactivate,
        pathParams: {'purchase_invoice_id': purchaseInvoiceId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseInvoiceRead.fromMap);

/// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/lines/{purchase_invoice_line_uuid}`
Future<ApiResponse<PurchaseInvoiceLine>> getPurchaseInvoiceLine(
  ExsitedClient client,
  Object purchaseInvoiceId,
  Object purchaseInvoiceLineUuid, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseInvoicesUrls.purchaseInvoiceLine,
        pathParams: {
          'purchase_invoice_id': purchaseInvoiceId,
          'purchase_invoice_line_uuid': purchaseInvoiceLineUuid
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseInvoiceLine.fromMap);

/// `PATCH /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}`
///
/// Sent as a form, the text as the `note` field, and as multipart with any
/// [files] beside it: the endpoint reads no JSON body.
Future<ApiResponse<PurchaseInvoiceNoteView>> updatePurchaseInvoiceNote(
  ExsitedClient client,
  Object purchaseInvoiceId,
  Object noteId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPatchRequest(PurchaseInvoicesUrls.purchaseInvoiceNote,
      pathParams: {'purchase_invoice_id': purchaseInvoiceId, 'note_id': noteId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: PurchaseInvoiceNoteView.fromMap);
}

/// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}`
Future<ApiResponse<PurchaseInvoiceNoteView>> getPurchaseInvoiceNote(
  ExsitedClient client,
  Object purchaseInvoiceId,
  Object noteId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseInvoicesUrls.purchaseInvoiceNote,
        pathParams: {
          'purchase_invoice_id': purchaseInvoiceId,
          'note_id': noteId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseInvoiceNoteView.fromMap);

/// `DELETE /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deletePurchaseInvoiceNote(
  ExsitedClient client,
  Object purchaseInvoiceId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(PurchaseInvoicesUrls.purchaseInvoiceNote,
        pathParams: {
          'purchase_invoice_id': purchaseInvoiceId,
          'note_id': noteId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}/files`
Future<ApiResponse<PurchaseInvoiceNoteFileList>> getPurchaseInvoiceNoteFiles(
  ExsitedClient client,
  Object purchaseInvoiceId,
  Object noteId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseInvoicesUrls.purchaseInvoiceNoteFiles,
        pathParams: {
          'purchase_invoice_id': purchaseInvoiceId,
          'note_id': noteId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseInvoiceNoteFileList.fromMap);

/// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/notes/{note_id}/files/{file_id}`
Future<ApiResponse<PurchaseInvoiceNoteFile>> getPurchaseInvoiceNoteFile(
  ExsitedClient client,
  Object purchaseInvoiceId,
  Object noteId,
  Object fileId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseInvoicesUrls.purchaseInvoiceNoteFile,
        pathParams: {
          'purchase_invoice_id': purchaseInvoiceId,
          'note_id': noteId,
          'file_id': fileId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseInvoiceNoteFile.fromMap);

/// `GET /api/{api_version}/purchase_invoices/{purchase_invoice_id}/purchase_credit_note_applications/{application_id}`
///
/// One purchase credit note application through a purchase invoice; not checked
/// against the invoice, so any application answers under any invoice.
Future<ApiResponse<PurchaseCreditNoteApplicationRead>>
    getPurchaseInvoicePurchaseCreditNoteApplication(
  ExsitedClient client,
  Object purchaseInvoiceId,
  Object applicationId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            PurchaseInvoicesUrls.purchaseInvoicePurchaseCreditNoteApplication,
            pathParams: {
              'purchase_invoice_id': purchaseInvoiceId,
              'application_id': applicationId
            },
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: PurchaseCreditNoteApplicationRead.fromMap);
