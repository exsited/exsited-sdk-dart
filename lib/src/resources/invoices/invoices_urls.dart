/// Invoices path templates and body keys; the client fills `{api_version}`.
library;

class InvoicesUrls {
  InvoicesUrls._();

  static const String invoices = '/api/{api_version}/invoices';
  static const String invoice = '/api/{api_version}/invoices/{invoice_id}';
  static const String invoiceAmend =
      '/api/{api_version}/invoices/{invoice_id}/amend';
  static const String invoiceCancel =
      '/api/{api_version}/invoices/{invoice_id}/cancel';
  static const String invoiceInformation =
      '/api/{api_version}/invoices/{invoice_id}/information';
  static const String invoiceItemFulfillments =
      '/api/{api_version}/invoices/{invoice_id}/item_fulfillments';
  static const String invoiceNotes =
      '/api/{api_version}/invoices/{invoice_id}/notes';
  static const String invoicePdf =
      '/api/{api_version}/invoices/{invoice_id}/pdf';
  static const String invoiceReactivate =
      '/api/{api_version}/invoices/{invoice_id}/reactivate';
  static const String invoiceReturnMerchandiseAuthorisations =
      '/api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations';
  static const String orderInvoices =
      '/api/{api_version}/orders/{order_id}/invoices';
  static const String invoiceItemFulfillment =
      '/api/{api_version}/invoices/{invoice_id}/item_fulfillments/{fulfillment_id}';
  static const String invoiceNote =
      '/api/{api_version}/invoices/{invoice_id}/notes/{invoice_note_id}';
  static const String invoiceReturnMerchandiseAuthorisation =
      '/api/{api_version}/invoices/{invoice_id}/return_merchandise_authorisations/{rma_id}';
  static const String invoiceNoteFiles =
      '/api/{api_version}/invoices/{invoice_id}/notes/{invoice_note_id}/files';
  static const String invoiceNoteFile =
      '/api/{api_version}/invoices/{invoice_id}/notes/{invoice_note_id}/files/{invoice_file_id}';
  static const String invoiceKpis =
      '/api/{api_version}/invoices/{invoice_id}/kpis';
  static const String invoiceLines =
      '/api/{api_version}/invoices/{invoice_id}/lines';
  static const String invoiceLine =
      '/api/{api_version}/invoices/{invoice_id}/lines/{line_id}';
  static const String invoiceCreditNoteApplication =
      '/api/{api_version}/invoices/{invoice_id}/credit_note_applications/{credit_note_application_id}';
  static const String invoiceCustomObjects =
      '/api/{api_version}/invoices/{invoice_id}/custom_objects';
  static const String invoiceCustomObject =
      '/api/{api_version}/invoices/{invoice_id}/custom_objects/{custom_object_id}';
  static const String invoiceCustomObjectInstance =
      '/api/{api_version}/invoices/{invoice_id}/custom_objects/{custom_object_id}/instances/{instance_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String creditNoteApplicationKey = 'credit_note_application';
  static const String fileKey = 'file';
  static const String invoiceKey = 'invoice';
  static const String invoiceKpisKey = 'invoice_kpis';
  static const String itemFulfillmentKey = 'item_fulfillment';
  static const String noteKey = 'note';
  static const String returnMerchandiseAuthorisationKey =
      'return_merchandise_authorisation';
}
