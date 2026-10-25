/// The v4 return merchandise authorisations endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'return_merchandise_authorisations_dto.dart';
import 'return_merchandise_authorisations_urls.dart';

/// `GET /api/{api_version}/return_merchandise_authorisations`
Future<ApiResponse<ReturnMerchandiseAuthorisationList>>
    getReturnMerchandiseAuthorisations(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            ReturnMerchandiseAuthorisationsUrls.returnMerchandiseAuthorisations,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReturnMerchandiseAuthorisationList.fromMap);

/// `POST /api/{api_version}/return_merchandise_authorisations`
Future<ApiResponse<ReturnMerchandiseAuthorisations>>
    createReturnMerchandiseAuthorisation(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPostRequest(
            ReturnMerchandiseAuthorisationsUrls.returnMerchandiseAuthorisations,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReturnMerchandiseAuthorisations.fromMap);

/// `GET /api/{api_version}/return_merchandise_authorisations/{rma_id}`
Future<ApiResponse<ReturnMerchandiseAuthorisationRead>>
    getReturnMerchandiseAuthorisation(
  ExsitedClient client,
  Object rmaId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            ReturnMerchandiseAuthorisationsUrls.returnMerchandiseAuthorisation,
            pathParams: {'rma_id': rmaId},
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReturnMerchandiseAuthorisationRead.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations/{rma_code}/receive`
Future<ApiResponse<InvoiceReturnMerchandiseAuthorisationReceiveList>>
    getInvoiceReturnMerchandiseAuthorisationReceive(
  ExsitedClient client,
  Object invoiceId,
  Object rmaId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            ReturnMerchandiseAuthorisationsUrls
                .invoiceReturnMerchandiseAuthorisationReceive,
            pathParams: {'invoice_id': invoiceId, 'rma_code': rmaId},
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder:
                InvoiceReturnMerchandiseAuthorisationReceiveList.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations/{rma_code}/receive/{receive_uuid}`
Future<ApiResponse<InvoiceReturnMerchandiseAuthorisationReceive>>
    getInvoiceReturnMerchandiseAuthorisationReceiveByUuid(
  ExsitedClient client,
  Object invoiceId,
  Object rmaId,
  Object receiveUuid, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            ReturnMerchandiseAuthorisationsUrls
                .invoiceReturnMerchandiseAuthorisationReceiveByUuid,
            pathParams: {
              'invoice_id': invoiceId,
              'rma_code': rmaId,
              'receive_uuid': receiveUuid
            },
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: InvoiceReturnMerchandiseAuthorisationReceive.fromMap);

/// `PATCH /api/{api_version}/return_merchandise_authorisations/{rma_id}`
///
/// Update RMA, the `rma_` id and `{"return_merchandise_authorisation": {...}}`
/// of `rma_date`, `note` and `returns`.
Future<ApiResponse<ReturnMerchandiseAuthorisationRead>>
    updateReturnMerchandiseAuthorisation(
  ExsitedClient client,
  Object rmaId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(
            ReturnMerchandiseAuthorisationsUrls.returnMerchandiseAuthorisation,
            pathParams: {'rma_id': rmaId},
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReturnMerchandiseAuthorisationRead.fromMap);

/// `DELETE /api/{api_version}/return_merchandise_authorisations/{rma_id}`
///
/// Delete RMA, the `rma_` id; only a draft is deleted, anything else is refused
/// `400` `stock_committed`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteReturnMerchandiseAuthorisation(
  ExsitedClient client,
  Object rmaId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(
        ReturnMerchandiseAuthorisationsUrls.returnMerchandiseAuthorisation,
        pathParams: {'rma_id': rmaId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/return_merchandise_authorisations/{rma_id}/approve`
///
/// Approve RMA, no body; `422` when the RMA holds no pending approval.
Future<ApiResponse<ReturnMerchandiseAuthorisationRead>>
    approveReturnMerchandiseAuthorisation(
  ExsitedClient client,
  Object rmaId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPostRequest(
            ReturnMerchandiseAuthorisationsUrls
                .returnMerchandiseAuthorisationApprove,
            pathParams: {'rma_id': rmaId},
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReturnMerchandiseAuthorisationRead.fromMap);

/// `POST /api/{api_version}/return_merchandise_authorisations/{rma_id}/reject`
///
/// Reject RMA, no body; `422` when the RMA holds no pending approval.
Future<ApiResponse<ReturnMerchandiseAuthorisationRead>>
    rejectReturnMerchandiseAuthorisation(
  ExsitedClient client,
  Object rmaId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPostRequest(
            ReturnMerchandiseAuthorisationsUrls
                .returnMerchandiseAuthorisationReject,
            pathParams: {'rma_id': rmaId},
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReturnMerchandiseAuthorisationRead.fromMap);

/// `POST /api/{api_version}/return_merchandise_authorisations/{rma_id}/receive`
///
/// Receive returned stock, `{"return_merchandise_authorisation":
/// {"receive_returns": [{"uuid", "rma_receive_quantity"}]}}`.
Future<ApiResponse<ReturnMerchandiseAuthorisationRead>>
    receiveReturnMerchandiseAuthorisation(
  ExsitedClient client,
  Object rmaId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPostRequest(
            ReturnMerchandiseAuthorisationsUrls
                .returnMerchandiseAuthorisationReceive,
            pathParams: {'rma_id': rmaId},
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReturnMerchandiseAuthorisationRead.fromMap);

/// `GET /api/{api_version}/return_merchandise_authorisations/{rma_code}/receive`
///
/// List an RMA's receipts, by the RMA's code; an `rma_` id answers `404`.
Future<ApiResponse<InvoiceReturnMerchandiseAuthorisationReceiveList>>
    getReturnMerchandiseAuthorisationReceive(
  ExsitedClient client,
  Object rmaCode, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            ReturnMerchandiseAuthorisationsUrls
                .returnMerchandiseAuthorisationReceiveByCode,
            pathParams: {'rma_code': rmaCode},
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder:
                InvoiceReturnMerchandiseAuthorisationReceiveList.fromMap);

/// `GET /api/{api_version}/return_merchandise_authorisations/{rma_code}/receive/{receive_uuid}`
///
/// Get one RMA receipt, the `rrma_` id or the receipt's code, under
/// `receive_rma`.
Future<ApiResponse<InvoiceReturnMerchandiseAuthorisationReceive>>
    getReturnMerchandiseAuthorisationReceiveByUuid(
  ExsitedClient client,
  Object rmaCode,
  Object receiveUuid, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            ReturnMerchandiseAuthorisationsUrls
                .returnMerchandiseAuthorisationReceiveByUuid,
            pathParams: {'rma_code': rmaCode, 'receive_uuid': receiveUuid},
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: InvoiceReturnMerchandiseAuthorisationReceive.fromMap);

/// `POST /api/{api_version}/return_merchandise_authorisations/{rma_id}/notes`
///
/// Add RMA note, the `rma_` id and a JSON `{"note": {"note": "..."}}`, not a
/// form; no attachment.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createReturnMerchandiseAuthorisationNote(
  ExsitedClient client,
  Object rmaId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(
        ReturnMerchandiseAuthorisationsUrls.returnMerchandiseAuthorisationNotes,
        pathParams: {'rma_id': rmaId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/return_merchandise_authorisations/{rma_code}/notes`
///
/// List RMA notes, by the RMA's code; an `rma_` id answers `404`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getReturnMerchandiseAuthorisationNotes(
  ExsitedClient client,
  Object rmaCode, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(
        ReturnMerchandiseAuthorisationsUrls
            .returnMerchandiseAuthorisationNotesByCode,
        pathParams: {'rma_code': rmaCode},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/return_merchandise_authorisations/{rma_code}/notes/{note_id}`
///
/// Get one RMA note, by the RMA's code.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getReturnMerchandiseAuthorisationNote(
  ExsitedClient client,
  Object rmaCode,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(
        ReturnMerchandiseAuthorisationsUrls
            .returnMerchandiseAuthorisationNoteByCode,
        pathParams: {'rma_code': rmaCode, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/return_merchandise_authorisations/{rma_id}/notes/{note_id}`
///
/// Delete RMA note, the `rma_` id; a code answers `404`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteReturnMerchandiseAuthorisationNote(
  ExsitedClient client,
  Object rmaId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(
        ReturnMerchandiseAuthorisationsUrls.returnMerchandiseAuthorisationNote,
        pathParams: {'rma_id': rmaId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/return_merchandise_authorisations/{rma_code}/notes/{note_id}/files`
///
/// List an RMA note's attachments, by the code.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getReturnMerchandiseAuthorisationNoteFiles(
  ExsitedClient client,
  Object rmaCode,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(
        ReturnMerchandiseAuthorisationsUrls
            .returnMerchandiseAuthorisationNoteFilesByCode,
        pathParams: {'rma_code': rmaCode, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/return_merchandise_authorisations/{rma_code}/notes/{note_id}/files/{file_id}`
///
/// Get one RMA note attachment.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getReturnMerchandiseAuthorisationNoteFile(
  ExsitedClient client,
  Object rmaCode,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(
        ReturnMerchandiseAuthorisationsUrls
            .returnMerchandiseAuthorisationNoteFileByCode,
        pathParams: {'rma_code': rmaCode, 'note_id': noteId, 'file_id': fileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/return_merchandise_authorisations/{rma_id}/notes/{note_id}/files/{file_id}`
///
/// Delete an RMA note attachment.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteReturnMerchandiseAuthorisationNoteFile(
  ExsitedClient client,
  Object rmaId,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(
        ReturnMerchandiseAuthorisationsUrls
            .returnMerchandiseAuthorisationNoteFile,
        pathParams: {'rma_id': rmaId, 'note_id': noteId, 'file_id': fileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
