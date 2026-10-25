/// The v4 fulfillment terms endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'fulfillment_terms.dart' as endpoints;
import 'fulfillment_terms_dto.dart' as views;

/// The fulfillment terms endpoints with [client] already applied.
class FulfillmentTermsResource {
  /// Bind the resource to a client; normally reached via `client.fulfillmentTerms`.
  const FulfillmentTermsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/fulfillment_terms`
  Future<ApiResponse<views.SettingsFulfillmentTermList>>
      getSettingsFulfillmentTerms({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsFulfillmentTerms(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/fulfillment_terms`
  Future<ApiResponse<views.SettingsFulfillmentTerm>>
      createSettingsFulfillmentTerm(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsFulfillmentTerm(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/fulfillment_terms/{fulfillment_term_id}`
  Future<ApiResponse<views.SettingsFulfillmentTerm>> getSettingsFulfillmentTerm(
    Object fulfillmentTermId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsFulfillmentTerm(
        client,
        fulfillmentTermId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/fulfillment_terms/{fulfillment_term_id}`
  Future<ApiResponse<Object?>> deleteSettingsFulfillmentTerm(
    Object fulfillmentTermId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsFulfillmentTerm(
        client,
        fulfillmentTermId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/fulfillment_terms/{fulfillment_term_id}`
  Future<ApiResponse<views.SettingsFulfillmentTerm>>
      updateSettingsFulfillmentTerm(
    Object fulfillmentTermId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsFulfillmentTerm(
            client,
            fulfillmentTermId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );
}
