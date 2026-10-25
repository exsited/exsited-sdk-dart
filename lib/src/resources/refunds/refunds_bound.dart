/// The v4 refunds endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../accounts/accounts_dto.dart' as views show NoteFileList;
import 'refunds.dart' as endpoints;
import 'refunds_dto.dart' as views;

/// The refunds endpoints with [client] already applied.
class RefundsResource {
  /// Bind the resource to a client; normally reached via `client.refunds`.
  const RefundsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/refunds`
  Future<ApiResponse<views.RefundList>> getRefunds({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getRefunds(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/refunds/{refund_id}`
  Future<ApiResponse<Object?>> deleteRefund(
    Object refundId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteRefund(
        client,
        refundId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/refunds/{refund_id}`
  Future<ApiResponse<views.Refund>> getRefund(
    Object refundId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getRefund(
        client,
        refundId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/refunds/{refund_id}`
  Future<ApiResponse<views.RefundUpdated>> updateRefund(
    Object refundId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateRefund(
        client,
        refundId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/credit_notes/{credit_note_id}/refunds`
  Future<ApiResponse<views.RefundUpdated>> createCreditNoteRefund(
    Object creditNoteId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createCreditNoteRefund(
        client,
        creditNoteId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/refunds/{refund_id}/notes`
  Future<ApiResponse<views.RefundNoteList>> getRefundNotes(
    Object refundId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getRefundNotes(
        client,
        refundId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/refunds/{refund_id}/notes/{note_id}`
  Future<ApiResponse<views.RefundNote>> getRefundNote(
    Object refundId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getRefundNote(
        client,
        refundId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/refunds/{refund_id}/notes`
  Future<ApiResponse<views.RefundNote>> createRefundNote(
    Object refundId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createRefundNote(
        client,
        refundId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/refunds/{refund_id}/notes/{note_id}`
  Future<ApiResponse<Object?>> deleteRefundNote(
    Object refundId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteRefundNote(
        client,
        refundId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/refunds/{refund_id}/notes/{note_id}/files`
  Future<ApiResponse<views.NoteFileList>> getRefundNoteFiles(
    Object refundId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getRefundNoteFiles(
        client,
        refundId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/refunds/{refund_id}/notes/{note_id}/files/{file_id}`
  Future<ApiResponse<views.RefundNoteFile>> getRefundNoteFile(
    Object refundId,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getRefundNoteFile(
        client,
        refundId,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/refunds/{refund_id}/notes/{note_id}/files/{file_id}`
  Future<ApiResponse<Object?>> deleteRefundNoteFile(
    Object refundId,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteRefundNoteFile(
        client,
        refundId,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
