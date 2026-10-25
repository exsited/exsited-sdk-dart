/// The v4 settings endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'settings.dart' as endpoints;
import 'settings_dto.dart' as views;

/// The settings endpoints with [client] already applied.
class SettingsResource {
  /// Bind the resource to a client; normally reached via `client.settings`.
  const SettingsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/custom_objects`
  Future<ApiResponse<views.CustomObjectList>> getCustomObjects({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getCustomObjects(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings`
  Future<ApiResponse<views.Settings>> getSettings({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettings(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/custom_objects/{custom_object_id}`
  Future<ApiResponse<views.SettingsCustomObjects>> getCustomObject(
    Object customObjectId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getCustomObject(
        client,
        customObjectId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/currencies`
  Future<ApiResponse<views.SettingsCurrencyList>> getSettingsCurrencies({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsCurrencies(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/custom_logic_scripts`
  Future<ApiResponse<views.SettingsCustomLogicScripts>>
      getSettingsCustomLogicScripts({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsCustomLogicScripts(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/custom_objects`
  Future<ApiResponse<views.SettingsCustomObjects>> createSettingsCustomObject(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsCustomObject(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/discount_profiles`
  Future<ApiResponse<views.SettingsDiscountProfileList>>
      getSettingsDiscountProfiles({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsDiscountProfiles(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/item_groups`
  Future<ApiResponse<views.SettingsItemGroupList>> getSettingsItemGroups({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsItemGroups(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/item_groups`
  Future<ApiResponse<views.SettingsItemGroups>> createSettingsItemGroup(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsItemGroup(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/payment_processors`
  Future<ApiResponse<views.SettingsPaymentProcessorList>>
      getSettingsPaymentProcessors({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsPaymentProcessors(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/payment_terms`
  Future<ApiResponse<views.SettingsPaymentTermList>> getSettingsPaymentTerms({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsPaymentTerms(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/pricing_levels`
  Future<ApiResponse<views.SettingsPricingLevelList>> getSettingsPricingLevels({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsPricingLevels(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/shipping_profiles`
  Future<ApiResponse<views.SettingsShippingProfileList>>
      getSettingsShippingProfiles({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsShippingProfiles(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/taxes`
  Future<ApiResponse<views.SettingsTaxList>> getSettingsTaxes({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsTaxes(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/time_zones`
  Future<ApiResponse<views.SettingsTimeZoneList>> getSettingsTimeZones({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsTimeZones(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/variations`
  Future<ApiResponse<views.SettingsVariationList>> getSettingsVariations({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsVariations(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/variations`
  Future<ApiResponse<views.SettingsVariations>> createSettingsVariation(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsVariation(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/warehouses`
  Future<ApiResponse<views.SettingsWarehouseList>> getSettingsWarehouses({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsWarehouses(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/currencies/{currency_id}`
  Future<ApiResponse<views.SettingsCurrencyRead>> getSettingsCurrency(
    Object currencyId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsCurrency(
        client,
        currencyId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/custom_logic_scripts/{custom_logic_script_id}`
  Future<ApiResponse<views.SettingsCustomLogicScript>>
      getSettingsCustomLogicScript(
    Object customLogicScriptId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsCustomLogicScript(
            client,
            customLogicScriptId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/settings/custom_objects/{custom_object_id}`
  Future<ApiResponse<Object?>> deleteSettingsCustomObject(
    Object customObjectId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsCustomObject(
        client,
        customObjectId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/custom_objects/{custom_object_id}`
  Future<ApiResponse<views.SettingsCustomObjects>> updateSettingsCustomObject(
    Object customObjectId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsCustomObject(
        client,
        customObjectId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/field_settings/account`
  Future<ApiResponse<views.SettingsFieldSettingsAccountUpdated>>
      updateSettingsFieldSettingsAccount(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsFieldSettingsAccount(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/field_settings/item`
  Future<ApiResponse<views.SettingsFieldSettingsItemUpdated>>
      updateSettingsFieldSettingsItem(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsFieldSettingsItem(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/general_settings/account`
  Future<ApiResponse<views.SettingsGeneralSettingsAccountUpdated>>
      updateSettingsGeneralSettingsAccount(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsGeneralSettingsAccount(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/general_settings/item`
  Future<ApiResponse<views.SettingsGeneralSettingsItemUpdated>>
      updateSettingsGeneralSettingsItem(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsGeneralSettingsItem(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/settings/item_groups/{item_group_id}`
  Future<ApiResponse<Object?>> deleteSettingsItemGroup(
    Object itemGroupId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsItemGroup(
        client,
        itemGroupId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/item_groups/{item_group_id}`
  Future<ApiResponse<views.SettingsItemGroups>> getSettingsItemGroup(
    Object itemGroupId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsItemGroup(
        client,
        itemGroupId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/item_groups/{item_group_id}`
  Future<ApiResponse<views.SettingsItemGroups>> updateSettingsItemGroup(
    Object itemGroupId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsItemGroup(
        client,
        itemGroupId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/time_zones/{time_zone_id}`
  Future<ApiResponse<views.SettingsTimeZoneRead>> getSettingsTimeZone(
    Object timeZoneId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsTimeZone(
        client,
        timeZoneId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/variations/{variation_id}`
  Future<ApiResponse<views.SettingsVariations>> getSettingsVariation(
    Object variationId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsVariation(
        client,
        variationId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/variations/{variation_id}`
  Future<ApiResponse<views.SettingsVariations>> updateSettingsVariation(
    Object variationId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsVariation(
        client,
        variationId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/custom_objects/{custom_object_id}/customize`
  Future<ApiResponse<views.SettingsCustomObjectCustomize>>
      createSettingsCustomObjectCustomize(
    Object customObjectId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsCustomObjectCustomize(
            client,
            customObjectId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/item_groups/{item_group_id}/billing_preferences`
  Future<ApiResponse<views.SettingsItemGroups>>
      createSettingsItemGroupBillingPreference(
    Object itemGroupId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsItemGroupBillingPreference(
            client,
            itemGroupId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/custom_objects`
  Future<ApiResponse<views.SettingsCustomObjectDefinitionList>>
      getSettingsCustomObjects({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsCustomObjects(
            client,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/custom_objects/{custom_object_id}`
  Future<ApiResponse<views.SettingsCustomObjectDefinitionRead>>
      getSettingsCustomObject(
    Object customObjectId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsCustomObject(
            client,
            customObjectId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/custom_objects`
  Future<ApiResponse<views.SettingsCustomObjects>> createCustomObject(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createCustomObject(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/custom_objects/{custom_object_id}`
  Future<ApiResponse<views.SettingsCustomObjects>> updateCustomObject(
    Object customObjectId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateCustomObject(
        client,
        customObjectId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/custom_objects/{custom_object_id}`
  Future<ApiResponse<Object?>> deleteCustomObject(
    Object customObjectId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteCustomObject(
        client,
        customObjectId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/currencies`
  Future<ApiResponse<Object?>> createSettingsCurrency(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsCurrency(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/currencies/{currency_id}`
  Future<ApiResponse<Object?>> updateSettingsCurrency(
    Object currencyId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsCurrency(
        client,
        currencyId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/custom_logic_scripts`
  Future<ApiResponse<views.SettingsCustomLogicScriptSaved>>
      createSettingsCustomLogicScript(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsCustomLogicScript(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/custom_logic_scripts/{custom_logic_script_id}`
  Future<ApiResponse<views.SettingsCustomLogicScriptSaved>>
      updateSettingsCustomLogicScript(
    Object customLogicScriptId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsCustomLogicScript(
            client,
            customLogicScriptId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/settings/custom_logic_scripts/{custom_logic_script_id}`
  Future<ApiResponse<Object?>> deleteSettingsCustomLogicScript(
    Object customLogicScriptId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsCustomLogicScript(
        client,
        customLogicScriptId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/discount_profiles`
  Future<ApiResponse<views.SettingsDiscountProfileRead>>
      createSettingsDiscountProfile(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsDiscountProfile(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/discount_profiles/{discount_profile_id}`
  Future<ApiResponse<views.SettingsDiscountProfileRead>>
      getSettingsDiscountProfile(
    Object discountProfileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsDiscountProfile(
            client,
            discountProfileId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/discount_profiles/{discount_profile_id}`
  Future<ApiResponse<views.SettingsDiscountProfileRead>>
      updateSettingsDiscountProfile(
    Object discountProfileId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsDiscountProfile(
            client,
            discountProfileId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/settings/discount_profiles/{discount_profile_id}`
  Future<ApiResponse<Object?>> deleteSettingsDiscountProfile(
    Object discountProfileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsDiscountProfile(
        client,
        discountProfileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/field_settings`
  Future<ApiResponse<views.SettingsFieldSettingList>> getSettingsFieldSettings({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsFieldSettings(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/field_settings/{field_setting_id}`
  Future<ApiResponse<views.SettingsFieldSettingRead>> getSettingsFieldSetting(
    Object fieldSettingId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsFieldSetting(
        client,
        fieldSettingId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/general_settings/{group}`
  Future<ApiResponse<views.SettingsGeneralSettings>> getSettingsGeneralSettings(
    Object group, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsGeneralSettings(
        client,
        group,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/general_settings/{group}/{general_setting_id}`
  Future<ApiResponse<Object?>> getSettingsGeneralSetting(
    Object group,
    Object generalSettingId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsGeneralSetting(
        client,
        group,
        generalSettingId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/general_settings/dashboard`
  Future<ApiResponse<views.SettingsGeneralSettings>>
      updateSettingsGeneralSettingsDashboard(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsGeneralSettingsDashboard(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/general_settings/date_and_time`
  Future<ApiResponse<views.SettingsGeneralSettings>>
      updateSettingsGeneralSettingsDateAndTime(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsGeneralSettingsDateAndTime(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/general_settings/display`
  Future<ApiResponse<views.SettingsGeneralSettings>>
      updateSettingsGeneralSettingsDisplay(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsGeneralSettingsDisplay(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/general_settings/general`
  Future<ApiResponse<views.SettingsGeneralSettings>>
      updateSettingsGeneralSettingsGeneral(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsGeneralSettingsGeneral(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/general_settings/labour`
  Future<ApiResponse<views.SettingsGeneralSettings>>
      updateSettingsGeneralSettingsLabour(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsGeneralSettingsLabour(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/general_settings/order`
  Future<ApiResponse<views.SettingsGeneralSettings>>
      updateSettingsGeneralSettingsOrder(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsGeneralSettingsOrder(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/general_settings/portal`
  Future<ApiResponse<views.SettingsGeneralSettings>>
      updateSettingsGeneralSettingsPortal(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsGeneralSettingsPortal(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/general_settings/purchase`
  Future<ApiResponse<views.SettingsGeneralSettings>>
      updateSettingsGeneralSettingsPurchase(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsGeneralSettingsPurchase(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/general_settings/security`
  Future<ApiResponse<views.SettingsGeneralSettings>>
      updateSettingsGeneralSettingsSecurity(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsGeneralSettingsSecurity(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/general_settings/transaction`
  Future<ApiResponse<views.SettingsGeneralSettings>>
      updateSettingsGeneralSettingsTransaction(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsGeneralSettingsTransaction(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `POST /api/{api_version}/settings/payment_processors`
  Future<ApiResponse<views.SettingsPaymentProcessorSaved>>
      createSettingsPaymentProcessor(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsPaymentProcessor(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/payment_processors/{payment_processor_id}`
  Future<ApiResponse<views.SettingsPaymentProcessorRead>>
      getSettingsPaymentProcessor(
    Object paymentProcessorId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsPaymentProcessor(
            client,
            paymentProcessorId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/payment_processors/{payment_processor_id}`
  Future<ApiResponse<views.SettingsPaymentProcessorSaved>>
      updateSettingsPaymentProcessor(
    Object paymentProcessorId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsPaymentProcessor(
            client,
            paymentProcessorId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/settings/payment_processors/{payment_processor_id}`
  Future<ApiResponse<Object?>> deleteSettingsPaymentProcessor(
    Object paymentProcessorId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsPaymentProcessor(
        client,
        paymentProcessorId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/payment_terms`
  Future<ApiResponse<views.SettingsPaymentTermCreated>>
      createSettingsPaymentTerm(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsPaymentTerm(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/payment_terms/{payment_term_id}`
  Future<ApiResponse<views.SettingsPaymentTermRead>> getSettingsPaymentTerm(
    Object paymentTermId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsPaymentTerm(
        client,
        paymentTermId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/payment_terms/{payment_term_id}`
  Future<ApiResponse<views.SettingsPaymentTermUpdated>>
      updateSettingsPaymentTerm(
    Object paymentTermId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsPaymentTerm(
            client,
            paymentTermId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/settings/payment_terms/{payment_term_id}`
  Future<ApiResponse<Object?>> deleteSettingsPaymentTerm(
    Object paymentTermId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsPaymentTerm(
        client,
        paymentTermId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/pricing_levels`
  Future<ApiResponse<views.SettingsPricingLevelCreated>>
      createSettingsPricingLevel(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsPricingLevel(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/pricing_levels/{pricing_level_id}`
  Future<ApiResponse<views.SettingsPricingLevelRead>> getSettingsPricingLevel(
    Object pricingLevelId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsPricingLevel(
        client,
        pricingLevelId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/pricing_levels/{pricing_level_id}`
  Future<ApiResponse<views.SettingsPricingLevelRead>>
      updateSettingsPricingLevel(
    Object pricingLevelId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.updateSettingsPricingLevel(
            client,
            pricingLevelId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `DELETE /api/{api_version}/settings/pricing_levels/{pricing_level_id}`
  Future<ApiResponse<Object?>> deleteSettingsPricingLevel(
    Object pricingLevelId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsPricingLevel(
        client,
        pricingLevelId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/shipping_profiles`
  Future<ApiResponse<views.SettingsShippingProfileRead>>
      createSettingsShippingProfile(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsShippingProfile(
            client,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/settings/shipping_profiles/{shipping_profile_id}`
  Future<ApiResponse<views.SettingsShippingProfileRead>>
      getSettingsShippingProfile(
    Object shippingProfileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getSettingsShippingProfile(
            client,
            shippingProfileId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/settings/shipping_profiles/{shipping_profile_id}`
  Future<ApiResponse<Object?>> updateSettingsShippingProfile(
    Object shippingProfileId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsShippingProfile(
        client,
        shippingProfileId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/shipping_profiles/{shipping_profile_id}`
  Future<ApiResponse<Object?>> deleteSettingsShippingProfile(
    Object shippingProfileId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsShippingProfile(
        client,
        shippingProfileId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/warehouses`
  Future<ApiResponse<views.SettingsWarehouseRead>> createSettingsWarehouse(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsWarehouse(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/warehouses/{warehouse_id}`
  Future<ApiResponse<views.SettingsWarehouseRead>> getSettingsWarehouse(
    Object warehouseId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsWarehouse(
        client,
        warehouseId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/warehouses/{warehouse_id}`
  Future<ApiResponse<views.SettingsWarehouseRead>> updateSettingsWarehouse(
    Object warehouseId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsWarehouse(
        client,
        warehouseId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/warehouses/{warehouse_id}`
  Future<ApiResponse<Object?>> deleteSettingsWarehouse(
    Object warehouseId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsWarehouse(
        client,
        warehouseId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/taxes`
  Future<ApiResponse<Object?>> createSettingsTax(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsTax(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/taxes/{tax_id}`
  Future<ApiResponse<views.SettingsTaxRead>> getSettingsTax(
    Object taxId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsTax(
        client,
        taxId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/taxes/{tax_id}`
  Future<ApiResponse<Object?>> updateSettingsTax(
    Object taxId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsTax(
        client,
        taxId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/variations/{variation_id}`
  Future<ApiResponse<Object?>> deleteSettingsVariation(
    Object variationId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsVariation(
        client,
        variationId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
