/// Settings path templates and body keys; the client fills `{api_version}`.
library;

class SettingsUrls {
  SettingsUrls._();

  static const String customObjects = '/api/{api_version}/custom_objects';
  static const String settings = '/api/{api_version}/settings';
  static const String customObject =
      '/api/{api_version}/custom_objects/{custom_object_id}';
  static const String settingsCurrencies =
      '/api/{api_version}/settings/currencies';
  static const String settingsCustomLogicScripts =
      '/api/{api_version}/settings/custom_logic_scripts';
  static const String settingsCustomObjects =
      '/api/{api_version}/settings/custom_objects';
  static const String settingsDiscountProfiles =
      '/api/{api_version}/settings/discount_profiles';
  static const String settingsItemGroups =
      '/api/{api_version}/settings/item_groups';
  static const String settingsPaymentProcessors =
      '/api/{api_version}/settings/payment_processors';
  static const String settingsPaymentTerms =
      '/api/{api_version}/settings/payment_terms';
  static const String settingsPricingLevels =
      '/api/{api_version}/settings/pricing_levels';
  static const String settingsShippingProfiles =
      '/api/{api_version}/settings/shipping_profiles';
  static const String settingsTaxes = '/api/{api_version}/settings/taxes';
  static const String settingsTimeZones =
      '/api/{api_version}/settings/time_zones';
  static const String settingsVariations =
      '/api/{api_version}/settings/variations';
  static const String settingsWarehouses =
      '/api/{api_version}/settings/warehouses';
  static const String settingsCurrency =
      '/api/{api_version}/settings/currencies/{currency_id}';
  static const String settingsCustomLogicScript =
      '/api/{api_version}/settings/custom_logic_scripts/{custom_logic_script_id}';
  static const String settingsCustomObject =
      '/api/{api_version}/settings/custom_objects/{custom_object_id}';
  static const String settingsFieldSettingsAccount =
      '/api/{api_version}/settings/field_settings/account';
  static const String settingsFieldSettingsItem =
      '/api/{api_version}/settings/field_settings/item';
  static const String settingsGeneralSettingsAccount =
      '/api/{api_version}/settings/general_settings/account';
  static const String settingsGeneralSettingsItem =
      '/api/{api_version}/settings/general_settings/item';
  static const String settingsItemGroup =
      '/api/{api_version}/settings/item_groups/{item_group_id}';
  static const String settingsTimeZone =
      '/api/{api_version}/settings/time_zones/{time_zone_id}';
  static const String settingsVariation =
      '/api/{api_version}/settings/variations/{variation_id}';
  static const String settingsCustomObjectCustomize =
      '/api/{api_version}/settings/custom_objects/{custom_object_id}/customize';
  static const String settingsItemGroupBillingPreferences =
      '/api/{api_version}/settings/item_groups/{item_group_id}/billing_preferences';
  static const String settingsDiscountProfile =
      '/api/{api_version}/settings/discount_profiles/{discount_profile_id}';
  static const String settingsFieldSettings =
      '/api/{api_version}/settings/field_settings';
  static const String settingsFieldSetting =
      '/api/{api_version}/settings/field_settings/{field_setting_id}';
  static const String settingsGeneralSettingsGroup =
      '/api/{api_version}/settings/general_settings/{group}';
  static const String settingsGeneralSetting =
      '/api/{api_version}/settings/general_settings/{group}/{general_setting_id}';
  static const String settingsGeneralSettingsDashboard =
      '/api/{api_version}/settings/general_settings/dashboard';
  static const String settingsGeneralSettingsDateAndTime =
      '/api/{api_version}/settings/general_settings/date_and_time';
  static const String settingsGeneralSettingsDisplay =
      '/api/{api_version}/settings/general_settings/display';
  static const String settingsGeneralSettingsGeneral =
      '/api/{api_version}/settings/general_settings/general';
  static const String settingsGeneralSettingsLabour =
      '/api/{api_version}/settings/general_settings/labour';
  static const String settingsGeneralSettingsOrder =
      '/api/{api_version}/settings/general_settings/order';
  static const String settingsGeneralSettingsPortal =
      '/api/{api_version}/settings/general_settings/portal';
  static const String settingsGeneralSettingsPurchase =
      '/api/{api_version}/settings/general_settings/purchase';
  static const String settingsGeneralSettingsSecurity =
      '/api/{api_version}/settings/general_settings/security';
  static const String settingsGeneralSettingsTransaction =
      '/api/{api_version}/settings/general_settings/transaction';
  static const String settingsPaymentProcessor =
      '/api/{api_version}/settings/payment_processors/{payment_processor_id}';
  static const String settingsPaymentTerm =
      '/api/{api_version}/settings/payment_terms/{payment_term_id}';
  static const String settingsPricingLevel =
      '/api/{api_version}/settings/pricing_levels/{pricing_level_id}';
  static const String settingsShippingProfile =
      '/api/{api_version}/settings/shipping_profiles/{shipping_profile_id}';
  static const String settingsWarehouse =
      '/api/{api_version}/settings/warehouses/{warehouse_id}';
  static const String settingsTax =
      '/api/{api_version}/settings/taxes/{tax_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String currencyKey = 'currency';
  static const String customLogicScriptKey = 'custom_logic_script';
  static const String customObjectKey = 'custom_object';
  static const String discountProfileKey = 'discount_profile';
  static const String fieldSettingKey = 'field_setting';
  static const String generalSettingKey = 'general_setting';
  static const String generalSettingsKey = 'general_settings';
  static const String itemGroupKey = 'item_group';
  static const String paymentProcessorKey = 'payment_processor';
  static const String paymentTermKey = 'payment_term';
  static const String pricingLevelKey = 'pricing_level';
  static const String settingsKey = 'settings';
  static const String shippingProfileKey = 'shipping_profile';
  static const String taxKey = 'tax';
  static const String timeZoneKey = 'time_zone';
  static const String variationKey = 'variation';
  static const String warehouseKey = 'warehouse';
}
