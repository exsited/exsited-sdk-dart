/// Accounting codes path templates and body keys; the client fills `{api_version}`.
library;

class AccountingCodesUrls {
  AccountingCodesUrls._();

  static const String settingsAccountingCodes =
      '/api/{api_version}/settings/accounting_codes';
  static const String settingsAccountingCode =
      '/api/{api_version}/settings/accounting_codes/{accounting_code_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String accountingCodeKey = 'accounting_code';
}
