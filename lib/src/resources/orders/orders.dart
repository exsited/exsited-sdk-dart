/// The v4 orders endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../../errors.dart';
import 'orders_dto.dart';
import 'orders_urls.dart';

/// `GET /api/{api_version}/orders`
Future<ApiResponse<OrderList>> getOrders(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orders,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderList.fromMap);

/// `POST /api/{api_version}/orders`
///
/// Answered `201`. A contract needs a recurring or metered item on a line.
Future<ApiResponse<OrderRead>> createOrder(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orders,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `GET /api/{api_version}/orders/{order_id}`
Future<ApiResponse<OrderRead>> getOrder(
  ExsitedClient client,
  Object orderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.order,
        pathParams: {'order_id': orderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `DELETE /api/{api_version}/orders/{order_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteOrder(
  ExsitedClient client,
  Object orderId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(OrdersUrls.order,
        pathParams: {'order_id': orderId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/orders/{order_id}/activate`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> activateOrder(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderActivate,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/orders/{order_id}/activate_draft`
Future<ApiResponse<OrderRead>> createOrderActivateDraft(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderActivateDraft,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/billing_preferences`
Future<ApiResponse<OrderBillingPreferences>> getOrderBillingPreferences(
  ExsitedClient client,
  Object orderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderBillingPreferences,
        pathParams: {'order_id': orderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderBillingPreferences.fromMap);

/// `PATCH /api/{api_version}/orders/{order_id}/billing_preferences`
Future<ApiResponse<OrderRead>> updateOrderBillingPreferences(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(OrdersUrls.orderBillingPreferences,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `PUT /api/{api_version}/orders/{order_id}/billing_preferences`
Future<ApiResponse<OrderRead>> replaceOrderBillingPreferences(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPutRequest(OrdersUrls.orderBillingPreferences,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `POST /api/{api_version}/orders/{order_id}/cancel`
Future<ApiResponse<OrderRead>> cancelOrder(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderCancel,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `POST /api/{api_version}/orders/{order_id}/change`
Future<ApiResponse<OrderRead>> changeOrder(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderChange,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `POST /api/{api_version}/orders/{order_id}/convert_to_order`
Future<ApiResponse<OrderRead>> createOrderConvertToOrder(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderConvertToOrder,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/custom_objects`
Future<ApiResponse<AccountOrders>> getOrderCustomObjects(
  ExsitedClient client,
  Object orderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderCustomObjects,
        pathParams: {'order_id': orderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountOrders.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/custom_objects_instances`
Future<ApiResponse<AccountOrders>> getOrderCustomObjectsInstances(
  ExsitedClient client,
  Object orderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderCustomObjectsInstances,
        pathParams: {'order_id': orderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountOrders.fromMap);

/// `POST /api/{api_version}/orders/{order_id}/discard_draft`
Future<ApiResponse<OrderDiscardDraft>> createOrderDiscardDraft(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderDiscardDraft,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderDiscardDraft.fromMap);

/// `POST /api/{api_version}/orders/{order_id}/extend_trial`
///
/// The new trial window must start after the current trial ends.
Future<ApiResponse<OrderExtendTrial>> createOrderExtendTrial(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderExtendTrial,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderExtendTrial.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/information`
Future<ApiResponse<OrderInformation>> getOrderInformation(
  ExsitedClient client,
  Object orderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderInformation,
        pathParams: {'order_id': orderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderInformation.fromMap);

/// `PATCH /api/{api_version}/orders/{order_id}/information`
Future<ApiResponse<OrderRead>> updateOrderInformation(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(OrdersUrls.orderInformation,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/item_fulfillments`
Future<ApiResponse<AccountOrders>> getOrderItemFulfillments(
  ExsitedClient client,
  Object orderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderItemFulfillments,
        pathParams: {'order_id': orderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountOrders.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/lines`
Future<ApiResponse<OrderLines>> getOrderLines(
  ExsitedClient client,
  Object orderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderLines,
        pathParams: {'order_id': orderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderLines.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/notes`
Future<ApiResponse<OrderNoteList>> getOrderNotes(
  ExsitedClient client,
  Object orderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderNotes,
        pathParams: {'order_id': orderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderNoteList.fromMap);

/// `POST /api/{api_version}/orders/{order_id}/notes`
///
/// Sent as a form, the text as the `note` field, and as multipart with any
/// [files] beside it: the endpoint reads no JSON body.
Future<ApiResponse<OrderNoteView>> createOrderNote(
  ExsitedClient client,
  Object orderId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPostRequest(OrdersUrls.orderNotes,
      pathParams: {'order_id': orderId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: OrderNoteView.fromMap);
}

/// `GET /api/{api_version}/orders/{order_id}/payment_methods`
Future<ApiResponse<OrderPaymentMethods>> getOrderPaymentMethods(
  ExsitedClient client,
  Object orderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderPaymentMethods,
        pathParams: {'order_id': orderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderPaymentMethods.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/pdf`
Future<ApiResponse<OrderPdf>> getOrderPdf(
  ExsitedClient client,
  Object orderId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderPdf,
        pathParams: {'order_id': orderId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderPdf.fromMap);

/// `POST /api/{api_version}/orders/{order_id}/reactivate`
Future<ApiResponse<OrderRead>> reactivateOrder(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderReactivate,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `POST /api/{api_version}/orders/{order_id}/relinquish`
Future<ApiResponse<OrderRead>> createOrderRelinquish(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderRelinquish,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `PATCH /api/{api_version}/orders/{order_id}/lines/{line_uuid}`
Future<ApiResponse<OrderRead>> updateOrderLine(
  ExsitedClient client,
  Object orderId,
  Object lineUuid,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(OrdersUrls.orderLine,
        pathParams: {'order_id': orderId, 'line_uuid': lineUuid},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/lines/{line_uuid}`
Future<ApiResponse<OrderLine>> getOrderLine(
  ExsitedClient client,
  Object orderId,
  Object lineUuid, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderLine,
        pathParams: {'order_id': orderId, 'line_uuid': lineUuid},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderLine.fromMap);

/// `DELETE /api/{api_version}/orders/{order_id}/notes/{order_note_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteOrderNote(
  ExsitedClient client,
  Object orderId,
  Object orderNoteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(OrdersUrls.orderNote,
        pathParams: {'order_id': orderId, 'order_note_id': orderNoteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/orders/{order_id}/notes/{order_note_id}`
Future<ApiResponse<OrderNoteView>> getOrderNote(
  ExsitedClient client,
  Object orderId,
  Object orderNoteId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderNote,
        pathParams: {'order_id': orderId, 'order_note_id': orderNoteId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderNoteView.fromMap);

/// `PATCH /api/{api_version}/orders/{order_id}/notes/{order_note_id}`
///
/// Sent as a form, the text as the `note` field, and as multipart with any
/// [files] beside it: the endpoint reads no JSON body.
Future<ApiResponse<OrderNoteView>> updateOrderNote(
  ExsitedClient client,
  Object orderId,
  Object orderNoteId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPatchRequest(OrdersUrls.orderNote,
      pathParams: {'order_id': orderId, 'order_note_id': orderNoteId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: OrderNoteView.fromMap);
}

/// `GET /api/{api_version}/orders/{order_id}/payment_methods/{payment_method_ref}`
Future<ApiResponse<OrderPaymentMethod>> getOrderPaymentMethod(
  ExsitedClient client,
  Object orderId,
  Object paymentMethodRef, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderPaymentMethod,
        pathParams: {
          'order_id': orderId,
          'payment_method_ref': paymentMethodRef
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderPaymentMethod.fromMap);

/// `PATCH /api/{api_version}/orders/{order_id}/lines/{line_uuid}/billing_preferences`
Future<ApiResponse<OrderRead>> updateOrderLineBillingPreferences(
  ExsitedClient client,
  Object orderId,
  Object lineUuid,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(OrdersUrls.orderLineBillingPreferences,
        pathParams: {'order_id': orderId, 'line_uuid': lineUuid},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `PUT /api/{api_version}/orders/{order_id}/lines/{line_uuid}/billing_preferences`
Future<ApiResponse<OrderRead>> replaceOrderLineBillingPreferences(
  ExsitedClient client,
  Object orderId,
  Object lineUuid,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPutRequest(OrdersUrls.orderLineBillingPreferences,
        pathParams: {'order_id': orderId, 'line_uuid': lineUuid},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/notes/{order_note_id}/files`
Future<ApiResponse<OrderNoteFileList>> getOrderNoteFiles(
  ExsitedClient client,
  Object orderId,
  Object orderNoteId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderNoteFiles,
        pathParams: {'order_id': orderId, 'order_note_id': orderNoteId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderNoteFileList.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/notes/{order_note_id}/files/{order_file_id}`
Future<ApiResponse<OrderNoteFile>> getOrderNoteFile(
  ExsitedClient client,
  Object orderId,
  Object orderNoteId,
  Object orderFileId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderNoteFile,
        pathParams: {
          'order_id': orderId,
          'order_note_id': orderNoteId,
          'order_file_id': orderFileId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderNoteFile.fromMap);

/// `GET /api/{api_version}/orders/notes`
///
/// List the notes of every order; not scoped to one order.
Future<ApiResponse<OrderNoteList>> getOrdersNotes(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.ordersNotes,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderNoteList.fromMap);

/// `POST /api/{api_version}/orders/preview`
///
/// Price an order without creating it, the `createOrder` body; `201`, with no
/// cart data in the answer. An `account` object still creates that account.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> previewOrder(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.ordersPreview,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/orders/express`
///
/// Create an order, and its invoice and payment if the body nests them, in one
/// call, the `createExpress` body under `account`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createOrderExpress(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.ordersExpress,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/orders/{order_id}/accept`
///
/// Accept an order's pending acceptance; no body sent. It raises an invoice and
/// may require payment.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> acceptOrder(
  ExsitedClient client,
  Object orderId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderAccept,
        pathParams: {'order_id': orderId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/orders/{order_id}/activate_invoice_from_dormant/{invoice_uuid}`
///
/// Activate a dormant invoice, body under `activate`: `due_date`, `amount`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> activateOrderInvoiceFromDormant(
  ExsitedClient client,
  Object orderId,
  Object invoiceUuid,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderActivateInvoiceFromDormant,
        pathParams: {'order_id': orderId, 'invoice_uuid': invoiceUuid},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/orders/{order_id}/change/preview`
///
/// Preview a change, the `changeOrder` body; nothing is changed, and the answer
/// is the order as it stands.
Future<ApiResponse<OrderRead>> previewOrderChange(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderChangePreview,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderRead.fromMap);

/// `POST /api/{api_version}/orders/{order_id}/change_status`
///
/// Trigger a workflow state, body `order.workflow_status`; it runs the
/// workflow's connections.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> changeOrderStatus(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderChangeStatus,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/orders/{order_id}/contract_adjustment`
///
/// Upgrade or downgrade by package rank; the body is not wrapped:
/// `effective_date` and `lines`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> adjustOrderContract(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderContractAdjustment,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/orders/{order_id}/contract_adjustment/preview`
///
/// Preview a contract adjustment, the `adjustOrderContract` body, not wrapped.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> previewOrderContractAdjustment(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderContractAdjustmentPreview,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/orders/{order_id}/downgrade`
///
/// Downgrade a contract; the body is not wrapped: `effective_date` and `lines`
/// naming each `charge_item_uuid` and `package_name`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> downgradeOrder(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderDowngrade,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/orders/{order_id}/downgrade/preview`
///
/// Preview a downgrade, the `downgradeOrder` body, not wrapped.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> previewOrderDowngrade(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderDowngradePreview,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/orders/{order_id}/upgrade`
///
/// Upgrade a contract; the body is not wrapped: `effective_date` and `lines`
/// naming each `charge_item_uuid` and `package_name`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> upgradeOrder(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderUpgrade,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/orders/{order_id}/upgrade/preview`
///
/// Preview an upgrade, the `upgradeOrder` body, not wrapped.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> previewOrderUpgrade(
  ExsitedClient client,
  Object orderId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderUpgradePreview,
        pathParams: {'order_id': orderId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/orders/{order_id}/terminate_trial`
///
/// End a contract's trial now; no body sent. It starts the contract.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> terminateOrderTrial(
  ExsitedClient client,
  Object orderId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrdersUrls.orderTerminateTrial,
        pathParams: {'order_id': orderId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/orders/{order_id}/notes/{order_note_id}/files/{order_file_id}`
///
/// Delete a note attachment; `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteOrderNoteFile(
  ExsitedClient client,
  Object orderId,
  Object orderNoteId,
  Object orderFileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(OrdersUrls.orderNoteFile,
        pathParams: {
          'order_id': orderId,
          'order_note_id': orderNoteId,
          'order_file_id': orderFileId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/orders/{order_id}/custom_objects/{custom_object_id}`
///
/// One custom object with the order's instances of it.
Future<ApiResponse<OrderCustomObject>> getOrderCustomObject(
  ExsitedClient client,
  Object orderId,
  Object customObjectId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderCustomObject,
        pathParams: {'order_id': orderId, 'custom_object_id': customObjectId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderCustomObject.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/custom_objects/{custom_object_id}/instances/{instance_id}`
///
/// One custom object instance.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getOrderCustomObjectInstance(
  ExsitedClient client,
  Object orderId,
  Object customObjectId,
  Object instanceId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderCustomObjectInstance,
        pathParams: {
          'order_id': orderId,
          'custom_object_id': customObjectId,
          'instance_id': instanceId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/orders/{order_id}/custom_objects_instances/{custom_object_id}`
///
/// The server's alias of `getOrderCustomObject`.
Future<ApiResponse<OrderCustomObject>> getOrderCustomObjectsInstance(
  ExsitedClient client,
  Object orderId,
  Object customObjectId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderCustomObjectsInstance,
        pathParams: {'order_id': orderId, 'custom_object_id': customObjectId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderCustomObject.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/custom_objects_instances/{custom_object_id}/instances/{instance_id}`
///
/// The server's alias of `getOrderCustomObjectInstance`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getOrderCustomObjectsInstanceInstance(
  ExsitedClient client,
  Object orderId,
  Object customObjectId,
  Object instanceId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderCustomObjectsInstanceInstance,
        pathParams: {
          'order_id': orderId,
          'custom_object_id': customObjectId,
          'instance_id': instanceId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/orders/{order_id}/item_fulfillments/{fulfillment_id}`
///
/// One fulfillment; the server does not check that the fulfillment belongs to
/// the order.
Future<ApiResponse<OrderItemFulfillment>> getOrderItemFulfillment(
  ExsitedClient client,
  Object orderId,
  Object fulfillmentId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderItemFulfillment,
        pathParams: {'order_id': orderId, 'fulfillment_id': fulfillmentId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderItemFulfillment.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/kpis`
///
/// An order's KPIs, under `order_kpis`.
Future<ApiResponse<OrderKpis>> getOrderKpis(
  ExsitedClient client,
  Object orderId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderKpis,
        pathParams: {'order_id': orderId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderKpis.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/payments/{payment_id}`
///
/// One payment; the server does not check that the payment belongs to the
/// order.
Future<ApiResponse<OrderPayment>> getOrderPayment(
  ExsitedClient client,
  Object orderId,
  Object paymentId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderPayment,
        pathParams: {'order_id': orderId, 'payment_id': paymentId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderPayment.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/quote_partial_invoices`
///
/// The deposit and instalment invoices of a converted quote; an unconverted
/// quote answers `400`.
Future<ApiResponse<OrderQuotePartialInvoices>> getOrderQuotePartialInvoices(
  ExsitedClient client,
  Object orderId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderQuotePartialInvoices,
        pathParams: {'order_id': orderId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: OrderQuotePartialInvoices.fromMap);

/// `GET /api/{api_version}/orders/{order_id}/shipping_pdf/{shipping_line_id}`
///
/// A shipping line's PDF; `404` until the line has a generated shipping PDF.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getOrderShippingPdf(
  ExsitedClient client,
  Object orderId,
  Object shippingLineId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrdersUrls.orderShippingPdf,
        pathParams: {'order_id': orderId, 'shipping_line_id': shippingLineId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
