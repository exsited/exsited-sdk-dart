/// The v4 shipping rules endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'shipping_rules_dto.dart';
import 'shipping_rules_urls.dart';

/// `GET /api/{api_version}/settings/shipping_rules`
///
/// List shipping rules.
Future<ApiResponse<SettingsShippingRuleList>> getSettingsShippingRules(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ShippingRulesUrls.settingsShippingRules,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsShippingRuleList.fromMap);

/// `POST /api/{api_version}/settings/shipping_rules`
///
/// Create a shipping rule.
Future<ApiResponse<SettingsShippingRule>> createSettingsShippingRule(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ShippingRulesUrls.settingsShippingRules,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsShippingRule.fromMap);

/// `GET /api/{api_version}/settings/shipping_rules/{shipping_rule_id}`
///
/// Get one shipping rule.
Future<ApiResponse<SettingsShippingRule>> getSettingsShippingRule(
  ExsitedClient client,
  Object shippingRuleId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(ShippingRulesUrls.settingsShippingRule,
        pathParams: {'shipping_rule_id': shippingRuleId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsShippingRule.fromMap);

/// `DELETE /api/{api_version}/settings/shipping_rules/{shipping_rule_id}`
///
/// Delete a shipping rule.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsShippingRule(
  ExsitedClient client,
  Object shippingRuleId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(ShippingRulesUrls.settingsShippingRule,
        pathParams: {'shipping_rule_id': shippingRuleId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/shipping_rules/{shipping_rule_id}`
///
/// Update a shipping rule.
Future<ApiResponse<SettingsShippingRule>> updateSettingsShippingRule(
  ExsitedClient client,
  Object shippingRuleId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(ShippingRulesUrls.settingsShippingRule,
        pathParams: {'shipping_rule_id': shippingRuleId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsShippingRule.fromMap);

/// `POST /api/{api_version}/settings/shipping_rules/{shipping_rule_id}/configuration`
///
/// Set a shipping rule's zones, rate and tiers - `POST
/// /settings/shipping_rules/{shipping_rule_id}/configuration`; each
/// `zones[].zone` is the zone's dashed uuid, not its prefixed id, and the body
/// sits under `configuration`.
Future<ApiResponse<SettingsShippingRule>>
    createSettingsShippingRuleConfiguration(
  ExsitedClient client,
  Object shippingRuleId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
        client.sendPostRequest(
            ShippingRulesUrls.settingsShippingRuleConfiguration,
            pathParams: {'shipping_rule_id': shippingRuleId},
            jsonBody: payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
            dtoDecoder: SettingsShippingRule.fromMap);
