/// The v4 items endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'items.dart' as endpoints;
import 'items_dto.dart' as views;

/// The items endpoints with [client] already applied.
class ItemsResource {
  /// Bind the resource to a client; normally reached via `client.items`.
  const ItemsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/v4/items` - list items, filtered, sorted and paged.
  Future<ApiResponse<views.ItemList>> getItems({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItems(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/items/{item_id}` - retrieve one item.
  Future<ApiResponse<views.Item>> getItem(
    Object itemId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItem(
        client,
        itemId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/items/{item_id}/information` - the item's core information.
  Future<ApiResponse<views.Item>> getItemInformation(
    Object itemId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemInformation(
        client,
        itemId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/items` - create an item.
  Future<ApiResponse<views.Item>> createItem(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createItem(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/v4/items/{item_id}/information` - update core information. Partial.
  Future<ApiResponse<views.Item>> updateItemInformation(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateItemInformation(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/items/{item_id}/deactivate` - deactivate an item. Takes no body.
  Future<ApiResponse<views.Item>> deactivateItem(
    Object itemId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deactivateItem(
        client,
        itemId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/items/{item_id}/reactivate` - reactivate an item. Takes no body.
  Future<ApiResponse<views.Item>> reactivateItem(
    Object itemId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.reactivateItem(
        client,
        itemId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/v4/items/{item_id}` - delete an item.
  Future<ApiResponse<Object?>> deleteItem(
    Object itemId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteItem(
        client,
        itemId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/items/{item_id}/image` - set the item's image.
  Future<ApiResponse<views.Item>> uploadItemImage(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.uploadItemImage(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/items/{item_id}/sale` - the item's sale configuration.
  Future<ApiResponse<views.ItemSaleView>> getItemSale(
    Object itemId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemSale(
        client,
        itemId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/items/{item_id}/sale` - create the sale configuration.
  Future<ApiResponse<views.Item>> createItemSale(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createItemSale(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/v4/items/{item_id}/sale` - update the sale configuration. Partial.
  Future<ApiResponse<views.Item>> updateItemSale(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateItemSale(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/items/{item_id}/purchase` - a **stub**, as the sale read is.
  Future<ApiResponse<views.ItemPurchaseView>> getItemPurchase(
    Object itemId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemPurchase(
        client,
        itemId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/items/{item_id}/purchase` - answers `409 already_exists` if one exists.
  Future<ApiResponse<views.Item>> createItemPurchase(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createItemPurchase(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/v4/items/{item_id}/purchase` - update the purchase configuration.
  Future<ApiResponse<views.Item>> updateItemPurchase(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateItemPurchase(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/items/{item_id}/inventories` - configuration and stock.
  Future<ApiResponse<views.ItemInventoriesView>> getItemInventories(
    Object itemId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemInventories(
        client,
        itemId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/v4/items/{item_id}/inventories` - update the inventory configuration.
  Future<ApiResponse<views.Item>> updateItemInventories(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateItemInventories(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/items/{item_id}/inventory/add` - add stock to a warehouse.
  Future<ApiResponse<views.Item>> addItemInventory(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.addItemInventory(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/items/{item_id}/inventory_adjustments` - the item's stock movements.
  Future<ApiResponse<views.InventoryAdjustmentList>>
      getItemInventoryAdjustments(
    Object itemId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getItemInventoryAdjustments(
            client,
            itemId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/v4/items/{item_id}/warehouses/{warehouse_name}/inventories` - one warehouse's stock.
  Future<ApiResponse<views.ItemInventoriesView>> getItemWarehouseInventories(
    Object itemId,
    Object warehouseName, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemWarehouseInventories(
        client,
        itemId,
        warehouseName,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/v4/items/{item_id}/bundle_details` - set a bundle's components.
  Future<ApiResponse<views.Item>> updateItemBundleDetails(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateItemBundleDetails(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/v4/items/{item_id}/variations` - configure an item's variations.
  Future<ApiResponse<views.Item>> updateItemVariations(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateItemVariations(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/items/{item_id}/family_details` - the members of an item family.
  Future<ApiResponse<views.ItemFamilyDetails>> getItemFamilyDetails(
    Object itemId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemFamilyDetails(
        client,
        itemId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/items/{item_id}/family_details` - add members to an item family.
  Future<ApiResponse<views.Item>> createItemFamilyDetails(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createItemFamilyDetails(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/items/{item_id}/package_details` - the item's packages.
  Future<ApiResponse<views.ItemPackageDetails>> getItemPackageDetails(
    Object itemId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemPackageDetails(
        client,
        itemId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/items/{item_id}/package_details/{package_detail_id}` - one package.
  Future<ApiResponse<views.ItemPackageDetail>> getItemPackageDetail(
    Object itemId,
    Object packageDetailId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemPackageDetail(
        client,
        itemId,
        packageDetailId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/items/{item_id}/package_details` - add a package.
  Future<ApiResponse<views.Item>> createItemPackageDetails(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createItemPackageDetails(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/v4/items/{item_id}/package_details/{package_detail_id}` - delete one package.
  Future<ApiResponse<Object?>> deleteItemPackageDetail(
    Object itemId,
    Object packageDetailId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteItemPackageDetail(
        client,
        itemId,
        packageDetailId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/items/{item_id}/notes` - the item's notes.
  Future<ApiResponse<views.NoteList>> getItemNotes(
    Object itemId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemNotes(
        client,
        itemId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/items/{item_id}/notes/{note_id}` - one note. Answers `{"note": {...}}`.
  Future<ApiResponse<views.Note>> getItemNote(
    Object itemId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemNote(
        client,
        itemId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/items/{item_id}/notes` - attach a note.
  Future<ApiResponse<views.Note>> createItemNote(
    Object itemId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createItemNote(
        client,
        itemId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/v4/items/{item_id}/notes/{note_id}` - update a note's text.
  Future<ApiResponse<views.Note>> updateItemNote(
    Object itemId,
    Object noteId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateItemNote(
        client,
        itemId,
        noteId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/v4/items/{item_id}/notes/{note_id}` - delete one note.
  Future<ApiResponse<Object?>> deleteItemNote(
    Object itemId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteItemNote(
        client,
        itemId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/items/{item_id}/notes/{note_id}/files` - a note's attachments.
  Future<ApiResponse<views.NoteFileList>> getItemNoteFiles(
    Object itemId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemNoteFiles(
        client,
        itemId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/items/{item_id}/notes/{note_id}/files/{file_id}` - one attachment.
  Future<ApiResponse<views.ItemNoteFile>> getItemNoteFile(
    Object itemId,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemNoteFile(
        client,
        itemId,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/items/{item_id}/inventories`
  Future<ApiResponse<views.Item>> createItemInventories(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createItemInventories(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/items/{item_id}/inventory`
  Future<ApiResponse<views.Item>> createItemInventory(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createItemInventory(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/items/{item_id}/inventories/add`
  Future<ApiResponse<views.Item>> addItemInventories(
    Object itemId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.addItemInventories(
        client,
        itemId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/items/{item_id}/package_details/{package_detail_id}`
  Future<ApiResponse<views.Item>> updateItemPackageDetail(
    Object itemId,
    Object packageDetailId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateItemPackageDetail(
        client,
        itemId,
        packageDetailId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/items/{item_id}/notes/{note_id}/files/{file_id}`
  Future<ApiResponse<Object?>> deleteItemNoteFile(
    Object itemId,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteItemNoteFile(
        client,
        itemId,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/items/{item_id}/kpis`
  Future<ApiResponse<Object?>> getItemKpis(
    Object itemId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getItemKpis(
        client,
        itemId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
