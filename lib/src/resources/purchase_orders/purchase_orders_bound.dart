/// The v4 purchase orders endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'purchase_orders.dart' as endpoints;
import 'purchase_orders_dto.dart' as views;

/// The purchase orders endpoints with [client] already applied.
class PurchaseOrdersResource {
  /// Bind the resource to a client; normally reached via `client.purchaseOrders`.
  const PurchaseOrdersResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/purchase_orders`
  Future<ApiResponse<views.PurchaseOrderList>> getPurchaseOrders({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseOrders(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_orders`
  Future<ApiResponse<views.PurchaseOrders>> createPurchaseOrder(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPurchaseOrder(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_orders/notes`
  Future<ApiResponse<views.PurchaseOrdersNoteList>> getPurchaseOrdersNotes({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseOrdersNotes(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/purchase_orders/{purchase_order_id}`
  Future<ApiResponse<Object?>> deletePurchaseOrder(
    Object purchaseOrderId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deletePurchaseOrder(
        client,
        purchaseOrderId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/purchase_orders/{purchase_order_id}`
  Future<ApiResponse<views.PurchaseOrderUpdated>> updatePurchaseOrder(
    Object purchaseOrderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updatePurchaseOrder(
        client,
        purchaseOrderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_orders/{purchase_order_id}`
  Future<ApiResponse<views.PurchaseOrderRead>> getPurchaseOrder(
    Object purchaseOrderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseOrder(
        client,
        purchaseOrderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_orders/{purchase_order_id}/cancel`
  Future<ApiResponse<views.PurchaseOrderRead>> cancelPurchaseOrder(
    Object purchaseOrderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.cancelPurchaseOrder(
        client,
        purchaseOrderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_orders/{purchase_order_id}/change`
  Future<ApiResponse<views.PurchaseOrderRead>> changePurchaseOrder(
    Object purchaseOrderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.changePurchaseOrder(
        client,
        purchaseOrderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/information`
  Future<ApiResponse<views.PurchaseOrderInformation>>
      getPurchaseOrderInformation(
    Object purchaseOrderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getPurchaseOrderInformation(
            client,
            purchaseOrderId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/lines`
  Future<ApiResponse<views.PurchaseOrderLineList>> getPurchaseOrderLines(
    Object purchaseOrderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseOrderLines(
        client,
        purchaseOrderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/notes`
  Future<ApiResponse<views.PurchaseOrderNotes>> getPurchaseOrderNotes(
    Object purchaseOrderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseOrderNotes(
        client,
        purchaseOrderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_orders/{purchase_order_id}/notes`
  Future<ApiResponse<views.PurchaseOrderNoteView>> createPurchaseOrderNote(
    Object purchaseOrderId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPurchaseOrderNote(
        client,
        purchaseOrderId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_invoices`
  Future<ApiResponse<views.PurchaseOrderPurchaseInvoices>>
      createPurchaseOrderPurchaseInvoice(
    Object purchaseOrderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createPurchaseOrderPurchaseInvoice(
            client,
            purchaseOrderId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_invoices`
  Future<ApiResponse<views.PurchaseOrderPurchaseInvoiceList>>
      getPurchaseOrderPurchaseInvoices(
    Object purchaseOrderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getPurchaseOrderPurchaseInvoices(
            client,
            purchaseOrderId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/purchase_payments`
  Future<ApiResponse<views.PurchaseOrderPurchasePaymentList>>
      getPurchaseOrderPurchasePayments(
    Object purchaseOrderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getPurchaseOrderPurchasePayments(
            client,
            purchaseOrderId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/purchase_orders/{purchase_order_id}/reactivate`
  Future<ApiResponse<views.PurchaseOrderRead>> reactivatePurchaseOrder(
    Object purchaseOrderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.reactivatePurchaseOrder(
        client,
        purchaseOrderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/lines/{purchase_order_line_uuid}`
  Future<ApiResponse<views.PurchaseOrderLineRead>> getPurchaseOrderLine(
    Object purchaseOrderId,
    Object purchaseOrderLineUuid, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseOrderLine(
        client,
        purchaseOrderId,
        purchaseOrderLineUuid,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}`
  Future<ApiResponse<Object?>> deletePurchaseOrderNote(
    Object purchaseOrderId,
    Object purchaseOrderNoteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deletePurchaseOrderNote(
        client,
        purchaseOrderId,
        purchaseOrderNoteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}`
  Future<ApiResponse<views.PurchaseOrderNoteView>> getPurchaseOrderNote(
    Object purchaseOrderId,
    Object purchaseOrderNoteId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseOrderNote(
        client,
        purchaseOrderId,
        purchaseOrderNoteId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}/files`
  Future<ApiResponse<views.PurchaseOrderNoteFileList>>
      getPurchaseOrderNoteFiles(
    Object purchaseOrderId,
    Object purchaseOrderNoteId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getPurchaseOrderNoteFiles(
            client,
            purchaseOrderId,
            purchaseOrderNoteId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}/files/{purchase_order_file_id}`
  Future<ApiResponse<views.PurchaseOrderNoteFile>> getPurchaseOrderNoteFile(
    Object purchaseOrderId,
    Object purchaseOrderNoteId,
    Object purchaseOrderFileId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseOrderNoteFile(
        client,
        purchaseOrderId,
        purchaseOrderNoteId,
        purchaseOrderFileId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/kpis`
  Future<ApiResponse<views.PurchaseOrderKpis>> getPurchaseOrderKpis(
    Object purchaseOrderId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseOrderKpis(
        client,
        purchaseOrderId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/purchase_orders/{purchase_order_id}/notes/{purchase_order_note_id}/files/{purchase_order_file_id}`
  Future<ApiResponse<Object?>> deletePurchaseOrderNoteFile(
    Object purchaseOrderId,
    Object purchaseOrderNoteId,
    Object purchaseOrderFileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deletePurchaseOrderNoteFile(
        client,
        purchaseOrderId,
        purchaseOrderNoteId,
        purchaseOrderFileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
