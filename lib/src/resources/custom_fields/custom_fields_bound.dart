/// The v4 custom fields endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'custom_fields.dart' as endpoints;
import 'custom_fields_dto.dart' as views;

/// The custom fields endpoints with [client] already applied.
class CustomFieldsResource {
  /// Bind the resource to a client; normally reached via `client.customFields`.
  const CustomFieldsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/custom_fields`
  Future<ApiResponse<views.SettingsCustomFieldList>> getSettingsCustomFields({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsCustomFields(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/custom_fields/{custom_field_id}`
  Future<ApiResponse<views.SettingsCustomField>> getSettingsCustomField(
    Object customFieldId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsCustomField(
        client,
        customFieldId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
