/// The v4 shipping packages endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'shipping_packages_dto.dart';
import 'shipping_packages_urls.dart';

/// `GET /api/{api_version}/settings/shipping_packages`
///
/// List shipping packages.
Future<ApiResponse<SettingsShippingPackageList>> getSettingsShippingPackages(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ShippingPackagesUrls.settingsShippingPackages,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsShippingPackageList.fromMap);

/// `POST /api/{api_version}/settings/shipping_packages`
///
/// Create a shipping package; a `*_uom` is the unit's bare uuid, not its
/// prefixed id.
Future<ApiResponse<SettingsShippingPackage>> createSettingsShippingPackage(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ShippingPackagesUrls.settingsShippingPackages,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsShippingPackage.fromMap);

/// `GET /api/{api_version}/settings/shipping_packages/{shipping_package_id}`
///
/// Get one shipping package.
Future<ApiResponse<SettingsShippingPackage>> getSettingsShippingPackage(
  ExsitedClient client,
  Object shippingPackageId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ShippingPackagesUrls.settingsShippingPackage,
        pathParams: {'shipping_package_id': shippingPackageId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsShippingPackage.fromMap);

/// `DELETE /api/{api_version}/settings/shipping_packages/{shipping_package_id}`
///
/// Delete a shipping package.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsShippingPackage(
  ExsitedClient client,
  Object shippingPackageId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ShippingPackagesUrls.settingsShippingPackage,
        pathParams: {'shipping_package_id': shippingPackageId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/shipping_packages/{shipping_package_id}`
///
/// Update a shipping package.
Future<ApiResponse<SettingsShippingPackage>> updateSettingsShippingPackage(
  ExsitedClient client,
  Object shippingPackageId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ShippingPackagesUrls.settingsShippingPackage,
        pathParams: {'shipping_package_id': shippingPackageId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsShippingPackage.fromMap);
