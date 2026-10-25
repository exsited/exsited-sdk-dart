/// The v4 countries endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'countries.dart' as endpoints;
import 'countries_dto.dart' as views;

/// The countries endpoints with [client] already applied.
class CountriesResource {
  /// Bind the resource to a client; normally reached via `client.countries`.
  const CountriesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/countries`
  Future<ApiResponse<views.SettingsCountryList>> getSettingsCountries({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsCountries(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/countries/{country_id}`
  Future<ApiResponse<views.SettingsCountry>> getSettingsCountry(
    Object countryId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsCountry(
        client,
        countryId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/settings/countries/{country_id}`
  Future<ApiResponse<views.SettingsCountry>> updateSettingsCountry(
    Object countryId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateSettingsCountry(
        client,
        countryId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
