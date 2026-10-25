/// The v4 item fulfillments endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../../errors.dart';
import 'item_fulfillments_dto.dart';
import 'item_fulfillments_urls.dart';

/// `GET /api/{api_version}/item_fulfillments`
Future<ApiResponse<ItemFulfillmentList>> getItemFulfillments(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemFulfillmentsUrls.itemFulfillments,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemFulfillmentList.fromMap);

/// `POST /api/{api_version}/item_fulfillments`
Future<ApiResponse<ItemFulfillments>> createItemFulfillment(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ItemFulfillmentsUrls.itemFulfillments,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemFulfillments.fromMap);

/// `GET /api/{api_version}/item_fulfillments/{fulfillment_id}`
Future<ApiResponse<ItemFulfillmentRead>> getItemFulfillment(
  ExsitedClient client,
  Object fulfillmentId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemFulfillmentsUrls.itemFulfillment,
        pathParams: {'fulfillment_id': fulfillmentId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemFulfillmentRead.fromMap);

/// `PATCH /api/{api_version}/item_fulfillments/{fulfillment_id}`
Future<ApiResponse<ItemFulfillmentUpdated>> updateItemFulfillment(
  ExsitedClient client,
  Object fulfillmentId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ItemFulfillmentsUrls.itemFulfillment,
        pathParams: {'fulfillment_id': fulfillmentId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemFulfillmentUpdated.fromMap);

/// `POST /api/{api_version}/item_fulfillments/{fulfillment_id}/notes`
///
/// Sent as a form, the text as the `note` field, and as multipart with any
/// [files] beside it: the endpoint reads no JSON body.
Future<ApiResponse<ItemFulfillmentNotes>> createItemFulfillmentNote(
  ExsitedClient client,
  Object fulfillmentId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPostRequest(ItemFulfillmentsUrls.itemFulfillmentNotes,
      pathParams: {'fulfillment_id': fulfillmentId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: ItemFulfillmentNotes.fromMap);
}

/// `DELETE /api/{api_version}/item_fulfillments/{fulfillment_id}`
///
/// Delete fulfillment, by its `ifm_` id; refused `400` `stock_committed` once
/// any of its stock has been sent.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteItemFulfillment(
  ExsitedClient client,
  Object fulfillmentId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ItemFulfillmentsUrls.itemFulfillment,
        pathParams: {'fulfillment_id': fulfillmentId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/item_fulfillments/{fulfillment_id}/notes`
///
/// List fulfillment notes; the notes of the fulfillment's sale invoice, which
/// is where `createItemFulfillmentNote` puts them.
Future<ApiResponse<ItemFulfillmentNoteList>> getItemFulfillmentNotes(
  ExsitedClient client,
  Object fulfillmentId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemFulfillmentsUrls.itemFulfillmentNotes,
        pathParams: {'fulfillment_id': fulfillmentId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemFulfillmentNoteList.fromMap);

/// `GET /api/{api_version}/item_fulfillments/{fulfillment_id}/notes/{note_id}`
///
/// Get one fulfillment note, answered under `item_fulfillment.note`.
Future<ApiResponse<ItemFulfillmentNoteRead>> getItemFulfillmentNote(
  ExsitedClient client,
  Object fulfillmentId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemFulfillmentsUrls.itemFulfillmentNote,
        pathParams: {'fulfillment_id': fulfillmentId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemFulfillmentNoteRead.fromMap);

/// `DELETE /api/{api_version}/item_fulfillments/{fulfillment_id}/notes/{note_id}`
///
/// Delete fulfillment note, `ifm_` and `note_` ids; it looks on the
/// fulfillment, where the create never puts one.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteItemFulfillmentNote(
  ExsitedClient client,
  Object fulfillmentId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ItemFulfillmentsUrls.itemFulfillmentNote,
        pathParams: {'fulfillment_id': fulfillmentId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
