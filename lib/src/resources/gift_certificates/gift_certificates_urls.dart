/// Gift certificates path templates and body keys; the client fills `{api_version}`.
library;

class GiftCertificatesUrls {
  GiftCertificatesUrls._();

  static const String giftCertificates = '/api/{api_version}/gift_certificates';
  static const String giftCertificate =
      '/api/{api_version}/gift_certificates/{gc_id}';
  static const String giftCertificateAllocations =
      '/api/{api_version}/gift_certificates/{gc_id}/allocations';
  static const String giftCertificateTransactions =
      '/api/{api_version}/gift_certificates/{gc_id}/transactions';
  static const String giftCertificateAmend =
      '/api/{api_version}/gift_certificates/{gc_id}/amend';
  static const String giftCertificateDeallocations =
      '/api/{api_version}/gift_certificates/{gc_id}/deallocations';
  static const String giftCertificateAllocation =
      '/api/{api_version}/gift_certificates/{gc_id}/allocations/{allocation_id}';
  static const String giftCertificateTransaction =
      '/api/{api_version}/gift_certificates/{gc_id}/transactions/{transaction_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String giftCertificateAllocationKey =
      'gift_certificate_allocation';
  static const String giftCertificateKey = 'gift_certificate';
  static const String giftCertificateTransactionKey =
      'gift_certificate_transaction';
}
