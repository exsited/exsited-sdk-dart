/// The v4 invoices endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../../errors.dart';
import '../credit_note_applications/credit_note_applications_dto.dart'
    show CreditNoteApplicationRead;
import 'invoices_dto.dart';
import 'invoices_urls.dart';

/// `GET /api/{api_version}/invoices`
Future<ApiResponse<InvoiceList>> getInvoices(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoices,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: InvoiceList.fromMap);

/// `POST /api/{api_version}/invoices`
Future<ApiResponse<Invoice>> createInvoice(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(InvoicesUrls.invoices,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Invoice.fromMap);

/// `DELETE /api/{api_version}/invoices/{invoice_id}`
Future<ApiResponse<Invoice>> deleteInvoice(
  ExsitedClient client,
  Object invoiceId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(InvoicesUrls.invoice,
        pathParams: {'invoice_id': invoiceId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Invoice.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}`
Future<ApiResponse<Invoice>> getInvoice(
  ExsitedClient client,
  Object invoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoice,
        pathParams: {'invoice_id': invoiceId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Invoice.fromMap);

/// `POST /api/{api_version}/invoices/{invoice_id}/amend`
Future<ApiResponse<Invoice>> amendInvoice(
  ExsitedClient client,
  Object invoiceId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(InvoicesUrls.invoiceAmend,
        pathParams: {'invoice_id': invoiceId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Invoice.fromMap);

/// `POST /api/{api_version}/invoices/{invoice_id}/cancel`
Future<ApiResponse<Invoice>> cancelInvoice(
  ExsitedClient client,
  Object invoiceId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(InvoicesUrls.invoiceCancel,
        pathParams: {'invoice_id': invoiceId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Invoice.fromMap);

/// `PATCH /api/{api_version}/invoices/{invoice_id}/information`
Future<ApiResponse<Invoice>> updateInvoiceInformation(
  ExsitedClient client,
  Object invoiceId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(InvoicesUrls.invoiceInformation,
        pathParams: {'invoice_id': invoiceId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Invoice.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/information`
Future<ApiResponse<Invoice>> getInvoiceInformation(
  ExsitedClient client,
  Object invoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoiceInformation,
        pathParams: {'invoice_id': invoiceId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Invoice.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/item_fulfillments`
Future<ApiResponse<InvoiceItemFulfillmentList>> getInvoiceItemFulfillments(
  ExsitedClient client,
  Object invoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoiceItemFulfillments,
        pathParams: {'invoice_id': invoiceId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: InvoiceItemFulfillmentList.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/notes`
Future<ApiResponse<InvoiceNoteList>> getInvoiceNotes(
  ExsitedClient client,
  Object invoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoiceNotes,
        pathParams: {'invoice_id': invoiceId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: InvoiceNoteList.fromMap);

/// `POST /api/{api_version}/invoices/{invoice_id}/notes`
///
/// Sent as a form, the text as the `note` field, and as multipart with any
/// [files] beside it: the endpoint reads no JSON body.
Future<ApiResponse<InvoiceNote>> createInvoiceNote(
  ExsitedClient client,
  Object invoiceId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPostRequest(InvoicesUrls.invoiceNotes,
      pathParams: {'invoice_id': invoiceId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: InvoiceNote.fromMap);
}

/// `GET /api/{api_version}/invoices/{invoice_id}/pdf`
Future<ApiResponse<InvoicePdf>> getInvoicePdf(
  ExsitedClient client,
  Object invoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoicePdf,
        pathParams: {'invoice_id': invoiceId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: InvoicePdf.fromMap);

/// `POST /api/{api_version}/invoices/{invoice_id}/reactivate`
Future<ApiResponse<Invoice>> reactivateInvoice(
  ExsitedClient client,
  Object invoiceId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(InvoicesUrls.invoiceReactivate,
        pathParams: {'invoice_id': invoiceId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Invoice.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations`
Future<ApiResponse<InvoiceReturnMerchandiseAuthorisationList>>
    getInvoiceReturnMerchandiseAuthorisations(
  ExsitedClient client,
  Object invoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            InvoicesUrls.invoiceReturnMerchandiseAuthorisations,
            pathParams: {'invoice_id': invoiceId},
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: InvoiceReturnMerchandiseAuthorisationList.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/invoices`
Future<ApiResponse<OrderInvoiceList>> getOrderInvoices(
  ExsitedClient client,
  Object orderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.orderInvoices,
        pathParams: {'order_id': orderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderInvoiceList.fromMap);

/// `POST /api/{api_version}/orders/{order_id}/invoices`
Future<ApiResponse<Invoice>> createOrderInvoice(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(InvoicesUrls.orderInvoices,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Invoice.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/item_fulfillments/{fulfillment_id}`
Future<ApiResponse<InvoiceItemFulfillment>> getInvoiceItemFulfillment(
  ExsitedClient client,
  Object invoiceId,
  Object fulfillmentId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoiceItemFulfillment,
        pathParams: {'invoice_id': invoiceId, 'fulfillment_id': fulfillmentId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: InvoiceItemFulfillment.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/notes/{invoice_note_id}`
Future<ApiResponse<InvoiceNote>> getInvoiceNote(
  ExsitedClient client,
  Object invoiceId,
  Object invoiceNoteId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoiceNote,
        pathParams: {'invoice_id': invoiceId, 'invoice_note_id': invoiceNoteId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: InvoiceNote.fromMap);

/// `DELETE /api/{api_version}/invoices/{invoice_id}/notes/{invoice_note_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteInvoiceNote(
  ExsitedClient client,
  Object invoiceId,
  Object invoiceNoteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(InvoicesUrls.invoiceNote,
        pathParams: {'invoice_id': invoiceId, 'invoice_note_id': invoiceNoteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations/{rma_id}`
Future<ApiResponse<InvoiceReturnMerchandiseAuthorisation>>
    getInvoiceReturnMerchandiseAuthorisation(
  ExsitedClient client,
  Object invoiceId,
  Object rmaId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            InvoicesUrls.invoiceReturnMerchandiseAuthorisation,
            pathParams: {'invoice_id': invoiceId, 'rma_id': rmaId},
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: InvoiceReturnMerchandiseAuthorisation.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/notes/{invoice_note_id}/files`
Future<ApiResponse<InvoiceNoteFileList>> getInvoiceNoteFiles(
  ExsitedClient client,
  Object invoiceId,
  Object invoiceNoteId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoiceNoteFiles,
        pathParams: {'invoice_id': invoiceId, 'invoice_note_id': invoiceNoteId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: InvoiceNoteFileList.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/notes/{invoice_note_id}/files/{invoice_file_id}`
Future<ApiResponse<InvoiceNoteFile>> getInvoiceNoteFile(
  ExsitedClient client,
  Object invoiceId,
  Object invoiceNoteId,
  Object invoiceFileId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoiceNoteFile,
        pathParams: {
          'invoice_id': invoiceId,
          'invoice_note_id': invoiceNoteId,
          'invoice_file_id': invoiceFileId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: InvoiceNoteFile.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/kpis`
///
/// An invoice's KPI block, under `invoice_kpis`; the same block `getInvoice`
/// carries as `kpis`.
Future<ApiResponse<InvoiceKpisRead>> getInvoiceKpis(
  ExsitedClient client,
  Object invoiceId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoiceKpis,
        pathParams: {'invoice_id': invoiceId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: InvoiceKpisRead.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/lines`
///
/// An invoice's lines, under `invoice.lines`; not a paged listing.
Future<ApiResponse<InvoiceLines>> getInvoiceLines(
  ExsitedClient client,
  Object invoiceId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoiceLines,
        pathParams: {'invoice_id': invoiceId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: InvoiceLines.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/lines/{line_id}`
///
/// One invoice line, under `invoice.line`. The server ignores `line_id` and
/// answers the invoice's first line.
Future<ApiResponse<InvoiceLineRead>> getInvoiceLine(
  ExsitedClient client,
  Object invoiceId,
  Object lineId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoiceLine,
        pathParams: {'invoice_id': invoiceId, 'line_id': lineId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: InvoiceLineRead.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/credit_note_applications/{credit_note_application_id}`
///
/// One credit note application through an invoice; not checked against the
/// invoice, so any application answers under any invoice.
Future<ApiResponse<CreditNoteApplicationRead>> getInvoiceCreditNoteApplication(
  ExsitedClient client,
  Object invoiceId,
  Object creditNoteApplicationId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoiceCreditNoteApplication,
        pathParams: {
          'invoice_id': invoiceId,
          'credit_note_application_id': creditNoteApplicationId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CreditNoteApplicationRead.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/custom_objects`
///
/// The custom objects defined for invoices; a paged listing, under `data`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getInvoiceCustomObjects(
  ExsitedClient client,
  Object invoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoiceCustomObjects,
        pathParams: {'invoice_id': invoiceId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/invoices/{invoice_id}/custom_objects/{custom_object_id}`
///
/// One custom object with this invoice's instances of it.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getInvoiceCustomObject(
  ExsitedClient client,
  Object invoiceId,
  Object customObjectId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoiceCustomObject,
        pathParams: {
          'invoice_id': invoiceId,
          'custom_object_id': customObjectId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/invoices/{invoice_id}/custom_objects/{custom_object_id}/instances/{instance_id}`
///
/// One instance of a custom object on an invoice.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getInvoiceCustomObjectInstance(
  ExsitedClient client,
  Object invoiceId,
  Object customObjectId,
  Object instanceId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoicesUrls.invoiceCustomObjectInstance,
        pathParams: {
          'invoice_id': invoiceId,
          'custom_object_id': customObjectId,
          'instance_id': instanceId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/invoices/{invoice_id}/notes/{invoice_note_id}/files/{invoice_file_id}`
///
/// Delete one attachment, by the attachment's `uuid`; `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteInvoiceNoteFile(
  ExsitedClient client,
  Object invoiceId,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(InvoicesUrls.invoiceNoteFile,
        pathParams: {
          'invoice_id': invoiceId,
          'invoice_note_id': noteId,
          'invoice_file_id': fileId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
