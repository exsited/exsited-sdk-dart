/// Typed views over the v4 rental assets bodies.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';

/// The rental asset body.
class RentalAsset extends Dto {
  const RentalAsset({
    this.activityLogs,
    this.code,
    this.createdBy,
    this.createdOn,
    this.customAttributes,
    this.customForm,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.imageName,
    this.item,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.rentalAssetAvailability,
    this.rentalAssetCustomAvailability,
    this.rentalAssetProfile,
    this.status,
    this.useCustomAvailability,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/rental_assets',
    'GET /api/{api_version}/rental_assets/{rental_asset_uuid}',
    'POST /api/{api_version}/rental_assets',
    'PATCH /api/{api_version}/rental_assets/{rental_asset_uuid}',
    'POST /api/{api_version}/rental_assets/{rental_asset_id}/cancel',
    'POST /api/{api_version}/rental_assets/{rental_asset_id}/reactivate',
  ];

  static RentalAsset? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'rental_asset');
    if (source == null) return null;
    return RentalAsset(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      code: readText(source['code']),
      createdBy: RentalAssetCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      customForm: RentalAssetCustomForm.fromMap(source['custom_form']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      imageName: readAny(source['image_name']),
      item: readAny(source['item']),
      lastUpdatedBy:
          RentalAssetLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      rentalAssetAvailability:
          readList<Object>(source['rental_asset_availability'], readAny),
      rentalAssetCustomAvailability:
          readList<RentalAssetRentalAssetCustomAvailability>(
              source['rental_asset_custom_availability'],
              RentalAssetRentalAssetCustomAvailability.fromMap),
      rentalAssetProfile:
          RentalAssetRentalAssetProfile.fromMap(source['rental_asset_profile']),
      status: readText(source['status']),
      useCustomAvailability: readFlag(source['use_custom_availability']),
      version: readInteger(source['version']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  final String? code;

  final RentalAssetCreatedBy? createdBy;

  final String? createdOn;

  final List<Object?>? customAttributes;

  final RentalAssetCustomForm? customForm;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Untyped: never populated in the records measured.
  final Object? imageName;

  /// Untyped: never populated in the records measured.
  final Object? item;

  final RentalAssetLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final List<Object?>? rentalAssetAvailability;

  final List<RentalAssetRentalAssetCustomAvailability?>?
      rentalAssetCustomAvailability;

  final RentalAssetRentalAssetProfile? rentalAssetProfile;

  final String? status;

  final bool? useCustomAvailability;

  final int? version;

  @override
  String? get envelopeKey => 'rental_asset';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'code': code,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_attributes': customAttributes,
        'custom_form': customForm,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'image_name': imageName,
        'item': item,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'rental_asset_availability': rentalAssetAvailability,
        'rental_asset_custom_availability': rentalAssetCustomAvailability,
        'rental_asset_profile': rentalAssetProfile,
        'status': status,
        'use_custom_availability': useCustomAvailability,
        'version': version,
      };
}

/// A page of RentalAsset records.
class RentalAssetList extends Dto {
  const RentalAssetList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/rental_assets',
  ];

  static RentalAssetList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetList(
      data: readList<RentalAsset>(source['data'], RentalAsset.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<RentalAsset?>? data;

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

/// The rental asset profile body.
class RentalAssetProfile extends Dto {
  const RentalAssetProfile({
    this.createdBy,
    this.createdOn,
    this.currency,
    this.displayName,
    this.href,
    this.id,
    this.isTaxInclusive,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.maxBookingLimit,
    this.name,
    this.object,
    this.rentalAssetProfileSessions,
    this.rentalAssets,
    this.status,
    this.tax,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/rental_asset_profiles',
  ];

  static RentalAssetProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfile(
      createdBy: RentalAssetProfileCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: RentalAssetProfileCurrency.fromMap(source['currency']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      isTaxInclusive: readFlag(source['is_tax_inclusive']),
      lastUpdatedBy:
          RentalAssetProfileLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      maxBookingLimit: readAny(source['max_booking_limit']),
      name: readText(source['name']),
      object: readText(source['object']),
      rentalAssetProfileSessions:
          readList<RentalAssetProfileRentalAssetProfileSession>(
              source['rental_asset_profile_sessions'],
              RentalAssetProfileRentalAssetProfileSession.fromMap),
      rentalAssets: readList<RentalAssetProfileRentalAsset>(
          source['rental_assets'], RentalAssetProfileRentalAsset.fromMap),
      status: readText(source['status']),
      tax: readAny(source['tax']),
      version: readInteger(source['version']),
    );
  }

  final RentalAssetProfileCreatedBy? createdBy;

  final String? createdOn;

  final RentalAssetProfileCurrency? currency;

  final String? displayName;

  final String? href;

  final String? id;

  final bool? isTaxInclusive;

  final RentalAssetProfileLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  /// Untyped: never populated in the records measured.
  final Object? maxBookingLimit;

  final String? name;

  final String? object;

  final List<RentalAssetProfileRentalAssetProfileSession?>?
      rentalAssetProfileSessions;

  final List<RentalAssetProfileRentalAsset?>? rentalAssets;

  final String? status;

  /// Untyped: never populated in the records measured.
  final Object? tax;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'display_name': displayName,
        'href': href,
        'id': id,
        'is_tax_inclusive': isTaxInclusive,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'max_booking_limit': maxBookingLimit,
        'name': name,
        'object': object,
        'rental_asset_profile_sessions': rentalAssetProfileSessions,
        'rental_assets': rentalAssets,
        'status': status,
        'tax': tax,
        'version': version,
      };
}

/// A page of RentalAssetProfile records.
class RentalAssetProfileList extends Dto {
  const RentalAssetProfileList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/rental_asset_profiles',
  ];

  static RentalAssetProfileList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileList(
      data: readList<RentalAssetProfile>(
          source['data'], RentalAssetProfile.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<RentalAssetProfile?>? data;

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

/// The rental asset availability body.
class RentalAssetAvailability extends Dto {
  const RentalAssetAvailability({
    this.availableList,
    this.code,
    this.displayName,
    this.id,
    this.name,
    this.object,
    this.processedScheduleList,
    this.rentalAssetProfile,
    this.scheduleList,
    this.sessionList,
    this.status,
    this.unavailableList,
    this.useCustomAvailability,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/rental_asset_availability',
  ];

  static RentalAssetAvailability? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetAvailability(
      availableList: readList<Object>(source['available_list'], readAny),
      code: readText(source['code']),
      displayName: readText(source['display_name']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      processedScheduleList: readAny(source['processed_schedule_list']),
      rentalAssetProfile: RentalAssetAvailabilityRentalAssetProfile.fromMap(
          source['rental_asset_profile']),
      scheduleList: readList<RentalAssetAvailabilityScheduleList>(
          source['schedule_list'], RentalAssetAvailabilityScheduleList.fromMap),
      sessionList: readList<RentalAssetAvailabilitySessionList>(
          source['session_list'], RentalAssetAvailabilitySessionList.fromMap),
      status: readText(source['status']),
      unavailableList: readList<Object>(source['unavailable_list'], readAny),
      useCustomAvailability: readFlag(source['use_custom_availability']),
      version: readInteger(source['version']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? availableList;

  final String? code;

  final String? displayName;

  final String? id;

  final String? name;

  final String? object;

  /// Untyped: an object with no keys in every record measured.
  final Object? processedScheduleList;

  final RentalAssetAvailabilityRentalAssetProfile? rentalAssetProfile;

  final List<RentalAssetAvailabilityScheduleList?>? scheduleList;

  final List<RentalAssetAvailabilitySessionList?>? sessionList;

  final String? status;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? unavailableList;

  final bool? useCustomAvailability;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'available_list': availableList,
        'code': code,
        'display_name': displayName,
        'id': id,
        'name': name,
        'object': object,
        'processed_schedule_list': processedScheduleList,
        'rental_asset_profile': rentalAssetProfile,
        'schedule_list': scheduleList,
        'session_list': sessionList,
        'status': status,
        'unavailable_list': unavailableList,
        'use_custom_availability': useCustomAvailability,
        'version': version,
      };
}

/// A page of RentalAssetAvailability records.
class RentalAssetAvailabilityList extends Dto {
  const RentalAssetAvailabilityList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/rental_asset_availability',
  ];

  static RentalAssetAvailabilityList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetAvailabilityList(
      data: readList<RentalAssetAvailability>(
          source['data'], RentalAssetAvailability.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<RentalAssetAvailability?>? data;

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

/// What `getRentalAssetProfile` answers, under `rental_asset_profile`.
class RentalAssetProfileView extends Dto {
  const RentalAssetProfileView({
    this.activityLogs,
    this.createdBy,
    this.createdOn,
    this.currency,
    this.displayName,
    this.href,
    this.id,
    this.isTaxInclusive,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.maxBookingLimit,
    this.name,
    this.object,
    this.rentalAssetProfileSessions,
    this.rentalAssets,
    this.status,
    this.tax,
    this.version,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/rental_asset_profiles/{rental_asset_profile_id}',
    'POST /api/{api_version}/rental_asset_profiles',
  ];

  static RentalAssetProfileView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'rental_asset_profile');
    if (source == null) return null;
    return RentalAssetProfileView(
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      createdBy: RentalAssetProfileViewCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      currency: RentalAssetProfileViewCurrency.fromMap(source['currency']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      isTaxInclusive: readFlag(source['is_tax_inclusive']),
      lastUpdatedBy: RentalAssetProfileViewLastUpdatedBy.fromMap(
          source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      maxBookingLimit: readAny(source['max_booking_limit']),
      name: readText(source['name']),
      object: readText(source['object']),
      rentalAssetProfileSessions:
          readList<RentalAssetProfileViewRentalAssetProfileSession>(
              source['rental_asset_profile_sessions'],
              RentalAssetProfileViewRentalAssetProfileSession.fromMap),
      rentalAssets: readList<RentalAssetProfileViewRentalAsset>(
          source['rental_assets'], RentalAssetProfileViewRentalAsset.fromMap),
      status: readText(source['status']),
      tax: readAny(source['tax']),
      version: readInteger(source['version']),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  final RentalAssetProfileViewCreatedBy? createdBy;

  final String? createdOn;

  final RentalAssetProfileViewCurrency? currency;

  final String? displayName;

  final String? href;

  final String? id;

  final bool? isTaxInclusive;

  final RentalAssetProfileViewLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  /// Untyped: null in every record measured.
  final Object? maxBookingLimit;

  final String? name;

  final String? object;

  final List<RentalAssetProfileViewRentalAssetProfileSession?>?
      rentalAssetProfileSessions;

  final List<RentalAssetProfileViewRentalAsset?>? rentalAssets;

  final String? status;

  /// Untyped: null in every record measured.
  final Object? tax;

  final int? version;

  @override
  String? get envelopeKey => 'rental_asset_profile';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'activity_logs': activityLogs,
        'created_by': createdBy,
        'created_on': createdOn,
        'currency': currency,
        'display_name': displayName,
        'href': href,
        'id': id,
        'is_tax_inclusive': isTaxInclusive,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'max_booking_limit': maxBookingLimit,
        'name': name,
        'object': object,
        'rental_asset_profile_sessions': rentalAssetProfileSessions,
        'rental_assets': rentalAssets,
        'status': status,
        'tax': tax,
        'version': version,
      };
}

/// A [RentalAsset]'s `rental_asset_profile`.
class RentalAssetRentalAssetProfile extends Dto {
  const RentalAssetRentalAssetProfile({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static RentalAssetRentalAssetProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetRentalAssetProfile(
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

/// A [RentalAsset]'s `custom_form`.
class RentalAssetCustomForm extends Dto {
  const RentalAssetCustomForm({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static RentalAssetCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetCustomForm(
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

/// One entry of a [RentalAsset]'s `rental_asset_custom_availability`.
class RentalAssetRentalAssetCustomAvailability extends Dto {
  const RentalAssetRentalAssetCustomAvailability({
    this.available,
    this.endTime,
    this.id,
    this.object,
    this.preferredDay,
    this.startTime,
    this.status,
  });

  static RentalAssetRentalAssetCustomAvailability? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetRentalAssetCustomAvailability(
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

/// A [RentalAsset]'s `created_by`.
class RentalAssetCreatedBy extends Dto {
  const RentalAssetCreatedBy({
    this.name,
    this.object,
  });

  static RentalAssetCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetCreatedBy(
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

/// A [RentalAsset]'s `last_updated_by`.
class RentalAssetLastUpdatedBy extends Dto {
  const RentalAssetLastUpdatedBy({
    this.name,
    this.object,
  });

  static RentalAssetLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetLastUpdatedBy(
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

/// A [RentalAssetProfile]'s `currency`.
class RentalAssetProfileCurrency extends Dto {
  const RentalAssetProfileCurrency({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static RentalAssetProfileCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileCurrency(
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

/// One entry of a [RentalAssetProfile]'s `rental_assets`.
class RentalAssetProfileRentalAsset extends Dto {
  const RentalAssetProfileRentalAsset({
    this.displayName,
    this.href,
    this.id,
    this.imageName,
    this.name,
    this.object,
    this.status,
    this.useCustomAvailability,
  });

  static RentalAssetProfileRentalAsset? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileRentalAsset(
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      imageName: readAny(source['image_name']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
      useCustomAvailability: readFlag(source['use_custom_availability']),
    );
  }

  final String? displayName;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? imageName;

  final String? name;

  final String? object;

  final String? status;

  final bool? useCustomAvailability;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_name': displayName,
        'href': href,
        'id': id,
        'image_name': imageName,
        'name': name,
        'object': object,
        'status': status,
        'use_custom_availability': useCustomAvailability,
      };
}

/// One entry of a [RentalAssetProfile]'s `rental_asset_profile_sessions`.
class RentalAssetProfileRentalAssetProfileSession extends Dto {
  const RentalAssetProfileRentalAssetProfileSession({
    this.endDate,
    this.id,
    this.name,
    this.object,
    this.rentalAssetProfileSessionAvailability,
    this.rentalAssetProfileSessionPrices,
    this.rentalAssetProfileSessionWorkingHours,
    this.startDate,
    this.status,
  });

  static RentalAssetProfileRentalAssetProfileSession? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileRentalAssetProfileSession(
      endDate: readText(source['end_date']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      rentalAssetProfileSessionAvailability: readList<
              RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionAvailability>(
          source['rental_asset_profile_session_availability'],
          RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionAvailability
              .fromMap),
      rentalAssetProfileSessionPrices: readList<
              RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionPrice>(
          source['rental_asset_profile_session_prices'],
          RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionPrice
              .fromMap),
      rentalAssetProfileSessionWorkingHours: readList<
              RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionWorkingHour>(
          source['rental_asset_profile_session_working_hours'],
          RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionWorkingHour
              .fromMap),
      startDate: readText(source['start_date']),
      status: readText(source['status']),
    );
  }

  final String? endDate;

  final String? id;

  final String? name;

  final String? object;

  final List<
          RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionAvailability?>?
      rentalAssetProfileSessionAvailability;

  final List<
          RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionPrice?>?
      rentalAssetProfileSessionPrices;

  final List<
          RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionWorkingHour?>?
      rentalAssetProfileSessionWorkingHours;

  final String? startDate;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'end_date': endDate,
        'id': id,
        'name': name,
        'object': object,
        'rental_asset_profile_session_availability':
            rentalAssetProfileSessionAvailability,
        'rental_asset_profile_session_prices': rentalAssetProfileSessionPrices,
        'rental_asset_profile_session_working_hours':
            rentalAssetProfileSessionWorkingHours,
        'start_date': startDate,
        'status': status,
      };
}

/// A [RentalAssetProfile]'s `created_by`.
class RentalAssetProfileCreatedBy extends Dto {
  const RentalAssetProfileCreatedBy({
    this.name,
    this.object,
  });

  static RentalAssetProfileCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileCreatedBy(
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

/// A [RentalAssetProfile]'s `last_updated_by`.
class RentalAssetProfileLastUpdatedBy extends Dto {
  const RentalAssetProfileLastUpdatedBy({
    this.name,
    this.object,
  });

  static RentalAssetProfileLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileLastUpdatedBy(
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

/// A [RentalAssetAvailability]'s `rental_asset_profile`.
class RentalAssetAvailabilityRentalAssetProfile extends Dto {
  const RentalAssetAvailabilityRentalAssetProfile({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static RentalAssetAvailabilityRentalAssetProfile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetAvailabilityRentalAssetProfile(
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

/// One entry of a [RentalAssetAvailability]'s `session_list`.
class RentalAssetAvailabilitySessionList extends Dto {
  const RentalAssetAvailabilitySessionList({
    this.endDate,
    this.name,
    this.processedScheduleList,
    this.scheduleList,
    this.startDate,
    this.uuid,
  });

  static RentalAssetAvailabilitySessionList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetAvailabilitySessionList(
      endDate: readText(source['end_date']),
      name: readText(source['name']),
      processedScheduleList: readAny(source['processed_schedule_list']),
      scheduleList: readList<RentalAssetAvailabilitySessionListScheduleList>(
          source['schedule_list'],
          RentalAssetAvailabilitySessionListScheduleList.fromMap),
      startDate: readText(source['start_date']),
      uuid: readText(source['uuid']),
    );
  }

  final String? endDate;

  final String? name;

  /// Untyped: an object with no keys in every record measured.
  final Object? processedScheduleList;

  final List<RentalAssetAvailabilitySessionListScheduleList?>? scheduleList;

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

/// One entry of a [RentalAssetAvailability]'s `schedule_list`.
class RentalAssetAvailabilityScheduleList extends Dto {
  const RentalAssetAvailabilityScheduleList({
    this.available,
    this.endTime,
    this.preferredDay,
    this.startTime,
    this.uuid,
  });

  static RentalAssetAvailabilityScheduleList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetAvailabilityScheduleList(
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

/// A [RentalAssetProfileView]'s `currency`.
class RentalAssetProfileViewCurrency extends Dto {
  const RentalAssetProfileViewCurrency({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static RentalAssetProfileViewCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileViewCurrency(
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

/// One entry of a [RentalAssetProfileView]'s `rental_assets`.
class RentalAssetProfileViewRentalAsset extends Dto {
  const RentalAssetProfileViewRentalAsset({
    this.displayName,
    this.href,
    this.id,
    this.imageName,
    this.name,
    this.object,
    this.status,
    this.useCustomAvailability,
  });

  static RentalAssetProfileViewRentalAsset? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileViewRentalAsset(
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      imageName: readAny(source['image_name']),
      name: readText(source['name']),
      object: readText(source['object']),
      status: readText(source['status']),
      useCustomAvailability: readFlag(source['use_custom_availability']),
    );
  }

  final String? displayName;

  final String? href;

  final String? id;

  /// Untyped: null in every record measured.
  final Object? imageName;

  final String? name;

  final String? object;

  final String? status;

  final bool? useCustomAvailability;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'display_name': displayName,
        'href': href,
        'id': id,
        'image_name': imageName,
        'name': name,
        'object': object,
        'status': status,
        'use_custom_availability': useCustomAvailability,
      };
}

/// One entry of a [RentalAssetProfileView]'s `rental_asset_profile_sessions`.
class RentalAssetProfileViewRentalAssetProfileSession extends Dto {
  const RentalAssetProfileViewRentalAssetProfileSession({
    this.endDate,
    this.id,
    this.name,
    this.object,
    this.rentalAssetProfileSessionAvailability,
    this.rentalAssetProfileSessionPrices,
    this.rentalAssetProfileSessionWorkingHours,
    this.startDate,
    this.status,
  });

  static RentalAssetProfileViewRentalAssetProfileSession? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileViewRentalAssetProfileSession(
      endDate: readText(source['end_date']),
      id: readText(source['id']),
      name: readText(source['name']),
      object: readText(source['object']),
      rentalAssetProfileSessionAvailability: readList<
              RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionAvailability>(
          source['rental_asset_profile_session_availability'],
          RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionAvailability
              .fromMap),
      rentalAssetProfileSessionPrices: readList<
              RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionPrice>(
          source['rental_asset_profile_session_prices'],
          RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionPrice
              .fromMap),
      rentalAssetProfileSessionWorkingHours: readList<
              RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionWorkingHour>(
          source['rental_asset_profile_session_working_hours'],
          RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionWorkingHour
              .fromMap),
      startDate: readText(source['start_date']),
      status: readText(source['status']),
    );
  }

  final String? endDate;

  final String? id;

  final String? name;

  final String? object;

  final List<
          RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionAvailability?>?
      rentalAssetProfileSessionAvailability;

  final List<
          RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionPrice?>?
      rentalAssetProfileSessionPrices;

  final List<
          RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionWorkingHour?>?
      rentalAssetProfileSessionWorkingHours;

  final String? startDate;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'end_date': endDate,
        'id': id,
        'name': name,
        'object': object,
        'rental_asset_profile_session_availability':
            rentalAssetProfileSessionAvailability,
        'rental_asset_profile_session_prices': rentalAssetProfileSessionPrices,
        'rental_asset_profile_session_working_hours':
            rentalAssetProfileSessionWorkingHours,
        'start_date': startDate,
        'status': status,
      };
}

/// A [RentalAssetProfileView]'s `created_by`.
class RentalAssetProfileViewCreatedBy extends Dto {
  const RentalAssetProfileViewCreatedBy({
    this.name,
    this.object,
  });

  static RentalAssetProfileViewCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileViewCreatedBy(
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

/// A [RentalAssetProfileView]'s `last_updated_by`.
class RentalAssetProfileViewLastUpdatedBy extends Dto {
  const RentalAssetProfileViewLastUpdatedBy({
    this.name,
    this.object,
  });

  static RentalAssetProfileViewLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileViewLastUpdatedBy(
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

/// One entry of a [RentalAssetProfileRentalAssetProfileSession]'s `rental_asset_profile_session_prices`.
class RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionPrice
    extends Dto {
  const RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionPrice({
    this.id,
    this.isEnabledProRata,
    this.object,
    this.price,
    this.priceType,
    this.pricingLevel,
    this.rentalAssetProfileSessionPriceHours,
    this.rentalAssetProfileSessionPricePeakHourly,
    this.status,
  });

  static RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionPrice?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionPrice(
      id: readText(source['id']),
      isEnabledProRata: readFlag(source['is_enabled_pro_rata']),
      object: readText(source['object']),
      price: readDecimal(source['price']),
      priceType: readText(source['price_type']),
      pricingLevel: readAny(source['pricing_level']),
      rentalAssetProfileSessionPriceHours: readList<Object>(
          source['rental_asset_profile_session_price_hours'], readAny),
      rentalAssetProfileSessionPricePeakHourly: readList<Object>(
          source['rental_asset_profile_session_price_peak_hourly'], readAny),
      status: readText(source['status']),
    );
  }

  final String? id;

  final bool? isEnabledProRata;

  final String? object;

  final double? price;

  final String? priceType;

  /// Untyped: null in every record measured.
  final Object? pricingLevel;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? rentalAssetProfileSessionPriceHours;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? rentalAssetProfileSessionPricePeakHourly;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'is_enabled_pro_rata': isEnabledProRata,
        'object': object,
        'price': price,
        'price_type': priceType,
        'pricing_level': pricingLevel,
        'rental_asset_profile_session_price_hours':
            rentalAssetProfileSessionPriceHours,
        'rental_asset_profile_session_price_peak_hourly':
            rentalAssetProfileSessionPricePeakHourly,
        'status': status,
      };
}

/// One entry of a [RentalAssetProfileRentalAssetProfileSession]'s `rental_asset_profile_session_availability`.
class RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionAvailability
    extends Dto {
  const RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionAvailability({
    this.available,
    this.endTime,
    this.id,
    this.object,
    this.preferredDay,
    this.startTime,
    this.status,
  });

  static RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionAvailability?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionAvailability(
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

/// One entry of a [RentalAssetProfileRentalAssetProfileSession]'s `rental_asset_profile_session_working_hours`.
class RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionWorkingHour
    extends Dto {
  const RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionWorkingHour({
    this.endTime,
    this.id,
    this.object,
    this.startTime,
    this.status,
  });

  static RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionWorkingHour?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileRentalAssetProfileSessionRentalAssetProfileSessionWorkingHour(
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

/// One entry of a [RentalAssetAvailabilitySessionList]'s `schedule_list`.
class RentalAssetAvailabilitySessionListScheduleList extends Dto {
  const RentalAssetAvailabilitySessionListScheduleList({
    this.available,
    this.endTime,
    this.preferredDay,
    this.startTime,
    this.uuid,
  });

  static RentalAssetAvailabilitySessionListScheduleList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetAvailabilitySessionListScheduleList(
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

/// One entry of a [RentalAssetProfileViewRentalAssetProfileSession]'s `rental_asset_profile_session_prices`.
class RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionPrice
    extends Dto {
  const RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionPrice({
    this.id,
    this.isEnabledProRata,
    this.object,
    this.price,
    this.priceType,
    this.pricingLevel,
    this.rentalAssetProfileSessionPriceHours,
    this.rentalAssetProfileSessionPricePeakHourly,
    this.status,
  });

  static RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionPrice?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionPrice(
      id: readText(source['id']),
      isEnabledProRata: readFlag(source['is_enabled_pro_rata']),
      object: readText(source['object']),
      price: readDecimal(source['price']),
      priceType: readText(source['price_type']),
      pricingLevel: readAny(source['pricing_level']),
      rentalAssetProfileSessionPriceHours: readList<Object>(
          source['rental_asset_profile_session_price_hours'], readAny),
      rentalAssetProfileSessionPricePeakHourly: readList<Object>(
          source['rental_asset_profile_session_price_peak_hourly'], readAny),
      status: readText(source['status']),
    );
  }

  final String? id;

  final bool? isEnabledProRata;

  final String? object;

  final double? price;

  final String? priceType;

  /// Untyped: null in every record measured.
  final Object? pricingLevel;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? rentalAssetProfileSessionPriceHours;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? rentalAssetProfileSessionPricePeakHourly;

  final String? status;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'is_enabled_pro_rata': isEnabledProRata,
        'object': object,
        'price': price,
        'price_type': priceType,
        'pricing_level': pricingLevel,
        'rental_asset_profile_session_price_hours':
            rentalAssetProfileSessionPriceHours,
        'rental_asset_profile_session_price_peak_hourly':
            rentalAssetProfileSessionPricePeakHourly,
        'status': status,
      };
}

/// One entry of a [RentalAssetProfileViewRentalAssetProfileSession]'s `rental_asset_profile_session_availability`.
class RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionAvailability
    extends Dto {
  const RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionAvailability({
    this.available,
    this.endTime,
    this.id,
    this.object,
    this.preferredDay,
    this.startTime,
    this.status,
  });

  static RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionAvailability?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionAvailability(
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

/// One entry of a [RentalAssetProfileViewRentalAssetProfileSession]'s `rental_asset_profile_session_working_hours`.
class RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionWorkingHour
    extends Dto {
  const RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionWorkingHour({
    this.endTime,
    this.id,
    this.object,
    this.startTime,
    this.status,
  });

  static RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionWorkingHour?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return RentalAssetProfileViewRentalAssetProfileSessionRentalAssetProfileSessionWorkingHour(
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
