/// The v4 organisations endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'organisations_urls.dart';

/// `GET /api/{api_version}/settings/organisations`
///
/// List the child organisations; the root is never among them.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getSettingsOrganisations(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrganisationsUrls.settingsOrganisations,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/settings/organisations`
///
/// Create a child organisation; the envelope is `organization`, with a z.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createSettingsOrganisation(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(OrganisationsUrls.settingsOrganisations,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/settings/organisations/{organisation_id}`
///
/// Get one organisation.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getSettingsOrganisation(
  ExsitedClient client,
  Object organisationId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrganisationsUrls.settingsOrganisation,
        pathParams: {'organisation_id': organisationId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/settings/organisations/{organisation_id}`
///
/// Delete an organisation.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteSettingsOrganisation(
  ExsitedClient client,
  Object organisationId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(OrganisationsUrls.settingsOrganisation,
        pathParams: {'organisation_id': organisationId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `PATCH /api/{api_version}/settings/organisations/{organisation_id}`
///
/// Update an organisation.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> updateSettingsOrganisation(
  ExsitedClient client,
  Object organisationId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(OrganisationsUrls.settingsOrganisation,
        pathParams: {'organisation_id': organisationId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
