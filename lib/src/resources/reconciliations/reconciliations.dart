/// The v4 reconciliations endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'reconciliations_urls.dart';

/// `GET /api/{api_version}/reconciliations/{reconciliation_id}/sale_payments`
///
/// List the payments in a reconciliation; the uuid or the numeric id.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getReconciliationSalePayments(
  ExsitedClient client,
  Object reconciliationId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ReconciliationsUrls.reconciliationSalePayments,
        pathParams: {'reconciliation_id': reconciliationId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/reconciliations/{reconciliation_id}/sale_refunds`
///
/// List the refunds in a reconciliation; the uuid or the numeric id.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getReconciliationSaleRefunds(
  ExsitedClient client,
  Object reconciliationId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ReconciliationsUrls.reconciliationSaleRefunds,
        pathParams: {'reconciliation_id': reconciliationId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
