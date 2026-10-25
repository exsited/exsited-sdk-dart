/// The v4 employees endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'employees_dto.dart';
import 'employees_urls.dart';

/// `GET /api/{api_version}/employees`
Future<ApiResponse<EmployeeList>> getEmployees(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(EmployeesUrls.employees,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: EmployeeList.fromMap);

/// `POST /api/{api_version}/employees`
Future<ApiResponse<Employee>> createEmployee(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(EmployeesUrls.employees,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Employee.fromMap);

/// `DELETE /api/{api_version}/employees/{employee_id}`
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteEmployee(
  ExsitedClient client,
  Object employeeId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(EmployeesUrls.employee,
        pathParams: {'employee_id': employeeId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/employees/{employee_id}`
Future<ApiResponse<Employee>> getEmployee(
  ExsitedClient client,
  Object employeeId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(EmployeesUrls.employee,
        pathParams: {'employee_id': employeeId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Employee.fromMap);

/// `PATCH /api/{api_version}/employees/{employee_id}`
Future<ApiResponse<Employee>> updateEmployee(
  ExsitedClient client,
  Object employeeId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(EmployeesUrls.employee,
        pathParams: {'employee_id': employeeId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: Employee.fromMap);
