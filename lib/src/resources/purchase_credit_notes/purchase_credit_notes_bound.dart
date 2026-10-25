/// The v4 purchase credit notes endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'purchase_credit_notes.dart' as endpoints;
import 'purchase_credit_notes_dto.dart' as views;

/// The purchase credit notes endpoints with [client] already applied.
class PurchaseCreditNotesResource {
  /// Bind the resource to a client; normally reached via `client.purchaseCreditNotes`.
  const PurchaseCreditNotesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/purchase_credit_notes`
  Future<ApiResponse<views.PurchaseCreditNoteList>> getPurchaseCreditNotes({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseCreditNotes(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}`
  Future<ApiResponse<views.PurchaseCreditNoteRead>> getPurchaseCreditNote(
    Object purchaseCreditNoteId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseCreditNote(
        client,
        purchaseCreditNoteId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}`
  Future<ApiResponse<views.PurchaseCreditNoteUpdated>> updatePurchaseCreditNote(
    Object purchaseCreditNoteId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updatePurchaseCreditNote(
        client,
        purchaseCreditNoteId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_credit_notes`
  Future<ApiResponse<views.PurchaseCreditNoteCreated>> createPurchaseCreditNote(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPurchaseCreditNote(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}`
  Future<ApiResponse<Object?>> deletePurchaseCreditNote(
    Object purchaseCreditNoteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deletePurchaseCreditNote(
        client,
        purchaseCreditNoteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}/apply`
  Future<ApiResponse<views.PurchaseCreditNoteCreated>> applyPurchaseCreditNote(
    Object purchaseCreditNoteId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.applyPurchaseCreditNote(
        client,
        purchaseCreditNoteId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}/notes`
  Future<ApiResponse<Object?>> createPurchaseCreditNoteNote(
    Object purchaseCreditNoteId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPurchaseCreditNoteNote(
        client,
        purchaseCreditNoteId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}/notes/{note_id}`
  Future<ApiResponse<Object?>> deletePurchaseCreditNoteNote(
    Object purchaseCreditNoteId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deletePurchaseCreditNoteNote(
        client,
        purchaseCreditNoteId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
