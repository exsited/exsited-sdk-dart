/// The v4 return vendor authorizations endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'return_vendor_authorizations_dto.dart';
import 'return_vendor_authorizations_urls.dart';

/// `GET /api/{api_version}/return_vendor_authorizations`
///
/// List RVAs.
Future<ApiResponse<ReturnVendorAuthorizationList>>
    getReturnVendorAuthorizations(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(
            ReturnVendorAuthorizationsUrls.returnVendorAuthorizations,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReturnVendorAuthorizationList.fromMap);

/// `POST /api/{api_version}/return_vendor_authorizations`
///
/// Create RVA, `{"return_vendor_authorization": {"purchase_order", "lines":
/// [{"purchase_order_line", "rva_qty"}]}}`; answered `201`.
Future<ApiResponse<ReturnVendorAuthorizationView>>
    createReturnVendorAuthorization(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPostRequest(
            ReturnVendorAuthorizationsUrls.returnVendorAuthorizations,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReturnVendorAuthorizationView.fromMap);

/// `GET /api/{api_version}/return_vendor_authorizations/{rva_id}`
///
/// Get RVA, the `rva_` id or the code.
Future<ApiResponse<ReturnVendorAuthorizationView>> getReturnVendorAuthorization(
  ExsitedClient client,
  Object rvaId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(
        ReturnVendorAuthorizationsUrls.returnVendorAuthorization,
        pathParams: {'rva_id': rvaId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ReturnVendorAuthorizationView.fromMap);

/// `PATCH /api/{api_version}/return_vendor_authorizations/{rva_id}`
///
/// Edit RVA header, the `rva_` id or the code, `{"return_vendor_authorization":
/// {...}}` of `rva_date`, `note` and `custom_attributes`.
Future<ApiResponse<ReturnVendorAuthorizationView>>
    updateReturnVendorAuthorization(
  ExsitedClient client,
  Object rvaId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(
            ReturnVendorAuthorizationsUrls.returnVendorAuthorization,
            pathParams: {'rva_id': rvaId},
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: ReturnVendorAuthorizationView.fromMap);

/// `DELETE /api/{api_version}/return_vendor_authorizations/{rva_id}`
///
/// Delete draft RVA, the `rva_` id only; a code answers `404`, and anything but
/// a draft `400` `stock_committed`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteReturnVendorAuthorization(
  ExsitedClient client,
  Object rvaId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(
        ReturnVendorAuthorizationsUrls.returnVendorAuthorization,
        pathParams: {'rva_id': rvaId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/return_vendor_authorizations/{rva_id}/notes/{note_id}`
///
/// Delete RVA note, the `rva_` id; no route lists or creates an RVA's notes.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteReturnVendorAuthorizationNote(
  ExsitedClient client,
  Object rvaId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(
        ReturnVendorAuthorizationsUrls.returnVendorAuthorizationNote,
        pathParams: {'rva_id': rvaId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/return_vendor_authorizations/{rva_id}/notes/{note_id}/files/{file_id}`
///
/// Delete RVA note attachment.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteReturnVendorAuthorizationNoteFile(
  ExsitedClient client,
  Object rvaId,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(
        ReturnVendorAuthorizationsUrls.returnVendorAuthorizationNoteFile,
        pathParams: {'rva_id': rvaId, 'note_id': noteId, 'file_id': fileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
