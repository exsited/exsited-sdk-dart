/// The v4 organisation endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'organisation.dart' as endpoints;
import 'organisation_dto.dart' as views;

/// The organisation endpoints with [client] already applied.
class OrganisationResource {
  /// Bind the resource to a client; normally reached via `client.organisation`.
  const OrganisationResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/organisation`
  Future<ApiResponse<views.SettingsOrganisation>> getSettingsOrganisation({
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsOrganisation(
        client,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
