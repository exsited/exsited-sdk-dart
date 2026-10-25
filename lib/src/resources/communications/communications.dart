/// The v4 communications endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'communications_urls.dart';

/// `POST /api/{api_version}/communications/send_email`
///
/// Email a document; the body names one of `invoice`, `purchase_invoice`,
/// `account_statement` or `payment`, each an `id` beside `to`, `cc`, `bcc`,
/// `subject`, `body` and `template`. Sends real mail.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> sendEmail(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CommunicationsUrls.communicationsSendEmail,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
