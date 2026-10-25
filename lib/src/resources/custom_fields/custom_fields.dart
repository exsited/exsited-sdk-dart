/// The v4 custom fields endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'custom_fields_dto.dart';
import 'custom_fields_urls.dart';

/// `GET /api/{api_version}/settings/custom_fields`
///
/// List the custom fields.
Future<ApiResponse<SettingsCustomFieldList>> getSettingsCustomFields(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomFieldsUrls.settingsCustomFields,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomFieldList.fromMap);

/// `GET /api/{api_version}/settings/custom_fields/{custom_field_id}`
///
/// Read one custom field by its `cfld_` id.
Future<ApiResponse<SettingsCustomField>> getSettingsCustomField(
  ExsitedClient client,
  Object customFieldId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CustomFieldsUrls.settingsCustomField,
        pathParams: {'custom_field_id': customFieldId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCustomField.fromMap);
