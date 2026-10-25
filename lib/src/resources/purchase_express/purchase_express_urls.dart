/// Purchase express path templates and body keys; the client fills `{api_version}`.
library;

class PurchaseExpressUrls {
  PurchaseExpressUrls._();

  static const String purchaseExpress = '/api/{api_version}/purchase_express';

  /// The envelopes one record arrives under, read off this family's views.
  static const String purchaseExpressKey = 'purchase_express';
}
