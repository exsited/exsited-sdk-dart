/// The v4 credit notes endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'credit_notes.dart' as endpoints;
import 'credit_notes_dto.dart' as views;

/// The credit notes endpoints with [client] already applied.
class CreditNotesResource {
  /// Bind the resource to a client; normally reached via `client.creditNotes`.
  const CreditNotesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/credit_notes`
  Future<ApiResponse<views.CreditNoteList>> getCreditNotes({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getCreditNotes(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/credit_notes/{credit_note_id}`
  Future<ApiResponse<views.CreditNoteRead>> getCreditNote(
    Object creditNoteId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getCreditNote(
        client,
        creditNoteId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/credit_notes/{credit_note_id}`
  Future<ApiResponse<views.CreditNoteUpdated>> updateCreditNote(
    Object creditNoteId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateCreditNote(
        client,
        creditNoteId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/credit_notes`
  Future<ApiResponse<Object?>> createCreditNote(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createCreditNote(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/credit_notes/{credit_note_id}`
  Future<ApiResponse<Object?>> deleteCreditNote(
    Object creditNoteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteCreditNote(
        client,
        creditNoteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/credit_notes/{credit_note_id}/apply`
  Future<ApiResponse<Object?>> applyCreditNote(
    Object creditNoteId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.applyCreditNote(
        client,
        creditNoteId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/credit_notes/{credit_note_id}/items`
  Future<ApiResponse<views.CreditNoteItems>> getCreditNoteItems(
    Object creditNoteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getCreditNoteItems(
        client,
        creditNoteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/credit_notes/{credit_note_id}/credit_note_applications`
  Future<ApiResponse<views.CreditNoteApplications>>
      getCreditNoteCreditNoteApplications(
    Object creditNoteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getCreditNoteCreditNoteApplications(
            client,
            creditNoteId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/credit_notes/{credit_note_id}/notes`
  Future<ApiResponse<views.CreditNoteNoteList>> getCreditNoteNotes(
    Object creditNoteId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getCreditNoteNotes(
        client,
        creditNoteId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/credit_notes/{credit_note_id}/notes/{note_id}`
  Future<ApiResponse<views.CreditNoteNote>> getCreditNoteNote(
    Object creditNoteId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getCreditNoteNote(
        client,
        creditNoteId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/credit_notes/{credit_note_id}/notes`
  Future<ApiResponse<Object?>> createCreditNoteNote(
    Object creditNoteId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createCreditNoteNote(
        client,
        creditNoteId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/credit_notes/{credit_note_id}/notes/{note_id}`
  Future<ApiResponse<Object?>> deleteCreditNoteNote(
    Object creditNoteId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteCreditNoteNote(
        client,
        creditNoteId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/credit_notes/{credit_note_id}/notes/{note_id}/files`
  Future<ApiResponse<Object?>> getCreditNoteNoteFiles(
    Object creditNoteId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getCreditNoteNoteFiles(
        client,
        creditNoteId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/credit_notes/{credit_note_id}/notes/{note_id}/files/{file_id}`
  Future<ApiResponse<Object?>> getCreditNoteNoteFile(
    Object creditNoteId,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getCreditNoteNoteFile(
        client,
        creditNoteId,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
