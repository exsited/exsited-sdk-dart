/// The v4 countries endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'countries_dto.dart';
import 'countries_urls.dart';

/// `GET /api/{api_version}/settings/countries`
///
/// List the countries.
Future<ApiResponse<SettingsCountryList>> getSettingsCountries(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CountriesUrls.settingsCountries,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCountryList.fromMap);

/// `GET /api/{api_version}/settings/countries/{country_id}`
///
/// Read one country by its `country_` id.
Future<ApiResponse<SettingsCountry>> getSettingsCountry(
  ExsitedClient client,
  Object countryId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(CountriesUrls.settingsCountry,
        pathParams: {'country_id': countryId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCountry.fromMap);

/// `PATCH /api/{api_version}/settings/countries/{country_id}`
///
/// Update a country's status, description or `default_*` fields; the answer is
/// the country as it was before the write.
Future<ApiResponse<SettingsCountry>> updateSettingsCountry(
  ExsitedClient client,
  Object countryId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(CountriesUrls.settingsCountry,
        pathParams: {'country_id': countryId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsCountry.fromMap);
