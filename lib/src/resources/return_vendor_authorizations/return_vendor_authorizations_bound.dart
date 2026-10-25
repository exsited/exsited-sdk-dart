/// The v4 return vendor authorizations endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'return_vendor_authorizations.dart' as endpoints;
import 'return_vendor_authorizations_dto.dart' as views;

/// The return vendor authorizations endpoints with [client] already applied.
class ReturnVendorAuthorizationsResource {
  /// Bind the resource to a client; normally reached via `client.returnVendorAuthorizations`.
  const ReturnVendorAuthorizationsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/return_vendor_authorizations`
  Future<ApiResponse<views.ReturnVendorAuthorizationList>>
      getReturnVendorAuthorizations({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getReturnVendorAuthorizations(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/return_vendor_authorizations`
  Future<ApiResponse<views.ReturnVendorAuthorizationView>>
      createReturnVendorAuthorization(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createReturnVendorAuthorization(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/return_vendor_authorizations/{rva_id}`
  Future<ApiResponse<views.ReturnVendorAuthorizationView>>
      getReturnVendorAuthorization(
    Object rvaId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getReturnVendorAuthorization(
            client,
            rvaId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/return_vendor_authorizations/{rva_id}`
  Future<ApiResponse<views.ReturnVendorAuthorizationView>>
      updateReturnVendorAuthorization(
    Object rvaId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateReturnVendorAuthorization(
            client,
            rvaId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/return_vendor_authorizations/{rva_id}`
  Future<ApiResponse<Object?>> deleteReturnVendorAuthorization(
    Object rvaId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteReturnVendorAuthorization(
        client,
        rvaId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/return_vendor_authorizations/{rva_id}/notes/{note_id}`
  Future<ApiResponse<Object?>> deleteReturnVendorAuthorizationNote(
    Object rvaId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteReturnVendorAuthorizationNote(
        client,
        rvaId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/return_vendor_authorizations/{rva_id}/notes/{note_id}/files/{file_id}`
  Future<ApiResponse<Object?>> deleteReturnVendorAuthorizationNoteFile(
    Object rvaId,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteReturnVendorAuthorizationNoteFile(
        client,
        rvaId,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
