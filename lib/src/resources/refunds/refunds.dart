/// The v4 refunds endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../../errors.dart';
import '../accounts/accounts_dto.dart' show NoteFileList;
import 'refunds_dto.dart';
import 'refunds_urls.dart';

/// `GET /api/{api_version}/refunds`
Future<ApiResponse<RefundList>> getRefunds(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(RefundsUrls.refunds,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RefundList.fromMap);

/// `DELETE /api/{api_version}/refunds/{refund_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteRefund(
  ExsitedClient client,
  Object refundId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(RefundsUrls.refund,
        pathParams: {'refund_id': refundId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/refunds/{refund_id}`
Future<ApiResponse<Refund>> getRefund(
  ExsitedClient client,
  Object refundId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(RefundsUrls.refund,
        pathParams: {'refund_id': refundId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Refund.fromMap);

/// `PATCH /api/{api_version}/refunds/{refund_id}`
Future<ApiResponse<RefundUpdated>> updateRefund(
  ExsitedClient client,
  Object refundId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(RefundsUrls.refund,
        pathParams: {'refund_id': refundId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RefundUpdated.fromMap);

/// `POST /api/{api_version}/credit_notes/{credit_note_id}/refunds`
Future<ApiResponse<RefundUpdated>> createCreditNoteRefund(
  ExsitedClient client,
  Object creditNoteId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(RefundsUrls.creditNoteRefunds,
        pathParams: {'credit_note_id': creditNoteId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RefundUpdated.fromMap);

/// `GET /api/{api_version}/refunds/{refund_id}/notes`
///
/// List a refund's notes; a paged listing, under `data`.
Future<ApiResponse<RefundNoteList>> getRefundNotes(
  ExsitedClient client,
  Object refundId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(RefundsUrls.refundNotes,
        pathParams: {'refund_id': refundId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RefundNoteList.fromMap);

/// `GET /api/{api_version}/refunds/{refund_id}/notes/{note_id}`
///
/// Retrieve one note, by its `note_` id; under `note`.
Future<ApiResponse<RefundNote>> getRefundNote(
  ExsitedClient client,
  Object refundId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(RefundsUrls.refundNote,
        pathParams: {'refund_id': refundId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RefundNote.fromMap);

/// `POST /api/{api_version}/refunds/{refund_id}/notes`
///
/// Attach a note to a refund; a form, the text as the `note` field, and `201`
/// under `note`.
Future<ApiResponse<RefundNote>> createRefundNote(
  ExsitedClient client,
  Object refundId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPostRequest(RefundsUrls.refundNotes,
      pathParams: {'refund_id': refundId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: RefundNote.fromMap);
}

/// `DELETE /api/{api_version}/refunds/{refund_id}/notes/{note_id}`
///
/// Delete one note; `204`. The server checks `CREATE_REFUND_NOTE` here, not a
/// delete permission.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteRefundNote(
  ExsitedClient client,
  Object refundId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(RefundsUrls.refundNote,
        pathParams: {'refund_id': refundId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/refunds/{refund_id}/notes/{note_id}/files`
///
/// List a note's attachments, under `data`.
Future<ApiResponse<NoteFileList>> getRefundNoteFiles(
  ExsitedClient client,
  Object refundId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(RefundsUrls.refundNoteFiles,
        pathParams: {'refund_id': refundId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: NoteFileList.fromMap);

/// `GET /api/{api_version}/refunds/{refund_id}/notes/{note_id}/files/{file_id}`
///
/// Retrieve one attachment, by the attachment's `uuid`; a JSON descriptor under
/// `file`, not the file's bytes.
Future<ApiResponse<RefundNoteFile>> getRefundNoteFile(
  ExsitedClient client,
  Object refundId,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(RefundsUrls.refundNoteFile,
        pathParams: {
          'refund_id': refundId,
          'note_id': noteId,
          'file_id': fileId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RefundNoteFile.fromMap);

/// `DELETE /api/{api_version}/refunds/{refund_id}/notes/{note_id}/files/{file_id}`
///
/// Delete one attachment, by the attachment's `uuid`; `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteRefundNoteFile(
  ExsitedClient client,
  Object refundId,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(RefundsUrls.refundNoteFile,
        pathParams: {
          'refund_id': refundId,
          'note_id': noteId,
          'file_id': fileId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
