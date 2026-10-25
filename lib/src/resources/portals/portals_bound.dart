/// The v4 portals endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'portals.dart' as endpoints;
import 'portals_dto.dart' as views;

/// The portals endpoints with [client] already applied.
class PortalsResource {
  /// Bind the resource to a client; normally reached via `client.portals`.
  const PortalsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `POST /api/{api_version}/portal/activate`
  Future<ApiResponse<Object?>> activatePortal(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.activatePortal(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/portal/change_password`
  Future<ApiResponse<views.PortalChangePassword>> createPortalChangePassword(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPortalChangePassword(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/portal/login`
  Future<ApiResponse<views.PortalLogin>> createPortalLogin(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPortalLogin(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/portal/reset`
  Future<ApiResponse<Object?>> createPortalReset(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPortalReset(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/portal/reset_link`
  Future<ApiResponse<views.PortalResetLink>> createPortalResetLink(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPortalResetLink(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/portal/validate`
  Future<ApiResponse<Object?>> createPortalValidate(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createPortalValidate(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/portal/change`
  Future<ApiResponse<Object?>> setPortalPassword(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.setPortalPassword(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
