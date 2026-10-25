/// The v4 aba files endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'aba_files.dart' as endpoints;

/// The aba files endpoints with [client] already applied.
class AbaFilesResource {
  /// Bind the resource to a client; normally reached via `client.abaFiles`.
  const AbaFilesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `POST /api/{api_version}/aba_file/generate`
  Future<ApiResponse<Object?>> generateAbaFile(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.generateAbaFile(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
