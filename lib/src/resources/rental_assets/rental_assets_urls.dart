/// Rental assets path templates and body keys; the client fills `{api_version}`.
library;

class RentalAssetsUrls {
  RentalAssetsUrls._();

  static const String rentalAssetAvailability =
      '/api/{api_version}/rental_asset_availability';
  static const String rentalAssetProfiles =
      '/api/{api_version}/rental_asset_profiles';
  static const String rentalAssets = '/api/{api_version}/rental_assets';
  static const String rentalAssetProfile =
      '/api/{api_version}/rental_asset_profiles/{rental_asset_profile_id}';
  static const String rentalAsset =
      '/api/{api_version}/rental_assets/{rental_asset_uuid}';
  static const String rentalAssetCancel =
      '/api/{api_version}/rental_assets/{rental_asset_id}/cancel';
  static const String rentalAssetReactivate =
      '/api/{api_version}/rental_assets/{rental_asset_id}/reactivate';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String rentalAssetKey = 'rental_asset';
  static const String rentalAssetProfileKey = 'rental_asset_profile';
}
