/// Accounts path templates and body keys; the client fills `{api_version}`.
/// `{account_id}` takes the account's short `id` such as `"W13ZGY"`, never the
/// `uuid`; `set-password` is the one hyphenated v4 path.
library;

class AccountsUrls {
  AccountsUrls._();

  static const String accounts = '/api/{api_version}/accounts';
  static const String account = '/api/{api_version}/accounts/{account_id}';
  static const String accountInformation =
      '/api/{api_version}/accounts/{account_id}/information';
  static const String accountCancel =
      '/api/{api_version}/accounts/{account_id}/cancel';
  static const String accountSetPassword =
      '/api/{api_version}/accounts/{account_id}/set-password';
  static const String accountContacts =
      '/api/{api_version}/accounts/{account_id}/contacts';
  static const String accountContact =
      '/api/{api_version}/accounts/{account_id}/contacts/{contact_type}';
  static const String accountAddresses =
      '/api/{api_version}/accounts/{account_id}/addresses';
  static const String accountAddress =
      '/api/{api_version}/accounts/{account_id}/addresses/{address_id}';
  static const String accountBillingPreferences =
      '/api/{api_version}/accounts/{account_id}/billing_preferences';
  static const String accountPaymentMethods =
      '/api/{api_version}/accounts/{account_id}/payment_methods';
  static const String accountPaymentMethod =
      '/api/{api_version}/accounts/{account_id}/payment_methods/{payment_method_id}';
  static const String accountNotes =
      '/api/{api_version}/accounts/{account_id}/notes';
  static const String accountNote =
      '/api/{api_version}/accounts/{account_id}/notes/{note_id}';
  static const String accountNoteFiles =
      '/api/{api_version}/accounts/{account_id}/notes/{note_id}/files';
  static const String accountNoteFile =
      '/api/{api_version}/accounts/{account_id}/notes/{note_id}/files/{file_id}';
  static const String accountImage =
      '/api/{api_version}/accounts/{account_id}/image';
  static const String accountEmails =
      '/api/{api_version}/accounts/{account_id}/communications/emails';
  static const String accountEmail =
      '/api/{api_version}/accounts/{account_id}/communications/emails/{email_id}';
  static const String accountOrders =
      '/api/{api_version}/accounts/{account_id}/orders';
  static const String accountInvoices =
      '/api/{api_version}/accounts/{account_id}/invoices';
  static const String accountPayments =
      '/api/{api_version}/accounts/{account_id}/payments';
  static const String accountRefunds =
      '/api/{api_version}/accounts/{account_id}/refunds';
  static const String accountCreditNotes =
      '/api/{api_version}/accounts/{account_id}/credit_notes';
  static const String accountPurchaseOrders =
      '/api/{api_version}/accounts/{account_id}/purchase_orders';
  static const String accountPurchaseInvoices =
      '/api/{api_version}/accounts/{account_id}/purchase_invoices';
  static const String accountPurchasePayments =
      '/api/{api_version}/accounts/{account_id}/purchase_payments';
  static const String accountPurchaseRefunds =
      '/api/{api_version}/accounts/{account_id}/purchase_refunds';
  static const String accountCustomObjects =
      '/api/{api_version}/accounts/{account_id}/custom_objects';
  static const String accountInventories =
      '/api/{api_version}/accounts/{account_id}/inventories';
  static const String accountQuotePartialInvoices =
      '/api/{api_version}/accounts/{account_id}/quote_partial_invoices';
  static const String accountKpis =
      '/api/{api_version}/accounts/{account_id}/kpis';
  static const String accountFinancialSummary =
      '/api/{api_version}/accounts/{account_id}/financial_summary';
  static const String accountCustomObject =
      '/api/{api_version}/accounts/{account_id}/custom_objects/{custom_object_id}';
  static const String accountCustomObjectInstanceOf =
      '/api/{api_version}/accounts/{account_id}/custom_objects/{custom_object_id}/instances/{custom_object_instance_id}';
  static const String accountComponentObjects =
      '/api/{api_version}/accounts/{account_id}/component/{component_id}';
  static const String accountComponentObject =
      '/api/{api_version}/accounts/{account_id}/component/{component_id}/{component_object_id}';
  static const String accountReactivate =
      '/api/{api_version}/accounts/{account_id}/reactivate';
  static const String accountCustomObjectInstance =
      '/api/{api_version}/accounts/{account_id}/custom_objects_instances/{custom_object_instance_id}';
  static const String accountPurge =
      '/api/{api_version}/accounts/{account_id}/purge';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String accountKey = 'account';
  static const String accountKpisKey = 'account_kpis';
  static const String customComponentObjectKey = 'custom_component_object';
  static const String customObjectInstanceKey = 'custom_object_instance';
  static const String customObjectKey = 'custom_object';
  static const String fileKey = 'file';
  static const String noteKey = 'note';

  /// The paging and sorting names the listing takes; a filter is
  /// `filter_<field>[_<op>]` beside them, built with `filterParam`.
  static const List<String> queryParams = <String>[
    'limit',
    'cursor',
    'sort',
  ];
}
