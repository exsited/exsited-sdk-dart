/// The v4 gift certificates endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'gift_certificates_dto.dart';
import 'gift_certificates_urls.dart';

/// `GET /api/{api_version}/gift_certificates`
Future<ApiResponse<GiftCertificateList>> getGiftCertificates(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(GiftCertificatesUrls.giftCertificates,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: GiftCertificateList.fromMap);

/// `POST /api/{api_version}/gift_certificates`
Future<ApiResponse<GiftCertificate>> createGiftCertificate(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(GiftCertificatesUrls.giftCertificates,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: GiftCertificate.fromMap);

/// `DELETE /api/{api_version}/gift_certificates/{gc_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteGiftCertificate(
  ExsitedClient client,
  Object gcId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(GiftCertificatesUrls.giftCertificate,
        pathParams: {'gc_id': gcId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/gift_certificates/{gc_id}`
Future<ApiResponse<GiftCertificate>> getGiftCertificate(
  ExsitedClient client,
  Object gcId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(GiftCertificatesUrls.giftCertificate,
        pathParams: {'gc_id': gcId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: GiftCertificate.fromMap);

/// `PATCH /api/{api_version}/gift_certificates/{gc_id}`
Future<ApiResponse<GiftCertificate>> updateGiftCertificate(
  ExsitedClient client,
  Object gcId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(GiftCertificatesUrls.giftCertificate,
        pathParams: {'gc_id': gcId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: GiftCertificate.fromMap);

/// `GET /api/{api_version}/gift_certificates/{gc_id}/allocations`
Future<ApiResponse<GiftCertificateAllocations>> getGiftCertificateAllocations(
  ExsitedClient client,
  Object gcId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(GiftCertificatesUrls.giftCertificateAllocations,
        pathParams: {'gc_id': gcId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: GiftCertificateAllocations.fromMap);

/// `GET /api/{api_version}/gift_certificates/{gc_id}/transactions`
Future<ApiResponse<GiftCertificateTransactionList>>
    getGiftCertificateTransactions(
  ExsitedClient client,
  Object gcId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(GiftCertificatesUrls.giftCertificateTransactions,
            pathParams: {'gc_id': gcId},
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: GiftCertificateTransactionList.fromMap);

/// `POST /api/{api_version}/gift_certificates/{gc_id}/amend`
///
/// Set a new balance, as `{"gift_certificate": {"new_balance":...}}`; a balance
/// below the used amount is a `400`.
Future<ApiResponse<GiftCertificate>> amendGiftCertificate(
  ExsitedClient client,
  Object gcId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(GiftCertificatesUrls.giftCertificateAmend,
        pathParams: {'gc_id': gcId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: GiftCertificate.fromMap);

/// `POST /api/{api_version}/gift_certificates/{gc_id}/allocations`
///
/// Allocate to an account, as `{"gift_certificate": {"account":
/// {"code":...}}}`; `200`, not `201`.
Future<ApiResponse<GiftCertificate>> allocateGiftCertificate(
  ExsitedClient client,
  Object gcId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(GiftCertificatesUrls.giftCertificateAllocations,
        pathParams: {'gc_id': gcId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: GiftCertificate.fromMap);

/// `POST /api/{api_version}/gift_certificates/{gc_id}/deallocations`
///
/// Take an allocation back from an account, with the same body
/// `allocateGiftCertificate` takes.
Future<ApiResponse<GiftCertificate>> deallocateGiftCertificate(
  ExsitedClient client,
  Object gcId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(GiftCertificatesUrls.giftCertificateDeallocations,
        pathParams: {'gc_id': gcId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: GiftCertificate.fromMap);

/// `GET /api/{api_version}/gift_certificates/{gc_id}/allocations/{allocation_id}`
///
/// Retrieve one allocation, under `gift_certificate_allocation`.
Future<ApiResponse<GiftCertificateAllocationRead>> getGiftCertificateAllocation(
  ExsitedClient client,
  Object gcId,
  Object allocationId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(GiftCertificatesUrls.giftCertificateAllocation,
        pathParams: {'gc_id': gcId, 'allocation_id': allocationId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: GiftCertificateAllocationRead.fromMap);

/// `GET /api/{api_version}/gift_certificates/{gc_id}/transactions/{transaction_id}`
///
/// Retrieve one transaction, under `gift_certificate_transaction`.
Future<ApiResponse<GiftCertificateTransactionRead>>
    getGiftCertificateTransaction(
  ExsitedClient client,
  Object gcId,
  Object transactionId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(GiftCertificatesUrls.giftCertificateTransaction,
            pathParams: {'gc_id': gcId, 'transaction_id': transactionId},
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: GiftCertificateTransactionRead.fromMap);
