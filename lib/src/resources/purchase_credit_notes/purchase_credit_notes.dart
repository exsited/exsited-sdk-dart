/// The v4 purchase credit notes endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../../errors.dart';
import 'purchase_credit_notes_dto.dart';
import 'purchase_credit_notes_urls.dart';

/// `GET /api/{api_version}/purchase_credit_notes`
Future<ApiResponse<PurchaseCreditNoteList>> getPurchaseCreditNotes(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseCreditNotesUrls.purchaseCreditNotes,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseCreditNoteList.fromMap);

/// `GET /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}`
Future<ApiResponse<PurchaseCreditNoteRead>> getPurchaseCreditNote(
  ExsitedClient client,
  Object purchaseCreditNoteId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseCreditNotesUrls.purchaseCreditNote,
        pathParams: {'purchase_credit_note_id': purchaseCreditNoteId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseCreditNoteRead.fromMap);

/// `PATCH /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}`
Future<ApiResponse<PurchaseCreditNoteUpdated>> updatePurchaseCreditNote(
  ExsitedClient client,
  Object purchaseCreditNoteId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(PurchaseCreditNotesUrls.purchaseCreditNote,
        pathParams: {'purchase_credit_note_id': purchaseCreditNoteId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseCreditNoteUpdated.fromMap);

/// `POST /api/{api_version}/purchase_credit_notes`
///
/// Credit a purchase invoice, as `{"purchase_credit_note":
/// {purchase_invoice_id, amount}}`; `201`, drawn from its payments.
Future<ApiResponse<PurchaseCreditNoteCreated>> createPurchaseCreditNote(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PurchaseCreditNotesUrls.purchaseCreditNotes,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseCreditNoteCreated.fromMap);

/// `DELETE /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}`
///
/// Delete a purchase credit note, by its `pcn_` id only; `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deletePurchaseCreditNote(
  ExsitedClient client,
  Object purchaseCreditNoteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(PurchaseCreditNotesUrls.purchaseCreditNote,
        pathParams: {'purchase_credit_note_id': purchaseCreditNoteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}/apply`
///
/// Apply credit to purchase invoices, under
/// `purchase_credit_note.purchase_invoices`; it records a purchase payment.
Future<ApiResponse<PurchaseCreditNoteCreated>> applyPurchaseCreditNote(
  ExsitedClient client,
  Object purchaseCreditNoteId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PurchaseCreditNotesUrls.purchaseCreditNoteApply,
        pathParams: {'purchase_credit_note_id': purchaseCreditNoteId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseCreditNoteCreated.fromMap);

/// `POST /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}/notes`
///
/// Attach a note; a form, the text as the `note` field, and `201`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createPurchaseCreditNoteNote(
  ExsitedClient client,
  Object purchaseCreditNoteId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPostRequest(PurchaseCreditNotesUrls.purchaseCreditNoteNotes,
      pathParams: {'purchase_credit_note_id': purchaseCreditNoteId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat);
}

/// `DELETE /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}/notes/{note_id}`
///
/// Delete one note, by the `pcn_` and `note_` ids; `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deletePurchaseCreditNoteNote(
  ExsitedClient client,
  Object purchaseCreditNoteId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(PurchaseCreditNotesUrls.purchaseCreditNoteNote,
        pathParams: {
          'purchase_credit_note_id': purchaseCreditNoteId,
          'note_id': noteId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
