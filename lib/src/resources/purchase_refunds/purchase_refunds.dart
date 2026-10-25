/// The v4 purchase refunds endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'purchase_refunds_dto.dart';
import 'purchase_refunds_urls.dart';

/// `GET /api/{api_version}/purchase_refunds`
Future<ApiResponse<PurchaseRefunds>> getPurchaseRefunds(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseRefundsUrls.purchaseRefunds,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseRefunds.fromMap);

/// `GET /api/{api_version}/purchase_refunds/{purchase_refund_id}`
Future<ApiResponse<PurchaseRefund>> getPurchaseRefund(
  ExsitedClient client,
  Object purchaseRefundId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(PurchaseRefundsUrls.purchaseRefund,
        pathParams: {'purchase_refund_id': purchaseRefundId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseRefund.fromMap);

/// `POST /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}/purchase_refunds`
///
/// Refund from a purchase credit note; `201`, as `getPurchaseRefund` reads it.
/// `payment_method` is the supplier's method reference.
Future<ApiResponse<PurchaseRefund>> createPurchaseCreditNotePurchaseRefund(
  ExsitedClient client,
  Object purchaseCreditNoteId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(
        PurchaseRefundsUrls.purchaseCreditNotePurchaseRefunds,
        pathParams: {'purchase_credit_note_id': purchaseCreditNoteId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseRefund.fromMap);

/// `PATCH /api/{api_version}/purchase_refunds/{purchase_refund_id}`
///
/// Edit a refund's reference, note, date or attributes, wrapped in
/// `purchase_refund`; the amount cannot change.
Future<ApiResponse<PurchaseRefund>> updatePurchaseRefund(
  ExsitedClient client,
  Object purchaseRefundId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(PurchaseRefundsUrls.purchaseRefund,
        pathParams: {'purchase_refund_id': purchaseRefundId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PurchaseRefund.fromMap);

/// `DELETE /api/{api_version}/purchase_refunds/{purchase_refund_id}`
///
/// Delete a refund, by its code; `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deletePurchaseRefund(
  ExsitedClient client,
  Object purchaseRefundId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(PurchaseRefundsUrls.purchaseRefund,
        pathParams: {'purchase_refund_id': purchaseRefundId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
