/// The v4 departments endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'departments_dto.dart';
import 'departments_urls.dart';

/// `GET /api/{api_version}/settings/departments`
///
/// List the departments; some carry no `id` and cannot be read singly.
Future<ApiResponse<SettingsDepartmentList>> getSettingsDepartments(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(DepartmentsUrls.settingsDepartments,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsDepartmentList.fromMap);

/// `GET /api/{api_version}/settings/departments/{department_id}`
///
/// Read one department by its `dept_` id.
Future<ApiResponse<SettingsDepartment>> getSettingsDepartment(
  ExsitedClient client,
  Object departmentId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(DepartmentsUrls.settingsDepartment,
        pathParams: {'department_id': departmentId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: SettingsDepartment.fromMap);
