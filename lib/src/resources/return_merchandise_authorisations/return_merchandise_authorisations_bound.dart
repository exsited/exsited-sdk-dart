/// The v4 return merchandise authorisations endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'return_merchandise_authorisations.dart' as endpoints;
import 'return_merchandise_authorisations_dto.dart' as views;

/// The return merchandise authorisations endpoints with [client] already applied.
class ReturnMerchandiseAuthorisationsResource {
  /// Bind the resource to a client; normally reached via `client.returnMerchandiseAuthorisations`.
  const ReturnMerchandiseAuthorisationsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/return_merchandise_authorisations`
  Future<ApiResponse<views.ReturnMerchandiseAuthorisationList>>
      getReturnMerchandiseAuthorisations({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getReturnMerchandiseAuthorisations(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/return_merchandise_authorisations`
  Future<ApiResponse<views.ReturnMerchandiseAuthorisations>>
      createReturnMerchandiseAuthorisation(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createReturnMerchandiseAuthorisation(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/return_merchandise_authorisations/{rma_id}`
  Future<ApiResponse<views.ReturnMerchandiseAuthorisationRead>>
      getReturnMerchandiseAuthorisation(
    Object rmaId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getReturnMerchandiseAuthorisation(
            client,
            rmaId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations/{rma_code}/receive`
  Future<ApiResponse<views.InvoiceReturnMerchandiseAuthorisationReceiveList>>
      getInvoiceReturnMerchandiseAuthorisationReceive(
    Object invoiceId,
    Object rmaId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getInvoiceReturnMerchandiseAuthorisationReceive(
            client,
            invoiceId,
            rmaId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations/{rma_code}/receive/{receive_uuid}`
  Future<ApiResponse<views.InvoiceReturnMerchandiseAuthorisationReceive>>
      getInvoiceReturnMerchandiseAuthorisationReceiveByUuid(
    Object invoiceId,
    Object rmaId,
    Object receiveUuid, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getInvoiceReturnMerchandiseAuthorisationReceiveByUuid(
            client,
            invoiceId,
            rmaId,
            receiveUuid,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/return_merchandise_authorisations/{rma_id}`
  Future<ApiResponse<views.ReturnMerchandiseAuthorisationRead>>
      updateReturnMerchandiseAuthorisation(
    Object rmaId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateReturnMerchandiseAuthorisation(
            client,
            rmaId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/return_merchandise_authorisations/{rma_id}`
  Future<ApiResponse<Object?>> deleteReturnMerchandiseAuthorisation(
    Object rmaId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteReturnMerchandiseAuthorisation(
        client,
        rmaId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/return_merchandise_authorisations/{rma_id}/approve`
  Future<ApiResponse<views.ReturnMerchandiseAuthorisationRead>>
      approveReturnMerchandiseAuthorisation(
    Object rmaId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.approveReturnMerchandiseAuthorisation(
            client,
            rmaId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/return_merchandise_authorisations/{rma_id}/reject`
  Future<ApiResponse<views.ReturnMerchandiseAuthorisationRead>>
      rejectReturnMerchandiseAuthorisation(
    Object rmaId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.rejectReturnMerchandiseAuthorisation(
            client,
            rmaId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/return_merchandise_authorisations/{rma_id}/receive`
  Future<ApiResponse<views.ReturnMerchandiseAuthorisationRead>>
      receiveReturnMerchandiseAuthorisation(
    Object rmaId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.receiveReturnMerchandiseAuthorisation(
            client,
            rmaId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/return_merchandise_authorisations/{rma_code}/receive`
  Future<ApiResponse<views.InvoiceReturnMerchandiseAuthorisationReceiveList>>
      getReturnMerchandiseAuthorisationReceive(
    Object rmaCode, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getReturnMerchandiseAuthorisationReceive(
            client,
            rmaCode,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/return_merchandise_authorisations/{rma_code}/receive/{receive_uuid}`
  Future<ApiResponse<views.InvoiceReturnMerchandiseAuthorisationReceive>>
      getReturnMerchandiseAuthorisationReceiveByUuid(
    Object rmaCode,
    Object receiveUuid, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getReturnMerchandiseAuthorisationReceiveByUuid(
            client,
            rmaCode,
            receiveUuid,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/return_merchandise_authorisations/{rma_id}/notes`
  Future<ApiResponse<Object?>> createReturnMerchandiseAuthorisationNote(
    Object rmaId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createReturnMerchandiseAuthorisationNote(
        client,
        rmaId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/return_merchandise_authorisations/{rma_code}/notes`
  Future<ApiResponse<Object?>> getReturnMerchandiseAuthorisationNotes(
    Object rmaCode, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getReturnMerchandiseAuthorisationNotes(
        client,
        rmaCode,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/return_merchandise_authorisations/{rma_code}/notes/{note_id}`
  Future<ApiResponse<Object?>> getReturnMerchandiseAuthorisationNote(
    Object rmaCode,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getReturnMerchandiseAuthorisationNote(
        client,
        rmaCode,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/return_merchandise_authorisations/{rma_id}/notes/{note_id}`
  Future<ApiResponse<Object?>> deleteReturnMerchandiseAuthorisationNote(
    Object rmaId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteReturnMerchandiseAuthorisationNote(
        client,
        rmaId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/return_merchandise_authorisations/{rma_code}/notes/{note_id}/files`
  Future<ApiResponse<Object?>> getReturnMerchandiseAuthorisationNoteFiles(
    Object rmaCode,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getReturnMerchandiseAuthorisationNoteFiles(
        client,
        rmaCode,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/return_merchandise_authorisations/{rma_code}/notes/{note_id}/files/{file_id}`
  Future<ApiResponse<Object?>> getReturnMerchandiseAuthorisationNoteFile(
    Object rmaCode,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getReturnMerchandiseAuthorisationNoteFile(
        client,
        rmaCode,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/return_merchandise_authorisations/{rma_id}/notes/{note_id}/files/{file_id}`
  Future<ApiResponse<Object?>> deleteReturnMerchandiseAuthorisationNoteFile(
    Object rmaId,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteReturnMerchandiseAuthorisationNoteFile(
        client,
        rmaId,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
