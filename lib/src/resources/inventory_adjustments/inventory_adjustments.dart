/// The v4 inventory adjustments endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'inventory_adjustments_dto.dart';
import 'inventory_adjustments_urls.dart';

/// `GET /api/{api_version}/inventory_adjustments`
Future<ApiResponse<InventoryAdjustmentList>> getInventoryAdjustments(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InventoryAdjustmentsUrls.inventoryAdjustments,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: InventoryAdjustmentList.fromMap);

/// `GET /api/{api_version}/inventory_adjustments/{inventory_adjustment_id}`
Future<ApiResponse<InventoryAdjustment>> getInventoryAdjustment(
  ExsitedClient client,
  Object inventoryAdjustmentId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InventoryAdjustmentsUrls.inventoryAdjustment,
        pathParams: {'inventory_adjustment_id': inventoryAdjustmentId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: InventoryAdjustment.fromMap);
