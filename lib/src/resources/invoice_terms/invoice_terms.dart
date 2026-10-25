/// The v4 invoice terms endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'invoice_terms_dto.dart';
import 'invoice_terms_urls.dart';

/// `GET /api/{api_version}/settings/invoice_terms`
///
/// List invoice terms.
Future<ApiResponse<SettingsInvoiceTermList>> getSettingsInvoiceTerms(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoiceTermsUrls.settingsInvoiceTerms,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsInvoiceTermList.fromMap);

/// `POST /api/{api_version}/settings/invoice_terms`
///
/// Create an invoice term; the answer is flat, where a read nests `duration`.
Future<ApiResponse<SettingsInvoiceTermWrite>> createSettingsInvoiceTerm(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(InvoiceTermsUrls.settingsInvoiceTerms,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsInvoiceTermWrite.fromMap);

/// `GET /api/{api_version}/settings/invoice_terms/{invoice_term_id}`
///
/// Get one invoice term.
Future<ApiResponse<SettingsInvoiceTerm>> getSettingsInvoiceTerm(
  ExsitedClient client,
  Object invoiceTermId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(InvoiceTermsUrls.settingsInvoiceTerm,
        pathParams: {'invoice_term_id': invoiceTermId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsInvoiceTerm.fromMap);

/// `DELETE /api/{api_version}/settings/invoice_terms/{invoice_term_id}`
///
/// Delete an invoice term.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsInvoiceTerm(
  ExsitedClient client,
  Object invoiceTermId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(InvoiceTermsUrls.settingsInvoiceTerm,
        pathParams: {'invoice_term_id': invoiceTermId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/invoice_terms/{invoice_term_id}`
///
/// Update or enable/disable an invoice term - `PATCH
/// /settings/invoice_terms/{invoice_term_id}`; the answer is flat, where a read
/// nests `duration`.
Future<ApiResponse<SettingsInvoiceTermWrite>> updateSettingsInvoiceTerm(
  ExsitedClient client,
  Object invoiceTermId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(InvoiceTermsUrls.settingsInvoiceTerm,
        pathParams: {'invoice_term_id': invoiceTermId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsInvoiceTermWrite.fromMap);
