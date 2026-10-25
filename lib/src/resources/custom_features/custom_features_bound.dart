/// The v4 custom features endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'custom_features.dart' as endpoints;
import 'custom_features_dto.dart' as views;

/// The custom features endpoints with [client] already applied.
class CustomFeaturesResource {
  /// Bind the resource to a client; normally reached via `client.customFeatures`.
  const CustomFeaturesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `POST /api/{api_version}/custom_feature`
  Future<ApiResponse<views.CustomFeature>> createCustomFeature(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createCustomFeature(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/component/{custom_feature_id}`
  Future<ApiResponse<Object?>> deleteComponentById(
    Object customFeatureId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteComponentById(
        client,
        customFeatureId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/custom_feature/{custom_feature_id}`
  Future<ApiResponse<views.CustomFeature>> updateCustomFeatureById(
    Object customFeatureId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateCustomFeatureById(
        client,
        customFeatureId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/custom_feature/{custom_feature_id}`
  Future<ApiResponse<views.CustomFeature>> createCustomFeatureById(
    Object customFeatureId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createCustomFeatureById(
        client,
        customFeatureId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/custom_feature`
  Future<ApiResponse<views.CustomFeatureList>> getCustomFeatures({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getCustomFeatures(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/custom_feature/{custom_feature_id}`
  Future<ApiResponse<views.CustomFeature>> getCustomFeatureById(
    Object customFeatureId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getCustomFeatureById(
        client,
        customFeatureId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/custom_feature/{custom_feature_id}`
  Future<ApiResponse<Object?>> deleteCustomFeatureById(
    Object customFeatureId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteCustomFeatureById(
        client,
        customFeatureId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
