/// Shipping packages path templates and body keys; the client fills `{api_version}`.
library;

class ShippingPackagesUrls {
  ShippingPackagesUrls._();

  static const String settingsShippingPackages =
      '/api/{api_version}/settings/shipping_packages';
  static const String settingsShippingPackage =
      '/api/{api_version}/settings/shipping_packages/{shipping_package_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String shippingPackageKey = 'shipping_package';
}
