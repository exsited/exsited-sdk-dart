/// The v4 accounts endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import '../account_emails/account_emails_dto.dart' as views
    show AccountCommunicationsEmail, AccountCommunicationsEmailList;
import '../custom_components/custom_components_dto.dart' as views
    show ComponentObjects;
import '../orders/orders_dto.dart' as views show AccountOrders;
import '../payments/payments_dto.dart' as views show AccountPayments;
import '../purchase_invoices/purchase_invoices_dto.dart' as views
    show AccountPurchaseInvoices;
import '../purchase_orders/purchase_orders_dto.dart' as views
    show AccountPurchaseOrders;
import '../purchase_payments/purchase_payments_dto.dart' as views
    show AccountPurchasePayments;
import '../purchase_refunds/purchase_refunds_dto.dart' as views
    show AccountPurchaseRefunds;
import '../refunds/refunds_dto.dart' as views show AccountRefunds;
import 'accounts.dart' as endpoints;
import 'accounts_dto.dart' as views;

/// The accounts endpoints with [client] already applied.
class AccountsResource {
  /// Bind the resource to a client; normally reached via `client.accounts`.
  const AccountsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/v4/accounts` - list accounts, filtered, sorted and paged.
  Future<ApiResponse<views.AccountList>> getAccounts({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccounts(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}` - retrieve one account.
  Future<ApiResponse<views.Account>> getAccount(
    Object accountId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccount(
        client,
        accountId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/information` - the account's core information.
  Future<ApiResponse<views.Account>> getAccountInformation(
    Object accountId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountInformation(
        client,
        accountId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/v4/accounts/{account_id}/information` - update core information.
  Future<ApiResponse<views.Account>> updateAccountInformation(
    Object accountId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateAccountInformation(
        client,
        accountId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/accounts/{account_id}/cancel` - cancel an account on a date.
  Future<ApiResponse<views.Account>> cancelAccount(
    Object accountId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.cancelAccount(
        client,
        accountId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/accounts/{account_id}/set-password` - set the portal password.
  Future<ApiResponse<views.Account>> setAccountPassword(
    Object accountId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.setAccountPassword(
        client,
        accountId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/v4/accounts/{account_id}` - delete an account.
  Future<ApiResponse<Object?>> deleteAccount(
    Object accountId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteAccount(
        client,
        accountId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/image` - the profile image reference.
  Future<ApiResponse<views.AccountImageView>> getAccountImage(
    Object accountId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountImage(
        client,
        accountId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/accounts/{account_id}/image` - set the profile image.
  Future<ApiResponse<views.Account>> uploadAccountImage(
    Object accountId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.uploadAccountImage(
        client,
        accountId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/v4/accounts/{account_id}/image` - remove the profile image.
  Future<ApiResponse<Object?>> deleteAccountImage(
    Object accountId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteAccountImage(
        client,
        accountId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/contacts` - the account's contacts.
  Future<ApiResponse<views.Account>> getAccountContacts(
    Object accountId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountContacts(
        client,
        accountId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/contacts/{contact_type}` - one contact, addressed by type.
  Future<ApiResponse<views.AccountContact>> getAccountContact(
    Object accountId,
    Object contactType, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountContact(
        client,
        accountId,
        contactType,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/v4/accounts/{account_id}/contacts/{contact_type}` - update one contact.
  Future<ApiResponse<views.Account>> updateAccountContact(
    Object accountId,
    Object contactType,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateAccountContact(
        client,
        accountId,
        contactType,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PUT /api/v4/accounts/{account_id}/contacts/{contact_type}` - replace one contact.
  Future<ApiResponse<views.Account>> replaceAccountContact(
    Object accountId,
    Object contactType,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.replaceAccountContact(
        client,
        accountId,
        contactType,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/v4/accounts/{account_id}/contacts/{contact_type}` - delete one contact.
  Future<ApiResponse<Object?>> deleteAccountContact(
    Object accountId,
    Object contactType, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteAccountContact(
        client,
        accountId,
        contactType,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/addresses` - the account's addresses.
  Future<ApiResponse<views.Account>> getAccountAddresses(
    Object accountId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountAddresses(
        client,
        accountId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/addresses/{address_id}` - one address by its id.
  Future<ApiResponse<views.AccountAddress>> getAccountAddress(
    Object accountId,
    Object addressId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountAddress(
        client,
        accountId,
        addressId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/accounts/{account_id}/addresses` - add one or more addresses.
  Future<ApiResponse<views.Account>> createAccountAddresses(
    Object accountId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createAccountAddresses(
        client,
        accountId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/v4/accounts/{account_id}/addresses/{address_id}` - update one address.
  Future<ApiResponse<views.Account>> updateAccountAddress(
    Object accountId,
    Object addressId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateAccountAddress(
        client,
        accountId,
        addressId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/v4/accounts/{account_id}/addresses/{address_id}` - delete one address.
  Future<ApiResponse<Object?>> deleteAccountAddress(
    Object accountId,
    Object addressId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteAccountAddress(
        client,
        accountId,
        addressId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/billing_preferences` - the billing preferences.
  Future<ApiResponse<views.Account>> getAccountBillingPreferences(
    Object accountId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountBillingPreferences(
        client,
        accountId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PUT /api/v4/accounts/{account_id}/billing_preferences` - replace the preferences.
  Future<ApiResponse<views.Account>> replaceAccountBillingPreferences(
    Object accountId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.replaceAccountBillingPreferences(
        client,
        accountId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/payment_methods` - the account's payment methods.
  Future<ApiResponse<views.Account>> getAccountPaymentMethods(
    Object accountId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountPaymentMethods(
        client,
        accountId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/payment_methods/{payment_method_id}` - one payment method.
  Future<ApiResponse<views.AccountPaymentMethod>> getAccountPaymentMethod(
    Object accountId,
    Object paymentMethodId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountPaymentMethod(
        client,
        accountId,
        paymentMethodId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/v4/accounts/{account_id}/payment_methods/{payment_method_id}` - update one method.
  Future<ApiResponse<views.Account>> updateAccountPaymentMethod(
    Object accountId,
    Object paymentMethodId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateAccountPaymentMethod(
        client,
        accountId,
        paymentMethodId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/v4/accounts/{account_id}/payment_methods/{payment_method_id}` - delete one method.
  Future<ApiResponse<Object?>> deleteAccountPaymentMethod(
    Object accountId,
    Object paymentMethodId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteAccountPaymentMethod(
        client,
        accountId,
        paymentMethodId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/notes` - the account's notes.
  Future<ApiResponse<views.AccountNoteList>> getAccountNotes(
    Object accountId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountNotes(
        client,
        accountId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/notes/{note_id}` - one note.
  Future<ApiResponse<views.AccountNote>> getAccountNote(
    Object accountId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountNote(
        client,
        accountId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/v4/accounts/{account_id}/notes` - attach a note.
  Future<ApiResponse<views.AccountNotes>> createAccountNote(
    Object accountId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createAccountNote(
        client,
        accountId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/v4/accounts/{account_id}/notes/{note_id}` - update a note's text.
  Future<ApiResponse<views.AccountNotes>> updateAccountNote(
    Object accountId,
    Object noteId,
    String note, {
    Map<String, Object?>? files,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateAccountNote(
        client,
        accountId,
        noteId,
        note,
        files: files,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/v4/accounts/{account_id}/notes/{note_id}` - delete one note.
  Future<ApiResponse<Object?>> deleteAccountNote(
    Object accountId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteAccountNote(
        client,
        accountId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/notes/{note_id}/files` - a note's attachments.
  Future<ApiResponse<views.AccountNoteFileList>> getAccountNoteFiles(
    Object accountId,
    Object noteId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountNoteFiles(
        client,
        accountId,
        noteId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/notes/{note_id}/files/{file_id}` - one attachment.
  Future<ApiResponse<views.AccountNoteFile>> getAccountNoteFile(
    Object accountId,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountNoteFile(
        client,
        accountId,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/communications/emails` - emails sent to the account.
  Future<ApiResponse<views.AccountCommunicationsEmailList>> getAccountEmails(
    Object accountId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountEmails(
        client,
        accountId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/communications/emails/{email_id}` - one email.
  Future<ApiResponse<views.AccountCommunicationsEmail>> getAccountEmail(
    Object accountId,
    Object emailId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountEmail(
        client,
        accountId,
        emailId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/orders` - the account's orders.
  Future<ApiResponse<views.AccountOrders>> getAccountOrders(
    Object accountId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountOrders(
        client,
        accountId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/invoices` - the account's invoices.
  Future<ApiResponse<views.AccountInvoiceList>> getAccountInvoices(
    Object accountId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountInvoices(
        client,
        accountId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/payments` - the account's payments.
  Future<ApiResponse<views.AccountPayments>> getAccountPayments(
    Object accountId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountPayments(
        client,
        accountId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/refunds` - the account's refunds.
  Future<ApiResponse<views.AccountRefunds>> getAccountRefunds(
    Object accountId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountRefunds(
        client,
        accountId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/credit_notes` - the account's credit notes.
  Future<ApiResponse<views.AccountCreditNoteList>> getAccountCreditNotes(
    Object accountId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountCreditNotes(
        client,
        accountId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/purchase_orders` - the account's purchase orders.
  Future<ApiResponse<views.AccountPurchaseOrders>> getAccountPurchaseOrders(
    Object accountId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountPurchaseOrders(
        client,
        accountId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/purchase_invoices` - the account's purchase invoices.
  Future<ApiResponse<views.AccountPurchaseInvoices>> getAccountPurchaseInvoices(
    Object accountId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountPurchaseInvoices(
        client,
        accountId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/purchase_payments` - the account's purchase payments.
  Future<ApiResponse<views.AccountPurchasePayments>> getAccountPurchasePayments(
    Object accountId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountPurchasePayments(
        client,
        accountId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/purchase_refunds` - the account's purchase refunds.
  Future<ApiResponse<views.AccountPurchaseRefunds>> getAccountPurchaseRefunds(
    Object accountId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountPurchaseRefunds(
        client,
        accountId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/custom_objects` - the account's custom objects.
  Future<ApiResponse<views.AccountCustomObjectList>> getAccountCustomObjects(
    Object accountId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountCustomObjects(
        client,
        accountId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/inventories` - the account's inventories.
  Future<ApiResponse<views.AccountInventories>> getAccountInventories(
    Object accountId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountInventories(
        client,
        accountId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/v4/accounts/{account_id}/quote_partial_invoices` - partial invoices from quotes.
  Future<ApiResponse<views.AccountQuotePartialInvoices>>
      getAccountQuotePartialInvoices(
    Object accountId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getAccountQuotePartialInvoices(
            client,
            accountId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/accounts/{account_id}/kpis`
  Future<ApiResponse<views.AccountKpis>> getAccountKpis(
    Object accountId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountKpis(
        client,
        accountId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/accounts/{account_id}/financial_summary`
  Future<ApiResponse<views.AccountFinancialSummary>> getAccountFinancialSummary(
    Object accountId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountFinancialSummary(
        client,
        accountId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/accounts/{account_id}/custom_objects/{custom_object_id}`
  Future<ApiResponse<views.AccountCustomObjectRead>> getAccountCustomObject(
    Object accountId,
    Object customObjectId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountCustomObject(
        client,
        accountId,
        customObjectId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/accounts/{account_id}/custom_objects/{custom_object_id}/instances/{custom_object_instance_id}`
  Future<ApiResponse<Object?>> getAccountCustomObjectInstance(
    Object accountId,
    Object customObjectId,
    Object customObjectInstanceId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountCustomObjectInstance(
        client,
        accountId,
        customObjectId,
        customObjectInstanceId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/accounts/{account_id}/component/{component_id}`
  Future<ApiResponse<views.ComponentObjects>> getAccountComponentObjects(
    Object accountId,
    Object componentId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountComponentObjects(
        client,
        accountId,
        componentId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/accounts/{account_id}/component/{component_id}/{component_object_id}`
  Future<ApiResponse<views.AccountComponentObject>> getAccountComponentObject(
    Object accountId,
    Object componentId,
    Object componentObjectId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getAccountComponentObject(
        client,
        accountId,
        componentId,
        componentObjectId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/accounts`
  Future<ApiResponse<views.Account>> createAccount(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createAccount(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PUT /api/{api_version}/accounts/{account_id}`
  Future<ApiResponse<views.Account>> replaceAccount(
    Object accountId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.replaceAccount(
        client,
        accountId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/accounts/{account_id}/reactivate`
  Future<ApiResponse<views.Account>> reactivateAccount(
    Object accountId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.reactivateAccount(
        client,
        accountId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/accounts/{account_id}/contacts`
  Future<ApiResponse<views.Account>> createAccountContacts(
    Object accountId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createAccountContacts(
        client,
        accountId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PUT /api/{api_version}/accounts/{account_id}/addresses/{address_id}`
  Future<ApiResponse<views.Account>> replaceAccountAddress(
    Object accountId,
    Object addressId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.replaceAccountAddress(
        client,
        accountId,
        addressId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/accounts/{account_id}/payment_methods`
  Future<ApiResponse<views.Account>> createAccountPaymentMethod(
    Object accountId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createAccountPaymentMethod(
        client,
        accountId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PUT /api/{api_version}/accounts/{account_id}/payment_methods/{payment_method_id}`
  Future<ApiResponse<views.Account>> replaceAccountPaymentMethod(
    Object accountId,
    Object paymentMethodId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.replaceAccountPaymentMethod(
        client,
        accountId,
        paymentMethodId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/accounts/{account_id}/custom_objects/{custom_object_id}`
  Future<ApiResponse<Object?>> createAccountCustomObjectInstance(
    Object accountId,
    Object customObjectId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createAccountCustomObjectInstance(
        client,
        accountId,
        customObjectId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/accounts/{account_id}/custom_objects_instances/{custom_object_instance_id}`
  Future<ApiResponse<views.Account>> updateAccountCustomObjectInstance(
    Object accountId,
    Object customObjectInstanceId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateAccountCustomObjectInstance(
        client,
        accountId,
        customObjectInstanceId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/accounts/{account_id}/communications/emails`
  Future<ApiResponse<Object?>> sendAccountEmail(
    Object accountId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.sendAccountEmail(
        client,
        accountId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/accounts/{account_id}/purge`
  Future<ApiResponse<Object?>> purgeAccount(
    Object accountId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.purgeAccount(
        client,
        accountId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/accounts/{account_id}/notes/{note_id}/files/{file_id}`
  Future<ApiResponse<Object?>> deleteAccountNoteFile(
    Object accountId,
    Object noteId,
    Object fileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteAccountNoteFile(
        client,
        accountId,
        noteId,
        fileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
