/// The v4 item endpoints, one function per endpoint taking the client first.
///
/// Items sort with `order_by` + `direction`, not the account family's `sort`,
/// which is accepted and silently ignored here; [sortParams] builds the pair.
/// 20 documented `filter_<field>` names are refused by the API because they
/// address a nested field; [itemFilterParam] refuses them locally.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../../errors.dart';
import '../../http/query_params.dart';
import 'items_dto.dart';
import 'items_urls.dart';

/// Build a `filter_*` parameter name, refusing one the API rejects.
///
/// The same construction as [filterParam] - `filter_<field>` for equality and
/// `filter_<field>_<operator>` otherwise - with one addition: a field in
/// [ItemsUrls.deprecatedFilters] throws here rather than costing a request to be told the
/// syntax is deprecated.
///
/// Throws [SdkUsageError] for a rejected field or an unknown operator.
String itemFilterParam(String field, [String operator = 'eq']) {
  if (ItemsUrls.deprecatedFilters.contains(field)) {
    throw SdkUsageError(
      "filter field '$field': the API answers 400 'Filter syntax deprecated "
      "bracket' for this one, because it addresses a field inside a nested block "
      'rather than a top-level item field. Use the \'filter\' expression '
      'parameter instead, e.g. '
      '{\'filter\': "items/sale(pricing/latest_used_pricing_version) eq \'1\'"} '
      '- see getItems.',
    );
  }
  return filterParam(field, operator);
}

/// Build this family's sort parameters.
///
/// **Items sort with two parameters, not one.** Where an account listing takes
/// `sort: '-created_on'`, an item listing takes `order_by: 'created_on'` and
/// `direction: 'desc'`. [sortParam] builds the account spelling and does not apply
/// here; passing it to an item listing is accepted and silently ignored.
Map<String, Object?> sortParams(String field, {bool descending = false}) {
  if (field.trim().isEmpty) {
    throw SdkUsageError(
        "sort field: expected a name like 'created_on', got '$field'");
  }
  return {
    'order_by': field.trim(),
    'direction': descending ? 'desc' : 'asc',
  };
}

/// `GET /api/v4/items` - list items, filtered, sorted and paged.
///
/// Four parameters control the listing: `limit`, `cursor`, and the `order_by` +
/// `direction` pair - build the last two with [sortParams]. Everything else is a
/// filter: top-level fields take `filter_<field>` (build with [itemFilterParam]);
/// nested fields take the single `filter` expression, e.g.
/// `{'filter': "items/sale(pricing/latest_used_pricing_version) eq '1'"}`.
Future<ApiResponse<ItemList>> getItems(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.items,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemList.fromMap);

/// `GET /api/v4/items/{item_id}` - retrieve one item.
///
/// [itemId] is the item's `id` as a listing returns it - `"ITEM-0001"`. **Not**
/// the `uuid`, and not the int id the sale, purchase and inventories reads hand
/// back.
Future<ApiResponse<Item>> getItem(
  ExsitedClient client,
  Object itemId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.item,
        pathParams: {'item_id': itemId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `GET /api/v4/items/{item_id}/information` - the item's core information.
Future<ApiResponse<Item>> getItemInformation(
  ExsitedClient client,
  Object itemId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.itemInformation,
        pathParams: {'item_id': itemId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `POST /api/v4/items` - create an item.
///
/// `{"item": {"type": "STANDARD", "name": "Widget"}}` is the minimum that
/// works. An unknown `group` is a `400` with code
/// `internal_error` and the message `"Invalid group"` - a validation failure
/// wearing a server fault's name.
Future<ApiResponse<Item>> createItem(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ItemsUrls.items,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `PATCH /api/v4/items/{item_id}/information` - update core information. Partial.
Future<ApiResponse<Item>> updateItemInformation(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ItemsUrls.itemInformation,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `POST /api/v4/items/{item_id}/deactivate` - deactivate an item. Takes no body.
///
/// The API answers 500.
Future<ApiResponse<Item>> deactivateItem(
  ExsitedClient client,
  Object itemId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ItemsUrls.itemDeactivate,
        pathParams: {'item_id': itemId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `POST /api/v4/items/{item_id}/reactivate` - reactivate an item. Takes no body.
///
/// The API answers 500.
Future<ApiResponse<Item>> reactivateItem(
  ExsitedClient client,
  Object itemId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ItemsUrls.itemReactivate,
        pathParams: {'item_id': itemId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `DELETE /api/v4/items/{item_id}` - delete an item.
///
/// A **409** with code `internal_error` means the item is referenced - *"All
/// Orders with this Item need to be deleted"*. A business rule, not a server fault
/// despite the code, and not retryable.
Future<ApiResponse<Object?>> deleteItem(
  ExsitedClient client,
  Object itemId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ItemsUrls.item,
        pathParams: {'item_id': itemId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/v4/items/{item_id}/image` - set the item's image.
///
/// `{"image_base64": "..."}` at the **top level** - the one write in this family
/// with no `item` envelope. The API answers 500.
Future<ApiResponse<Item>> uploadItemImage(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ItemsUrls.itemImage,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `GET /api/v4/items/{item_id}/sale` - the item's sale configuration.
///
/// **A stub, not the item**: `{"item": {"id": 2, "name": "...", "sale": {...}}}`,
/// and `id` is an **int**, not the String code the path took.
Future<ApiResponse<ItemSaleView>> getItemSale(
  ExsitedClient client,
  Object itemId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.itemSale,
        pathParams: {'item_id': itemId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemSaleView.fromMap);

/// `POST /api/v4/items/{item_id}/sale` - create the sale configuration.
///
/// `{"item": {"sale": {...}, "currencies": [...]}}`. Answers `409 already_exists`
/// when the item already has one.
Future<ApiResponse<Item>> createItemSale(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ItemsUrls.itemSale,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `PATCH /api/v4/items/{item_id}/sale` - update the sale configuration. Partial.
Future<ApiResponse<Item>> updateItemSale(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ItemsUrls.itemSale,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `GET /api/v4/items/{item_id}/purchase` - a **stub**, as the sale read is.
Future<ApiResponse<ItemPurchaseView>> getItemPurchase(
  ExsitedClient client,
  Object itemId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.itemPurchase,
        pathParams: {'item_id': itemId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemPurchaseView.fromMap);

/// `POST /api/v4/items/{item_id}/purchase` - answers `409 already_exists` if one exists.
Future<ApiResponse<Item>> createItemPurchase(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ItemsUrls.itemPurchase,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `PATCH /api/v4/items/{item_id}/purchase` - update the purchase configuration.
Future<ApiResponse<Item>> updateItemPurchase(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ItemsUrls.itemPurchase,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `GET /api/v4/items/{item_id}/inventories` - configuration and stock.
///
/// A **stub** under `item`, whose `id` is the String code the path took, unlike
/// the sale and purchase reads. The per-warehouse quantities inside are numbers,
/// each beside a `_value` twin that is a String.
Future<ApiResponse<ItemInventoriesView>> getItemInventories(
  ExsitedClient client,
  Object itemId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.itemInventories,
        pathParams: {'item_id': itemId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemInventoriesView.fromMap);

/// `PATCH /api/v4/items/{item_id}/inventories` - update the inventory configuration.
///
/// The write spells warehouse management `warehouse_enabled` where the read
/// returns `enable_warehouse_management`. Turning inventory off once stock exists
/// is refused with `400 "Unable to disable Inventory Management"`.
Future<ApiResponse<Item>> updateItemInventories(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ItemsUrls.itemInventories,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `POST /api/v4/items/{item_id}/inventory/add` - add stock to a warehouse.
///
/// The path segment is `inventory`, singular. The warehouse is keyed `name`
/// in the body and `warehouse` on the read side. The API answers
/// `400 validation_error`.
Future<ApiResponse<Item>> addItemInventory(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ItemsUrls.itemInventoryAdd,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `GET /api/v4/items/{item_id}/inventory_adjustments` - the item's stock movements.
///
/// **Every quantity on these records is a String** - `"79999"`, not `79999` - the
/// opposite of what [getItemInventories] returns for the same names.
Future<ApiResponse<InventoryAdjustmentList>> getItemInventoryAdjustments(
  ExsitedClient client,
  Object itemId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.itemInventoryAdjustments,
        pathParams: {'item_id': itemId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: InventoryAdjustmentList.fromMap);

/// `GET /api/v4/items/{item_id}/warehouses/{warehouse_name}/inventories` - one warehouse's stock.
///
/// [warehouseName] is the warehouse **name**, not an id - the one slot in this
/// family that takes a name. A 404 names it, e.g. *"warehouse 'BareHouse' not
/// found"*.
Future<ApiResponse<ItemInventoriesView>> getItemWarehouseInventories(
  ExsitedClient client,
  Object itemId,
  Object warehouseName, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.itemWarehouseInventories,
        pathParams: {'item_id': itemId, 'warehouse_name': warehouseName},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemInventoriesView.fromMap);

/// `PATCH /api/v4/items/{item_id}/bundle_details` - set a bundle's components.
///
/// `{"item": {"bundle_details": [{id, quantity}]}}` - a **bare list**, unlike
/// `family_details`, which takes an object with an `add` key.
Future<ApiResponse<Item>> updateItemBundleDetails(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ItemsUrls.itemBundleDetails,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `PATCH /api/v4/items/{item_id}/variations` - configure an item's variations.
///
/// A parent declares `configure_variations`; a child sets `parent_item_id` and
/// `use_variations`. The API answers both forms with a 400.
Future<ApiResponse<Item>> updateItemVariations(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ItemsUrls.itemVariations,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `GET /api/v4/items/{item_id}/family_details` - the members of an item family.
Future<ApiResponse<ItemFamilyDetails>> getItemFamilyDetails(
  ExsitedClient client,
  Object itemId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.itemFamilyDetails,
        pathParams: {'item_id': itemId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemFamilyDetails.fromMap);

/// `POST /api/v4/items/{item_id}/family_details` - add members to an item family.
///
/// `{"item": {"family_details": {"add": ["ITEM-0002"]}}}` - an **object with an
/// `add` list**. The API answers `405 method_not_allowed`.
Future<ApiResponse<Item>> createItemFamilyDetails(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ItemsUrls.itemFamilyDetails,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `GET /api/v4/items/{item_id}/package_details` - the item's packages.
Future<ApiResponse<ItemPackageDetails>> getItemPackageDetails(
  ExsitedClient client,
  Object itemId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.itemPackageDetails,
        pathParams: {'item_id': itemId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemPackageDetails.fromMap);

/// `GET /api/v4/items/{item_id}/package_details/{package_detail_id}` - one package.
///
/// [packageDetailId] is the package's `uuid`, as `package_details[].uuid` carries
/// it.
Future<ApiResponse<ItemPackageDetail>> getItemPackageDetail(
  ExsitedClient client,
  Object itemId,
  Object packageDetailId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.itemPackageDetail,
        pathParams: {'item_id': itemId, 'package_detail_id': packageDetailId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemPackageDetail.fromMap);

/// `POST /api/v4/items/{item_id}/package_details` - add a package.
///
/// The API answers `405 method_not_allowed`.
Future<ApiResponse<Item>> createItemPackageDetails(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ItemsUrls.itemPackageDetails,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `DELETE /api/v4/items/{item_id}/package_details/{package_detail_id}` - delete one package.
Future<ApiResponse<Object?>> deleteItemPackageDetail(
  ExsitedClient client,
  Object itemId,
  Object packageDetailId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ItemsUrls.itemPackageDetail,
        pathParams: {'item_id': itemId, 'package_detail_id': packageDetailId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/v4/items/{item_id}/notes` - the item's notes.
Future<ApiResponse<NoteList>> getItemNotes(
  ExsitedClient client,
  Object itemId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.itemNotes,
        pathParams: {'item_id': itemId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: NoteList.fromMap);

/// `GET /api/v4/items/{item_id}/notes/{note_id}` - one note. Answers `{"note": {...}}`.
Future<ApiResponse<Note>> getItemNote(
  ExsitedClient client,
  Object itemId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.itemNote,
        pathParams: {'item_id': itemId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Note.fromMap);

/// `POST /api/v4/items/{item_id}/notes` - attach a note.
///
/// **Form-encoded, not JSON** - the text travels as a form field named `note`,
/// exactly as on an account, which is why this takes the text directly rather than
/// a payload object. HTML is accepted and comes back as written. Any [files] go
/// beside the text as parts of a multipart body.
Future<ApiResponse<Note>> createItemNote(
  ExsitedClient client,
  Object itemId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPostRequest(ItemsUrls.itemNotes,
      pathParams: {'item_id': itemId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: Note.fromMap);
}

/// `PATCH /api/v4/items/{item_id}/notes/{note_id}` - update a note's text.
///
/// Form-encoded, as the create is, and multipart with [files], which the update
/// appends to the note's attachments. Answers `400 "Invalid UUID"` when [noteId] is
/// not one - the message names the format, not the field.
Future<ApiResponse<Note>> updateItemNote(
  ExsitedClient client,
  Object itemId,
  Object noteId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPatchRequest(ItemsUrls.itemNote,
      pathParams: {'item_id': itemId, 'note_id': noteId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: Note.fromMap);
}

/// `DELETE /api/v4/items/{item_id}/notes/{note_id}` - delete one note.
///
/// Answers `400 "Invalid note_id"` when the id is not one.
Future<ApiResponse<Object?>> deleteItemNote(
  ExsitedClient client,
  Object itemId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ItemsUrls.itemNote,
        pathParams: {'item_id': itemId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/v4/items/{item_id}/notes/{note_id}/files` - a note's attachments.
///
/// The API answers `404 "note 'files' not found"`.
Future<ApiResponse<NoteFileList>> getItemNoteFiles(
  ExsitedClient client,
  Object itemId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.itemNoteFiles,
        pathParams: {'item_id': itemId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: NoteFileList.fromMap);

/// `GET /api/v4/items/{item_id}/notes/{note_id}/files/{file_id}` - one attachment.
///
/// `map` may be **bytes** for a binary attachment, in which case `json` and `dto`
/// are both null. The API answers `400 "Invalid endpoint"`.
Future<ApiResponse<ItemNoteFile>> getItemNoteFile(
  ExsitedClient client,
  Object itemId,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.itemNoteFile,
        pathParams: {'item_id': itemId, 'note_id': noteId, 'file_id': fileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ItemNoteFile.fromMap);

/// `POST /api/{api_version}/items/{item_id}/inventories`
///
/// Create an item's inventory section, once, on a `STANDARD` item with sale or
/// purchase on; `201` with the whole item.
Future<ApiResponse<Item>> createItemInventories(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ItemsUrls.itemInventories,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `POST /api/{api_version}/items/{item_id}/inventory`
///
/// Create an item's inventory section, `inventory` singular; the same handler
/// as `createItemInventories`.
Future<ApiResponse<Item>> createItemInventory(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ItemsUrls.itemInventory,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `POST /api/{api_version}/items/{item_id}/inventories/add`
///
/// Add stock to a warehouse, `inventories` plural; the same handler as
/// `addItemInventory`.
Future<ApiResponse<Item>> addItemInventories(
  ExsitedClient client,
  Object itemId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ItemsUrls.itemInventoriesAdd,
        pathParams: {'item_id': itemId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `PATCH /api/{api_version}/items/{item_id}/package_details/{package_detail_id}`
///
/// Update one package, by its `uuid`; the body is `{"item": {"package_details":
/// {...}}}`.
Future<ApiResponse<Item>> updateItemPackageDetail(
  ExsitedClient client,
  Object itemId,
  Object packageDetailId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ItemsUrls.itemPackageDetail,
        pathParams: {'item_id': itemId, 'package_detail_id': packageDetailId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Item.fromMap);

/// `DELETE /api/{api_version}/items/{item_id}/notes/{note_id}/files/{file_id}`
///
/// Delete one attachment, the `uuid` the note's files listing gives; any
/// failure is answered `404`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteItemNoteFile(
  ExsitedClient client,
  Object itemId,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ItemsUrls.itemNoteFile,
        pathParams: {'item_id': itemId, 'note_id': noteId, 'file_id': fileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/items/{item_id}/kpis`
///
/// Retrieve an item's KPI summary, under `item_kpis`; answered empty, so no
/// typed view.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getItemKpis(
  ExsitedClient client,
  Object itemId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ItemsUrls.itemKpis,
        pathParams: {'item_id': itemId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
