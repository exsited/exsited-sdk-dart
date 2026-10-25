/// The v4 portals endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'portals_dto.dart';
import 'portals_urls.dart';

/// `POST /api/{api_version}/portal/activate`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> activatePortal(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PortalsUrls.portalActivate,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/portal/change_password`
Future<ApiResponse<PortalChangePassword>> createPortalChangePassword(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PortalsUrls.portalChangePassword,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PortalChangePassword.fromMap);

/// `POST /api/{api_version}/portal/login`
Future<ApiResponse<PortalLogin>> createPortalLogin(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PortalsUrls.portalLogin,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PortalLogin.fromMap);

/// `POST /api/{api_version}/portal/reset`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createPortalReset(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PortalsUrls.portalReset,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/portal/reset_link`
Future<ApiResponse<PortalResetLink>> createPortalResetLink(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PortalsUrls.portalResetLink,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: PortalResetLink.fromMap);

/// `POST /api/{api_version}/portal/validate`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createPortalValidate(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PortalsUrls.portalValidate,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/portal/change`
///
/// Set a portal password by email, `{"portal": {"email", "password"}}`; no
/// current password is asked, and it answers `202`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> setPortalPassword(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(PortalsUrls.portalChange,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
