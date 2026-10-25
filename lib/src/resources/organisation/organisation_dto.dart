/// Typed views over the v4 organisation bodies.
library;

import '../../client/dto.dart';

/// The root organisation body, under `organization`.
class SettingsOrganisation extends Dto {
  const SettingsOrganisation({
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    this.addressLine5,
    this.city,
    this.createdBy,
    this.createdOn,
    this.description,
    this.details,
    this.displayName,
    this.email,
    this.fax,
    this.faxAreaCode,
    this.faxCountryCode,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.mobile,
    this.mobileAreaCode,
    this.mobileCountryCode,
    this.name,
    this.nodes,
    this.object,
    this.parentOrganization,
    this.phone,
    this.phoneAreaCode,
    this.phoneCountryCode,
    this.postCode,
    this.state,
    this.status,
    this.type,
    this.website,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/settings/organisation',
  ];

  static SettingsOrganisation? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'organization');
    if (source == null) return null;
    return SettingsOrganisation(
      addressLine1: readAny(source['address_line1']),
      addressLine2: readAny(source['address_line2']),
      addressLine3: readAny(source['address_line3']),
      addressLine4: readAny(source['address_line4']),
      addressLine5: readAny(source['address_line5']),
      city: readAny(source['city']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      description: readAny(source['description']),
      details: readAny(source['details']),
      displayName: readText(source['display_name']),
      email: readAny(source['email']),
      fax: readAny(source['fax']),
      faxAreaCode: readAny(source['fax_area_code']),
      faxCountryCode: readAny(source['fax_country_code']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      mobile: readAny(source['mobile']),
      mobileAreaCode: readAny(source['mobile_area_code']),
      mobileCountryCode: readAny(source['mobile_country_code']),
      name: readText(source['name']),
      nodes: readList<Object>(source['nodes'], readAny),
      object: readText(source['object']),
      parentOrganization: SettingsOrganisationParentOrganization.fromMap(
          source['parent_organization']),
      phone: readAny(source['phone']),
      phoneAreaCode: readAny(source['phone_area_code']),
      phoneCountryCode: readAny(source['phone_country_code']),
      postCode: readAny(source['post_code']),
      state: readAny(source['state']),
      status: readText(source['status']),
      type: readText(source['type']),
      website: readAny(source['website']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? addressLine1;

  /// Null in every record measured, so untyped.
  final Object? addressLine2;

  /// Null in every record measured, so untyped.
  final Object? addressLine3;

  /// Null in every record measured, so untyped.
  final Object? addressLine4;

  /// Null in every record measured, so untyped.
  final Object? addressLine5;

  /// Null in every record measured, so untyped.
  final Object? city;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? description;

  /// Null in every record measured, so untyped.
  final Object? details;

  final String? displayName;

  /// Null in every record measured, so untyped.
  final Object? email;

  /// Null in every record measured, so untyped.
  final Object? fax;

  /// Null in every record measured, so untyped.
  final Object? faxAreaCode;

  /// Null in every record measured, so untyped.
  final Object? faxCountryCode;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  /// Null in every record measured, so untyped.
  final Object? mobile;

  /// Null in every record measured, so untyped.
  final Object? mobileAreaCode;

  /// Null in every record measured, so untyped.
  final Object? mobileCountryCode;

  final String? name;

  /// Empty in every record measured, so untyped.
  final List<Object?>? nodes;

  final String? object;

  final SettingsOrganisationParentOrganization? parentOrganization;

  /// Null in every record measured, so untyped.
  final Object? phone;

  /// Null in every record measured, so untyped.
  final Object? phoneAreaCode;

  /// Null in every record measured, so untyped.
  final Object? phoneCountryCode;

  /// Null in every record measured, so untyped.
  final Object? postCode;

  /// Null in every record measured, so untyped.
  final Object? state;

  final String? status;

  final String? type;

  /// Null in every record measured, so untyped.
  final Object? website;

  @override
  String? get envelopeKey => 'organization';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'address_line1': addressLine1,
        'address_line2': addressLine2,
        'address_line3': addressLine3,
        'address_line4': addressLine4,
        'address_line5': addressLine5,
        'city': city,
        'created_by': createdBy,
        'created_on': createdOn,
        'description': description,
        'details': details,
        'display_name': displayName,
        'email': email,
        'fax': fax,
        'fax_area_code': faxAreaCode,
        'fax_country_code': faxCountryCode,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'mobile': mobile,
        'mobile_area_code': mobileAreaCode,
        'mobile_country_code': mobileCountryCode,
        'name': name,
        'nodes': nodes,
        'object': object,
        'parent_organization': parentOrganization,
        'phone': phone,
        'phone_area_code': phoneAreaCode,
        'phone_country_code': phoneCountryCode,
        'post_code': postCode,
        'state': state,
        'status': status,
        'type': type,
        'website': website,
      };
}

/// A [SettingsOrganisation]'s `parent_organization`.
class SettingsOrganisationParentOrganization extends Dto {
  const SettingsOrganisationParentOrganization({
    this.href,
    this.id,
    this.name,
    this.object,
  });

  static SettingsOrganisationParentOrganization? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SettingsOrganisationParentOrganization(
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
