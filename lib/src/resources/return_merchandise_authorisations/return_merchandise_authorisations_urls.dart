/// Return merchandise authorisations path templates and body keys; the client fills `{api_version}`.
library;

class ReturnMerchandiseAuthorisationsUrls {
  ReturnMerchandiseAuthorisationsUrls._();

  static const String returnMerchandiseAuthorisations =
      '/api/{api_version}/return_merchandise_authorisations';
  static const String returnMerchandiseAuthorisation =
      '/api/{api_version}/return_merchandise_authorisations/{rma_id}';
  static const String invoiceReturnMerchandiseAuthorisationReceive =
      '/api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations/{rma_code}/receive';
  static const String invoiceReturnMerchandiseAuthorisationReceiveByUuid =
      '/api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations/{rma_code}/receive/{receive_uuid}';
  static const String returnMerchandiseAuthorisationApprove =
      '/api/{api_version}/return_merchandise_authorisations/{rma_id}/approve';
  static const String returnMerchandiseAuthorisationReject =
      '/api/{api_version}/return_merchandise_authorisations/{rma_id}/reject';
  static const String returnMerchandiseAuthorisationReceive =
      '/api/{api_version}/return_merchandise_authorisations/{rma_id}/receive';
  static const String returnMerchandiseAuthorisationReceiveByCode =
      '/api/{api_version}/return_merchandise_authorisations/{rma_code}/receive';
  static const String returnMerchandiseAuthorisationReceiveByUuid =
      '/api/{api_version}/return_merchandise_authorisations/{rma_code}/receive/{receive_uuid}';
  static const String returnMerchandiseAuthorisationNotes =
      '/api/{api_version}/return_merchandise_authorisations/{rma_id}/notes';
  static const String returnMerchandiseAuthorisationNotesByCode =
      '/api/{api_version}/return_merchandise_authorisations/{rma_code}/notes';
  static const String returnMerchandiseAuthorisationNoteByCode =
      '/api/{api_version}/return_merchandise_authorisations/{rma_code}/notes/{note_id}';
  static const String returnMerchandiseAuthorisationNote =
      '/api/{api_version}/return_merchandise_authorisations/{rma_id}/notes/{note_id}';
  static const String returnMerchandiseAuthorisationNoteFilesByCode =
      '/api/{api_version}/return_merchandise_authorisations/{rma_code}/notes/{note_id}/files';
  static const String returnMerchandiseAuthorisationNoteFileByCode =
      '/api/{api_version}/return_merchandise_authorisations/{rma_code}/notes/{note_id}/files/{file_id}';
  static const String returnMerchandiseAuthorisationNoteFile =
      '/api/{api_version}/return_merchandise_authorisations/{rma_id}/notes/{note_id}/files/{file_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String fileKey = 'file';
  static const String invoiceKey = 'invoice';
  static const String noteKey = 'note';
  static const String receiveReturnMerchandiseAuthorisationKey =
      'receive_return_merchandise_authorisation';
  static const String receiveReturnMerchandiseAuthorisationsKey =
      'receive_return_merchandise_authorisations';
  static const String receiveRmaKey = 'receive_rma';
  static const String returnMerchandiseAuthorisationKey =
      'return_merchandise_authorisation';
}
