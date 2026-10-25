/// The v4 inventory adjustments endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'inventory_adjustments.dart' as endpoints;
import 'inventory_adjustments_dto.dart' as views;

/// The inventory adjustments endpoints with [client] already applied.
class InventoryAdjustmentsResource {
  /// Bind the resource to a client; normally reached via `client.inventoryAdjustments`.
  const InventoryAdjustmentsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/inventory_adjustments`
  Future<ApiResponse<views.InventoryAdjustmentList>> getInventoryAdjustments({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInventoryAdjustments(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/inventory_adjustments/{inventory_adjustment_id}`
  Future<ApiResponse<views.InventoryAdjustment>> getInventoryAdjustment(
    Object inventoryAdjustmentId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getInventoryAdjustment(
        client,
        inventoryAdjustmentId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
