/// The v4 shipping rules endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'shipping_rules.dart' as endpoints;
import 'shipping_rules_dto.dart' as views;

/// The shipping rules endpoints with [client] already applied.
class ShippingRulesResource {
  /// Bind the resource to a client; normally reached via `client.shippingRules`.
  const ShippingRulesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/shipping_rules`
  Future<ApiResponse<views.SettingsShippingRuleList>> getSettingsShippingRules({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsShippingRules(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/shipping_rules`
  Future<ApiResponse<views.SettingsShippingRule>> createSettingsShippingRule(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createSettingsShippingRule(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/shipping_rules/{shipping_rule_id}`
  Future<ApiResponse<views.SettingsShippingRule>> getSettingsShippingRule(
    Object shippingRuleId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsShippingRule(
        client,
        shippingRuleId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/settings/shipping_rules/{shipping_rule_id}`
  Future<ApiResponse<Object?>> deleteSettingsShippingRule(
    Object shippingRuleId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteSettingsShippingRule(
        client,
        shippingRuleId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/shipping_rules/{shipping_rule_id}`
  Future<ApiResponse<views.SettingsShippingRule>> updateSettingsShippingRule(
    Object shippingRuleId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsShippingRule(
        client,
        shippingRuleId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/settings/shipping_rules/{shipping_rule_id}/configuration`
  Future<ApiResponse<views.SettingsShippingRule>>
      createSettingsShippingRuleConfiguration(
    Object shippingRuleId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.createSettingsShippingRuleConfiguration(
            client,
            shippingRuleId,
            payload,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );
}
