/// The v4 purchase credit note applications endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'purchase_credit_note_applications_dto.dart';
import 'purchase_credit_note_applications_urls.dart';

/// `GET /api/{api_version}/purchase_credit_note_applications`
Future<ApiResponse<PurchaseCreditNoteApplicationList>>
    getPurchaseCreditNoteApplications(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            PurchaseCreditNoteApplicationsUrls.purchaseCreditNoteApplications,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: PurchaseCreditNoteApplicationList.fromMap);

/// `GET /api/{api_version}/purchase_credit_note_applications/{purchase_credit_note_application_id}`
Future<ApiResponse<PurchaseCreditNoteApplicationRead>>
    getPurchaseCreditNoteApplication(
  ExsitedClient client,
  Object purchaseCreditNoteApplicationId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            PurchaseCreditNoteApplicationsUrls.purchaseCreditNoteApplication,
            pathParams: {
              'purchase_credit_note_application_id':
                  purchaseCreditNoteApplicationId
            },
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: PurchaseCreditNoteApplicationRead.fromMap);
