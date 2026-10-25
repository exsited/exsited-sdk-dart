/// The v4 settings endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'settings_dto.dart';
import 'settings_urls.dart';

/// `GET /api/{api_version}/custom_objects`
Future<ApiResponse<CustomObjectList>> getCustomObjects(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.customObjects,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: CustomObjectList.fromMap);

/// `GET /api/{api_version}/settings`
Future<ApiResponse<Settings>> getSettings(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settings,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Settings.fromMap);

/// `GET /api/{api_version}/custom_objects/{custom_object_id}`
Future<ApiResponse<SettingsCustomObjects>> getCustomObject(
  ExsitedClient client,
  Object customObjectId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.customObject,
        pathParams: {'custom_object_id': customObjectId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomObjects.fromMap);

/// `GET /api/{api_version}/settings/currencies`
Future<ApiResponse<SettingsCurrencyList>> getSettingsCurrencies(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsCurrencies,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCurrencyList.fromMap);

/// `GET /api/{api_version}/settings/custom_logic_scripts`
Future<ApiResponse<SettingsCustomLogicScripts>> getSettingsCustomLogicScripts(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsCustomLogicScripts,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomLogicScripts.fromMap);

/// `POST /api/{api_version}/settings/custom_objects`
Future<ApiResponse<SettingsCustomObjects>> createSettingsCustomObject(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(SettingsUrls.settingsCustomObjects,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomObjects.fromMap);

/// `GET /api/{api_version}/settings/discount_profiles`
Future<ApiResponse<SettingsDiscountProfileList>> getSettingsDiscountProfiles(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsDiscountProfiles,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsDiscountProfileList.fromMap);

/// `GET /api/{api_version}/settings/item_groups`
Future<ApiResponse<SettingsItemGroupList>> getSettingsItemGroups(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsItemGroups,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsItemGroupList.fromMap);

/// `POST /api/{api_version}/settings/item_groups`
Future<ApiResponse<SettingsItemGroups>> createSettingsItemGroup(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(SettingsUrls.settingsItemGroups,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsItemGroups.fromMap);

/// `GET /api/{api_version}/settings/payment_processors`
Future<ApiResponse<SettingsPaymentProcessorList>> getSettingsPaymentProcessors(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsPaymentProcessors,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsPaymentProcessorList.fromMap);

/// `GET /api/{api_version}/settings/payment_terms`
Future<ApiResponse<SettingsPaymentTermList>> getSettingsPaymentTerms(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsPaymentTerms,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsPaymentTermList.fromMap);

/// `GET /api/{api_version}/settings/pricing_levels`
Future<ApiResponse<SettingsPricingLevelList>> getSettingsPricingLevels(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsPricingLevels,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsPricingLevelList.fromMap);

/// `GET /api/{api_version}/settings/shipping_profiles`
Future<ApiResponse<SettingsShippingProfileList>> getSettingsShippingProfiles(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsShippingProfiles,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsShippingProfileList.fromMap);

/// `GET /api/{api_version}/settings/taxes`
Future<ApiResponse<SettingsTaxList>> getSettingsTaxes(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsTaxes,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsTaxList.fromMap);

/// `GET /api/{api_version}/settings/time_zones`
Future<ApiResponse<SettingsTimeZoneList>> getSettingsTimeZones(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsTimeZones,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsTimeZoneList.fromMap);

/// `GET /api/{api_version}/settings/variations`
Future<ApiResponse<SettingsVariationList>> getSettingsVariations(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsVariations,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsVariationList.fromMap);

/// `POST /api/{api_version}/settings/variations`
Future<ApiResponse<SettingsVariations>> createSettingsVariation(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(SettingsUrls.settingsVariations,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsVariations.fromMap);

/// `GET /api/{api_version}/settings/warehouses`
Future<ApiResponse<SettingsWarehouseList>> getSettingsWarehouses(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsWarehouses,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsWarehouseList.fromMap);

/// `GET /api/{api_version}/settings/currencies/{currency_id}`
Future<ApiResponse<SettingsCurrencyRead>> getSettingsCurrency(
  ExsitedClient client,
  Object currencyId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsCurrency,
        pathParams: {'currency_id': currencyId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCurrencyRead.fromMap);

/// `GET /api/{api_version}/settings/custom_logic_scripts/{custom_logic_script_id}`
Future<ApiResponse<SettingsCustomLogicScript>> getSettingsCustomLogicScript(
  ExsitedClient client,
  Object customLogicScriptId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsCustomLogicScript,
        pathParams: {'custom_logic_script_id': customLogicScriptId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomLogicScript.fromMap);

/// `DELETE /api/{api_version}/settings/custom_objects/{custom_object_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsCustomObject(
  ExsitedClient client,
  Object customObjectId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(SettingsUrls.settingsCustomObject,
        pathParams: {'custom_object_id': customObjectId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/custom_objects/{custom_object_id}`
Future<ApiResponse<SettingsCustomObjects>> updateSettingsCustomObject(
  ExsitedClient client,
  Object customObjectId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(SettingsUrls.settingsCustomObject,
        pathParams: {'custom_object_id': customObjectId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomObjects.fromMap);

/// `PATCH /api/{api_version}/settings/field_settings/account`
Future<ApiResponse<SettingsFieldSettingsAccountUpdated>>
    updateSettingsFieldSettingsAccount(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsFieldSettingsAccount,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsFieldSettingsAccountUpdated.fromMap);

/// `PATCH /api/{api_version}/settings/field_settings/item`
Future<ApiResponse<SettingsFieldSettingsItemUpdated>>
    updateSettingsFieldSettingsItem(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsFieldSettingsItem,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsFieldSettingsItemUpdated.fromMap);

/// `PATCH /api/{api_version}/settings/general_settings/account`
Future<ApiResponse<SettingsGeneralSettingsAccountUpdated>>
    updateSettingsGeneralSettingsAccount(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsGeneralSettingsAccount,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsGeneralSettingsAccountUpdated.fromMap);

/// `PATCH /api/{api_version}/settings/general_settings/item`
Future<ApiResponse<SettingsGeneralSettingsItemUpdated>>
    updateSettingsGeneralSettingsItem(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsGeneralSettingsItem,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsGeneralSettingsItemUpdated.fromMap);

/// `DELETE /api/{api_version}/settings/item_groups/{item_group_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsItemGroup(
  ExsitedClient client,
  Object itemGroupId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(SettingsUrls.settingsItemGroup,
        pathParams: {'item_group_id': itemGroupId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/settings/item_groups/{item_group_id}`
Future<ApiResponse<SettingsItemGroups>> getSettingsItemGroup(
  ExsitedClient client,
  Object itemGroupId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsItemGroup,
        pathParams: {'item_group_id': itemGroupId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsItemGroups.fromMap);

/// `PATCH /api/{api_version}/settings/item_groups/{item_group_id}`
Future<ApiResponse<SettingsItemGroups>> updateSettingsItemGroup(
  ExsitedClient client,
  Object itemGroupId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(SettingsUrls.settingsItemGroup,
        pathParams: {'item_group_id': itemGroupId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsItemGroups.fromMap);

/// `GET /api/{api_version}/settings/time_zones/{time_zone_id}`
Future<ApiResponse<SettingsTimeZoneRead>> getSettingsTimeZone(
  ExsitedClient client,
  Object timeZoneId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsTimeZone,
        pathParams: {'time_zone_id': timeZoneId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsTimeZoneRead.fromMap);

/// `GET /api/{api_version}/settings/variations/{variation_id}`
Future<ApiResponse<SettingsVariations>> getSettingsVariation(
  ExsitedClient client,
  Object variationId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsVariation,
        pathParams: {'variation_id': variationId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsVariations.fromMap);

/// `PATCH /api/{api_version}/settings/variations/{variation_id}`
Future<ApiResponse<SettingsVariations>> updateSettingsVariation(
  ExsitedClient client,
  Object variationId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(SettingsUrls.settingsVariation,
        pathParams: {'variation_id': variationId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsVariations.fromMap);

/// `POST /api/{api_version}/settings/custom_objects/{custom_object_id}/customize`
Future<ApiResponse<SettingsCustomObjectCustomize>>
    createSettingsCustomObjectCustomize(
  ExsitedClient client,
  Object customObjectId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPostRequest(SettingsUrls.settingsCustomObjectCustomize,
            pathParams: {'custom_object_id': customObjectId},
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsCustomObjectCustomize.fromMap);

/// `POST /api/{api_version}/settings/item_groups/{item_group_id}/billing_preferences`
Future<ApiResponse<SettingsItemGroups>>
    createSettingsItemGroupBillingPreference(
  ExsitedClient client,
  Object itemGroupId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPostRequest(SettingsUrls.settingsItemGroupBillingPreferences,
            pathParams: {'item_group_id': itemGroupId},
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsItemGroups.fromMap);

/// `GET /api/{api_version}/settings/custom_objects`
///
/// List custom object definitions; enabled definitions only.
Future<ApiResponse<SettingsCustomObjectDefinitionList>>
    getSettingsCustomObjects(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendGetRequest(SettingsUrls.settingsCustomObjects,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsCustomObjectDefinitionList.fromMap);

/// `GET /api/{api_version}/settings/custom_objects/{custom_object_id}`
///
/// Get one custom object definition, under `custom_object`.
Future<ApiResponse<SettingsCustomObjectDefinitionRead>> getSettingsCustomObject(
  ExsitedClient client,
  Object customObjectId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsCustomObject,
        pathParams: {'custom_object_id': customObjectId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomObjectDefinitionRead.fromMap);

/// `POST /api/{api_version}/custom_objects`
///
/// Create a custom object schema; answered `201`, under `custom_object`. `name`
/// is required and must be unused.
Future<ApiResponse<SettingsCustomObjects>> createCustomObject(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(SettingsUrls.customObjects,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomObjects.fromMap);

/// `PATCH /api/{api_version}/custom_objects/{custom_object_id}`
///
/// Update a custom object schema, under `custom_object`. `use_in`, `relation`
/// and `custom_component` are refused.
Future<ApiResponse<SettingsCustomObjects>> updateCustomObject(
  ExsitedClient client,
  Object customObjectId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(SettingsUrls.customObject,
        pathParams: {'custom_object_id': customObjectId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomObjects.fromMap);

/// `DELETE /api/{api_version}/custom_objects/{custom_object_id}`
///
/// Delete a custom object schema; answered `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteCustomObject(
  ExsitedClient client,
  Object customObjectId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(SettingsUrls.customObject,
        pathParams: {'custom_object_id': customObjectId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/settings/currencies`
///
/// Create a currency; answered `201`, under `currency`. `code` and `country`
/// are required, and v4 has no route that deletes a currency.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createSettingsCurrency(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(SettingsUrls.settingsCurrencies,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/currencies/{currency_id}`
///
/// Update a currency, under `currency`. Only `rounding`,
/// `cash_rounding_interval`, `conversion_rate` and `status` are accepted.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateSettingsCurrency(
  ExsitedClient client,
  Object currencyId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(SettingsUrls.settingsCurrency,
        pathParams: {'currency_id': currencyId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/settings/custom_logic_scripts`
///
/// Create a custom logic script; answered `201`. `name`, `type` and `code` are
/// required, and `code` is validated but not stored.
Future<ApiResponse<SettingsCustomLogicScriptSaved>>
    createSettingsCustomLogicScript(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPostRequest(SettingsUrls.settingsCustomLogicScripts,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsCustomLogicScriptSaved.fromMap);

/// `PATCH /api/{api_version}/settings/custom_logic_scripts/{custom_logic_script_id}`
///
/// Update a custom logic script; `code` is refused.
Future<ApiResponse<SettingsCustomLogicScriptSaved>>
    updateSettingsCustomLogicScript(
  ExsitedClient client,
  Object customLogicScriptId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsCustomLogicScript,
            pathParams: {'custom_logic_script_id': customLogicScriptId},
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsCustomLogicScriptSaved.fromMap);

/// `DELETE /api/{api_version}/settings/custom_logic_scripts/{custom_logic_script_id}`
///
/// Soft-delete a custom logic script; `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsCustomLogicScript(
  ExsitedClient client,
  Object customLogicScriptId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(SettingsUrls.settingsCustomLogicScript,
        pathParams: {'custom_logic_script_id': customLogicScriptId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/settings/discount_profiles`
///
/// Create a discount profile; `201`. Times go as `YYYY-MM-DD HH:mm` and the
/// accounting code must be a discount one, or it is a `500`.
Future<ApiResponse<SettingsDiscountProfileRead>> createSettingsDiscountProfile(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(SettingsUrls.settingsDiscountProfiles,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsDiscountProfileRead.fromMap);

/// `GET /api/{api_version}/settings/discount_profiles/{discount_profile_id}`
///
/// Get one discount profile, under `discount_profile`.
Future<ApiResponse<SettingsDiscountProfileRead>> getSettingsDiscountProfile(
  ExsitedClient client,
  Object discountProfileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsDiscountProfile,
        pathParams: {'discount_profile_id': discountProfileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsDiscountProfileRead.fromMap);

/// `PATCH /api/{api_version}/settings/discount_profiles/{discount_profile_id}`
///
/// Update a discount profile, under `discount_profile`.
Future<ApiResponse<SettingsDiscountProfileRead>> updateSettingsDiscountProfile(
  ExsitedClient client,
  Object discountProfileId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(SettingsUrls.settingsDiscountProfile,
        pathParams: {'discount_profile_id': discountProfileId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsDiscountProfileRead.fromMap);

/// `DELETE /api/{api_version}/settings/discount_profiles/{discount_profile_id}`
///
/// Delete a discount profile; answered `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsDiscountProfile(
  ExsitedClient client,
  Object discountProfileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(SettingsUrls.settingsDiscountProfile,
        pathParams: {'discount_profile_id': discountProfileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/settings/field_settings`
///
/// List field settings; paged by cursor, and `include_total=true` is refused.
Future<ApiResponse<SettingsFieldSettingList>> getSettingsFieldSettings(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsFieldSettings,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsFieldSettingList.fromMap);

/// `GET /api/{api_version}/settings/field_settings/{field_setting_id}`
///
/// Get one field setting, under `field_setting`.
Future<ApiResponse<SettingsFieldSettingRead>> getSettingsFieldSetting(
  ExsitedClient client,
  Object fieldSettingId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsFieldSetting,
        pathParams: {'field_setting_id': fieldSettingId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsFieldSettingRead.fromMap);

/// `GET /api/{api_version}/settings/general_settings/{group}`
///
/// Read one group of general settings, under `general_settings`; `group` is one
/// of the twelve the server names, any case.
Future<ApiResponse<SettingsGeneralSettings>> getSettingsGeneralSettings(
  ExsitedClient client,
  Object group, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsGeneralSettingsGroup,
        pathParams: {'group': group},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsGeneralSettings.fromMap);

/// `GET /api/{api_version}/settings/general_settings/{group}/{general_setting_id}`
///
/// One general setting row; no v4 answer carries a `gs_` id.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getSettingsGeneralSetting(
  ExsitedClient client,
  Object group,
  Object generalSettingId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsGeneralSetting,
        pathParams: {'group': group, 'general_setting_id': generalSettingId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/general_settings/dashboard`
///
/// Update the dashboard group. Flags are stored as `"1"`/`"0"` and read back
/// raw, so a `"true"` cannot be restored.
Future<ApiResponse<SettingsGeneralSettings>>
    updateSettingsGeneralSettingsDashboard(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsGeneralSettingsDashboard,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsGeneralSettings.fromMap);

/// `PATCH /api/{api_version}/settings/general_settings/date_and_time`
///
/// Update the date and time group; the save also pushes the organisation to the
/// catalogue processor.
Future<ApiResponse<SettingsGeneralSettings>>
    updateSettingsGeneralSettingsDateAndTime(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsGeneralSettingsDateAndTime,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsGeneralSettings.fromMap);

/// `PATCH /api/{api_version}/settings/general_settings/display`
///
/// Update the display group. Column lists sent as the strings the read serves
/// are ignored: the save reads arrays.
Future<ApiResponse<SettingsGeneralSettings>>
    updateSettingsGeneralSettingsDisplay(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsGeneralSettingsDisplay,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsGeneralSettings.fromMap);

/// `PATCH /api/{api_version}/settings/general_settings/general`
///
/// Update the general group. It also resets `accountingPeriod`, `fiscalYear`
/// and six more settings no route can write back.
Future<ApiResponse<SettingsGeneralSettings>>
    updateSettingsGeneralSettingsGeneral(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsGeneralSettingsGeneral,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsGeneralSettings.fromMap);

/// `PATCH /api/{api_version}/settings/general_settings/labour`
///
/// Update the labour general settings; answers the group as `GET` reads it,
/// under `general_settings`.
Future<ApiResponse<SettingsGeneralSettings>>
    updateSettingsGeneralSettingsLabour(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsGeneralSettingsLabour,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsGeneralSettings.fromMap);

/// `PATCH /api/{api_version}/settings/general_settings/order`
///
/// Update the order group, which reads `order` and `product` from
/// `general_settings`.
Future<ApiResponse<SettingsGeneralSettings>> updateSettingsGeneralSettingsOrder(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(SettingsUrls.settingsGeneralSettingsOrder,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsGeneralSettings.fromMap);

/// `PATCH /api/{api_version}/settings/general_settings/portal`
///
/// Update the portal group. With `enableCustomerPortal` off, any write also
/// turns every portal login off.
Future<ApiResponse<SettingsGeneralSettings>>
    updateSettingsGeneralSettingsPortal(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsGeneralSettingsPortal,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsGeneralSettings.fromMap);

/// `PATCH /api/{api_version}/settings/general_settings/purchase`
///
/// Update the purchase general settings; answers the group as `GET` reads it,
/// under `general_settings`.
Future<ApiResponse<SettingsGeneralSettings>>
    updateSettingsGeneralSettingsPurchase(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsGeneralSettingsPurchase,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsGeneralSettings.fromMap);

/// `PATCH /api/{api_version}/settings/general_settings/security`
///
/// Update the security group. Send flags as `"1"`/`"0"`: the `"true"` the read
/// serves is stored as false.
Future<ApiResponse<SettingsGeneralSettings>>
    updateSettingsGeneralSettingsSecurity(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsGeneralSettingsSecurity,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsGeneralSettings.fromMap);

/// `PATCH /api/{api_version}/settings/general_settings/transaction`
///
/// Update the transaction general settings; answers the group as `GET` reads
/// it, under `general_settings`.
Future<ApiResponse<SettingsGeneralSettings>>
    updateSettingsGeneralSettingsTransaction(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsGeneralSettingsTransaction,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsGeneralSettings.fromMap);

/// `POST /api/{api_version}/settings/payment_processors`
///
/// Create an offline payment processor; `201`. Refused unless
/// `credentials.maximumRetryOnFailure` is `"0"` or `"1"`.
Future<ApiResponse<SettingsPaymentProcessorSaved>>
    createSettingsPaymentProcessor(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPostRequest(SettingsUrls.settingsPaymentProcessors,
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsPaymentProcessorSaved.fromMap);

/// `GET /api/{api_version}/settings/payment_processors/{payment_processor_id}`
///
/// Get one payment processor, under `payment_processor`.
Future<ApiResponse<SettingsPaymentProcessorRead>> getSettingsPaymentProcessor(
  ExsitedClient client,
  Object paymentProcessorId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsPaymentProcessor,
        pathParams: {'payment_processor_id': paymentProcessorId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsPaymentProcessorRead.fromMap);

/// `PATCH /api/{api_version}/settings/payment_processors/{payment_processor_id}`
///
/// Update a payment processor; refused, like the create, without
/// `credentials.maximumRetryOnFailure`.
Future<ApiResponse<SettingsPaymentProcessorSaved>>
    updateSettingsPaymentProcessor(
  ExsitedClient client,
  Object paymentProcessorId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPatchRequest(SettingsUrls.settingsPaymentProcessor,
            pathParams: {'payment_processor_id': paymentProcessorId},
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsPaymentProcessorSaved.fromMap);

/// `DELETE /api/{api_version}/settings/payment_processors/{payment_processor_id}`
///
/// Delete a payment processor; answered `204`. The default processor is
/// refused.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsPaymentProcessor(
  ExsitedClient client,
  Object paymentProcessorId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(SettingsUrls.settingsPaymentProcessor,
        pathParams: {'payment_processor_id': paymentProcessorId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/settings/payment_terms`
///
/// Create a payment term; answered `201` with a flat `period` and `duration`
/// where the read nests them. A sent `status` is not applied.
Future<ApiResponse<SettingsPaymentTermCreated>> createSettingsPaymentTerm(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(SettingsUrls.settingsPaymentTerms,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsPaymentTermCreated.fromMap);

/// `GET /api/{api_version}/settings/payment_terms/{payment_term_id}`
///
/// Get one payment term, under `payment_term`.
Future<ApiResponse<SettingsPaymentTermRead>> getSettingsPaymentTerm(
  ExsitedClient client,
  Object paymentTermId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsPaymentTerm,
        pathParams: {'payment_term_id': paymentTermId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsPaymentTermRead.fromMap);

/// `PATCH /api/{api_version}/settings/payment_terms/{payment_term_id}`
///
/// Update a payment term, under `payment_term`; the answer adds `display_order`
/// to the read's fields.
Future<ApiResponse<SettingsPaymentTermUpdated>> updateSettingsPaymentTerm(
  ExsitedClient client,
  Object paymentTermId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(SettingsUrls.settingsPaymentTerm,
        pathParams: {'payment_term_id': paymentTermId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsPaymentTermUpdated.fromMap);

/// `DELETE /api/{api_version}/settings/payment_terms/{payment_term_id}`
///
/// Delete a payment term; answered `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsPaymentTerm(
  ExsitedClient client,
  Object paymentTermId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(SettingsUrls.settingsPaymentTerm,
        pathParams: {'payment_term_id': paymentTermId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/settings/pricing_levels`
///
/// Create a pricing level; answered `201`, under `pricing_level`. `name` is
/// required, and a sent `status` is not applied.
Future<ApiResponse<SettingsPricingLevelCreated>> createSettingsPricingLevel(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(SettingsUrls.settingsPricingLevels,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsPricingLevelCreated.fromMap);

/// `GET /api/{api_version}/settings/pricing_levels/{pricing_level_id}`
///
/// Get one pricing level, under `pricing_level`.
Future<ApiResponse<SettingsPricingLevelRead>> getSettingsPricingLevel(
  ExsitedClient client,
  Object pricingLevelId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsPricingLevel,
        pathParams: {'pricing_level_id': pricingLevelId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsPricingLevelRead.fromMap);

/// `PATCH /api/{api_version}/settings/pricing_levels/{pricing_level_id}`
///
/// Update a pricing level, under `pricing_level`.
Future<ApiResponse<SettingsPricingLevelRead>> updateSettingsPricingLevel(
  ExsitedClient client,
  Object pricingLevelId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(SettingsUrls.settingsPricingLevel,
        pathParams: {'pricing_level_id': pricingLevelId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsPricingLevelRead.fromMap);

/// `DELETE /api/{api_version}/settings/pricing_levels/{pricing_level_id}`
///
/// Delete a pricing level; answered `204`. The default level is refused.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsPricingLevel(
  ExsitedClient client,
  Object pricingLevelId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(SettingsUrls.settingsPricingLevel,
        pathParams: {'pricing_level_id': pricingLevelId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/settings/shipping_profiles`
///
/// Create a shipping profile; `201`. `name` and `shipping_type` are required,
/// and `FIXED` needs `fixed_amount`.
Future<ApiResponse<SettingsShippingProfileRead>> createSettingsShippingProfile(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(SettingsUrls.settingsShippingProfiles,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsShippingProfileRead.fromMap);

/// `GET /api/{api_version}/settings/shipping_profiles/{shipping_profile_id}`
///
/// Get one shipping profile, under `shipping_profile`.
Future<ApiResponse<SettingsShippingProfileRead>> getSettingsShippingProfile(
  ExsitedClient client,
  Object shippingProfileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsShippingProfile,
        pathParams: {'shipping_profile_id': shippingProfileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsShippingProfileRead.fromMap);

/// `PATCH /api/{api_version}/settings/shipping_profiles/{shipping_profile_id}`
///
/// Update a shipping profile. The API answers `500`, so it names no view.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateSettingsShippingProfile(
  ExsitedClient client,
  Object shippingProfileId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(SettingsUrls.settingsShippingProfile,
        pathParams: {'shipping_profile_id': shippingProfileId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/settings/shipping_profiles/{shipping_profile_id}`
///
/// Delete a shipping profile; answered `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsShippingProfile(
  ExsitedClient client,
  Object shippingProfileId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(SettingsUrls.settingsShippingProfile,
        pathParams: {'shipping_profile_id': shippingProfileId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/settings/warehouses`
///
/// Create a warehouse; answered `201`. `name` and `country` are required, and
/// the answer's `country` reads null although it was stored.
Future<ApiResponse<SettingsWarehouseRead>> createSettingsWarehouse(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(SettingsUrls.settingsWarehouses,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsWarehouseRead.fromMap);

/// `GET /api/{api_version}/settings/warehouses/{warehouse_id}`
///
/// Get one warehouse, under `warehouse`.
Future<ApiResponse<SettingsWarehouseRead>> getSettingsWarehouse(
  ExsitedClient client,
  Object warehouseId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsWarehouse,
        pathParams: {'warehouse_id': warehouseId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsWarehouseRead.fromMap);

/// `PATCH /api/{api_version}/settings/warehouses/{warehouse_id}`
///
/// Update a warehouse, under `warehouse`; the answer's `country` reads null
/// although the record has one.
Future<ApiResponse<SettingsWarehouseRead>> updateSettingsWarehouse(
  ExsitedClient client,
  Object warehouseId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(SettingsUrls.settingsWarehouse,
        pathParams: {'warehouse_id': warehouseId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsWarehouseRead.fromMap);

/// `DELETE /api/{api_version}/settings/warehouses/{warehouse_id}`
///
/// Delete a warehouse; answered `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsWarehouse(
  ExsitedClient client,
  Object warehouseId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(SettingsUrls.settingsWarehouse,
        pathParams: {'warehouse_id': warehouseId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/settings/taxes`
///
/// Create a country tax; answered `201`, under `tax`. `code` and `country` are
/// required, and v4 has no route that deletes a tax.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createSettingsTax(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(SettingsUrls.settingsTaxes,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/settings/taxes/{tax_id}`
///
/// Get one tax, under `tax`.
Future<ApiResponse<SettingsTaxRead>> getSettingsTax(
  ExsitedClient client,
  Object taxId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(SettingsUrls.settingsTax,
        pathParams: {'tax_id': taxId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsTaxRead.fromMap);

/// `PATCH /api/{api_version}/settings/taxes/{tax_id}`
///
/// Update, enable or disable a tax, under `tax`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateSettingsTax(
  ExsitedClient client,
  Object taxId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(SettingsUrls.settingsTax,
        pathParams: {'tax_id': taxId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/settings/variations/{variation_id}`
///
/// Delete a variation; answered `204`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsVariation(
  ExsitedClient client,
  Object variationId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(SettingsUrls.settingsVariation,
        pathParams: {'variation_id': variationId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
