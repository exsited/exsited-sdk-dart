/// The v4 rental assets endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'rental_assets_dto.dart';
import 'rental_assets_urls.dart';

/// `GET /api/{api_version}/rental_asset_availability`
Future<ApiResponse<RentalAssetAvailabilityList>> getRentalAssetAvailability(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(RentalAssetsUrls.rentalAssetAvailability,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RentalAssetAvailabilityList.fromMap);

/// `PATCH /api/{api_version}/rental_asset_availability`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateRentalAssetAvailability(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(RentalAssetsUrls.rentalAssetAvailability,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/rental_asset_profiles`
Future<ApiResponse<RentalAssetProfileList>> getRentalAssetProfiles(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(RentalAssetsUrls.rentalAssetProfiles,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RentalAssetProfileList.fromMap);

/// `POST /api/{api_version}/rental_asset_profiles`
Future<ApiResponse<RentalAssetProfileView>> createRentalAssetProfile(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(RentalAssetsUrls.rentalAssetProfiles,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RentalAssetProfileView.fromMap);

/// `GET /api/{api_version}/rental_assets`
Future<ApiResponse<RentalAssetList>> getRentalAssets(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(RentalAssetsUrls.rentalAssets,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RentalAssetList.fromMap);

/// `POST /api/{api_version}/rental_assets`
Future<ApiResponse<RentalAsset>> createRentalAsset(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(RentalAssetsUrls.rentalAssets,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RentalAsset.fromMap);

/// `GET /api/{api_version}/rental_asset_profiles/{rental_asset_profile_id}`
Future<ApiResponse<RentalAssetProfileView>> getRentalAssetProfile(
  ExsitedClient client,
  Object rentalAssetProfileId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(RentalAssetsUrls.rentalAssetProfile,
        pathParams: {'rental_asset_profile_id': rentalAssetProfileId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RentalAssetProfileView.fromMap);

/// `PATCH /api/{api_version}/rental_asset_profiles/{rental_asset_profile_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateRentalAssetProfile(
  ExsitedClient client,
  Object rentalAssetProfileId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(RentalAssetsUrls.rentalAssetProfile,
        pathParams: {'rental_asset_profile_id': rentalAssetProfileId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/rental_asset_profiles/{rental_asset_profile_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteRentalAssetProfile(
  ExsitedClient client,
  Object rentalAssetProfileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(RentalAssetsUrls.rentalAssetProfile,
        pathParams: {'rental_asset_profile_id': rentalAssetProfileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/rental_assets/{rental_asset_uuid}`
Future<ApiResponse<RentalAsset>> updateRentalAsset(
  ExsitedClient client,
  Object rentalAssetUuid,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(RentalAssetsUrls.rentalAsset,
        pathParams: {'rental_asset_uuid': rentalAssetUuid},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RentalAsset.fromMap);

/// `DELETE /api/{api_version}/rental_assets/{rental_asset_uuid}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteRentalAsset(
  ExsitedClient client,
  Object rentalAssetUuid, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(RentalAssetsUrls.rentalAsset,
        pathParams: {'rental_asset_uuid': rentalAssetUuid},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/rental_assets/{rental_asset_uuid}`
Future<ApiResponse<RentalAsset>> getRentalAsset(
  ExsitedClient client,
  Object rentalAssetUuid, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(RentalAssetsUrls.rentalAsset,
        pathParams: {'rental_asset_uuid': rentalAssetUuid},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RentalAsset.fromMap);

/// `POST /api/{api_version}/rental_assets/{rental_asset_id}/cancel`
Future<ApiResponse<RentalAsset>> cancelRentalAsset(
  ExsitedClient client,
  Object rentalAssetId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(RentalAssetsUrls.rentalAssetCancel,
        pathParams: {'rental_asset_id': rentalAssetId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RentalAsset.fromMap);

/// `POST /api/{api_version}/rental_assets/{rental_asset_id}/reactivate`
Future<ApiResponse<RentalAsset>> reactivateRentalAsset(
  ExsitedClient client,
  Object rentalAssetId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(RentalAssetsUrls.rentalAssetReactivate,
        pathParams: {'rental_asset_id': rentalAssetId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: RentalAsset.fromMap);
