/// The v4 item receipts endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'item_receipts_dto.dart';
import 'item_receipts_urls.dart';

/// `GET /api/{api_version}/item_receipts`
Future<ApiResponse<ItemReceiptList>> getItemReceipts(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemReceiptsUrls.itemReceipts,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemReceiptList.fromMap);

/// `POST /api/{api_version}/item_receipts`
Future<ApiResponse<ItemReceipts>> createItemReceipt(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ItemReceiptsUrls.itemReceipts,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemReceipts.fromMap);

/// `PATCH /api/{api_version}/item_receipts/{item_receipt_id}`
Future<ApiResponse<ItemReceiptUpdated>> updateItemReceipt(
  ExsitedClient client,
  Object itemReceiptId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ItemReceiptsUrls.itemReceipt,
        pathParams: {'item_receipt_id': itemReceiptId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemReceiptUpdated.fromMap);

/// `GET /api/{api_version}/item_receipts/{item_receipt_id}`
Future<ApiResponse<ItemReceipt>> getItemReceipt(
  ExsitedClient client,
  Object itemReceiptId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemReceiptsUrls.itemReceipt,
        pathParams: {'item_receipt_id': itemReceiptId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemReceipt.fromMap);

/// `GET /api/{api_version}/purchase_orders/{purchase_order_id}/item_receipts`
Future<ApiResponse<PurchaseOrderItemReceipts>> getPurchaseOrderItemReceipts(
  ExsitedClient client,
  Object purchaseOrderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemReceiptsUrls.purchaseOrderItemReceipts,
        pathParams: {'purchase_order_id': purchaseOrderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseOrderItemReceipts.fromMap);

/// `DELETE /api/{api_version}/item_receipts/{item_receipt_id}`
///
/// Delete item receipt, by its `ir_` id; refused `400` `stock_committed` once
/// the receipt is completed.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteItemReceipt(
  ExsitedClient client,
  Object itemReceiptId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ItemReceiptsUrls.itemReceipt,
        pathParams: {'item_receipt_id': itemReceiptId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/item_receipts/{item_receipt_id}/notes/{note_id}`
///
/// Delete item receipt note, `ir_` and `note_` ids; no route lists or creates a
/// receipt's notes.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteItemReceiptNote(
  ExsitedClient client,
  Object itemReceiptId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ItemReceiptsUrls.itemReceiptNote,
        pathParams: {'item_receipt_id': itemReceiptId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
