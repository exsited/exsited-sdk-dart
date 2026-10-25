/// The v4 rental assets endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'rental_assets.dart' as endpoints;
import 'rental_assets_dto.dart' as views;

/// The rental assets endpoints with [client] already applied.
class RentalAssetsResource {
  /// Bind the resource to a client; normally reached via `client.rentalAssets`.
  const RentalAssetsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/rental_asset_availability`
  Future<ApiResponse<views.RentalAssetAvailabilityList>>
      getRentalAssetAvailability({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getRentalAssetAvailability(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/rental_asset_availability`
  Future<ApiResponse<Object?>> updateRentalAssetAvailability(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateRentalAssetAvailability(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/rental_asset_profiles`
  Future<ApiResponse<views.RentalAssetProfileList>> getRentalAssetProfiles({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getRentalAssetProfiles(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/rental_asset_profiles`
  Future<ApiResponse<views.RentalAssetProfileView>> createRentalAssetProfile(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createRentalAssetProfile(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/rental_assets`
  Future<ApiResponse<views.RentalAssetList>> getRentalAssets({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getRentalAssets(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/rental_assets`
  Future<ApiResponse<views.RentalAsset>> createRentalAsset(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createRentalAsset(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/rental_asset_profiles/{rental_asset_profile_id}`
  Future<ApiResponse<views.RentalAssetProfileView>> getRentalAssetProfile(
    Object rentalAssetProfileId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getRentalAssetProfile(
        client,
        rentalAssetProfileId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/rental_asset_profiles/{rental_asset_profile_id}`
  Future<ApiResponse<Object?>> updateRentalAssetProfile(
    Object rentalAssetProfileId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateRentalAssetProfile(
        client,
        rentalAssetProfileId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/rental_asset_profiles/{rental_asset_profile_id}`
  Future<ApiResponse<Object?>> deleteRentalAssetProfile(
    Object rentalAssetProfileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteRentalAssetProfile(
        client,
        rentalAssetProfileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/rental_assets/{rental_asset_uuid}`
  Future<ApiResponse<views.RentalAsset>> updateRentalAsset(
    Object rentalAssetUuid,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateRentalAsset(
        client,
        rentalAssetUuid,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/rental_assets/{rental_asset_uuid}`
  Future<ApiResponse<Object?>> deleteRentalAsset(
    Object rentalAssetUuid, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteRentalAsset(
        client,
        rentalAssetUuid,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/rental_assets/{rental_asset_uuid}`
  Future<ApiResponse<views.RentalAsset>> getRentalAsset(
    Object rentalAssetUuid, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getRentalAsset(
        client,
        rentalAssetUuid,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/rental_assets/{rental_asset_id}/cancel`
  Future<ApiResponse<views.RentalAsset>> cancelRentalAsset(
    Object rentalAssetId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.cancelRentalAsset(
        client,
        rentalAssetId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/rental_assets/{rental_asset_id}/reactivate`
  Future<ApiResponse<views.RentalAsset>> reactivateRentalAsset(
    Object rentalAssetId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.reactivateRentalAsset(
        client,
        rentalAssetId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
