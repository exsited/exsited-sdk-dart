/// The v4 purchase orders endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../../errors.dart';
import 'purchase_orders_dto.dart';
import 'purchase_orders_urls.dart';

/// `GET /api/{api_version}/purchase_orders`
Future<ApiResponse<PurchaseOrderList>> getPurchaseOrders(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseOrdersUrls.purchaseOrders,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderList.fromMap);

/// `POST /api/{api_version}/purchase_orders`
Future<ApiResponse<PurchaseOrders>> createPurchaseOrder(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PurchaseOrdersUrls.purchaseOrders,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrders.fromMap);

/// `GET /api/{api_version}/purchase_orders/notes`
Future<ApiResponse<PurchaseOrdersNoteList>> getPurchaseOrdersNotes(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseOrdersUrls.purchaseOrdersNotes,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrdersNoteList.fromMap);

/// `DELETE /api/{api_version}/purchase_orders/{purchase_order_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deletePurchaseOrder(
  ExsitedClient client,
  Object purchaseOrderId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(PurchaseOrdersUrls.purchaseOrder,
        pathParams: {'purchase_order_id': purchaseOrderId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/purchase_orders/{purchase_order_id}`
Future<ApiResponse<PurchaseOrderUpdated>> updatePurchaseOrder(
  ExsitedClient client,
  Object purchaseOrderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(PurchaseOrdersUrls.purchaseOrder,
        pathParams: {'purchase_order_id': purchaseOrderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderUpdated.fromMap);

/// `GET /api/{api_version}/purchase_orders/{purchase_order_id}`
Future<ApiResponse<PurchaseOrderRead>> getPurchaseOrder(
  ExsitedClient client,
  Object purchaseOrderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseOrdersUrls.purchaseOrder,
        pathParams: {'purchase_order_id': purchaseOrderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderRead.fromMap);

/// `POST /api/{api_version}/purchase_orders/{purchase_order_id}/cancel`
Future<ApiResponse<PurchaseOrderRead>> cancelPurchaseOrder(
  ExsitedClient client,
  Object purchaseOrderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PurchaseOrdersUrls.purchaseOrderCancel,
        pathParams: {'purchase_order_id': purchaseOrderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderRead.fromMap);

/// `POST /api/{api_version}/purchase_orders/{purchase_order_id}/change`
Future<ApiResponse<PurchaseOrderRead>> changePurchaseOrder(
  ExsitedClient client,
  Object purchaseOrderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PurchaseOrdersUrls.purchaseOrderChange,
        pathParams: {'purchase_order_id': purchaseOrderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderRead.fromMap);

/// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/information`
Future<ApiResponse<PurchaseOrderInformation>> getPurchaseOrderInformation(
  ExsitedClient client,
  Object purchaseOrderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseOrdersUrls.purchaseOrderInformation,
        pathParams: {'purchase_order_id': purchaseOrderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderInformation.fromMap);

/// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/lines`
Future<ApiResponse<PurchaseOrderLineList>> getPurchaseOrderLines(
  ExsitedClient client,
  Object purchaseOrderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseOrdersUrls.purchaseOrderLines,
        pathParams: {'purchase_order_id': purchaseOrderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderLineList.fromMap);

/// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/notes`
Future<ApiResponse<PurchaseOrderNotes>> getPurchaseOrderNotes(
  ExsitedClient client,
  Object purchaseOrderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseOrdersUrls.purchaseOrderNotes,
        pathParams: {'purchase_order_id': purchaseOrderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderNotes.fromMap);

/// `POST /api/{api_version}/purchase_orders/{purchase_order_id}/notes`
///
/// Sent as a form, the text as the `note` field, and as multipart with any
/// [files] beside it: the endpoint reads no JSON body.
Future<ApiResponse<PurchaseOrderNoteView>> createPurchaseOrderNote(
  ExsitedClient client,
  Object purchaseOrderId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPostRequest(PurchaseOrdersUrls.purchaseOrderNotes,
      pathParams: {'purchase_order_id': purchaseOrderId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: PurchaseOrderNoteView.fromMap);
}

/// `POST /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_invoices`
Future<ApiResponse<PurchaseOrderPurchaseInvoices>>
    createPurchaseOrderPurchaseInvoice(
  ExsitedClient client,
  Object purchaseOrderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPostRequest(PurchaseOrdersUrls.purchaseOrderPurchaseInvoices,
            pathParams: {'purchase_order_id': purchaseOrderId},
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: PurchaseOrderPurchaseInvoices.fromMap);

/// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_invoices`
Future<ApiResponse<PurchaseOrderPurchaseInvoiceList>>
    getPurchaseOrderPurchaseInvoices(
  ExsitedClient client,
  Object purchaseOrderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(PurchaseOrdersUrls.purchaseOrderPurchaseInvoices,
            pathParams: {'purchase_order_id': purchaseOrderId},
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: PurchaseOrderPurchaseInvoiceList.fromMap);

/// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_payments`
Future<ApiResponse<PurchaseOrderPurchasePaymentList>>
    getPurchaseOrderPurchasePayments(
  ExsitedClient client,
  Object purchaseOrderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(PurchaseOrdersUrls.purchaseOrderPurchasePayments,
            pathParams: {'purchase_order_id': purchaseOrderId},
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: PurchaseOrderPurchasePaymentList.fromMap);

/// `POST /api/{api_version}/purchase_orders/{purchase_order_id}/reactivate`
Future<ApiResponse<PurchaseOrderRead>> reactivatePurchaseOrder(
  ExsitedClient client,
  Object purchaseOrderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PurchaseOrdersUrls.purchaseOrderReactivate,
        pathParams: {'purchase_order_id': purchaseOrderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderRead.fromMap);

/// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/lines/{purchase_order_line_uuid}`
Future<ApiResponse<PurchaseOrderLineRead>> getPurchaseOrderLine(
  ExsitedClient client,
  Object purchaseOrderId,
  Object purchaseOrderLineUuid, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseOrdersUrls.purchaseOrderLine,
        pathParams: {
          'purchase_order_id': purchaseOrderId,
          'purchase_order_line_uuid': purchaseOrderLineUuid
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderLineRead.fromMap);

/// `DELETE /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deletePurchaseOrderNote(
  ExsitedClient client,
  Object purchaseOrderId,
  Object purchaseOrderNoteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(PurchaseOrdersUrls.purchaseOrderNote,
        pathParams: {
          'purchase_order_id': purchaseOrderId,
          'purchase_order_note_id': purchaseOrderNoteId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}`
Future<ApiResponse<PurchaseOrderNoteView>> getPurchaseOrderNote(
  ExsitedClient client,
  Object purchaseOrderId,
  Object purchaseOrderNoteId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseOrdersUrls.purchaseOrderNote,
        pathParams: {
          'purchase_order_id': purchaseOrderId,
          'purchase_order_note_id': purchaseOrderNoteId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderNoteView.fromMap);

/// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}/files`
Future<ApiResponse<PurchaseOrderNoteFileList>> getPurchaseOrderNoteFiles(
  ExsitedClient client,
  Object purchaseOrderId,
  Object purchaseOrderNoteId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseOrdersUrls.purchaseOrderNoteFiles,
        pathParams: {
          'purchase_order_id': purchaseOrderId,
          'purchase_order_note_id': purchaseOrderNoteId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderNoteFileList.fromMap);

/// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}/files/{purchase_order_file_id}`
Future<ApiResponse<PurchaseOrderNoteFile>> getPurchaseOrderNoteFile(
  ExsitedClient client,
  Object purchaseOrderId,
  Object purchaseOrderNoteId,
  Object purchaseOrderFileId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseOrdersUrls.purchaseOrderNoteFile,
        pathParams: {
          'purchase_order_id': purchaseOrderId,
          'purchase_order_note_id': purchaseOrderNoteId,
          'purchase_order_file_id': purchaseOrderFileId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderNoteFile.fromMap);

/// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/kpis`
///
/// A purchase order's KPI block, under `purchase_order_kpis`; the same block
/// `getPurchaseOrder` carries as `kpis`.
Future<ApiResponse<PurchaseOrderKpis>> getPurchaseOrderKpis(
  ExsitedClient client,
  Object purchaseOrderId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseOrdersUrls.purchaseOrderKpis,
        pathParams: {'purchase_order_id': purchaseOrderId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderKpis.fromMap);

/// `DELETE /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}/files/{purchase_order_file_id}`
///
/// Delete one attachment, by the purchase order's code and the attachment's
/// `uuid`; `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deletePurchaseOrderNoteFile(
  ExsitedClient client,
  Object purchaseOrderId,
  Object purchaseOrderNoteId,
  Object purchaseOrderFileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(PurchaseOrdersUrls.purchaseOrderNoteFile,
        pathParams: {
          'purchase_order_id': purchaseOrderId,
          'purchase_order_note_id': purchaseOrderNoteId,
          'purchase_order_file_id': purchaseOrderFileId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
