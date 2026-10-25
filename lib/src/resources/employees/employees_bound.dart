/// The v4 employees endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'employees.dart' as endpoints;
import 'employees_dto.dart' as views;

/// The employees endpoints with [client] already applied.
class EmployeesResource {
  /// Bind the resource to a client; normally reached via `client.employees`.
  const EmployeesResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/employees`
  Future<ApiResponse<views.EmployeeList>> getEmployees({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getEmployees(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/employees`
  Future<ApiResponse<views.Employee>> createEmployee(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createEmployee(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/employees/{employee_id}`
  Future<ApiResponse<Object?>> deleteEmployee(
    Object employeeId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteEmployee(
        client,
        employeeId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/employees/{employee_id}`
  Future<ApiResponse<views.Employee>> getEmployee(
    Object employeeId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getEmployee(
        client,
        employeeId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/employees/{employee_id}`
  Future<ApiResponse<views.Employee>> updateEmployee(
    Object employeeId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateEmployee(
        client,
        employeeId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
