/// The v4 proforma invoices endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'proforma_invoices_urls.dart';

/// `GET /api/{api_version}/proforma_invoices`
///
/// List pro-forma invoices; paged by cursor, under `data`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getProformaInvoices(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ProformaInvoicesUrls.proformaInvoices,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/proforma_invoices/{proforma_id}`
///
/// Retrieve one pro-forma invoice, by its code; under `proforma_invoice`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getProformaInvoice(
  ExsitedClient client,
  Object proformaId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ProformaInvoicesUrls.proformaInvoice,
        pathParams: {'proforma_id': proformaId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/proforma_invoices/{proforma_id}`
///
/// Delete a pro-forma invoice; `204`. A paid one is refused `400`
/// `already_paid`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteProformaInvoice(
  ExsitedClient client,
  Object proformaId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ProformaInvoicesUrls.proformaInvoice,
        pathParams: {'proforma_id': proformaId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/proforma_invoices/{proforma_id}/payments`
///
/// Pay a pro-forma invoice, wrapped in `payment`; `201`, answering the new
/// payment's code as `payment.payment_id`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createProformaInvoicePayment(
  ExsitedClient client,
  Object proformaId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ProformaInvoicesUrls.proformaInvoicePayments,
        pathParams: {'proforma_id': proformaId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
