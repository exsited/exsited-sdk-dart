/// The v4 shipping packages endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'shipping_packages.dart' as endpoints;
import 'shipping_packages_dto.dart' as views;

/// The shipping packages endpoints with [client] already applied.
class ShippingPackagesResource {
  /// Bind the resource to a client; normally reached via `client.shippingPackages`.
  const ShippingPackagesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/shipping_packages`
  Future<ApiResponse<views.SettingsShippingPackageList>>
      getSettingsShippingPackages({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsShippingPackages(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/shipping_packages`
  Future<ApiResponse<views.SettingsShippingPackage>>
      createSettingsShippingPackage(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsShippingPackage(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/shipping_packages/{shipping_package_id}`
  Future<ApiResponse<views.SettingsShippingPackage>> getSettingsShippingPackage(
    Object shippingPackageId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsShippingPackage(
        client,
        shippingPackageId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/shipping_packages/{shipping_package_id}`
  Future<ApiResponse<Object?>> deleteSettingsShippingPackage(
    Object shippingPackageId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsShippingPackage(
        client,
        shippingPackageId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/shipping_packages/{shipping_package_id}`
  Future<ApiResponse<views.SettingsShippingPackage>>
      updateSettingsShippingPackage(
    Object shippingPackageId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsShippingPackage(
            client,
            shippingPackageId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );
}
