/// The v4 custom features endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'custom_features_dto.dart';
import 'custom_features_urls.dart';

/// `POST /api/{api_version}/custom_feature`
Future<ApiResponse<CustomFeature>> createCustomFeature(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CustomFeaturesUrls.customFeature,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CustomFeature.fromMap);

/// `DELETE /api/{api_version}/component/{custom_feature_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteComponentById(
  ExsitedClient client,
  Object customFeatureId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(CustomFeaturesUrls.componentById,
        pathParams: {'custom_feature_id': customFeatureId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/custom_feature/{custom_feature_id}`
Future<ApiResponse<CustomFeature>> updateCustomFeatureById(
  ExsitedClient client,
  Object customFeatureId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(CustomFeaturesUrls.customFeatureById,
        pathParams: {'custom_feature_id': customFeatureId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CustomFeature.fromMap);

/// `POST /api/{api_version}/custom_feature/{custom_feature_id}`
Future<ApiResponse<CustomFeature>> createCustomFeatureById(
  ExsitedClient client,
  Object customFeatureId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CustomFeaturesUrls.customFeatureById,
        pathParams: {'custom_feature_id': customFeatureId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CustomFeature.fromMap);

/// `GET /api/{api_version}/custom_feature`
///
/// List custom features, cursor paged, the active ones only.
Future<ApiResponse<CustomFeatureList>> getCustomFeatures(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomFeaturesUrls.customFeature,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CustomFeatureList.fromMap);

/// `GET /api/{api_version}/custom_feature/{custom_feature_id}`
///
/// Retrieve custom feature, the `cmp_` id, under `custom_feature`; a deleted
/// one is `404`.
Future<ApiResponse<CustomFeature>> getCustomFeatureById(
  ExsitedClient client,
  Object customFeatureId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomFeaturesUrls.customFeatureById,
        pathParams: {'custom_feature_id': customFeatureId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CustomFeature.fromMap);

/// `DELETE /api/{api_version}/custom_feature/{custom_feature_id}`
///
/// Delete custom feature, the `cmp_` id; answered `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteCustomFeatureById(
  ExsitedClient client,
  Object customFeatureId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(CustomFeaturesUrls.customFeatureById,
        pathParams: {'custom_feature_id': customFeatureId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
