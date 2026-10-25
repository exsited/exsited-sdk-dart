/// The v4 orders endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'orders.dart' as endpoints;
import 'orders_dto.dart' as views;

/// The orders endpoints with [client] already applied.
class OrdersResource {
  /// Bind the resource to a client; normally reached via `client.orders`.
  const OrdersResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/orders`
  Future<ApiResponse<views.OrderList>> getOrders({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrders(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders`
  Future<ApiResponse<views.OrderRead>> createOrder(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createOrder(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}`
  Future<ApiResponse<views.OrderRead>> getOrder(
    Object orderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrder(
        client,
        orderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/orders/{order_id}`
  Future<ApiResponse<Object?>> deleteOrder(
    Object orderId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteOrder(
        client,
        orderId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/activate`
  Future<ApiResponse<Object?>> activateOrder(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.activateOrder(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/activate_draft`
  Future<ApiResponse<views.OrderRead>> createOrderActivateDraft(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createOrderActivateDraft(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/billing_preferences`
  Future<ApiResponse<views.OrderBillingPreferences>> getOrderBillingPreferences(
    Object orderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderBillingPreferences(
        client,
        orderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/orders/{order_id}/billing_preferences`
  Future<ApiResponse<views.OrderRead>> updateOrderBillingPreferences(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateOrderBillingPreferences(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PUT /api/{api_version}/orders/{order_id}/billing_preferences`
  Future<ApiResponse<views.OrderRead>> replaceOrderBillingPreferences(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.replaceOrderBillingPreferences(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/cancel`
  Future<ApiResponse<views.OrderRead>> cancelOrder(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.cancelOrder(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/change`
  Future<ApiResponse<views.OrderRead>> changeOrder(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.changeOrder(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/convert_to_order`
  Future<ApiResponse<views.OrderRead>> createOrderConvertToOrder(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createOrderConvertToOrder(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/custom_objects`
  Future<ApiResponse<views.AccountOrders>> getOrderCustomObjects(
    Object orderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderCustomObjects(
        client,
        orderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/custom_objects_instances`
  Future<ApiResponse<views.AccountOrders>> getOrderCustomObjectsInstances(
    Object orderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderCustomObjectsInstances(
        client,
        orderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/discard_draft`
  Future<ApiResponse<views.OrderDiscardDraft>> createOrderDiscardDraft(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createOrderDiscardDraft(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/extend_trial`
  Future<ApiResponse<views.OrderExtendTrial>> createOrderExtendTrial(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createOrderExtendTrial(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/information`
  Future<ApiResponse<views.OrderInformation>> getOrderInformation(
    Object orderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderInformation(
        client,
        orderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/orders/{order_id}/information`
  Future<ApiResponse<views.OrderRead>> updateOrderInformation(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateOrderInformation(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/item_fulfillments`
  Future<ApiResponse<views.AccountOrders>> getOrderItemFulfillments(
    Object orderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderItemFulfillments(
        client,
        orderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/lines`
  Future<ApiResponse<views.OrderLines>> getOrderLines(
    Object orderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderLines(
        client,
        orderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/notes`
  Future<ApiResponse<views.OrderNoteList>> getOrderNotes(
    Object orderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderNotes(
        client,
        orderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/notes`
  Future<ApiResponse<views.OrderNoteView>> createOrderNote(
    Object orderId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createOrderNote(
        client,
        orderId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/payment_methods`
  Future<ApiResponse<views.OrderPaymentMethods>> getOrderPaymentMethods(
    Object orderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderPaymentMethods(
        client,
        orderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/pdf`
  Future<ApiResponse<views.OrderPdf>> getOrderPdf(
    Object orderId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderPdf(
        client,
        orderId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/reactivate`
  Future<ApiResponse<views.OrderRead>> reactivateOrder(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.reactivateOrder(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/relinquish`
  Future<ApiResponse<views.OrderRead>> createOrderRelinquish(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createOrderRelinquish(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/orders/{order_id}/lines/{line_uuid}`
  Future<ApiResponse<views.OrderRead>> updateOrderLine(
    Object orderId,
    Object lineUuid,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateOrderLine(
        client,
        orderId,
        lineUuid,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/lines/{line_uuid}`
  Future<ApiResponse<views.OrderLine>> getOrderLine(
    Object orderId,
    Object lineUuid, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderLine(
        client,
        orderId,
        lineUuid,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/orders/{order_id}/notes/{order_note_id}`
  Future<ApiResponse<Object?>> deleteOrderNote(
    Object orderId,
    Object orderNoteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteOrderNote(
        client,
        orderId,
        orderNoteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/notes/{order_note_id}`
  Future<ApiResponse<views.OrderNoteView>> getOrderNote(
    Object orderId,
    Object orderNoteId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderNote(
        client,
        orderId,
        orderNoteId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/orders/{order_id}/notes/{order_note_id}`
  Future<ApiResponse<views.OrderNoteView>> updateOrderNote(
    Object orderId,
    Object orderNoteId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateOrderNote(
        client,
        orderId,
        orderNoteId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/payment_methods/{payment_method_ref}`
  Future<ApiResponse<views.OrderPaymentMethod>> getOrderPaymentMethod(
    Object orderId,
    Object paymentMethodRef, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderPaymentMethod(
        client,
        orderId,
        paymentMethodRef,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/orders/{order_id}/lines/{line_uuid}/billing_preferences`
  Future<ApiResponse<views.OrderRead>> updateOrderLineBillingPreferences(
    Object orderId,
    Object lineUuid,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateOrderLineBillingPreferences(
        client,
        orderId,
        lineUuid,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PUT /api/{api_version}/orders/{order_id}/lines/{line_uuid}/billing_preferences`
  Future<ApiResponse<views.OrderRead>> replaceOrderLineBillingPreferences(
    Object orderId,
    Object lineUuid,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.replaceOrderLineBillingPreferences(
        client,
        orderId,
        lineUuid,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/notes/{order_note_id}/files`
  Future<ApiResponse<views.OrderNoteFileList>> getOrderNoteFiles(
    Object orderId,
    Object orderNoteId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderNoteFiles(
        client,
        orderId,
        orderNoteId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/notes/{order_note_id}/files/{order_file_id}`
  Future<ApiResponse<views.OrderNoteFile>> getOrderNoteFile(
    Object orderId,
    Object orderNoteId,
    Object orderFileId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderNoteFile(
        client,
        orderId,
        orderNoteId,
        orderFileId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/notes`
  Future<ApiResponse<views.OrderNoteList>> getOrdersNotes({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrdersNotes(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/preview`
  Future<ApiResponse<Object?>> previewOrder(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.previewOrder(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/express`
  Future<ApiResponse<Object?>> createOrderExpress(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createOrderExpress(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/accept`
  Future<ApiResponse<Object?>> acceptOrder(
    Object orderId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.acceptOrder(
        client,
        orderId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/activate_invoice_from_dormant/{invoice_uuid}`
  Future<ApiResponse<Object?>> activateOrderInvoiceFromDormant(
    Object orderId,
    Object invoiceUuid,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.activateOrderInvoiceFromDormant(
        client,
        orderId,
        invoiceUuid,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/change/preview`
  Future<ApiResponse<views.OrderRead>> previewOrderChange(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.previewOrderChange(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/change_status`
  Future<ApiResponse<Object?>> changeOrderStatus(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.changeOrderStatus(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/contract_adjustment`
  Future<ApiResponse<Object?>> adjustOrderContract(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.adjustOrderContract(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/contract_adjustment/preview`
  Future<ApiResponse<Object?>> previewOrderContractAdjustment(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.previewOrderContractAdjustment(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/downgrade`
  Future<ApiResponse<Object?>> downgradeOrder(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.downgradeOrder(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/downgrade/preview`
  Future<ApiResponse<Object?>> previewOrderDowngrade(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.previewOrderDowngrade(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/upgrade`
  Future<ApiResponse<Object?>> upgradeOrder(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.upgradeOrder(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/upgrade/preview`
  Future<ApiResponse<Object?>> previewOrderUpgrade(
    Object orderId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.previewOrderUpgrade(
        client,
        orderId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/orders/{order_id}/terminate_trial`
  Future<ApiResponse<Object?>> terminateOrderTrial(
    Object orderId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.terminateOrderTrial(
        client,
        orderId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/orders/{order_id}/notes/{order_note_id}/files/{order_file_id}`
  Future<ApiResponse<Object?>> deleteOrderNoteFile(
    Object orderId,
    Object orderNoteId,
    Object orderFileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteOrderNoteFile(
        client,
        orderId,
        orderNoteId,
        orderFileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/custom_objects/{custom_object_id}`
  Future<ApiResponse<views.OrderCustomObject>> getOrderCustomObject(
    Object orderId,
    Object customObjectId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderCustomObject(
        client,
        orderId,
        customObjectId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/custom_objects/{custom_object_id}/instances/{instance_id}`
  Future<ApiResponse<Object?>> getOrderCustomObjectInstance(
    Object orderId,
    Object customObjectId,
    Object instanceId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderCustomObjectInstance(
        client,
        orderId,
        customObjectId,
        instanceId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/custom_objects_instances/{custom_object_id}`
  Future<ApiResponse<views.OrderCustomObject>> getOrderCustomObjectsInstance(
    Object orderId,
    Object customObjectId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderCustomObjectsInstance(
        client,
        orderId,
        customObjectId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/custom_objects_instances/{custom_object_id}/instances/{instance_id}`
  Future<ApiResponse<Object?>> getOrderCustomObjectsInstanceInstance(
    Object orderId,
    Object customObjectId,
    Object instanceId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderCustomObjectsInstanceInstance(
        client,
        orderId,
        customObjectId,
        instanceId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/item_fulfillments/{fulfillment_id}`
  Future<ApiResponse<views.OrderItemFulfillment>> getOrderItemFulfillment(
    Object orderId,
    Object fulfillmentId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderItemFulfillment(
        client,
        orderId,
        fulfillmentId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/kpis`
  Future<ApiResponse<views.OrderKpis>> getOrderKpis(
    Object orderId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderKpis(
        client,
        orderId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/payments/{payment_id}`
  Future<ApiResponse<views.OrderPayment>> getOrderPayment(
    Object orderId,
    Object paymentId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderPayment(
        client,
        orderId,
        paymentId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/orders/{order_id}/quote_partial_invoices`
  Future<ApiResponse<views.OrderQuotePartialInvoices>>
      getOrderQuotePartialInvoices(
    Object orderId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getOrderQuotePartialInvoices(
            client,
            orderId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/orders/{order_id}/shipping_pdf/{shipping_line_id}`
  Future<ApiResponse<Object?>> getOrderShippingPdf(
    Object orderId,
    Object shippingLineId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getOrderShippingPdf(
        client,
        orderId,
        shippingLineId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
