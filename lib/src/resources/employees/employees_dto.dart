/// Typed views over the v4 employees bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The employee body.
class Employee extends Dto {
  const Employee({
    this.activityLogs,
    this.code,
    this.contacts,
    this.createdBy,
    this.createdOn,
    this.customAttributes,
    this.customForm,
    this.description,
    this.displayName,
    this.emailAddress,
    this.href,
    this.id,
    this.imageUuid,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/employees',
    'GET /api/{api_version}/employees/{employee_id}',
    'POST /api/{api_version}/employees',
    'PATCH /api/{api_version}/employees/{employee_id}',
  ];

  static Employee? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'employee');
    if (source == null) return null;
    return Employee(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      code: readText(source['code']),
      contacts: readList<EmployeeContact>(
          source['contacts'], EmployeeContact.fromMap),
      createdBy: EmployeeCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customForm: EmployeeCustomForm.fromMap(source['custom_form']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      emailAddress: readText(source['email_address']),
      href: readText(source['href']),
      id: readText(source['id']),
      imageUuid: readAny(source['image_uuid']),
      lastUpdatedBy: EmployeeLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
      version: readInteger(source['version']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  final String? code;

  final List<EmployeeContact?>? contacts;

  final EmployeeCreatedBy? createdBy;

  final String? createdOn;

  final List<Object?>? customAttributes;

  final EmployeeCustomForm? customForm;

  final String? description;

  final String? displayName;

  final String? emailAddress;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? imageUuid;

  final EmployeeLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  final int? version;

  @override
  String? get envelopeKey => 'employee';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'code': code,
        'contacts': contacts,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_attributes': customAttributes,
        'custom_form': customForm,
        'description': description,
        'display_name': displayName,
        'email_address': emailAddress,
        'href': href,
        'id': id,
        'image_uuid': imageUuid,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
        'version': version,
      };
}

/// A page of Employee records.
class EmployeeList extends Dto {
  const EmployeeList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/employees',
  ];

  static EmployeeList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return EmployeeList(
      data: readList<Employee>(source['data'], Employee.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Employee?>? data;

  final String? object;

  final Pagination? pagination;

  final String? url;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'data': data,
        'object': object,
        'pagination': pagination,
        'url': url,
      };
}

/// A [Employee]'s `custom_form`.
class EmployeeCustomForm extends Dto {
  const EmployeeCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static EmployeeCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return EmployeeCustomForm(
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// One entry of a [Employee]'s `contacts`.
class EmployeeContact extends Dto {
  const EmployeeContact({
    this.address,
    this.createdBy,
    this.createdOn,
    this.email,
    this.fax,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.mobile,
    this.name,
    this.object,
    this.phone,
    this.status,
    this.type,
    this.version,
  });

  static EmployeeContact? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return EmployeeContact(
      address: readAny(source['address']),
      createdBy: EmployeeContactCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      email: EmployeeContactEmail.fromMap(source['email']),
      fax: readAny(source['fax']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      mobile: readAny(source['mobile']),
      name: EmployeeContactName.fromMap(source['name']),
      object: readText(source['object']),
      phone: readAny(source['phone']),
      status: readText(source['status']),
      type: readText(source['type']),
      version: readInteger(source['version']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? address;

  final EmployeeContactCreatedBy? createdBy;

  final String? createdOn;

  final EmployeeContactEmail? email;

  /// Untyped: null in every record measured.
  final Object? fax;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedOn;

  /// Untyped: null in every record measured.
  final Object? mobile;

  final EmployeeContactName? name;

  final String? object;

  /// Untyped: null in every record measured.
  final Object? phone;

  final String? status;

  final String? type;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'address': address,
        'created_by': createdBy,
        'created_on': createdOn,
        'email': email,
        'fax': fax,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'mobile': mobile,
        'name': name,
        'object': object,
        'phone': phone,
        'status': status,
        'type': type,
        'version': version,
      };
}

/// A [Employee]'s `created_by`.
class EmployeeCreatedBy extends Dto {
  const EmployeeCreatedBy({
    this.name,
    this.object,
  });

  static EmployeeCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return EmployeeCreatedBy(
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'object': object,
      };
}

/// A [Employee]'s `last_updated_by`.
class EmployeeLastUpdatedBy extends Dto {
  const EmployeeLastUpdatedBy({
    this.name,
    this.object,
  });

  static EmployeeLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return EmployeeLastUpdatedBy(
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'object': object,
      };
}

/// A [EmployeeContact]'s `name`.
class EmployeeContactName extends Dto {
  const EmployeeContactName({
    this.designation,
    this.first,
    this.last,
    this.middle,
    this.salutation,
  });

  static EmployeeContactName? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return EmployeeContactName(
      designation: readAny(source['designation']),
      first: readText(source['first']),
      last: readText(source['last']),
      middle: readAny(source['middle']),
      salutation: readAny(source['salutation']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? designation;

  final String? first;

  final String? last;

  /// Untyped: null in every record measured.
  final Object? middle;

  /// Untyped: null in every record measured.
  final Object? salutation;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'designation': designation,
        'first': first,
        'last': last,
        'middle': middle,
        'salutation': salutation,
      };
}

/// A [EmployeeContact]'s `email`.
class EmployeeContactEmail extends Dto {
  const EmployeeContactEmail({
    this.address,
    this.emailOptedOut,
  });

  static EmployeeContactEmail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return EmployeeContactEmail(
      address: readText(source['address']),
      emailOptedOut: readFlag(source['email_opted_out']),
    );
  }

  final String? address;

  final bool? emailOptedOut;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'address': address,
        'email_opted_out': emailOptedOut,
      };
}

/// A [EmployeeContact]'s `created_by`.
class EmployeeContactCreatedBy extends Dto {
  const EmployeeContactCreatedBy({
    this.name,
    this.object,
  });

  static EmployeeContactCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return EmployeeContactCreatedBy(
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'object': object,
      };
}
