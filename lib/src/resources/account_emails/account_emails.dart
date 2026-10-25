/// The v4 account emails endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'account_emails_urls.dart';

/// `DELETE /api/{api_version}/accounts/{account_id}/communications/emails/{email_uuid}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteAccountCommunicationsEmail(
  ExsitedClient client,
  Object accountId,
  Object emailUuid, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(AccountEmailsUrls.accountCommunicationsEmail,
        pathParams: {'account_id': accountId, 'email_uuid': emailUuid},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
