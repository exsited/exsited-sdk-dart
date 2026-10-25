/// The v4 account emails endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'account_emails.dart' as endpoints;

/// The account emails endpoints with [client] already applied.
class AccountEmailsResource {
  /// Bind the resource to a client; normally reached via `client.accountEmails`.
  const AccountEmailsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `DELETE /api/{api_version}/accounts/{account_id}/communications/emails/{email_uuid}`
  Future<ApiResponse<Object?>> deleteAccountCommunicationsEmail(
    Object accountId,
    Object emailUuid, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteAccountCommunicationsEmail(
        client,
        accountId,
        emailUuid,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
