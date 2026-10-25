/// The v4 receive terms endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'receive_terms.dart' as endpoints;
import 'receive_terms_dto.dart' as views;

/// The receive terms endpoints with [client] already applied.
class ReceiveTermsResource {
  /// Bind the resource to a client; normally reached via `client.receiveTerms`.
  const ReceiveTermsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/receive_terms`
  Future<ApiResponse<views.SettingsReceiveTermList>> getSettingsReceiveTerms({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsReceiveTerms(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/receive_terms`
  Future<ApiResponse<views.SettingsReceiveTerm>> createSettingsReceiveTerm(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsReceiveTerm(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/receive_terms/{receive_term_id}`
  Future<ApiResponse<views.SettingsReceiveTerm>> getSettingsReceiveTerm(
    Object receiveTermId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsReceiveTerm(
        client,
        receiveTermId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/receive_terms/{receive_term_id}`
  Future<ApiResponse<Object?>> deleteSettingsReceiveTerm(
    Object receiveTermId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsReceiveTerm(
        client,
        receiveTermId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/receive_terms/{receive_term_id}`
  Future<ApiResponse<views.SettingsReceiveTerm>> updateSettingsReceiveTerm(
    Object receiveTermId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsReceiveTerm(
        client,
        receiveTermId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
