/// Express path templates and body keys; the client fills `{api_version}`.
library;

class ExpressUrls {
  ExpressUrls._();

  static const String express = '/api/{api_version}/express';

  /// The envelopes one record arrives under, read off this family's views.
  static const String expressKey = 'express';
}
