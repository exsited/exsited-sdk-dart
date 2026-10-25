/// The v4 reconciliations endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'reconciliations.dart' as endpoints;

/// The reconciliations endpoints with [client] already applied.
class ReconciliationsResource {
  /// Bind the resource to a client; normally reached via `client.reconciliations`.
  const ReconciliationsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/reconciliations/{reconciliation_id}/sale_payments`
  Future<ApiResponse<Object?>> getReconciliationSalePayments(
    Object reconciliationId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getReconciliationSalePayments(
        client,
        reconciliationId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/reconciliations/{reconciliation_id}/sale_refunds`
  Future<ApiResponse<Object?>> getReconciliationSaleRefunds(
    Object reconciliationId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getReconciliationSaleRefunds(
        client,
        reconciliationId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
