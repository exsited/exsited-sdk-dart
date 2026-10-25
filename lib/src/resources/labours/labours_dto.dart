/// Typed views over the v4 labours bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The labour body.
class Labour extends Dto {
  const Labour({
    this.activityLogs,
    this.code,
    this.createdBy,
    this.createdOn,
    this.customForm,
    this.description,
    this.displayName,
    this.emailAddress,
    this.href,
    this.id,
    this.imageName,
    this.labourAvailability,
    this.labourContacts,
    this.labourCustomAvailability,
    this.labourProfile,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.status,
    this.useCustomAvailability,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/labours',
    'GET /api/{api_version}/labours/available_for_booking',
    'GET /api/{api_version}/labours/{labour_uuid}',
    'POST /api/{api_version}/labours',
    'PATCH /api/{api_version}/labours/{labour_uuid}',
    'POST /api/{api_version}/labours/{labour_id}/cancel',
    'POST /api/{api_version}/labours/{labour_id}/reactivate',
  ];

  static Labour? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'labour');
    if (source == null) return null;
    return Labour(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      code: readText(source['code']),
      createdBy: LabourCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      customForm: LabourCustomForm.fromMap(source['custom_form']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      emailAddress: readText(source['email_address']),
      href: readText(source['href']),
      id: readText(source['id']),
      imageName: readAny(source['image_name']),
      labourAvailability:
          readList<Object>(source['labour_availability'], readAny),
      labourContacts: readList<LabourLabourContact>(
          source['labour_contacts'], LabourLabourContact.fromMap),
      labourCustomAvailability: readList<LabourLabourCustomAvailability>(
          source['labour_custom_availability'],
          LabourLabourCustomAvailability.fromMap),
      labourProfile: LabourLabourProfile.fromMap(source['labour_profile']),
      lastUpdatedBy: LabourLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
      useCustomAvailability: readFlag(source['use_custom_availability']),
      version: readInteger(source['version']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  final String? code;

  final LabourCreatedBy? createdBy;

  final String? createdOn;

  final LabourCustomForm? customForm;

  final String? description;

  final String? displayName;

  final String? emailAddress;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? imageName;

  final List<Object?>? labourAvailability;

  final List<LabourLabourContact?>? labourContacts;

  final List<LabourLabourCustomAvailability?>? labourCustomAvailability;

  final LabourLabourProfile? labourProfile;

  final LabourLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? status;

  final bool? useCustomAvailability;

  final int? version;

  @override
  String? get envelopeKey => 'labour';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_form': customForm,
        'description': description,
        'display_name': displayName,
        'email_address': emailAddress,
        'href': href,
        'id': id,
        'image_name': imageName,
        'labour_availability': labourAvailability,
        'labour_contacts': labourContacts,
        'labour_custom_availability': labourCustomAvailability,
        'labour_profile': labourProfile,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'status': status,
        'use_custom_availability': useCustomAvailability,
        'version': version,
      };
}

/// A page of Labour records.
class LabourList extends Dto {
  const LabourList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/labours',
    'GET /api/{api_version}/labours/available_for_booking',
  ];

  static LabourList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourList(
      data: readList<Labour>(source['data'], Labour.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<Labour?>? data;

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

/// The labour profile body.
class LabourProfile extends Dto {
  const LabourProfile({
    this.createdBy,
    this.createdOn,
    this.currency,
    this.displayName,
    this.href,
    this.id,
    this.labours,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.maxBookingLimit,
    this.name,
    this.object,
    this.sessions,
    this.status,
    this.tax,
    this.taxInclusive,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/labour_profiles',
  ];

  static LabourProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfile(
      createdBy: LabourProfileCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: LabourProfileCurrency.fromMap(source['currency']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      labours: readList<LabourProfileLabour>(
          source['labours'], LabourProfileLabour.fromMap),
      lastUpdatedBy:
          LabourProfileLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      maxBookingLimit: readAny(source['max_booking_limit']),
      name: readText(source['name']),
      object: readText(source['object']),
      sessions: readList<LabourProfileSession>(
          source['sessions'], LabourProfileSession.fromMap),
      status: readText(source['status']),
      tax: LabourProfileTax.fromMap(source['tax']),
      taxInclusive: readFlag(source['tax_inclusive']),
      version: readInteger(source['version']),
    );
  }

  final LabourProfileCreatedBy? createdBy;

  final String? createdOn;

  final LabourProfileCurrency? currency;

  final String? displayName;

  final String? href;

  final String? id;

  final List<LabourProfileLabour?>? labours;

  final LabourProfileLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  /// Untyped: never populated in the records measured.
  final Object? maxBookingLimit;

  final String? name;

  final String? object;

  final List<LabourProfileSession?>? sessions;

  final String? status;

  final LabourProfileTax? tax;

  final bool? taxInclusive;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'display_name': displayName,
        'href': href,
        'id': id,
        'labours': labours,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'max_booking_limit': maxBookingLimit,
        'name': name,
        'object': object,
        'sessions': sessions,
        'status': status,
        'tax': tax,
        'tax_inclusive': taxInclusive,
        'version': version,
      };
}

/// A page of LabourProfile records.
class LabourProfileList extends Dto {
  const LabourProfileList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/labour_profiles',
  ];

  static LabourProfileList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileList(
      data: readList<LabourProfile>(source['data'], LabourProfile.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<LabourProfile?>? data;

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

/// The labour availability body.
class LabourAvailability extends Dto {
  const LabourAvailability({
    this.availableList,
    this.code,
    this.displayName,
    this.emailAddress,
    this.id,
    this.labourProfile,
    this.name,
    this.object,
    this.processedScheduleList,
    this.scheduleList,
    this.sessionList,
    this.status,
    this.unavailableList,
    this.useCustomAvailability,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/labour_availability',
  ];

  static LabourAvailability? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourAvailability(
      availableList: readList<Object>(source['available_list'], readAny),
      code: readText(source['code']),
      displayName: readText(source['display_name']),
      emailAddress: readText(source['email_address']),
      id: readText(source['id']),
      labourProfile:
          LabourAvailabilityLabourProfile.fromMap(source['labour_profile']),
      name: readText(source['name']),
      object: readText(source['object']),
      processedScheduleList: readAny(source['processed_schedule_list']),
      scheduleList: readList<LabourAvailabilityScheduleList>(
          source['schedule_list'], LabourAvailabilityScheduleList.fromMap),
      sessionList: readList<LabourAvailabilitySessionList>(
          source['session_list'], LabourAvailabilitySessionList.fromMap),
      status: readText(source['status']),
      unavailableList: readList<Object>(source['unavailable_list'], readAny),
      useCustomAvailability: readFlag(source['use_custom_availability']),
      version: readInteger(source['version']),
    );
  }

  final List<Object?>? availableList;

  final String? code;

  final String? displayName;

  final String? emailAddress;

  final String? id;

  final LabourAvailabilityLabourProfile? labourProfile;

  final String? name;

  final String? object;

  final Object? processedScheduleList;

  final List<LabourAvailabilityScheduleList?>? scheduleList;

  final List<LabourAvailabilitySessionList?>? sessionList;

  final String? status;

  final List<Object?>? unavailableList;

  final bool? useCustomAvailability;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'available_list': availableList,
        'code': code,
        'display_name': displayName,
        'email_address': emailAddress,
        'id': id,
        'labour_profile': labourProfile,
        'name': name,
        'object': object,
        'processed_schedule_list': processedScheduleList,
        'schedule_list': scheduleList,
        'session_list': sessionList,
        'status': status,
        'unavailable_list': unavailableList,
        'use_custom_availability': useCustomAvailability,
        'version': version,
      };
}

/// A page of LabourAvailability records.
class LabourAvailabilityList extends Dto {
  const LabourAvailabilityList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/labour_availability',
  ];

  static LabourAvailabilityList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourAvailabilityList(
      data: readList<LabourAvailability>(
          source['data'], LabourAvailability.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<LabourAvailability?>? data;

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

/// What `getLabourProfile` answers, under `labour_profile`.
class LabourProfileView extends Dto {
  const LabourProfileView({
    this.activityLogs,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.displayName,
    this.href,
    this.id,
    this.labours,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.maxBookingLimit,
    this.name,
    this.object,
    this.sessions,
    this.status,
    this.tax,
    this.taxInclusive,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/labour_profiles/{labour_profile_id}',
    'POST /api/{api_version}/labour_profiles',
  ];

  static LabourProfileView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'labour_profile');
    if (source == null) return null;
    return LabourProfileView(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      createdBy: LabourProfileViewCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: LabourProfileViewCurrency.fromMap(source['currency']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      labours: readList<LabourProfileViewLabour>(
          source['labours'], LabourProfileViewLabour.fromMap),
      lastUpdatedBy:
          LabourProfileViewLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      maxBookingLimit: readInteger(source['max_booking_limit']),
      name: readText(source['name']),
      object: readText(source['object']),
      sessions: readList<LabourProfileViewSession>(
          source['sessions'], LabourProfileViewSession.fromMap),
      status: readText(source['status']),
      tax: LabourProfileViewTax.fromMap(source['tax']),
      taxInclusive: readFlag(source['tax_inclusive']),
      version: readInteger(source['version']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  final LabourProfileViewCreatedBy? createdBy;

  final String? createdOn;

  final LabourProfileViewCurrency? currency;

  final String? displayName;

  final String? href;

  final String? id;

  final List<LabourProfileViewLabour?>? labours;

  final LabourProfileViewLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final int? maxBookingLimit;

  final String? name;

  final String? object;

  final List<LabourProfileViewSession?>? sessions;

  final String? status;

  final LabourProfileViewTax? tax;

  final bool? taxInclusive;

  final int? version;

  @override
  String? get envelopeKey => 'labour_profile';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'display_name': displayName,
        'href': href,
        'id': id,
        'labours': labours,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'max_booking_limit': maxBookingLimit,
        'name': name,
        'object': object,
        'sessions': sessions,
        'status': status,
        'tax': tax,
        'tax_inclusive': taxInclusive,
        'version': version,
      };
}

/// One page of what `getLabourOrders` lists, under `data`.
class LabourOrderList extends Dto {
  const LabourOrderList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/labours/{labour_uuid}/orders',
  ];

  static LabourOrderList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourOrderList(
      data: readList<LabourOrder>(source['data'], LabourOrder.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<LabourOrder?>? data;

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

/// A [Labour]'s `labour_profile`.
class LabourLabourProfile extends Dto {
  const LabourLabourProfile({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourLabourProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourLabourProfile(
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

/// A [Labour]'s `custom_form`.
class LabourCustomForm extends Dto {
  const LabourCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourCustomForm(
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

/// One entry of a [Labour]'s `labour_contacts`.
class LabourLabourContact extends Dto {
  const LabourLabourContact({
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    this.addressLine5,
    this.city,
    this.contactType,
    this.country,
    this.designation,
    this.emailAddress,
    this.fax,
    this.firstName,
    this.id,
    this.lastName,
    this.middleName,
    this.mobile,
    this.object,
    this.phone,
    this.postCode,
    this.receiveEmail,
    this.salutation,
    this.state,
    this.status,
  });

  static LabourLabourContact? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourLabourContact(
      addressLine1: readText(source['address_line_1']),
      addressLine2: readText(source['address_line_2']),
      addressLine3: readText(source['address_line_3']),
      addressLine4: readText(source['address_line_4']),
      addressLine5: readText(source['address_line_5']),
      city: readText(source['city']),
      contactType: readText(source['contact_type']),
      country: readText(source['country']),
      designation: readText(source['designation']),
      emailAddress: readText(source['email_address']),
      fax: LabourLabourContactFax.fromMap(source['fax']),
      firstName: readText(source['first_name']),
      id: readText(source['id']),
      lastName: readText(source['last_name']),
      middleName: readAny(source['middle_name']),
      mobile: LabourLabourContactMobile.fromMap(source['mobile']),
      object: readText(source['object']),
      phone: LabourLabourContactPhone.fromMap(source['phone']),
      postCode: readText(source['post_code']),
      receiveEmail: readFlag(source['receive_email']),
      salutation: readText(source['salutation']),
      state: readText(source['state']),
      status: readText(source['status']),
    );
  }

  final String? addressLine1;

  final String? addressLine2;

  final String? addressLine3;

  final String? addressLine4;

  final String? addressLine5;

  final String? city;

  final String? contactType;

  final String? country;

  final String? designation;

  final String? emailAddress;

  final LabourLabourContactFax? fax;

  final String? firstName;

  final String? id;

  final String? lastName;

  /// Untyped: null in every record measured.
  final Object? middleName;

  final LabourLabourContactMobile? mobile;

  final String? object;

  final LabourLabourContactPhone? phone;

  final String? postCode;

  final bool? receiveEmail;

  final String? salutation;

  final String? state;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_line_3': addressLine3,
        'address_line_4': addressLine4,
        'address_line_5': addressLine5,
        'city': city,
        'contact_type': contactType,
        'country': country,
        'designation': designation,
        'email_address': emailAddress,
        'fax': fax,
        'first_name': firstName,
        'id': id,
        'last_name': lastName,
        'middle_name': middleName,
        'mobile': mobile,
        'object': object,
        'phone': phone,
        'post_code': postCode,
        'receive_email': receiveEmail,
        'salutation': salutation,
        'state': state,
        'status': status,
      };
}

/// One entry of a [Labour]'s `labour_custom_availability`.
class LabourLabourCustomAvailability extends Dto {
  const LabourLabourCustomAvailability({
    this.available,
    this.endTime,
    this.id,
    this.object,
    this.preferredDay,
    this.startTime,
  });

  static LabourLabourCustomAvailability? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourLabourCustomAvailability(
      available: readFlag(source['available']),
      endTime: readText(source['end_time']),
      id: readText(source['id']),
      object: readText(source['object']),
      preferredDay: readText(source['preferred_day']),
      startTime: readText(source['start_time']),
    );
  }

  final bool? available;

  final String? endTime;

  final String? id;

  final String? object;

  final String? preferredDay;

  final String? startTime;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'available': available,
        'end_time': endTime,
        'id': id,
        'object': object,
        'preferred_day': preferredDay,
        'start_time': startTime,
      };
}

/// A [Labour]'s `created_by`.
class LabourCreatedBy extends Dto {
  const LabourCreatedBy({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourCreatedBy(
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

/// A [Labour]'s `last_updated_by`.
class LabourLastUpdatedBy extends Dto {
  const LabourLastUpdatedBy({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourLastUpdatedBy(
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

/// A [LabourProfile]'s `currency`.
class LabourProfileCurrency extends Dto {
  const LabourProfileCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourProfileCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileCurrency(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [LabourProfile]'s `tax`.
class LabourProfileTax extends Dto {
  const LabourProfileTax({
    this.href,
    this.id,
    this.object,
  });

  static LabourProfileTax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileTax(
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'object': object,
      };
}

/// One entry of a [LabourProfile]'s `labours`.
class LabourProfileLabour extends Dto {
  const LabourProfileLabour({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourProfileLabour? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileLabour(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// One entry of a [LabourProfile]'s `sessions`.
class LabourProfileSession extends Dto {
  const LabourProfileSession({
    this.allowOvertime,
    this.availability,
    this.endDate,
    this.href,
    this.id,
    this.name,
    this.object,
    this.prices,
    this.startDate,
    this.status,
    this.workingHours,
  });

  static LabourProfileSession? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileSession(
      allowOvertime: readFlag(source['allow_overtime']),
      availability: readList<LabourProfileSessionAvailability>(
          source['availability'], LabourProfileSessionAvailability.fromMap),
      endDate: readText(source['end_date']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      prices: readList<LabourProfileSessionPrice>(
          source['prices'], LabourProfileSessionPrice.fromMap),
      startDate: readText(source['start_date']),
      status: readText(source['status']),
      workingHours: readList<LabourProfileSessionWorkingHour>(
          source['working_hours'], LabourProfileSessionWorkingHour.fromMap),
    );
  }

  final bool? allowOvertime;

  final List<LabourProfileSessionAvailability?>? availability;

  final String? endDate;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final List<LabourProfileSessionPrice?>? prices;

  final String? startDate;

  final String? status;

  final List<LabourProfileSessionWorkingHour?>? workingHours;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'allow_overtime': allowOvertime,
        'availability': availability,
        'end_date': endDate,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'prices': prices,
        'start_date': startDate,
        'status': status,
        'working_hours': workingHours,
      };
}

/// A [LabourProfile]'s `created_by`.
class LabourProfileCreatedBy extends Dto {
  const LabourProfileCreatedBy({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourProfileCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileCreatedBy(
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

/// A [LabourProfile]'s `last_updated_by`.
class LabourProfileLastUpdatedBy extends Dto {
  const LabourProfileLastUpdatedBy({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourProfileLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileLastUpdatedBy(
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

/// A [LabourAvailability]'s `labour_profile`.
class LabourAvailabilityLabourProfile extends Dto {
  const LabourAvailabilityLabourProfile({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourAvailabilityLabourProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourAvailabilityLabourProfile(
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

/// One entry of a [LabourAvailability]'s `schedule_list`.
class LabourAvailabilityScheduleList extends Dto {
  const LabourAvailabilityScheduleList({
    this.available,
    this.endTime,
    this.id,
    this.object,
    this.preferredDay,
    this.startTime,
  });

  static LabourAvailabilityScheduleList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourAvailabilityScheduleList(
      available: readFlag(source['available']),
      endTime: readText(source['end_time']),
      id: readText(source['id']),
      object: readText(source['object']),
      preferredDay: readText(source['preferred_day']),
      startTime: readText(source['start_time']),
    );
  }

  final bool? available;

  final String? endTime;

  final String? id;

  final String? object;

  final String? preferredDay;

  final String? startTime;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'available': available,
        'end_time': endTime,
        'id': id,
        'object': object,
        'preferred_day': preferredDay,
        'start_time': startTime,
      };
}

/// One entry of a [LabourAvailability]'s `session_list`.
class LabourAvailabilitySessionList extends Dto {
  const LabourAvailabilitySessionList({
    this.endDate,
    this.name,
    this.processedScheduleList,
    this.scheduleList,
    this.startDate,
    this.uuid,
  });

  static LabourAvailabilitySessionList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourAvailabilitySessionList(
      endDate: readText(source['end_date']),
      name: readText(source['name']),
      processedScheduleList: readAny(source['processed_schedule_list']),
      scheduleList: readList<LabourAvailabilitySessionListScheduleList>(
          source['schedule_list'],
          LabourAvailabilitySessionListScheduleList.fromMap),
      startDate: readText(source['start_date']),
      uuid: readText(source['uuid']),
    );
  }

  final String? endDate;

  final String? name;

  /// Untyped: an object with no keys in every record measured.
  final Object? processedScheduleList;

  final List<LabourAvailabilitySessionListScheduleList?>? scheduleList;

  final String? startDate;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'end_date': endDate,
        'name': name,
        'processed_schedule_list': processedScheduleList,
        'schedule_list': scheduleList,
        'start_date': startDate,
        'uuid': uuid,
      };
}

/// A [LabourProfileView]'s `currency`.
class LabourProfileViewCurrency extends Dto {
  const LabourProfileViewCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourProfileViewCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileViewCurrency(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [LabourProfileView]'s `tax`.
class LabourProfileViewTax extends Dto {
  const LabourProfileViewTax({
    this.href,
    this.id,
    this.object,
  });

  static LabourProfileViewTax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileViewTax(
      href: readText(source['href']),
      id: readText(source['id']),
      object: readText(source['object']),
    );
  }

  final String? href;

  final String? id;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'href': href,
        'id': id,
        'object': object,
      };
}

/// One entry of a [LabourProfileView]'s `labours`.
class LabourProfileViewLabour extends Dto {
  const LabourProfileViewLabour({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourProfileViewLabour? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileViewLabour(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// One entry of a [LabourProfileView]'s `sessions`.
class LabourProfileViewSession extends Dto {
  const LabourProfileViewSession({
    this.allowOvertime,
    this.availability,
    this.endDate,
    this.href,
    this.id,
    this.name,
    this.object,
    this.prices,
    this.startDate,
    this.status,
    this.workingHours,
  });

  static LabourProfileViewSession? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileViewSession(
      allowOvertime: readFlag(source['allow_overtime']),
      availability: readList<LabourProfileViewSessionAvailability>(
          source['availability'], LabourProfileViewSessionAvailability.fromMap),
      endDate: readText(source['end_date']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      prices: readList<LabourProfileViewSessionPrice>(
          source['prices'], LabourProfileViewSessionPrice.fromMap),
      startDate: readText(source['start_date']),
      status: readText(source['status']),
      workingHours: readList<LabourProfileViewSessionWorkingHour>(
          source['working_hours'], LabourProfileViewSessionWorkingHour.fromMap),
    );
  }

  final bool? allowOvertime;

  final List<LabourProfileViewSessionAvailability?>? availability;

  final String? endDate;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final List<LabourProfileViewSessionPrice?>? prices;

  final String? startDate;

  final String? status;

  final List<LabourProfileViewSessionWorkingHour?>? workingHours;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'allow_overtime': allowOvertime,
        'availability': availability,
        'end_date': endDate,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'prices': prices,
        'start_date': startDate,
        'status': status,
        'working_hours': workingHours,
      };
}

/// A [LabourProfileView]'s `created_by`.
class LabourProfileViewCreatedBy extends Dto {
  const LabourProfileViewCreatedBy({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourProfileViewCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileViewCreatedBy(
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

/// A [LabourProfileView]'s `last_updated_by`.
class LabourProfileViewLastUpdatedBy extends Dto {
  const LabourProfileViewLastUpdatedBy({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourProfileViewLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileViewLastUpdatedBy(
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

/// One entry of a [LabourOrderList]'s `data`.
class LabourOrder extends Dto {
  const LabourOrder({
    this.account,
    this.allowContract,
    this.billingAddress,
    this.billingPreferences,
    this.billingStartDate,
    this.communicationPreferences,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.customForm,
    this.customerPurchaseOrderId,
    this.description,
    this.discountProfile,
    this.displayName,
    this.id,
    this.invoiceNote,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.manager,
    this.name,
    this.nextBillingFromDate,
    this.object,
    this.orderStartDate,
    this.orderType,
    this.origin,
    this.originalTotal,
    this.preOrder,
    this.priceTaxInclusive,
    this.quoteConverted,
    this.quoteOrder,
    this.referralAccount,
    this.salesRep,
    this.shippingAddress,
    this.shippingCost,
    this.shippingProfile,
    this.status,
    this.timeZone,
    this.version,
  });

  static LabourOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourOrder(
      account: LabourOrderAccount.fromMap(source['account']),
      allowContract: readFlag(source['allow_contract']),
      billingAddress: readAny(source['billing_address']),
      billingPreferences:
          LabourOrderBillingPreferences.fromMap(source['billing_preferences']),
      billingStartDate: readText(source['billing_start_date']),
      communicationPreferences: readList<LabourOrderCommunicationPreference>(
          source['communication_preferences'],
          LabourOrderCommunicationPreference.fromMap),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: LabourOrderCurrency.fromMap(source['currency']),
      customForm: LabourOrderCustomForm.fromMap(source['custom_form']),
      customerPurchaseOrderId: readAny(source['customer_purchase_order_id']),
      description: readAny(source['description']),
      discountProfile: readAny(source['discount_profile']),
      displayName: readText(source['display_name']),
      id: readText(source['id']),
      invoiceNote: readAny(source['invoice_note']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      manager: readAny(source['manager']),
      name: readText(source['name']),
      nextBillingFromDate: readText(source['next_billing_from_date']),
      object: readText(source['object']),
      orderStartDate: readText(source['order_start_date']),
      orderType: readText(source['order_type']),
      origin: readAny(source['origin']),
      originalTotal: readAny(source['original_total']),
      preOrder: readFlag(source['pre_order']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      quoteConverted: readFlag(source['quote_converted']),
      quoteOrder: readFlag(source['quote_order']),
      referralAccount: readAny(source['referral_account']),
      salesRep: readAny(source['sales_rep']),
      shippingAddress: readAny(source['shipping_address']),
      shippingCost: readDecimal(source['shipping_cost']),
      shippingProfile: readAny(source['shipping_profile']),
      status: readText(source['status']),
      timeZone: LabourOrderTimeZone.fromMap(source['time_zone']),
      version: readInteger(source['version']),
    );
  }

  final LabourOrderAccount? account;

  final bool? allowContract;

  /// Untyped: null in every record measured.
  final Object? billingAddress;

  final LabourOrderBillingPreferences? billingPreferences;

  final String? billingStartDate;

  final List<LabourOrderCommunicationPreference?>? communicationPreferences;

  /// Untyped: null in every record measured.
  final Object? createdBy;

  final String? createdOn;

  final LabourOrderCurrency? currency;

  final LabourOrderCustomForm? customForm;

  /// Untyped: null in every record measured.
  final Object? customerPurchaseOrderId;

  /// Untyped: null in every record measured.
  final Object? description;

  /// Untyped: null in every record measured.
  final Object? discountProfile;

  final String? displayName;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? invoiceNote;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  /// Untyped: null in every record measured.
  final Object? manager;

  final String? name;

  final String? nextBillingFromDate;

  final String? object;

  final String? orderStartDate;

  final String? orderType;

  /// Untyped: null in every record measured.
  final Object? origin;

  /// Untyped: null in every record measured.
  final Object? originalTotal;

  final bool? preOrder;

  final bool? priceTaxInclusive;

  final bool? quoteConverted;

  final bool? quoteOrder;

  /// Untyped: null in every record measured.
  final Object? referralAccount;

  /// Untyped: null in every record measured.
  final Object? salesRep;

  /// Untyped: null in every record measured.
  final Object? shippingAddress;

  final double? shippingCost;

  /// Untyped: null in every record measured.
  final Object? shippingProfile;

  final String? status;

  final LabourOrderTimeZone? timeZone;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'allow_contract': allowContract,
        'billing_address': billingAddress,
        'billing_preferences': billingPreferences,
        'billing_start_date': billingStartDate,
        'communication_preferences': communicationPreferences,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'custom_form': customForm,
        'customer_purchase_order_id': customerPurchaseOrderId,
        'description': description,
        'discount_profile': discountProfile,
        'display_name': displayName,
        'id': id,
        'invoice_note': invoiceNote,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'manager': manager,
        'name': name,
        'next_billing_from_date': nextBillingFromDate,
        'object': object,
        'order_start_date': orderStartDate,
        'order_type': orderType,
        'origin': origin,
        'original_total': originalTotal,
        'pre_order': preOrder,
        'price_tax_inclusive': priceTaxInclusive,
        'quote_converted': quoteConverted,
        'quote_order': quoteOrder,
        'referral_account': referralAccount,
        'sales_rep': salesRep,
        'shipping_address': shippingAddress,
        'shipping_cost': shippingCost,
        'shipping_profile': shippingProfile,
        'status': status,
        'time_zone': timeZone,
        'version': version,
      };
}

/// A [LabourLabourContact]'s `phone`.
class LabourLabourContactPhone extends Dto {
  const LabourLabourContactPhone({
    this.areaCode,
    this.countryCode,
    this.doNotCall,
    this.full,
    this.number,
  });

  static LabourLabourContactPhone? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourLabourContactPhone(
      areaCode: readText(source['area_code']),
      countryCode: readText(source['country_code']),
      doNotCall: readFlag(source['do_not_call']),
      full: readText(source['full']),
      number: readText(source['number']),
    );
  }

  final String? areaCode;

  final String? countryCode;

  final bool? doNotCall;

  final String? full;

  final String? number;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'area_code': areaCode,
        'country_code': countryCode,
        'do_not_call': doNotCall,
        'full': full,
        'number': number,
      };
}

/// A [LabourLabourContact]'s `fax`.
class LabourLabourContactFax extends Dto {
  const LabourLabourContactFax({
    this.areaCode,
    this.countryCode,
    this.doNotCall,
    this.full,
    this.number,
  });

  static LabourLabourContactFax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourLabourContactFax(
      areaCode: readText(source['area_code']),
      countryCode: readText(source['country_code']),
      doNotCall: readFlag(source['do_not_call']),
      full: readText(source['full']),
      number: readText(source['number']),
    );
  }

  final String? areaCode;

  final String? countryCode;

  final bool? doNotCall;

  final String? full;

  final String? number;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'area_code': areaCode,
        'country_code': countryCode,
        'do_not_call': doNotCall,
        'full': full,
        'number': number,
      };
}

/// A [LabourLabourContact]'s `mobile`.
class LabourLabourContactMobile extends Dto {
  const LabourLabourContactMobile({
    this.areaCode,
    this.countryCode,
    this.doNotCall,
    this.full,
    this.number,
  });

  static LabourLabourContactMobile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourLabourContactMobile(
      areaCode: readText(source['area_code']),
      countryCode: readText(source['country_code']),
      doNotCall: readFlag(source['do_not_call']),
      full: readText(source['full']),
      number: readText(source['number']),
    );
  }

  final String? areaCode;

  final String? countryCode;

  final bool? doNotCall;

  final String? full;

  final String? number;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'area_code': areaCode,
        'country_code': countryCode,
        'do_not_call': doNotCall,
        'full': full,
        'number': number,
      };
}

/// One entry of a [LabourProfileSession]'s `prices`.
class LabourProfileSessionPrice extends Dto {
  const LabourProfileSessionPrice({
    this.enabledProRata,
    this.hours,
    this.id,
    this.object,
    this.peakHourly,
    this.price,
    this.priceType,
    this.pricingLevel,
    this.status,
  });

  static LabourProfileSessionPrice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileSessionPrice(
      enabledProRata: readFlag(source['enabled_pro_rata']),
      hours: readList<LabourProfileSessionPriceHour>(
          source['hours'], LabourProfileSessionPriceHour.fromMap),
      id: readText(source['id']),
      object: readText(source['object']),
      peakHourly: readList<Object>(source['peak_hourly'], readAny),
      price: readDecimal(source['price']),
      priceType: readText(source['price_type']),
      pricingLevel: LabourProfileSessionPricePricingLevel.fromMap(
          source['pricing_level']),
      status: readText(source['status']),
    );
  }

  final bool? enabledProRata;

  final List<LabourProfileSessionPriceHour?>? hours;

  final String? id;

  final String? object;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? peakHourly;

  final double? price;

  final String? priceType;

  final LabourProfileSessionPricePricingLevel? pricingLevel;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'enabled_pro_rata': enabledProRata,
        'hours': hours,
        'id': id,
        'object': object,
        'peak_hourly': peakHourly,
        'price': price,
        'price_type': priceType,
        'pricing_level': pricingLevel,
        'status': status,
      };
}

/// One entry of a [LabourProfileSession]'s `availability`.
class LabourProfileSessionAvailability extends Dto {
  const LabourProfileSessionAvailability({
    this.available,
    this.endTime,
    this.id,
    this.object,
    this.preferredDay,
    this.startTime,
    this.status,
  });

  static LabourProfileSessionAvailability? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileSessionAvailability(
      available: readFlag(source['available']),
      endTime: readText(source['end_time']),
      id: readText(source['id']),
      object: readText(source['object']),
      preferredDay: readText(source['preferred_day']),
      startTime: readText(source['start_time']),
      status: readText(source['status']),
    );
  }

  final bool? available;

  final String? endTime;

  final String? id;

  final String? object;

  final String? preferredDay;

  final String? startTime;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'available': available,
        'end_time': endTime,
        'id': id,
        'object': object,
        'preferred_day': preferredDay,
        'start_time': startTime,
        'status': status,
      };
}

/// One entry of a [LabourProfileSession]'s `working_hours`.
class LabourProfileSessionWorkingHour extends Dto {
  const LabourProfileSessionWorkingHour({
    this.endTime,
    this.id,
    this.object,
    this.startTime,
    this.status,
  });

  static LabourProfileSessionWorkingHour? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileSessionWorkingHour(
      endTime: readText(source['end_time']),
      id: readText(source['id']),
      object: readText(source['object']),
      startTime: readText(source['start_time']),
      status: readText(source['status']),
    );
  }

  final String? endTime;

  final String? id;

  final String? object;

  final String? startTime;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'end_time': endTime,
        'id': id,
        'object': object,
        'start_time': startTime,
        'status': status,
      };
}

/// One entry of a [LabourAvailabilitySessionList]'s `schedule_list`.
class LabourAvailabilitySessionListScheduleList extends Dto {
  const LabourAvailabilitySessionListScheduleList({
    this.available,
    this.endTime,
    this.preferredDay,
    this.startTime,
    this.uuid,
  });

  static LabourAvailabilitySessionListScheduleList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourAvailabilitySessionListScheduleList(
      available: readText(source['available']),
      endTime: readText(source['end_time']),
      preferredDay: readText(source['preferred_day']),
      startTime: readText(source['start_time']),
      uuid: readText(source['uuid']),
    );
  }

  final String? available;

  final String? endTime;

  final String? preferredDay;

  final String? startTime;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'available': available,
        'end_time': endTime,
        'preferred_day': preferredDay,
        'start_time': startTime,
        'uuid': uuid,
      };
}

/// One entry of a [LabourProfileViewSession]'s `prices`.
class LabourProfileViewSessionPrice extends Dto {
  const LabourProfileViewSessionPrice({
    this.enabledProRata,
    this.hours,
    this.id,
    this.object,
    this.peakHourly,
    this.price,
    this.priceType,
    this.pricingLevel,
    this.status,
  });

  static LabourProfileViewSessionPrice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileViewSessionPrice(
      enabledProRata: readFlag(source['enabled_pro_rata']),
      hours: readList<LabourProfileViewSessionPriceHour>(
          source['hours'], LabourProfileViewSessionPriceHour.fromMap),
      id: readText(source['id']),
      object: readText(source['object']),
      peakHourly: readList<Object>(source['peak_hourly'], readAny),
      price: readDecimal(source['price']),
      priceType: readText(source['price_type']),
      pricingLevel: LabourProfileViewSessionPricePricingLevel.fromMap(
          source['pricing_level']),
      status: readText(source['status']),
    );
  }

  final bool? enabledProRata;

  final List<LabourProfileViewSessionPriceHour?>? hours;

  final String? id;

  final String? object;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? peakHourly;

  final double? price;

  final String? priceType;

  final LabourProfileViewSessionPricePricingLevel? pricingLevel;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'enabled_pro_rata': enabledProRata,
        'hours': hours,
        'id': id,
        'object': object,
        'peak_hourly': peakHourly,
        'price': price,
        'price_type': priceType,
        'pricing_level': pricingLevel,
        'status': status,
      };
}

/// One entry of a [LabourProfileViewSession]'s `availability`.
class LabourProfileViewSessionAvailability extends Dto {
  const LabourProfileViewSessionAvailability({
    this.available,
    this.endTime,
    this.id,
    this.object,
    this.preferredDay,
    this.startTime,
    this.status,
  });

  static LabourProfileViewSessionAvailability? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileViewSessionAvailability(
      available: readFlag(source['available']),
      endTime: readText(source['end_time']),
      id: readText(source['id']),
      object: readText(source['object']),
      preferredDay: readText(source['preferred_day']),
      startTime: readText(source['start_time']),
      status: readText(source['status']),
    );
  }

  final bool? available;

  final String? endTime;

  final String? id;

  final String? object;

  final String? preferredDay;

  final String? startTime;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'available': available,
        'end_time': endTime,
        'id': id,
        'object': object,
        'preferred_day': preferredDay,
        'start_time': startTime,
        'status': status,
      };
}

/// One entry of a [LabourProfileViewSession]'s `working_hours`.
class LabourProfileViewSessionWorkingHour extends Dto {
  const LabourProfileViewSessionWorkingHour({
    this.endTime,
    this.id,
    this.object,
    this.startTime,
    this.status,
  });

  static LabourProfileViewSessionWorkingHour? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileViewSessionWorkingHour(
      endTime: readText(source['end_time']),
      id: readText(source['id']),
      object: readText(source['object']),
      startTime: readText(source['start_time']),
      status: readText(source['status']),
    );
  }

  final String? endTime;

  final String? id;

  final String? object;

  final String? startTime;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'end_time': endTime,
        'id': id,
        'object': object,
        'start_time': startTime,
        'status': status,
      };
}

/// A [LabourOrder]'s `currency`.
class LabourOrderCurrency extends Dto {
  const LabourOrderCurrency({
    this.code,
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourOrderCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourOrderCurrency(
      code: readText(source['code']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
    );
  }

  final String? code;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'code': code,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
      };
}

/// A [LabourOrder]'s `time_zone`.
class LabourOrderTimeZone extends Dto {
  const LabourOrderTimeZone({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourOrderTimeZone? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourOrderTimeZone(
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

/// A [LabourOrder]'s `custom_form`.
class LabourOrderCustomForm extends Dto {
  const LabourOrderCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourOrderCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourOrderCustomForm(
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

/// A [LabourOrder]'s `account`.
class LabourOrderAccount extends Dto {
  const LabourOrderAccount({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourOrderAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourOrderAccount(
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

/// One entry of a [LabourOrder]'s `communication_preferences`.
class LabourOrderCommunicationPreference extends Dto {
  const LabourOrderCommunicationPreference({
    this.channel,
    this.enabled,
  });

  static LabourOrderCommunicationPreference? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourOrderCommunicationPreference(
      channel: readText(source['channel']),
      enabled: readFlag(source['enabled']),
    );
  }

  final String? channel;

  final bool? enabled;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'channel': channel,
        'enabled': enabled,
      };
}

/// A [LabourOrder]'s `billing_preferences`.
class LabourOrderBillingPreferences extends Dto {
  const LabourOrderBillingPreferences({
    this.billingPeriod,
    this.communicationProfile,
    this.consolidateInvoice,
    this.fulfillmentMode,
    this.fulfillmentTerm,
    this.invoiceMode,
    this.invoiceTerm,
    this.paymentMode,
    this.paymentProcessor,
    this.paymentTerm,
    this.paymentTermAlignment,
    this.proformaProperties,
  });

  static LabourOrderBillingPreferences? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourOrderBillingPreferences(
      billingPeriod: readText(source['billing_period']),
      communicationProfile: readText(source['communication_profile']),
      consolidateInvoice: readFlag(source['consolidate_invoice']),
      fulfillmentMode: readText(source['fulfillment_mode']),
      fulfillmentTerm: readText(source['fulfillment_term']),
      invoiceMode: readText(source['invoice_mode']),
      invoiceTerm: readText(source['invoice_term']),
      paymentMode: readText(source['payment_mode']),
      paymentProcessor: readText(source['payment_processor']),
      paymentTerm: readText(source['payment_term']),
      paymentTermAlignment: readText(source['payment_term_alignment']),
      proformaProperties:
          LabourOrderBillingPreferencesProformaProperties.fromMap(
              source['proforma_properties']),
    );
  }

  final String? billingPeriod;

  final String? communicationProfile;

  final bool? consolidateInvoice;

  final String? fulfillmentMode;

  final String? fulfillmentTerm;

  final String? invoiceMode;

  final String? invoiceTerm;

  final String? paymentMode;

  final String? paymentProcessor;

  final String? paymentTerm;

  final String? paymentTermAlignment;

  final LabourOrderBillingPreferencesProformaProperties? proformaProperties;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'billing_period': billingPeriod,
        'communication_profile': communicationProfile,
        'consolidate_invoice': consolidateInvoice,
        'fulfillment_mode': fulfillmentMode,
        'fulfillment_term': fulfillmentTerm,
        'invoice_mode': invoiceMode,
        'invoice_term': invoiceTerm,
        'payment_mode': paymentMode,
        'payment_processor': paymentProcessor,
        'payment_term': paymentTerm,
        'payment_term_alignment': paymentTermAlignment,
        'proforma_properties': proformaProperties,
      };
}

/// A [LabourProfileSessionPrice]'s `pricing_level`.
class LabourProfileSessionPricePricingLevel extends Dto {
  const LabourProfileSessionPricePricingLevel({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourProfileSessionPricePricingLevel? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileSessionPricePricingLevel(
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

/// One entry of a [LabourProfileSessionPrice]'s `hours`.
class LabourProfileSessionPriceHour extends Dto {
  const LabourProfileSessionPriceHour({
    this.endTime,
    this.id,
    this.object,
    this.price,
    this.startTime,
    this.status,
  });

  static LabourProfileSessionPriceHour? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileSessionPriceHour(
      endTime: readText(source['end_time']),
      id: readText(source['id']),
      object: readText(source['object']),
      price: readDecimal(source['price']),
      startTime: readText(source['start_time']),
      status: readText(source['status']),
    );
  }

  final String? endTime;

  final String? id;

  final String? object;

  final double? price;

  final String? startTime;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'end_time': endTime,
        'id': id,
        'object': object,
        'price': price,
        'start_time': startTime,
        'status': status,
      };
}

/// A [LabourProfileViewSessionPrice]'s `pricing_level`.
class LabourProfileViewSessionPricePricingLevel extends Dto {
  const LabourProfileViewSessionPricePricingLevel({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static LabourProfileViewSessionPricePricingLevel? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileViewSessionPricePricingLevel(
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

/// One entry of a [LabourProfileViewSessionPrice]'s `hours`.
class LabourProfileViewSessionPriceHour extends Dto {
  const LabourProfileViewSessionPriceHour({
    this.endTime,
    this.id,
    this.object,
    this.price,
    this.startTime,
    this.status,
  });

  static LabourProfileViewSessionPriceHour? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileViewSessionPriceHour(
      endTime: readText(source['end_time']),
      id: readText(source['id']),
      object: readText(source['object']),
      price: readDecimal(source['price']),
      startTime: readText(source['start_time']),
      status: readText(source['status']),
    );
  }

  final String? endTime;

  final String? id;

  final String? object;

  final double? price;

  final String? startTime;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'end_time': endTime,
        'id': id,
        'object': object,
        'price': price,
        'start_time': startTime,
        'status': status,
      };
}

/// A [LabourOrderBillingPreferences]'s `proforma_properties`.
class LabourOrderBillingPreferencesProformaProperties extends Dto {
  const LabourOrderBillingPreferencesProformaProperties({
    this.acceptanceDate,
    this.acceptanceRequired,
    this.acceptanceTerm,
    this.paymentRequired,
    this.termsAndConditions,
  });

  static LabourOrderBillingPreferencesProformaProperties? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourOrderBillingPreferencesProformaProperties(
      acceptanceDate: readAny(source['acceptance_date']),
      acceptanceRequired: readFlag(source['acceptance_required']),
      acceptanceTerm: readAny(source['acceptance_term']),
      paymentRequired: readFlag(source['payment_required']),
      termsAndConditions: readAny(source['terms_and_conditions']),
    );
  }

  /// Untyped: null in every record measured.
  final Object? acceptanceDate;

  final bool? acceptanceRequired;

  /// Untyped: null in every record measured.
  final Object? acceptanceTerm;

  final bool? paymentRequired;

  /// Untyped: null in every record measured.
  final Object? termsAndConditions;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'acceptance_date': acceptanceDate,
        'acceptance_required': acceptanceRequired,
        'acceptance_term': acceptanceTerm,
        'payment_required': paymentRequired,
        'terms_and_conditions': termsAndConditions,
      };
}

/// What `getLabourCalendar` answers, under `labour_calendar`: a
/// [LabourAvailability] record for one labour.
class LabourCalendar extends Dto {
  const LabourCalendar({
    this.availableList,
    this.code,
    this.displayName,
    this.emailAddress,
    this.id,
    this.labourProfile,
    this.name,
    this.object,
    this.processedScheduleList,
    this.scheduleList,
    this.sessionList,
    this.status,
    this.unavailableList,
    this.useCustomAvailability,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/labours/{labour_id}/availability',
  ];

  static LabourCalendar? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'labour_calendar');
    if (source == null) return null;
    return LabourCalendar(
      availableList: readList<Object>(source['available_list'], readAny),
      code: readText(source['code']),
      displayName: readText(source['display_name']),
      emailAddress: readText(source['email_address']),
      id: readText(source['id']),
      labourProfile:
          LabourAvailabilityLabourProfile.fromMap(source['labour_profile']),
      name: readText(source['name']),
      object: readText(source['object']),
      processedScheduleList: readAny(source['processed_schedule_list']),
      scheduleList: readList<LabourAvailabilityScheduleList>(
          source['schedule_list'], LabourAvailabilityScheduleList.fromMap),
      sessionList: readList<LabourAvailabilitySessionList>(
          source['session_list'], LabourAvailabilitySessionList.fromMap),
      status: readText(source['status']),
      unavailableList: readList<Object>(source['unavailable_list'], readAny),
      useCustomAvailability: readFlag(source['use_custom_availability']),
      version: readInteger(source['version']),
    );
  }

  final List<Object?>? availableList;

  final String? code;

  final String? displayName;

  final String? emailAddress;

  final String? id;

  final LabourAvailabilityLabourProfile? labourProfile;

  final String? name;

  final String? object;

  final Object? processedScheduleList;

  final List<LabourAvailabilityScheduleList?>? scheduleList;

  final List<LabourAvailabilitySessionList?>? sessionList;

  final String? status;

  final List<Object?>? unavailableList;

  final bool? useCustomAvailability;

  final int? version;

  @override
  String? get envelopeKey => 'labour_calendar';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'available_list': availableList,
        'code': code,
        'display_name': displayName,
        'email_address': emailAddress,
        'id': id,
        'labour_profile': labourProfile,
        'name': name,
        'object': object,
        'processed_schedule_list': processedScheduleList,
        'schedule_list': scheduleList,
        'session_list': sessionList,
        'status': status,
        'unavailable_list': unavailableList,
        'use_custom_availability': useCustomAvailability,
        'version': version,
      };
}

/// One page of a labour profile's sessions, under `data`, each a
/// [LabourProfileViewSession].
class LabourProfileSessionList extends Dto {
  const LabourProfileSessionList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/labour_profiles/{labour_profile_id}/sessions',
  ];

  static LabourProfileSessionList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return LabourProfileSessionList(
      data: readList<LabourProfileViewSession>(
          source['data'], LabourProfileViewSession.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<LabourProfileViewSession?>? data;

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

/// What `getLabourProfileSession` answers, under `labour_profile_session`.
class LabourProfileSessionView extends Dto {
  const LabourProfileSessionView({
    this.allowOvertime,
    this.availability,
    this.endDate,
    this.href,
    this.id,
    this.name,
    this.object,
    this.prices,
    this.startDate,
    this.status,
    this.workingHours,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/labour_profiles/{labour_profile_id}/sessions/{session_id}',
  ];

  static LabourProfileSessionView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'labour_profile_session');
    if (source == null) return null;
    return LabourProfileSessionView(
      allowOvertime: readFlag(source['allow_overtime']),
      availability: readList<LabourProfileViewSessionAvailability>(
          source['availability'], LabourProfileViewSessionAvailability.fromMap),
      endDate: readText(source['end_date']),
      href: readText(source['href']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      prices: readList<LabourProfileViewSessionPrice>(
          source['prices'], LabourProfileViewSessionPrice.fromMap),
      startDate: readText(source['start_date']),
      status: readText(source['status']),
      workingHours: readList<LabourProfileViewSessionWorkingHour>(
          source['working_hours'], LabourProfileViewSessionWorkingHour.fromMap),
    );
  }

  final bool? allowOvertime;

  final List<LabourProfileViewSessionAvailability?>? availability;

  final String? endDate;

  final String? href;

  final String? id;

  final String? name;

  final String? object;

  final List<LabourProfileViewSessionPrice?>? prices;

  final String? startDate;

  final String? status;

  final List<LabourProfileViewSessionWorkingHour?>? workingHours;

  @override
  String? get envelopeKey => 'labour_profile_session';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'allow_overtime': allowOvertime,
        'availability': availability,
        'end_date': endDate,
        'href': href,
        'id': id,
        'name': name,
        'object': object,
        'prices': prices,
        'start_date': startDate,
        'status': status,
        'working_hours': workingHours,
      };
}
