/// The v4 gift certificates endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'gift_certificates.dart' as endpoints;
import 'gift_certificates_dto.dart' as views;

/// The gift certificates endpoints with [client] already applied.
class GiftCertificatesResource {
  /// Bind the resource to a client; normally reached via `client.giftCertificates`.
  const GiftCertificatesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/gift_certificates`
  Future<ApiResponse<views.GiftCertificateList>> getGiftCertificates({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getGiftCertificates(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/gift_certificates`
  Future<ApiResponse<views.GiftCertificate>> createGiftCertificate(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createGiftCertificate(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/gift_certificates/{gc_id}`
  Future<ApiResponse<Object?>> deleteGiftCertificate(
    Object gcId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteGiftCertificate(
        client,
        gcId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/gift_certificates/{gc_id}`
  Future<ApiResponse<views.GiftCertificate>> getGiftCertificate(
    Object gcId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getGiftCertificate(
        client,
        gcId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/gift_certificates/{gc_id}`
  Future<ApiResponse<views.GiftCertificate>> updateGiftCertificate(
    Object gcId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateGiftCertificate(
        client,
        gcId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/gift_certificates/{gc_id}/allocations`
  Future<ApiResponse<views.GiftCertificateAllocations>>
      getGiftCertificateAllocations(
    Object gcId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getGiftCertificateAllocations(
            client,
            gcId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/gift_certificates/{gc_id}/transactions`
  Future<ApiResponse<views.GiftCertificateTransactionList>>
      getGiftCertificateTransactions(
    Object gcId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getGiftCertificateTransactions(
            client,
            gcId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/gift_certificates/{gc_id}/amend`
  Future<ApiResponse<views.GiftCertificate>> amendGiftCertificate(
    Object gcId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.amendGiftCertificate(
        client,
        gcId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/gift_certificates/{gc_id}/allocations`
  Future<ApiResponse<views.GiftCertificate>> allocateGiftCertificate(
    Object gcId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.allocateGiftCertificate(
        client,
        gcId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/gift_certificates/{gc_id}/deallocations`
  Future<ApiResponse<views.GiftCertificate>> deallocateGiftCertificate(
    Object gcId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deallocateGiftCertificate(
        client,
        gcId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/gift_certificates/{gc_id}/allocations/{allocation_id}`
  Future<ApiResponse<views.GiftCertificateAllocationRead>>
      getGiftCertificateAllocation(
    Object gcId,
    Object allocationId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getGiftCertificateAllocation(
            client,
            gcId,
            allocationId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/gift_certificates/{gc_id}/transactions/{transaction_id}`
  Future<ApiResponse<views.GiftCertificateTransactionRead>>
      getGiftCertificateTransaction(
    Object gcId,
    Object transactionId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getGiftCertificateTransaction(
            client,
            gcId,
            transactionId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );
}
