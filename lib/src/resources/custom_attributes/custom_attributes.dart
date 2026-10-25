/// The v4 custom attributes endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'custom_attributes_dto.dart';
import 'custom_attributes_urls.dart';

/// `GET /api/{api_version}/custom_attributes`
Future<ApiResponse<CustomAttributeList>> getCustomAttributes(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomAttributesUrls.customAttributes,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CustomAttributeList.fromMap);

/// `POST /api/{api_version}/custom_attributes`
Future<ApiResponse<CustomAttributes>> createCustomAttribute(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(CustomAttributesUrls.customAttributes,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CustomAttributes.fromMap);

/// `DELETE /api/{api_version}/custom_attributes/{custom_attribute_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteCustomAttribute(
  ExsitedClient client,
  Object customAttributeId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(CustomAttributesUrls.customAttribute,
        pathParams: {'custom_attribute_id': customAttributeId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/custom_attributes/{custom_attribute_id}`
Future<ApiResponse<CustomAttribute>> getCustomAttribute(
  ExsitedClient client,
  Object customAttributeId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomAttributesUrls.customAttribute,
        pathParams: {'custom_attribute_id': customAttributeId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CustomAttribute.fromMap);

/// `PATCH /api/{api_version}/custom_attributes/{custom_attribute_id}`
Future<ApiResponse<CustomAttribute>> updateCustomAttribute(
  ExsitedClient client,
  Object customAttributeId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(CustomAttributesUrls.customAttribute,
        pathParams: {'custom_attribute_id': customAttributeId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CustomAttribute.fromMap);
