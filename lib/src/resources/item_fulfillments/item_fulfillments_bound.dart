/// The v4 item fulfillments endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'item_fulfillments.dart' as endpoints;
import 'item_fulfillments_dto.dart' as views;

/// The item fulfillments endpoints with [client] already applied.
class ItemFulfillmentsResource {
  /// Bind the resource to a client; normally reached via `client.itemFulfillments`.
  const ItemFulfillmentsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/item_fulfillments`
  Future<ApiResponse<views.ItemFulfillmentList>> getItemFulfillments({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemFulfillments(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/item_fulfillments`
  Future<ApiResponse<views.ItemFulfillments>> createItemFulfillment(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createItemFulfillment(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/item_fulfillments/{fulfillment_id}`
  Future<ApiResponse<views.ItemFulfillmentRead>> getItemFulfillment(
    Object fulfillmentId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemFulfillment(
        client,
        fulfillmentId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/item_fulfillments/{fulfillment_id}`
  Future<ApiResponse<views.ItemFulfillmentUpdated>> updateItemFulfillment(
    Object fulfillmentId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateItemFulfillment(
        client,
        fulfillmentId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/item_fulfillments/{fulfillment_id}/notes`
  Future<ApiResponse<views.ItemFulfillmentNotes>> createItemFulfillmentNote(
    Object fulfillmentId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createItemFulfillmentNote(
        client,
        fulfillmentId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/item_fulfillments/{fulfillment_id}`
  Future<ApiResponse<Object?>> deleteItemFulfillment(
    Object fulfillmentId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteItemFulfillment(
        client,
        fulfillmentId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/item_fulfillments/{fulfillment_id}/notes`
  Future<ApiResponse<views.ItemFulfillmentNoteList>> getItemFulfillmentNotes(
    Object fulfillmentId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemFulfillmentNotes(
        client,
        fulfillmentId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/item_fulfillments/{fulfillment_id}/notes/{note_id}`
  Future<ApiResponse<views.ItemFulfillmentNoteRead>> getItemFulfillmentNote(
    Object fulfillmentId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemFulfillmentNote(
        client,
        fulfillmentId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/item_fulfillments/{fulfillment_id}/notes/{note_id}`
  Future<ApiResponse<Object?>> deleteItemFulfillmentNote(
    Object fulfillmentId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteItemFulfillmentNote(
        client,
        fulfillmentId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
