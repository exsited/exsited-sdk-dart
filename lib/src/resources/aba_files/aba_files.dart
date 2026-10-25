/// The v4 aba files endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'aba_files_urls.dart';

/// `POST /api/{api_version}/aba_file/generate`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> generateAbaFile(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(AbaFilesUrls.abaFileGenerate,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
