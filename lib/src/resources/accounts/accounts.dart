/// The v4 account endpoints, one function per endpoint taking the client first.
///
/// An account is created at `POST /api/v4/accounts` by [createAccount], answered
/// `201`, or through `POST /api/v4/express` with the account embedded.
/// A listing answers the list envelope; a single account and most sub-resource
/// reads answer `{"account": {...}}`.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../../errors.dart';
import '../account_emails/account_emails_dto.dart'
    show AccountCommunicationsEmail, AccountCommunicationsEmailList;
import '../custom_components/custom_components_dto.dart' show ComponentObjects;
import '../orders/orders_dto.dart' show AccountOrders;
import '../payments/payments_dto.dart' show AccountPayments;
import '../purchase_invoices/purchase_invoices_dto.dart'
    show AccountPurchaseInvoices;
import '../purchase_orders/purchase_orders_dto.dart' show AccountPurchaseOrders;
import '../purchase_payments/purchase_payments_dto.dart'
    show AccountPurchasePayments;
import '../purchase_refunds/purchase_refunds_dto.dart'
    show AccountPurchaseRefunds;
import '../refunds/refunds_dto.dart' show AccountRefunds;
import 'accounts_dto.dart';
import 'accounts_urls.dart';

/// `GET /api/v4/accounts` - list accounts, filtered, sorted and paged.
///
/// Three query parameters control the listing - `limit`, `cursor` and `sort` -
/// and everything else is a filter, spelled `filter_<field>` for equality and
/// `filter_<field>_<operator>` otherwise. Build the names with `filterParam` and
/// `sortParam` rather than concatenating: equality is the irregular case and
/// takes no operator suffix.
///
/// This family pages by **cursor**, so do not pass `cursor` yourself - hand the
/// path to `iterRecords` and let it walk.
Future<ApiResponse<AccountList>> getAccounts(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accounts,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountList.fromMap);

/// `GET /api/v4/accounts/{account_id}` - retrieve one account.
///
/// [accountId] is the account's `id`, the short code a response carries such as
/// `"W13ZGY"`. **Not the `uuid`**: a response carries both, only `id` addresses
/// the record in a path, and the `uuid` answers 404. Filter by `filter_uuid`
/// instead if the uuid is all you hold.
Future<ApiResponse<Account>> getAccount(
  ExsitedClient client,
  Object accountId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.account,
        pathParams: {'account_id': accountId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `GET /api/v4/accounts/{account_id}/information` - the account's core information.
///
/// The read that pairs with [updateAccountInformation].
Future<ApiResponse<Account>> getAccountInformation(
  ExsitedClient client,
  Object accountId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountInformation,
        pathParams: {'account_id': accountId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `PATCH /api/v4/accounts/{account_id}/information` - update core information.
///
/// A partial update: send only what changes. **Writes are flatter than reads** -
/// `currency` and `time_zone` go in as plain strings (`"AUD"`,
/// `"Australia/Adelaide"`) while the read returns reference objects, and contact
/// names go in flat as `first_name`/`middle_name`/`last_name` while the read
/// nests them under `name`. Posting a response body back unchanged is a 400.
///
/// `addresses` and `communication_preference` are refused here with code
/// `not_understood` even though the account response carries both; addresses go
/// through [createAccountAddresses] and [updateAccountAddress].
Future<ApiResponse<Account>> updateAccountInformation(
  ExsitedClient client,
  Object accountId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(AccountsUrls.accountInformation,
        pathParams: {'account_id': accountId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `POST /api/v4/accounts/{account_id}/cancel` - cancel an account on a date.
///
/// [payload] is a map, a JSON string sent byte-for-byte, or an
/// [AccountCancelBody]; all three put the same bytes on the wire. The date goes
/// under an `account` envelope, unlike [setAccountPassword], whose fields are at
/// the top level.
Future<ApiResponse<Account>> cancelAccount(
  ExsitedClient client,
  Object accountId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AccountsUrls.accountCancel,
        pathParams: {'account_id': accountId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `POST /api/v4/accounts/{account_id}/set-password` - set the portal password.
///
/// [payload] is `{password, confirm_password}` at the **top level**, with no
/// `account` envelope. The one hyphenated v4 path.
Future<ApiResponse<Account>> setAccountPassword(
  ExsitedClient client,
  Object accountId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AccountsUrls.accountSetPassword,
        pathParams: {'account_id': accountId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `DELETE /api/v4/accounts/{account_id}` - delete an account.
///
/// A **409** here means the account is locked: one with orders, invoices or
/// payments against it cannot be deleted, and the API answers code
/// `internal_error`. That is a business rule rather than a server fault despite
/// how the code reads - check `errorCode` and do not treat the 409 as retryable.
Future<ApiResponse<Object?>> deleteAccount(
  ExsitedClient client,
  Object accountId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(AccountsUrls.account,
        pathParams: {'account_id': accountId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/v4/accounts/{account_id}/image` - the profile image reference.
///
/// A **URI, not image bytes**, and null when the account has no image.
Future<ApiResponse<AccountImageView>> getAccountImage(
  ExsitedClient client,
  Object accountId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountImage,
        pathParams: {'account_id': accountId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountImageView.fromMap);

/// `POST /api/v4/accounts/{account_id}/image` - set the profile image.
///
/// **Base64 in a JSON body, not a multipart upload** - the opposite of the note
/// endpoints.
Future<ApiResponse<Account>> uploadAccountImage(
  ExsitedClient client,
  Object accountId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AccountsUrls.accountImage,
        pathParams: {'account_id': accountId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `DELETE /api/v4/accounts/{account_id}/image` - remove the profile image.
///
/// Answers 204, so `map` is null.
Future<ApiResponse<Object?>> deleteAccountImage(
  ExsitedClient client,
  Object accountId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(AccountsUrls.accountImage,
        pathParams: {'account_id': accountId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/v4/accounts/{account_id}/contacts` - the account's contacts.
///
/// The **account** envelope with the contacts on it, not the list envelope, so
/// `iterRecords` does not apply.
Future<ApiResponse<Account>> getAccountContacts(
  ExsitedClient client,
  Object accountId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountContacts,
        pathParams: {'account_id': accountId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `GET /api/v4/accounts/{account_id}/contacts/{contact_type}` - one contact, addressed by type.
///
/// [contactType] is `"billing"`, `"shipping"` or `"primary"` - **not** an id. An
/// account holds at most one contact of each type, so the type addresses it, and
/// passing a `"con_..."` id answers 404.
Future<ApiResponse<AccountContact>> getAccountContact(
  ExsitedClient client,
  Object accountId,
  Object contactType, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountContact,
        pathParams: {'account_id': accountId, 'contact_type': contactType},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountContact.fromMap);

/// `PATCH /api/v4/accounts/{account_id}/contacts/{contact_type}` - update one contact.
Future<ApiResponse<Account>> updateAccountContact(
  ExsitedClient client,
  Object accountId,
  Object contactType,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(AccountsUrls.accountContact,
        pathParams: {'account_id': accountId, 'contact_type': contactType},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `PUT /api/v4/accounts/{account_id}/contacts/{contact_type}` - replace one contact.
///
/// A replacement, not a merge: a field left out is cleared. Use
/// [updateAccountContact] to change one field.
Future<ApiResponse<Account>> replaceAccountContact(
  ExsitedClient client,
  Object accountId,
  Object contactType,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPutRequest(AccountsUrls.accountContact,
        pathParams: {'account_id': accountId, 'contact_type': contactType},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `DELETE /api/v4/accounts/{account_id}/contacts/{contact_type}` - delete one contact.
Future<ApiResponse<Object?>> deleteAccountContact(
  ExsitedClient client,
  Object accountId,
  Object contactType, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(AccountsUrls.accountContact,
        pathParams: {'account_id': accountId, 'contact_type': contactType},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/v4/accounts/{account_id}/addresses` - the account's addresses.
///
/// The account envelope with an `addresses` list on it.
Future<ApiResponse<Account>> getAccountAddresses(
  ExsitedClient client,
  Object accountId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountAddresses,
        pathParams: {'account_id': accountId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `GET /api/v4/accounts/{account_id}/addresses/{address_id}` - one address by its id.
Future<ApiResponse<AccountAddress>> getAccountAddress(
  ExsitedClient client,
  Object accountId,
  Object addressId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountAddress,
        pathParams: {'account_id': accountId, 'address_id': addressId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountAddress.fromMap);

/// `POST /api/v4/accounts/{account_id}/addresses` - add one or more addresses.
///
/// [payload] is a **list** under `addresses`, at the top level with no `account`
/// envelope - plural here, singular for [updateAccountAddress], which takes one
/// object under `address`. The write spelling is `post_code` where the read
/// returns `postal_code`. Answers 201.
Future<ApiResponse<Account>> createAccountAddresses(
  ExsitedClient client,
  Object accountId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AccountsUrls.accountAddresses,
        pathParams: {'account_id': accountId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `PATCH /api/v4/accounts/{account_id}/addresses/{address_id}` - update one address.
Future<ApiResponse<Account>> updateAccountAddress(
  ExsitedClient client,
  Object accountId,
  Object addressId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(AccountsUrls.accountAddress,
        pathParams: {'account_id': accountId, 'address_id': addressId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `DELETE /api/v4/accounts/{account_id}/addresses/{address_id}` - delete one address.
Future<ApiResponse<Object?>> deleteAccountAddress(
  ExsitedClient client,
  Object accountId,
  Object addressId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(AccountsUrls.accountAddress,
        pathParams: {'account_id': accountId, 'address_id': addressId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/v4/accounts/{account_id}/billing_preferences` - the billing preferences.
///
/// One setting reads back under either of two names: `charges_aligned_to_billing`
/// (a bool) or `charging_and_billing_alignment` (a string). The write takes the second spelling. Check for both.
Future<ApiResponse<Account>> getAccountBillingPreferences(
  ExsitedClient client,
  Object accountId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountBillingPreferences,
        pathParams: {'account_id': accountId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `PUT /api/v4/accounts/{account_id}/billing_preferences` - replace the preferences.
///
/// `billing_start_date` is an **enum, not a date** - `"DAY_OF_MONTH"` and the
/// like. A calendar date there is a 400 with code `matches_invalid`, which reads
/// as a formatting complaint and is a type one.
Future<ApiResponse<Account>> replaceAccountBillingPreferences(
  ExsitedClient client,
  Object accountId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPutRequest(AccountsUrls.accountBillingPreferences,
        pathParams: {'account_id': accountId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `GET /api/v4/accounts/{account_id}/payment_methods` - the account's payment methods.
Future<ApiResponse<Account>> getAccountPaymentMethods(
  ExsitedClient client,
  Object accountId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountPaymentMethods,
        pathParams: {'account_id': accountId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `GET /api/v4/accounts/{account_id}/payment_methods/{payment_method_id}` - one payment method.
///
/// This answers **200 with no `payment_methods` key at
/// all** for a method id belonging to another account, rather than 404. Check for
/// the key before reading it, or prefer [getAccountPaymentMethods] for a definite
/// answer.
Future<ApiResponse<AccountPaymentMethod>> getAccountPaymentMethod(
  ExsitedClient client,
  Object accountId,
  Object paymentMethodId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountPaymentMethod,
        pathParams: {
          'account_id': accountId,
          'payment_method_id': paymentMethodId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountPaymentMethod.fromMap);

/// `PATCH /api/v4/accounts/{account_id}/payment_methods/{payment_method_id}` - update one method.
Future<ApiResponse<Account>> updateAccountPaymentMethod(
  ExsitedClient client,
  Object accountId,
  Object paymentMethodId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(AccountsUrls.accountPaymentMethod,
        pathParams: {
          'account_id': accountId,
          'payment_method_id': paymentMethodId
        },
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `DELETE /api/v4/accounts/{account_id}/payment_methods/{payment_method_id}` - delete one method.
Future<ApiResponse<Object?>> deleteAccountPaymentMethod(
  ExsitedClient client,
  Object accountId,
  Object paymentMethodId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(AccountsUrls.accountPaymentMethod,
        pathParams: {
          'account_id': accountId,
          'payment_method_id': paymentMethodId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/v4/accounts/{account_id}/notes` - the account's notes.
///
/// Notes are the sub-resource that *does* answer the list envelope and page.
Future<ApiResponse<AccountNoteList>> getAccountNotes(
  ExsitedClient client,
  Object accountId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountNotes,
        pathParams: {'account_id': accountId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountNoteList.fromMap);

/// `GET /api/v4/accounts/{account_id}/notes/{note_id}` - one note.
Future<ApiResponse<AccountNote>> getAccountNote(
  ExsitedClient client,
  Object accountId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountNote,
        pathParams: {'account_id': accountId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountNote.fromMap);

/// `POST /api/v4/accounts/{account_id}/notes` - attach a note.
///
/// **Form-encoded, not JSON** - the one write in the family that is. The text
/// travels as a form field named `note`, which is why this takes the text
/// directly rather than a payload object: there is no JSON envelope to build.
/// HTML is accepted and comes back as written. Any [files] go beside the text
/// as parts of a multipart body.
Future<ApiResponse<AccountNotes>> createAccountNote(
  ExsitedClient client,
  Object accountId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPostRequest(AccountsUrls.accountNotes,
      pathParams: {'account_id': accountId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: AccountNotes.fromMap);
}

/// `PATCH /api/v4/accounts/{account_id}/notes/{note_id}` - update a note's text.
///
/// Form-encoded, as the create is, and multipart with [files].
Future<ApiResponse<AccountNotes>> updateAccountNote(
  ExsitedClient client,
  Object accountId,
  Object noteId,
  String note, {
  Map<String, Object?>? files,
  bool? raiseOnError,
  String? responseFormat,
}) {
  if (note.isEmpty) {
    throw SdkUsageError(
        'note is required: the note text is the body of this request');
  }
  return client.sendPatchRequest(AccountsUrls.accountNote,
      pathParams: {'account_id': accountId, 'note_id': noteId},
      formData: {'note': note},
      files: files,
      raiseOnError: raiseOnError,
      responseFormat: responseFormat,
      dtoDecoder: AccountNotes.fromMap);
}

/// `DELETE /api/v4/accounts/{account_id}/notes/{note_id}` - delete one note.
Future<ApiResponse<Object?>> deleteAccountNote(
  ExsitedClient client,
  Object accountId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(AccountsUrls.accountNote,
        pathParams: {'account_id': accountId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/v4/accounts/{account_id}/notes/{note_id}/files` - a note's attachments.
Future<ApiResponse<AccountNoteFileList>> getAccountNoteFiles(
  ExsitedClient client,
  Object accountId,
  Object noteId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountNoteFiles,
        pathParams: {'account_id': accountId, 'note_id': noteId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountNoteFileList.fromMap);

/// `GET /api/v4/accounts/{account_id}/notes/{note_id}/files/{file_id}` - one attachment.
///
/// `map` may be **bytes** for a binary attachment, in which case `json` and `dto`
/// are both null.
Future<ApiResponse<AccountNoteFile>> getAccountNoteFile(
  ExsitedClient client,
  Object accountId,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountNoteFile,
        pathParams: {
          'account_id': accountId,
          'note_id': noteId,
          'file_id': fileId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountNoteFile.fromMap);

/// `GET /api/v4/accounts/{account_id}/communications/emails` - emails sent to the account.
Future<ApiResponse<AccountCommunicationsEmailList>> getAccountEmails(
  ExsitedClient client,
  Object accountId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountEmails,
        pathParams: {'account_id': accountId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountCommunicationsEmailList.fromMap);

/// `GET /api/v4/accounts/{account_id}/communications/emails/{email_id}` - one email.
Future<ApiResponse<AccountCommunicationsEmail>> getAccountEmail(
  ExsitedClient client,
  Object accountId,
  Object emailId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountEmail,
        pathParams: {'account_id': accountId, 'email_id': emailId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountCommunicationsEmail.fromMap);

// Each narrows another resource's listing to one account and answers the list
// envelope. Where that resource's family has a view for this path, it is named.

/// `GET /api/v4/accounts/{account_id}/orders` - the account's orders.
Future<ApiResponse<AccountOrders>> getAccountOrders(
  ExsitedClient client,
  Object accountId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountOrders,
        pathParams: {'account_id': accountId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountOrders.fromMap);

/// `GET /api/v4/accounts/{account_id}/invoices` - the account's invoices.
Future<ApiResponse<AccountInvoiceList>> getAccountInvoices(
  ExsitedClient client,
  Object accountId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountInvoices,
        pathParams: {'account_id': accountId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountInvoiceList.fromMap);

/// `GET /api/v4/accounts/{account_id}/payments` - the account's payments.
Future<ApiResponse<AccountPayments>> getAccountPayments(
  ExsitedClient client,
  Object accountId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountPayments,
        pathParams: {'account_id': accountId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountPayments.fromMap);

/// `GET /api/v4/accounts/{account_id}/refunds` - the account's refunds.
Future<ApiResponse<AccountRefunds>> getAccountRefunds(
  ExsitedClient client,
  Object accountId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountRefunds,
        pathParams: {'account_id': accountId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountRefunds.fromMap);

/// `GET /api/v4/accounts/{account_id}/credit_notes` - the account's credit notes.
Future<ApiResponse<AccountCreditNoteList>> getAccountCreditNotes(
  ExsitedClient client,
  Object accountId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountCreditNotes,
        pathParams: {'account_id': accountId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountCreditNoteList.fromMap);

/// `GET /api/v4/accounts/{account_id}/purchase_orders` - the account's purchase orders.
Future<ApiResponse<AccountPurchaseOrders>> getAccountPurchaseOrders(
  ExsitedClient client,
  Object accountId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountPurchaseOrders,
        pathParams: {'account_id': accountId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountPurchaseOrders.fromMap);

/// `GET /api/v4/accounts/{account_id}/purchase_invoices` - the account's purchase invoices.
Future<ApiResponse<AccountPurchaseInvoices>> getAccountPurchaseInvoices(
  ExsitedClient client,
  Object accountId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountPurchaseInvoices,
        pathParams: {'account_id': accountId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountPurchaseInvoices.fromMap);

/// `GET /api/v4/accounts/{account_id}/purchase_payments` - the account's purchase payments.
Future<ApiResponse<AccountPurchasePayments>> getAccountPurchasePayments(
  ExsitedClient client,
  Object accountId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountPurchasePayments,
        pathParams: {'account_id': accountId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountPurchasePayments.fromMap);

/// `GET /api/v4/accounts/{account_id}/purchase_refunds` - the account's purchase refunds.
Future<ApiResponse<AccountPurchaseRefunds>> getAccountPurchaseRefunds(
  ExsitedClient client,
  Object accountId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountPurchaseRefunds,
        pathParams: {'account_id': accountId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountPurchaseRefunds.fromMap);

/// `GET /api/v4/accounts/{account_id}/custom_objects` - the account's custom objects.
Future<ApiResponse<AccountCustomObjectList>> getAccountCustomObjects(
  ExsitedClient client,
  Object accountId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountCustomObjects,
        pathParams: {'account_id': accountId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountCustomObjectList.fromMap);

/// `GET /api/v4/accounts/{account_id}/inventories` - the account's inventories.
///
/// **Unpaged and not the list envelope**, despite being a listing: the records
/// arrive on the account, so this takes no query parameters.
Future<ApiResponse<AccountInventories>> getAccountInventories(
  ExsitedClient client,
  Object accountId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountInventories,
        pathParams: {'account_id': accountId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountInventories.fromMap);

/// `GET /api/v4/accounts/{account_id}/quote_partial_invoices` - partial invoices from quotes.
///
/// Unpaged, and the key inside does **not** match the path: the records are under
/// `partial_invoices`.
Future<ApiResponse<AccountQuotePartialInvoices>> getAccountQuotePartialInvoices(
  ExsitedClient client,
  Object accountId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountQuotePartialInvoices,
        pathParams: {'account_id': accountId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountQuotePartialInvoices.fromMap);

/// `GET /api/{api_version}/accounts/{account_id}/kpis`
///
/// The account's revenue and order counters, under `account_kpis`; the money
/// fields are strings, `"0.00"`.
Future<ApiResponse<AccountKpis>> getAccountKpis(
  ExsitedClient client,
  Object accountId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountKpis,
        pathParams: {'account_id': accountId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountKpis.fromMap);

/// `GET /api/{api_version}/accounts/{account_id}/financial_summary`
///
/// The account's invoice totals, under `account`, beside its `name`; the money
/// fields are strings.
Future<ApiResponse<AccountFinancialSummary>> getAccountFinancialSummary(
  ExsitedClient client,
  Object accountId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountFinancialSummary,
        pathParams: {'account_id': accountId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountFinancialSummary.fromMap);

/// `GET /api/{api_version}/accounts/{account_id}/custom_objects/{custom_object_id}`
///
/// One custom object with this account's instances of it, the `co_` id, under
/// `custom_object`; the instances are paged inside it.
Future<ApiResponse<AccountCustomObjectRead>> getAccountCustomObject(
  ExsitedClient client,
  Object accountId,
  Object customObjectId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountCustomObject,
        pathParams: {
          'account_id': accountId,
          'custom_object_id': customObjectId
        },
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountCustomObjectRead.fromMap);

/// `GET /api/{api_version}/accounts/{account_id}/custom_objects/{custom_object_id}/instances/{custom_object_instance_id}`
///
/// One custom object instance, the `coi_` id, under `custom_object_instance`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getAccountCustomObjectInstance(
  ExsitedClient client,
  Object accountId,
  Object customObjectId,
  Object customObjectInstanceId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountCustomObjectInstanceOf,
        pathParams: {
          'account_id': accountId,
          'custom_object_id': customObjectId,
          'custom_object_instance_id': customObjectInstanceId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/accounts/{account_id}/component/{component_id}`
///
/// List a component's objects under an account and its child accounts, the
/// `cmp_` id; cursor paged.
Future<ApiResponse<ComponentObjects>> getAccountComponentObjects(
  ExsitedClient client,
  Object accountId,
  Object componentId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountComponentObjects,
        pathParams: {'account_id': accountId, 'component_id': componentId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: ComponentObjects.fromMap);

/// `GET /api/{api_version}/accounts/{account_id}/component/{component_id}/{component_object_id}`
///
/// One component object under an account, the `cco_` id, under
/// `custom_component_object`.
Future<ApiResponse<AccountComponentObject>> getAccountComponentObject(
  ExsitedClient client,
  Object accountId,
  Object componentId,
  Object componentObjectId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(AccountsUrls.accountComponentObject,
        pathParams: {
          'account_id': accountId,
          'component_id': componentId,
          'component_object_id': componentObjectId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: AccountComponentObject.fromMap);

/// `POST /api/{api_version}/accounts`
///
/// Create an account; answered `201`, under `account`. `name` and `type` are
/// required, and `POST /accounts/{account_id}` is a `400`.
Future<ApiResponse<Account>> createAccount(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AccountsUrls.accounts,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `PUT /api/{api_version}/accounts/{account_id}`
///
/// Replace an account, wrapped in `account`. `name` and `type` are required on
/// every call, and a field the body omits is kept, not cleared.
Future<ApiResponse<Account>> replaceAccount(
  ExsitedClient client,
  Object accountId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPutRequest(AccountsUrls.account,
        pathParams: {'account_id': accountId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `POST /api/{api_version}/accounts/{account_id}/reactivate`
///
/// Reactivate a cancelled account, the body `cancelAccount` takes; a null
/// `effective_date` means now.
Future<ApiResponse<Account>> reactivateAccount(
  ExsitedClient client,
  Object accountId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AccountsUrls.accountReactivate,
        pathParams: {'account_id': accountId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `POST /api/{api_version}/accounts/{account_id}/contacts`
///
/// Add contacts to an account; answered `201`. A list under `contacts`, each
/// with its slot as `type` (`CONTACT_1`) in the body.
Future<ApiResponse<Account>> createAccountContacts(
  ExsitedClient client,
  Object accountId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AccountsUrls.accountContacts,
        pathParams: {'account_id': accountId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `PUT /api/{api_version}/accounts/{account_id}/addresses/{address_id}`
///
/// Replace one address, under a singular `address`; `address_line_1` and
/// `country` are required.
Future<ApiResponse<Account>> replaceAccountAddress(
  ExsitedClient client,
  Object accountId,
  Object addressId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPutRequest(AccountsUrls.accountAddress,
        pathParams: {'account_id': accountId, 'address_id': addressId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `POST /api/{api_version}/accounts/{account_id}/payment_methods`
///
/// Add one payment method; answered `201`. One object under `payment_method`,
/// not a list; the first method becomes the default.
Future<ApiResponse<Account>> createAccountPaymentMethod(
  ExsitedClient client,
  Object accountId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AccountsUrls.accountPaymentMethods,
        pathParams: {'account_id': accountId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `PUT /api/{api_version}/accounts/{account_id}/payment_methods/{payment_method_id}`
///
/// Replace one payment method; `name` is required, and `processor_type` and
/// `payment_processor` are refused.
Future<ApiResponse<Account>> replaceAccountPaymentMethod(
  ExsitedClient client,
  Object accountId,
  Object paymentMethodId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPutRequest(AccountsUrls.accountPaymentMethod,
        pathParams: {
          'account_id': accountId,
          'payment_method_id': paymentMethodId
        },
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `POST /api/{api_version}/accounts/{account_id}/custom_objects/{custom_object_id}`
///
/// Create a custom object instance on an account, the schema's `co_` id.
/// Answers `custom_object_instance`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createAccountCustomObjectInstance(
  ExsitedClient client,
  Object accountId,
  Object customObjectId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AccountsUrls.accountCustomObject,
        pathParams: {
          'account_id': accountId,
          'custom_object_id': customObjectId
        },
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/accounts/{account_id}/custom_objects_instances/{custom_object_instance_id}`
///
/// Update a custom object instance, the instance's `coi_` id; answered with the
/// account.
Future<ApiResponse<Account>> updateAccountCustomObjectInstance(
  ExsitedClient client,
  Object accountId,
  Object customObjectInstanceId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(AccountsUrls.accountCustomObjectInstance,
        pathParams: {
          'account_id': accountId,
          'custom_object_instance_id': customObjectInstanceId
        },
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Account.fromMap);

/// `POST /api/{api_version}/accounts/{account_id}/communications/emails`
///
/// Send an email and log it on the account; `to`, `subject`, `body`, `cc` and
/// `bcc` with no envelope. It sends real mail.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> sendAccountEmail(
  ExsitedClient client,
  Object accountId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AccountsUrls.accountEmails,
        pathParams: {'account_id': accountId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/accounts/{account_id}/purge`
///
/// Purge an account and its records permanently; `204`, no body sent. There is
/// no undo.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> purgeAccount(
  ExsitedClient client,
  Object accountId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AccountsUrls.accountPurge,
        pathParams: {'account_id': accountId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/accounts/{account_id}/notes/{note_id}/files/{file_id}`
///
/// Delete one note attachment, the attachment's `uuid`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteAccountNoteFile(
  ExsitedClient client,
  Object accountId,
  Object noteId,
  Object fileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(AccountsUrls.accountNoteFile,
        pathParams: {
          'account_id': accountId,
          'note_id': noteId,
          'file_id': fileId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
