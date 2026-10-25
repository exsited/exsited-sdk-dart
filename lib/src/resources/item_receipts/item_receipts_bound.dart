/// The v4 item receipts endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'item_receipts.dart' as endpoints;
import 'item_receipts_dto.dart' as views;

/// The item receipts endpoints with [client] already applied.
class ItemReceiptsResource {
  /// Bind the resource to a client; normally reached via `client.itemReceipts`.
  const ItemReceiptsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/item_receipts`
  Future<ApiResponse<views.ItemReceiptList>> getItemReceipts({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemReceipts(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/item_receipts`
  Future<ApiResponse<views.ItemReceipts>> createItemReceipt(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createItemReceipt(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/item_receipts/{item_receipt_id}`
  Future<ApiResponse<views.ItemReceiptUpdated>> updateItemReceipt(
    Object itemReceiptId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateItemReceipt(
        client,
        itemReceiptId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/item_receipts/{item_receipt_id}`
  Future<ApiResponse<views.ItemReceipt>> getItemReceipt(
    Object itemReceiptId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemReceipt(
        client,
        itemReceiptId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/item_receipts`
  Future<ApiResponse<views.PurchaseOrderItemReceipts>>
      getPurchaseOrderItemReceipts(
    Object purchaseOrderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getPurchaseOrderItemReceipts(
            client,
            purchaseOrderId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/item_receipts/{item_receipt_id}`
  Future<ApiResponse<Object?>> deleteItemReceipt(
    Object itemReceiptId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteItemReceipt(
        client,
        itemReceiptId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/item_receipts/{item_receipt_id}/notes/{note_id}`
  Future<ApiResponse<Object?>> deleteItemReceiptNote(
    Object itemReceiptId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteItemReceiptNote(
        client,
        itemReceiptId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
