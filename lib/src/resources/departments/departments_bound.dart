/// The v4 departments endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'departments.dart' as endpoints;
import 'departments_dto.dart' as views;

/// The departments endpoints with [client] already applied.
class DepartmentsResource {
  /// Bind the resource to a client; normally reached via `client.departments`.
  const DepartmentsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/settings/departments`
  Future<ApiResponse<views.SettingsDepartmentList>> getSettingsDepartments({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsDepartments(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/settings/departments/{department_id}`
  Future<ApiResponse<views.SettingsDepartment>> getSettingsDepartment(
    Object departmentId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getSettingsDepartment(
        client,
        departmentId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
