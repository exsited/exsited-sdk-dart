/// The v4 express endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'express_dto.dart';
import 'express_urls.dart';

/// `POST /api/{api_version}/express`
Future<ApiResponse<Express>> createExpress(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(ExpressUrls.express,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Express.fromMap);
