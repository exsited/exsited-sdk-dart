/// The v4 purchase refunds endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'purchase_refunds.dart' as endpoints;
import 'purchase_refunds_dto.dart' as views;

/// The purchase refunds endpoints with [client] already applied.
class PurchaseRefundsResource {
  /// Bind the resource to a client; normally reached via `client.purchaseRefunds`.
  const PurchaseRefundsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/purchase_refunds`
  Future<ApiResponse<views.PurchaseRefunds>> getPurchaseRefunds({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseRefunds(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/purchase_refunds/{purchase_refund_id}`
  Future<ApiResponse<views.PurchaseRefund>> getPurchaseRefund(
    Object purchaseRefundId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getPurchaseRefund(
        client,
        purchaseRefundId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/purchase_credit_notes/{purchase_credit_note_id}/purchase_refunds`
  Future<ApiResponse<views.PurchaseRefund>>
      createPurchaseCreditNotePurchaseRefund(
    Object purchaseCreditNoteId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createPurchaseCreditNotePurchaseRefund(
            client,
            purchaseCreditNoteId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/purchase_refunds/{purchase_refund_id}`
  Future<ApiResponse<views.PurchaseRefund>> updatePurchaseRefund(
    Object purchaseRefundId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updatePurchaseRefund(
        client,
        purchaseRefundId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/purchase_refunds/{purchase_refund_id}`
  Future<ApiResponse<Object?>> deletePurchaseRefund(
    Object purchaseRefundId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deletePurchaseRefund(
        client,
        purchaseRefundId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
