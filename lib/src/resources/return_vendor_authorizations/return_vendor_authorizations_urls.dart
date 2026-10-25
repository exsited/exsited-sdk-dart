/// Return vendor authorizations path templates and body keys; the client fills `{api_version}`.
library;

class ReturnVendorAuthorizationsUrls {
  ReturnVendorAuthorizationsUrls._();

  static const String returnVendorAuthorizations =
      '/api/{api_version}/return_vendor_authorizations';
  static const String returnVendorAuthorization =
      '/api/{api_version}/return_vendor_authorizations/{rva_id}';
  static const String returnVendorAuthorizationNote =
      '/api/{api_version}/return_vendor_authorizations/{rva_id}/notes/{note_id}';
  static const String returnVendorAuthorizationNoteFile =
      '/api/{api_version}/return_vendor_authorizations/{rva_id}/notes/{note_id}/files/{file_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String returnVendorAuthorizationKey =
      'return_vendor_authorization';
}
