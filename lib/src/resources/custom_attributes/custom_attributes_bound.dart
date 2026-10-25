/// The v4 custom attributes endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'custom_attributes.dart' as endpoints;
import 'custom_attributes_dto.dart' as views;

/// The custom attributes endpoints with [client] already applied.
class CustomAttributesResource {
  /// Bind the resource to a client; normally reached via `client.customAttributes`.
  const CustomAttributesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/custom_attributes`
  Future<ApiResponse<views.CustomAttributeList>> getCustomAttributes({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getCustomAttributes(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/custom_attributes`
  Future<ApiResponse<views.CustomAttributes>> createCustomAttribute(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createCustomAttribute(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/custom_attributes/{custom_attribute_id}`
  Future<ApiResponse<Object?>> deleteCustomAttribute(
    Object customAttributeId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteCustomAttribute(
        client,
        customAttributeId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/custom_attributes/{custom_attribute_id}`
  Future<ApiResponse<views.CustomAttribute>> getCustomAttribute(
    Object customAttributeId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getCustomAttribute(
        client,
        customAttributeId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/custom_attributes/{custom_attribute_id}`
  Future<ApiResponse<views.CustomAttribute>> updateCustomAttribute(
    Object customAttributeId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateCustomAttribute(
        client,
        customAttributeId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
