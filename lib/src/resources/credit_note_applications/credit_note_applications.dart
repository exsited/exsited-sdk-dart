/// The v4 credit note applications endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'credit_note_applications_dto.dart';
import 'credit_note_applications_urls.dart';

/// `GET /api/{api_version}/credit_note_applications`
Future<ApiResponse<CreditNoteApplicationList>> getCreditNoteApplications(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CreditNoteApplicationsUrls.creditNoteApplications,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CreditNoteApplicationList.fromMap);

/// `GET /api/{api_version}/credit_note_applications/{credit_note_application_id}`
Future<ApiResponse<CreditNoteApplicationRead>> getCreditNoteApplication(
  ExsitedClient client,
  Object creditNoteApplicationId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CreditNoteApplicationsUrls.creditNoteApplication,
        pathParams: {'credit_note_application_id': creditNoteApplicationId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CreditNoteApplicationRead.fromMap);

/// `GET /api/{api_version}/invoices/{invoice_id}/credit_note_applications`
Future<ApiResponse<InvoiceCreditNoteApplications>>
    getInvoiceCreditNoteApplications(
  ExsitedClient client,
  Object invoiceId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            CreditNoteApplicationsUrls.invoiceCreditNoteApplications,
            pathParams: {'invoice_id': invoiceId},
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: InvoiceCreditNoteApplications.fromMap);
