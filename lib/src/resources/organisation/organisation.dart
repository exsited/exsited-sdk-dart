/// The v4 organisation endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'organisation_dto.dart';
import 'organisation_urls.dart';

/// `GET /api/{api_version}/settings/organisation`
///
/// Get the root organisation; read only, a PATCH here answers 405.
Future<ApiResponse<SettingsOrganisation>> getSettingsOrganisation(
  ExsitedClient client, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(OrganisationUrls.settingsOrganisation,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsOrganisation.fromMap);
