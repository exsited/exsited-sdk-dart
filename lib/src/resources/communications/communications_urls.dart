/// Communications path templates and body keys; the client fills `{api_version}`.
library;

class CommunicationsUrls {
  CommunicationsUrls._();

  static const String communicationsSendEmail =
      '/api/{api_version}/communications/send_email';

  /// The envelopes one record arrives under, read off this family's views.
  static const String emailKey = 'email';
}
