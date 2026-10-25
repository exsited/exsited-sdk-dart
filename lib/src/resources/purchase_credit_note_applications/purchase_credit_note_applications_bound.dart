/// The v4 purchase credit note applications endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'purchase_credit_note_applications.dart' as endpoints;
import 'purchase_credit_note_applications_dto.dart' as views;

/// The purchase credit note applications endpoints with [client] already applied.
class PurchaseCreditNoteApplicationsResource {
  /// Bind the resource to a client; normally reached via `client.purchaseCreditNoteApplications`.
  const PurchaseCreditNoteApplicationsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/purchase_credit_note_applications`
  Future<ApiResponse<views.PurchaseCreditNoteApplicationList>>
      getPurchaseCreditNoteApplications({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getPurchaseCreditNoteApplications(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/purchase_credit_note_applications/{purchase_credit_note_application_id}`
  Future<ApiResponse<views.PurchaseCreditNoteApplicationRead>>
      getPurchaseCreditNoteApplication(
    Object purchaseCreditNoteApplicationId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getPurchaseCreditNoteApplication(
            client,
            purchaseCreditNoteApplicationId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );
}
