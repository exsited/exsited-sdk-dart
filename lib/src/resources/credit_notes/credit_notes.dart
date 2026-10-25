/// The v4 credit notes endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../../errors.dart';
import 'credit_notes_dto.dart';
import 'credit_notes_urls.dart';

/// `GET /api/{api_version}/credit_notes`
Future<ApiResponse<CreditNoteList>> getCreditNotes(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CreditNotesUrls.creditNotes,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CreditNoteList.fromMap);

/// `GET /api/{api_version}/credit_notes/{credit_note_id}`
Future<ApiResponse<CreditNoteRead>> getCreditNote(
  ExsitedClient client,
  Object creditNoteId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CreditNotesUrls.creditNote,
        pathParams: {'credit_note_id': creditNoteId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CreditNoteRead.fromMap);

/// `PATCH /api/{api_version}/credit_notes/{credit_note_id}`
Future<ApiResponse<CreditNoteUpdated>> updateCreditNote(
  ExsitedClient client,
  Object creditNoteId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(CreditNotesUrls.creditNote,
        pathParams: {'credit_note_id': creditNoteId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CreditNoteUpdated.fromMap);

/// `POST /api/{api_version}/credit_notes`
///
/// Credit an invoice, `{"credit_note": {invoice_id, amount}}`; `201`. The
/// amount is drawn from the invoice's active payments, oldest first.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createCreditNote(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CreditNotesUrls.creditNotes,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/credit_notes/{credit_note_id}`
///
/// Delete a credit note, by `cn_` id or code; `204`. A credit note with an
/// active refund is refused `400` `in_use`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteCreditNote(
  ExsitedClient client,
  Object creditNoteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(CreditNotesUrls.creditNote,
        pathParams: {'credit_note_id': creditNoteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/credit_notes/{credit_note_id}/apply`
///
/// Apply a credit note to invoices, under `credit_note.invoices`; it records a
/// payment against each, and answers the credit note.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> applyCreditNote(
  ExsitedClient client,
  Object creditNoteId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CreditNotesUrls.creditNoteApply,
        pathParams: {'credit_note_id': creditNoteId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/credit_notes/{credit_note_id}/items`
///
/// A credit note's balance rows, under `credit_note.items`; not a paged
/// listing.
Future<ApiResponse<CreditNoteItems>> getCreditNoteItems(
  ExsitedClient client,
  Object creditNoteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CreditNotesUrls.creditNoteItems,
        pathParams: {'credit_note_id': creditNoteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CreditNoteItems.fromMap);

/// `GET /api/{api_version}/credit_notes/{credit_note_id}/credit_note_applications`
///
/// A credit note's applications, under `credit_note.applications`; not a paged
/// listing.
Future<ApiResponse<CreditNoteApplications>> getCreditNoteCreditNoteApplications(
  ExsitedClient client,
  Object creditNoteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CreditNotesUrls.creditNoteCreditNoteApplications,
        pathParams: {'credit_note_id': creditNoteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CreditNoteApplications.fromMap);

/// `GET /api/{api_version}/credit_notes/{credit_note_id}/notes`
///
/// List a credit note's notes; a paged listing, under `data`.
Future<ApiResponse<CreditNoteNoteList>> getCreditNoteNotes(
  ExsitedClient client,
  Object creditNoteId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CreditNotesUrls.creditNoteNotes,
        pathParams: {'credit_note_id': creditNoteId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CreditNoteNoteList.fromMap);

/// `GET /api/{api_version}/credit_notes/{credit_note_id}/notes/{note_id}`
///
/// Retrieve one note, by its `note_` id; under `note`.
Future<ApiResponse<CreditNoteNote>> getCreditNoteNote(
  ExsitedClient client,
  Object creditNoteId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CreditNotesUrls.creditNoteNote,
        pathParams: {'credit_note_id': creditNoteId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CreditNoteNote.fromMap);

/// `POST /api/{api_version}/credit_notes/{credit_note_id}/notes`
///
/// Attach a note to a credit note; a form, the text as the `note` field, and
/// `201`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createCreditNoteNote(
  ExsitedClient client,
  Object creditNoteId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPostRequest(CreditNotesUrls.creditNoteNotes,
      pathParams: {'credit_note_id': creditNoteId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat);
}

/// `DELETE /api/{api_version}/credit_notes/{credit_note_id}/notes/{note_id}`
///
/// Delete one note, by its `note_` id; `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteCreditNoteNote(
  ExsitedClient client,
  Object creditNoteId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(CreditNotesUrls.creditNoteNote,
        pathParams: {'credit_note_id': creditNoteId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/credit_notes/{credit_note_id}/notes/{note_id}/files`
///
/// List a note's attachments, under `data`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getCreditNoteNoteFiles(
  ExsitedClient client,
  Object creditNoteId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CreditNotesUrls.creditNoteNoteFiles,
        pathParams: {'credit_note_id': creditNoteId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/credit_notes/{credit_note_id}/notes/{note_id}/files/{file_id}`
///
/// Retrieve one attachment; a JSON descriptor under `file`, not the file's
/// bytes.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getCreditNoteNoteFile(
  ExsitedClient client,
  Object creditNoteId,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CreditNotesUrls.creditNoteNoteFile,
        pathParams: {
          'credit_note_id': creditNoteId,
          'note_id': noteId,
          'file_id': fileId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
