/// Typed views over the v4 account bodies.
///
/// Three read/write asymmetries are the API's, not mistakes: an address reads
/// `postal_code` and is written `post_code`; a contact's name reads nested under
/// `name` and is written flat; and the billing alignment setting is written
/// `charging_and_billing_alignment` as a bool but reads back as a String under
/// that name or as the bool `charges_aligned_to_billing`.
library;

import '../../client/dto.dart';
import '../common/common_dto.dart';
import '../custom_components/custom_components_dto.dart'
    show
        ComponentObjectsDataCustomForm,
        ComponentObjectsDataDetail,
        ComponentObjectsDataParent;

// Re-exported so a caller importing this family gets the shared types too.
export '../common/common_dto.dart'
    show Pagination, PaginationLinks, Reference, User;

/// An account's currency, as a reference.
class Currency extends Dto {
  const Currency({this.object, this.id, this.name, this.code, this.href});

  static Currency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return Currency(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'code': code,
        'href': href,
      };
}

/// An account's social links; present on every account, each value usually null.
class SocialLinks extends Dto {
  const SocialLinks({this.website, this.linkedin, this.twitter, this.facebook});

  static SocialLinks? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return SocialLinks(
      website: readText(source['website']),
      linkedin: readText(source['linkedin']),
      twitter: readText(source['twitter']),
      facebook: readText(source['facebook']),
    );
  }

  final String? website;

  final String? linkedin;

  final String? twitter;

  final String? facebook;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'website': website,
        'linkedin': linkedin,
        'twitter': twitter,
        'facebook': facebook,
      };
}

/// An address as it reads back; [AddressWrite] is the form a write takes.
class Address extends Dto {
  const Address({
    this.object,
    this.id,
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    this.addressLine5,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.defaultBilling,
    this.defaultShipping,
    this.href,
  });

  static Address? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return Address(
      object: readText(source['object']),
      id: readText(source['id']),
      addressLine1: readText(source['address_line_1']),
      addressLine2: readText(source['address_line_2']),
      addressLine3: readText(source['address_line_3']),
      addressLine4: readText(source['address_line_4']),
      addressLine5: readText(source['address_line_5']),
      city: readText(source['city']),
      state: readText(source['state']),
      country: readText(source['country']),
      postalCode: readText(source['postal_code']),
      defaultBilling: readFlag(source['default_billing']),
      defaultShipping: readFlag(source['default_shipping']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? addressLine1;

  final String? addressLine2;

  final String? addressLine3;

  final String? addressLine4;

  final String? addressLine5;

  final String? city;

  final String? state;

  /// A plain string on every address measured, not a nested reference.
  final String? country;

  /// The read spelling; a write sends `post_code`.
  final String? postalCode;

  final bool? defaultBilling;

  final bool? defaultShipping;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_line_3': addressLine3,
        'address_line_4': addressLine4,
        'address_line_5': addressLine5,
        'city': city,
        'state': state,
        'country': country,
        'postal_code': postalCode,
        'default_billing': defaultBilling,
        'default_shipping': defaultShipping,
        'href': href,
      };
}

/// Billing preferences as they read back on the account detail body.
///
/// The alignment setting reads back under two names, both declared with the type
/// each arrives as, because a view declaring one reads null on the accounts that
/// send the other.
class BillingPreferences extends Dto {
  const BillingPreferences({
    this.communicationProfile,
    this.invoiceMode,
    this.invoiceTerm,
    this.billingPeriod,
    this.billingStartDate,
    this.billingStartDayOfMonth,
    this.chargesAlignedToBilling,
    this.chargingAndBillingAlignment,
    this.paymentProcessor,
    this.paymentMode,
    this.paymentTerm,
    this.paymentTermAlignment,
    this.consolidateInvoice,
    this.fulfillmentMode,
    this.fulfillmentTerm,
    this.proformaProperties,
    this.communicationGroup,
    this.billingMode,
    this.chargingPeriod,
    this.chargingStartDate,
    this.eventProfile,
  });

  static BillingPreferences? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return BillingPreferences(
      communicationProfile: readText(source['communication_profile']),
      invoiceMode: readText(source['invoice_mode']),
      invoiceTerm: readText(source['invoice_term']),
      billingPeriod: readText(source['billing_period']),
      billingStartDate: readText(source['billing_start_date']),
      billingStartDayOfMonth: readAny(source['billing_start_day_of_month']),
      chargesAlignedToBilling: readFlag(source['charges_aligned_to_billing']),
      chargingAndBillingAlignment:
          readText(source['charging_and_billing_alignment']),
      paymentProcessor: readText(source['payment_processor']),
      paymentMode: readText(source['payment_mode']),
      paymentTerm: readText(source['payment_term']),
      paymentTermAlignment: readText(source['payment_term_alignment']),
      consolidateInvoice: readFlag(source['consolidate_invoice']),
      fulfillmentMode: readText(source['fulfillment_mode']),
      fulfillmentTerm: readText(source['fulfillment_term']),
      proformaProperties: readAny(source['proforma_properties']),
      communicationGroup: readText(source['communication_group']),
      billingMode: readText(source['billing_mode']),
      chargingPeriod: readText(source['charging_period']),
      chargingStartDate: readText(source['charging_start_date']),
      eventProfile: readText(source['event_profile']),
    );
  }

  final String? communicationProfile;

  final String? invoiceMode;

  final String? invoiceTerm;

  final String? billingPeriod;

  final String? billingStartDate;

  /// Untyped: some accounts send an `int` and others a `String`, and claiming
  /// either would drop the value on every account that sends the other.
  final Object? billingStartDayOfMonth;

  /// One of the two names the alignment setting reads back under; a bool.
  final bool? chargesAlignedToBilling;

  /// The other; a String on read, though a write sends this name as a bool.
  final String? chargingAndBillingAlignment;

  final String? paymentProcessor;

  final String? paymentMode;

  final String? paymentTerm;

  final String? paymentTermAlignment;

  final bool? consolidateInvoice;

  final String? fulfillmentMode;

  final String? fulfillmentTerm;

  /// Untyped: an object whose keys never varied enough to establish a shape.
  final Object? proformaProperties;

  final String? communicationGroup;

  final String? billingMode;

  final String? chargingPeriod;

  final String? chargingStartDate;

  final String? eventProfile;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'communication_profile': communicationProfile,
        'invoice_mode': invoiceMode,
        'invoice_term': invoiceTerm,
        'billing_period': billingPeriod,
        'billing_start_date': billingStartDate,
        'billing_start_day_of_month': billingStartDayOfMonth,
        'charges_aligned_to_billing': chargesAlignedToBilling,
        'charging_and_billing_alignment': chargingAndBillingAlignment,
        'payment_processor': paymentProcessor,
        'payment_mode': paymentMode,
        'payment_term': paymentTerm,
        'payment_term_alignment': paymentTermAlignment,
        'consolidate_invoice': consolidateInvoice,
        'fulfillment_mode': fulfillmentMode,
        'fulfillment_term': fulfillmentTerm,
        'proforma_properties': proformaProperties,
        'communication_group': communicationGroup,
        'billing_mode': billingMode,
        'charging_period': chargingPeriod,
        'charging_start_date': chargingStartDate,
        'event_profile': eventProfile,
      };
}

/// One payment method as it reads back on the account detail body.
class PaymentMethod extends Dto {
  const PaymentMethod({
    this.object,
    this.id,
    this.processorType,
    this.status,
    this.isDefault,
    this.restrictedToOrders,
    this.specifiedOrderIds,
    this.processor,
    this.reference,
    this.paymentCount,
    this.lastUsedAt,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
  });

  static PaymentMethod? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return PaymentMethod(
      object: readText(source['object']),
      id: readText(source['id']),
      processorType: readText(source['processor_type']),
      status: readText(source['status']),
      isDefault: readFlag(source['default']),
      restrictedToOrders: readFlag(source['restricted_to_orders']),
      specifiedOrderIds: readAny(source['specified_order_ids']),
      processor: Reference.fromMap(source['processor']),
      reference: readText(source['reference']),
      paymentCount: readInteger(source['payment_count']),
      lastUsedAt: readText(source['last_used_at']),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      createdBy: User.fromMap(source['created_by']),
      lastUpdatedBy: User.fromMap(source['last_updated_by']),
      version: readInteger(source['version']),
    );
  }

  final String? object;

  final String? id;

  final String? processorType;

  final String? status;

  /// The wire name is `default`, a Dart reserved word.
  final bool? isDefault;

  final bool? restrictedToOrders;

  /// Untyped: null in every record measured.
  final Object? specifiedOrderIds;

  final Reference? processor;

  final String? reference;

  final int? paymentCount;

  /// Null on a method that has never been charged.
  final String? lastUsedAt;

  final String? createdOn;

  /// Null until the method has been edited.
  final String? lastUpdatedOn;

  final User? createdBy;

  final User? lastUpdatedBy;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'processor_type': processorType,
        'status': status,
        'default': isDefault,
        'restricted_to_orders': restrictedToOrders,
        'specified_order_ids': specifiedOrderIds,
        'processor': processor,
        'reference': reference,
        'payment_count': paymentCount,
        'last_used_at': lastUsedAt,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
      };
}

/// One account, read from a `{"account": {...}}` detail body or a listing entry.
///
/// This is the read view. A write is flatter: `currency` and `time_zone` go in as
/// plain strings where this reads them back as objects, so posting a read body
/// back unchanged is a 400.
class Account extends Dto {
  const Account({
    this.object,
    this.id,
    this.name,
    this.status,
    this.type,
    this.displayName,
    this.emailAddress,
    this.description,
    this.currency,
    this.tax,
    this.taxId,
    this.taxIdNumber,
    this.imageUrl,
    this.socialLinks,
    this.version,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.accountingCode,
    this.communicationPreferences,
    this.customForm,
    this.customAttributes,
    this.customObjects,
    this.group,
    this.invoiceParentAccount,
    this.manager,
    this.origin,
    this.parentAccountId,
    this.portalAccess,
    this.pricingLevel,
    this.referralTracking,
    this.salesRep,
    this.timeZone,
    this.userTeam,
    this.workflowStatus,
    this.href,
    this.addresses,
    this.contacts,
    this.billingPreferences,
    this.paymentMethods,
    this.partialInvoices,
    this.inventories,
    this.activityLogs,
    this.paymentMethod,
  });

  static Account? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'account');
    if (source == null) return null;
    return Account(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      status: readText(source['status']),
      type: readText(source['type']),
      displayName: readText(source['display_name']),
      emailAddress: readText(source['email_address']),
      description: readText(source['description']),
      currency: Currency.fromMap(source['currency']),
      tax: Reference.fromMap(source['tax']),
      taxId: readAny(source['tax_id']),
      taxIdNumber: readAny(source['tax_id_number']),
      imageUrl: readAny(source['image_url']),
      socialLinks: SocialLinks.fromMap(source['social_links']),
      version: readInteger(source['version']),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      createdBy: User.fromMap(source['created_by']),
      lastUpdatedBy: User.fromMap(source['last_updated_by']),
      accountingCode: AccountAccountingCode.fromMap(source['accounting_code']),
      communicationPreferences: readList<AccountCommunicationPreference>(
          source['communication_preferences'],
          AccountCommunicationPreference.fromMap),
      customForm: Reference.fromMap(source['custom_form']),
      customAttributes: readList<AccountCustomAttribute>(
          source['custom_attributes'], AccountCustomAttribute.fromMap),
      customObjects: readList<AccountCustomObject>(
          source['custom_objects'], AccountCustomObject.fromMap),
      group: Reference.fromMap(source['group']),
      invoiceParentAccount: readFlag(source['invoice_parent_account']),
      manager: Reference.fromMap(source['manager']),
      origin: readText(source['origin']),
      parentAccountId: readText(source['parent_account_id']),
      portalAccess: readFlag(source['portal_access']),
      pricingLevel: Reference.fromMap(source['pricing_level']),
      referralTracking: readText(source['referral_tracking']),
      salesRep: Reference.fromMap(source['sales_rep']),
      timeZone: Reference.fromMap(source['time_zone']),
      userTeam: Reference.fromMap(source['user_team']),
      workflowStatus: readText(source['workflow_status']),
      href: readText(source['href']),
      addresses: readList<Address>(source['addresses'], Address.fromMap),
      contacts: readList<AccountContactEntry>(
          source['contacts'], AccountContactEntry.fromMap),
      billingPreferences:
          BillingPreferences.fromMap(source['billing_preferences']),
      paymentMethods: readList<PaymentMethod>(
          source['payment_methods'], PaymentMethod.fromMap),
      partialInvoices: readList<Object>(source['partial_invoices'], readAny),
      inventories: readList<Object>(source['inventories'], readAny),
      activityLogs: readList<Object>(source['activity_logs'], readAny),
      paymentMethod: PaymentMethod.fromMap(source['payment_method']),
    );
  }

  final String? object;

  /// The short code, such as `"W13ZGY"`, and what every path takes.
  final String? id;

  final String? name;

  final String? status;

  final String? type;

  final String? displayName;

  final String? emailAddress;

  final String? description;

  final Currency? currency;

  /// Null on an account with no tax profile.
  final Reference? tax;

  /// Untyped: null in every record measured.
  final Object? taxId;

  /// Untyped: null in every record measured.
  final Object? taxIdNumber;

  /// Untyped: null in every record measured; the image endpoint answers the URI.
  final Object? imageUrl;

  final SocialLinks? socialLinks;

  final int? version;

  final String? createdOn;

  /// Set only once an account has been edited.
  final String? lastUpdatedOn;

  final User? createdBy;

  /// An object like [createdBy], not a string.
  final User? lastUpdatedBy;

  final AccountAccountingCode? accountingCode;

  final List<AccountCommunicationPreference?>? communicationPreferences;

  final Reference? customForm;

  final List<AccountCustomAttribute?>? customAttributes;

  final List<AccountCustomObject?>? customObjects;

  final Reference? group;

  final bool? invoiceParentAccount;

  final Reference? manager;

  final String? origin;

  final String? parentAccountId;

  final bool? portalAccess;

  final Reference? pricingLevel;

  final String? referralTracking;

  final Reference? salesRep;

  final Reference? timeZone;

  final Reference? userTeam;

  final String? workflowStatus;

  final String? href;

  final List<Address?>? addresses;

  final List<AccountContactEntry?>? contacts;

  final BillingPreferences? billingPreferences;

  final List<PaymentMethod?>? paymentMethods;

  /// The key the quote partial invoices read answers under, which does not match
  /// its path segment.
  final List<Object?>? partialInvoices;

  final List<Object?>? inventories;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? activityLogs;

  final PaymentMethod? paymentMethod;

  @override
  String? get envelopeKey => 'account';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'status': status,
        'type': type,
        'display_name': displayName,
        'email_address': emailAddress,
        'description': description,
        'currency': currency,
        'tax': tax,
        'tax_id': taxId,
        'tax_id_number': taxIdNumber,
        'image_url': imageUrl,
        'social_links': socialLinks,
        'version': version,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'accounting_code': accountingCode,
        'communication_preferences': communicationPreferences,
        'custom_form': customForm,
        'custom_attributes': customAttributes,
        'custom_objects': customObjects,
        'group': group,
        'invoice_parent_account': invoiceParentAccount,
        'manager': manager,
        'origin': origin,
        'parent_account_id': parentAccountId,
        'portal_access': portalAccess,
        'pricing_level': pricingLevel,
        'referral_tracking': referralTracking,
        'sales_rep': salesRep,
        'time_zone': timeZone,
        'user_team': userTeam,
        'workflow_status': workflowStatus,
        'href': href,
        'addresses': addresses,
        'contacts': contacts,
        'billing_preferences': billingPreferences,
        'payment_methods': paymentMethods,
        'partial_invoices': partialInvoices,
        'inventories': inventories,
        'activity_logs': activityLogs,
        'payment_method': paymentMethod,
      };
}

/// A listing of accounts; each record under `data` is written without its
/// `account` envelope, as the API sends it.
class AccountList extends Dto {
  const AccountList({this.object, this.url, this.data, this.pagination});

  static AccountList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<Account>(source['data'], Account.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<Account?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

/// The account's image as a URI, not image bytes; null when there is none.
class AccountImageView extends Dto {
  const AccountImageView({this.imageUri, this.accountId});

  static AccountImageView? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'account');
    if (source == null) return null;
    return AccountImageView(
      imageUri: readText(source['image_uri']),
      accountId: readText(source['account_id']),
    );
  }

  final String? imageUri;

  final String? accountId;

  @override
  String? get envelopeKey => 'account';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'image_uri': imageUri,
        'account_id': accountId,
      };
}

/// The body that cancels an account, under an `account` envelope.
class AccountCancelBody extends Dto {
  const AccountCancelBody({this.effectiveDate});

  /// `YYYY-MM-DD`; the endpoint does not parse a datetime.
  final String? effectiveDate;

  @override
  String? get envelopeKey => 'account';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'effective_date': effectiveDate,
      };
}

/// One address as it is written: [postCode] against the read's `postal_code`.
class AddressWrite extends Dto {
  const AddressWrite({
    this.addressLine1,
    this.city,
    this.state,
    this.country,
    this.postCode,
    this.defaultBilling,
    this.defaultShipping,
  });

  final String? addressLine1;

  final String? city;

  /// The name, not an id.
  final String? state;

  /// The name, not an id.
  final String? country;

  final String? postCode;

  final bool? defaultBilling;

  final bool? defaultShipping;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'address_line_1': addressLine1,
        'city': city,
        'state': state,
        'country': country,
        'post_code': postCode,
        'default_billing': defaultBilling,
        'default_shipping': defaultShipping,
      };
}

/// A list under `addresses`, at the top level with no `account` envelope.
class AddressesCreate extends Dto {
  const AddressesCreate({this.addresses});

  final List<AddressWrite>? addresses;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'addresses': addresses,
      };
}

/// The set-password body, at the top level with no envelope.
class AccountSetPasswordBody extends Dto {
  const AccountSetPasswordBody({this.password, this.confirmPassword});

  final String? password;

  final String? confirmPassword;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'password': password,
        'confirm_password': confirmPassword,
      };
}

/// What `getAccountContact` answers, under `account`.
class AccountContact extends Dto {
  const AccountContact({
    this.id,
    this.contacts,
  });

  static AccountContact? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'account');
    if (source == null) return null;
    return AccountContact(
      id: readText(source['id']),
      contacts: AccountContactContacts.fromMap(source['contacts']),
    );
  }

  final String? id;

  final AccountContactContacts? contacts;

  @override
  String? get envelopeKey => 'account';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'contacts': contacts,
      };
}

/// What `getAccountAddress` answers, under `account`.
class AccountAddress extends Dto {
  const AccountAddress({
    this.id,
    this.addresses,
  });

  static AccountAddress? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'account');
    if (source == null) return null;
    return AccountAddress(
      id: readText(source['id']),
      addresses: AccountAddressAddresses.fromMap(source['addresses']),
    );
  }

  final String? id;

  final AccountAddressAddresses? addresses;

  @override
  String? get envelopeKey => 'account';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'addresses': addresses,
      };
}

/// What `getAccountPaymentMethod` answers, under `account`.
class AccountPaymentMethod extends Dto {
  const AccountPaymentMethod({
    this.id,
    this.paymentMethod,
  });

  static AccountPaymentMethod? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'account');
    if (source == null) return null;
    return AccountPaymentMethod(
      id: readText(source['id']),
      paymentMethod:
          AccountPaymentMethodPaymentMethod.fromMap(source['payment_method']),
    );
  }

  final String? id;

  final AccountPaymentMethodPaymentMethod? paymentMethod;

  @override
  String? get envelopeKey => 'account';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'payment_method': paymentMethod,
      };
}

/// One page of what `getAccountNoteFiles` lists, under `data`.
class AccountNoteFileList extends Dto {
  const AccountNoteFileList({
    this.object,
    this.url,
    this.data,
    this.pagination,
  });

  static AccountNoteFileList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountNoteFileList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<AccountNoteFileEntry>(
          source['data'], AccountNoteFileEntry.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<AccountNoteFileEntry?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

/// What `getAccountNoteFile` answers, under `file`.
class AccountNoteFile extends Dto {
  const AccountNoteFile({
    this.uuid,
    this.filename,
    this.contentType,
    this.size,
    this.href,
  });

  static AccountNoteFile? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'file');
    if (source == null) return null;
    return AccountNoteFile(
      uuid: readText(source['uuid']),
      filename: readText(source['filename']),
      contentType: readText(source['content_type']),
      size: readInteger(source['size']),
      href: readText(source['href']),
    );
  }

  final String? uuid;

  final String? filename;

  final String? contentType;

  final int? size;

  final String? href;

  @override
  String? get envelopeKey => 'file';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'uuid': uuid,
        'filename': filename,
        'content_type': contentType,
        'size': size,
        'href': href,
      };
}

/// One page of what `getAccountInvoices` lists, under `data`.
class AccountInvoiceList extends Dto {
  const AccountInvoiceList({
    this.object,
    this.url,
    this.data,
    this.pagination,
  });

  static AccountInvoiceList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<AccountInvoice>(source['data'], AccountInvoice.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<AccountInvoice?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

/// One page of what `getAccountCreditNotes` lists, under `data`.
class AccountCreditNoteList extends Dto {
  const AccountCreditNoteList({
    this.object,
    this.url,
    this.data,
    this.pagination,
  });

  static AccountCreditNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCreditNoteList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<AccountCreditNote>(
          source['data'], AccountCreditNote.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<AccountCreditNote?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

/// One page of what `getAccountCustomObjects` lists, under `data`.
class AccountCustomObjectList extends Dto {
  const AccountCustomObjectList({
    this.object,
    this.url,
    this.data,
    this.pagination,
  });

  static AccountCustomObjectList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCustomObjectList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<AccountCustomObjectEntry>(
          source['data'], AccountCustomObjectEntry.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<AccountCustomObjectEntry?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

/// What `getAccountInventories` answers, under `account`.
class AccountInventories extends Dto {
  const AccountInventories({
    this.inventories,
  });

  static AccountInventories? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'account');
    if (source == null) return null;
    return AccountInventories(
      inventories: readList<Object>(source['inventories'], readAny),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? inventories;

  @override
  String? get envelopeKey => 'account';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'inventories': inventories,
      };
}

/// What `getAccountQuotePartialInvoices` answers, under `account`.
class AccountQuotePartialInvoices extends Dto {
  const AccountQuotePartialInvoices({
    this.partialInvoices,
  });

  static AccountQuotePartialInvoices? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'account');
    if (source == null) return null;
    return AccountQuotePartialInvoices(
      partialInvoices: readList<Object>(source['partial_invoices'], readAny),
    );
  }

  /// Untyped entries: empty in every record measured.
  final List<Object?>? partialInvoices;

  @override
  String? get envelopeKey => 'account';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'partial_invoices': partialInvoices,
      };
}

/// What `createAccountNote` answers, under `note`.
class AccountNotes extends Dto {
  const AccountNotes({
    this.object,
    this.id,
    this.content,
    this.account,
    this.group,
    this.user,
    this.attachments,
    this.watchers,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
    this.href,
  });

  static AccountNotes? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return AccountNotes(
      object: readText(source['object']),
      id: readText(source['id']),
      content: readText(source['content']),
      account: AccountNotesAccount.fromMap(source['account']),
      group: readAny(source['group']),
      user: readAny(source['user']),
      attachments: readList<AccountNotesAttachment>(
          source['attachments'], AccountNotesAttachment.fromMap),
      watchers: readList<AccountNotesWatcher>(
          source['watchers'], AccountNotesWatcher.fromMap),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      createdBy: AccountNotesCreatedBy.fromMap(source['created_by']),
      lastUpdatedBy:
          AccountNotesLastUpdatedBy.fromMap(source['last_updated_by']),
      version: readInteger(source['version']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? content;

  final AccountNotesAccount? account;

  /// Untyped: null in every record measured.
  final Object? group;

  /// Untyped: null in every record measured.
  final Object? user;

  final List<AccountNotesAttachment?>? attachments;

  final List<AccountNotesWatcher?>? watchers;

  final String? createdOn;

  final String? lastUpdatedOn;

  final AccountNotesCreatedBy? createdBy;

  final AccountNotesLastUpdatedBy? lastUpdatedBy;

  final int? version;

  final String? href;

  @override
  String? get envelopeKey => 'note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'content': content,
        'account': account,
        'group': group,
        'user': user,
        'attachments': attachments,
        'watchers': watchers,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
        'href': href,
      };
}

/// A [Account]'s `accounting_code`.
class AccountAccountingCode extends Dto {
  const AccountAccountingCode({
    this.accountReceivable,
  });

  static AccountAccountingCode? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountAccountingCode(
      accountReceivable: readText(source['account_receivable']),
    );
  }

  final String? accountReceivable;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account_receivable': accountReceivable,
      };
}

/// One entry of a [Account]'s `communication_preferences`.
class AccountCommunicationPreference extends Dto {
  const AccountCommunicationPreference({
    this.channel,
    this.enabled,
  });

  static AccountCommunicationPreference? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCommunicationPreference(
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

/// One entry of a [Account]'s `contacts`.
class AccountContactEntry extends Dto {
  const AccountContactEntry({
    this.object,
    this.id,
    this.type,
    this.billingContact,
    this.shippingContact,
    this.receivesBillingInformation,
    this.name,
    this.email,
    this.phone,
    this.fax,
    this.mobile,
    this.address,
    this.customAttributes,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
  });

  static AccountContactEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactEntry(
      object: readText(source['object']),
      id: readText(source['id']),
      type: readText(source['type']),
      billingContact: readFlag(source['billing_contact']),
      shippingContact: readFlag(source['shipping_contact']),
      receivesBillingInformation:
          readFlag(source['receives_billing_information']),
      name: AccountContactEntryName.fromMap(source['name']),
      email: AccountContactEntryEmail.fromMap(source['email']),
      phone: AccountContactEntryPhone.fromMap(source['phone']),
      fax: AccountContactEntryFax.fromMap(source['fax']),
      mobile: AccountContactEntryMobile.fromMap(source['mobile']),
      address: AccountContactEntryAddress.fromMap(source['address']),
      customAttributes: readList<AccountContactEntryCustomAttribute>(
          source['custom_attributes'],
          AccountContactEntryCustomAttribute.fromMap),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      createdBy: AccountContactEntryCreatedBy.fromMap(source['created_by']),
      lastUpdatedBy:
          AccountContactEntryLastUpdatedBy.fromMap(source['last_updated_by']),
      version: readInteger(source['version']),
    );
  }

  final String? object;

  final String? id;

  final String? type;

  final bool? billingContact;

  final bool? shippingContact;

  final bool? receivesBillingInformation;

  final AccountContactEntryName? name;

  final AccountContactEntryEmail? email;

  final AccountContactEntryPhone? phone;

  final AccountContactEntryFax? fax;

  final AccountContactEntryMobile? mobile;

  final AccountContactEntryAddress? address;

  final List<AccountContactEntryCustomAttribute?>? customAttributes;

  final String? createdOn;

  final String? lastUpdatedOn;

  final AccountContactEntryCreatedBy? createdBy;

  final AccountContactEntryLastUpdatedBy? lastUpdatedBy;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'type': type,
        'billing_contact': billingContact,
        'shipping_contact': shippingContact,
        'receives_billing_information': receivesBillingInformation,
        'name': name,
        'email': email,
        'phone': phone,
        'fax': fax,
        'mobile': mobile,
        'address': address,
        'custom_attributes': customAttributes,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
      };
}

/// One entry of a [Account]'s `custom_attributes`.
class AccountCustomAttribute extends Dto {
  const AccountCustomAttribute({
    this.object,
    this.id,
    this.name,
    this.type,
    this.value,
    this.href,
  });

  static AccountCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCustomAttribute(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      type: readText(source['type']),
      value: readAny(source['value']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? type;

  /// Untyped: the records measured disagree on its type.
  final Object? value;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'type': type,
        'value': value,
        'href': href,
      };
}

/// One entry of a [Account]'s `custom_objects`.
class AccountCustomObject extends Dto {
  const AccountCustomObject({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static AccountCustomObject? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCustomObject(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'href': href,
      };
}

/// A [AccountContact]'s `contacts`.
class AccountContactContacts extends Dto {
  const AccountContactContacts({
    this.object,
    this.id,
    this.type,
    this.billingContact,
    this.shippingContact,
    this.receivesBillingInformation,
    this.name,
    this.email,
    this.phone,
    this.fax,
    this.mobile,
    this.address,
    this.customAttributes,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
  });

  static AccountContactContacts? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactContacts(
      object: readText(source['object']),
      id: readText(source['id']),
      type: readText(source['type']),
      billingContact: readFlag(source['billing_contact']),
      shippingContact: readFlag(source['shipping_contact']),
      receivesBillingInformation:
          readFlag(source['receives_billing_information']),
      name: AccountContactContactsName.fromMap(source['name']),
      email: AccountContactContactsEmail.fromMap(source['email']),
      phone: AccountContactContactsPhone.fromMap(source['phone']),
      fax: readAny(source['fax']),
      mobile: AccountContactContactsMobile.fromMap(source['mobile']),
      address: AccountContactContactsAddress.fromMap(source['address']),
      customAttributes: readList<Object>(source['custom_attributes'], readAny),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      createdBy: AccountContactContactsCreatedBy.fromMap(source['created_by']),
      lastUpdatedBy: AccountContactContactsLastUpdatedBy.fromMap(
          source['last_updated_by']),
      version: readInteger(source['version']),
    );
  }

  final String? object;

  final String? id;

  final String? type;

  final bool? billingContact;

  final bool? shippingContact;

  final bool? receivesBillingInformation;

  final AccountContactContactsName? name;

  final AccountContactContactsEmail? email;

  final AccountContactContactsPhone? phone;

  /// Untyped: null in every record measured.
  final Object? fax;

  final AccountContactContactsMobile? mobile;

  final AccountContactContactsAddress? address;

  /// Untyped entries: empty in every record measured.
  final List<Object?>? customAttributes;

  final String? createdOn;

  final String? lastUpdatedOn;

  final AccountContactContactsCreatedBy? createdBy;

  final AccountContactContactsLastUpdatedBy? lastUpdatedBy;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'type': type,
        'billing_contact': billingContact,
        'shipping_contact': shippingContact,
        'receives_billing_information': receivesBillingInformation,
        'name': name,
        'email': email,
        'phone': phone,
        'fax': fax,
        'mobile': mobile,
        'address': address,
        'custom_attributes': customAttributes,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
      };
}

/// A [AccountAddress]'s `addresses`.
class AccountAddressAddresses extends Dto {
  const AccountAddressAddresses({
    this.id,
    this.city,
    this.state,
    this.country,
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    this.addressLine5,
    this.object,
    this.href,
    this.defaultBilling,
    this.defaultShipping,
    this.postalCode,
  });

  static AccountAddressAddresses? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountAddressAddresses(
      id: readText(source['id']),
      city: readText(source['city']),
      state: readText(source['state']),
      country: readText(source['country']),
      addressLine1: readText(source['address_line_1']),
      addressLine2: readText(source['address_line_2']),
      addressLine3: readText(source['address_line_3']),
      addressLine4: readText(source['address_line_4']),
      addressLine5: readText(source['address_line_5']),
      object: readText(source['object']),
      href: readText(source['href']),
      defaultBilling: readFlag(source['default_billing']),
      defaultShipping: readFlag(source['default_shipping']),
      postalCode: readText(source['postal_code']),
    );
  }

  final String? id;

  final String? city;

  final String? state;

  final String? country;

  final String? addressLine1;

  final String? addressLine2;

  final String? addressLine3;

  final String? addressLine4;

  final String? addressLine5;

  final String? object;

  final String? href;

  final bool? defaultBilling;

  final bool? defaultShipping;

  final String? postalCode;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'city': city,
        'state': state,
        'country': country,
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_line_3': addressLine3,
        'address_line_4': addressLine4,
        'address_line_5': addressLine5,
        'object': object,
        'href': href,
        'default_billing': defaultBilling,
        'default_shipping': defaultShipping,
        'postal_code': postalCode,
      };
}

/// A [AccountPaymentMethod]'s `payment_method`.
class AccountPaymentMethodPaymentMethod extends Dto {
  const AccountPaymentMethodPaymentMethod({
    this.object,
    this.id,
    this.processorType,
    this.status,
    this.isDefault,
    this.restrictedToOrders,
    this.specifiedOrderIds,
    this.processor,
    this.reference,
    this.paymentCount,
    this.lastUsedAt,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
  });

  static AccountPaymentMethodPaymentMethod? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPaymentMethodPaymentMethod(
      object: readText(source['object']),
      id: readText(source['id']),
      processorType: readText(source['processor_type']),
      status: readText(source['status']),
      isDefault: readFlag(source['default']),
      restrictedToOrders: readFlag(source['restricted_to_orders']),
      specifiedOrderIds: readAny(source['specified_order_ids']),
      processor: AccountPaymentMethodPaymentMethodProcessor.fromMap(
          source['processor']),
      reference: readText(source['reference']),
      paymentCount: readInteger(source['payment_count']),
      lastUsedAt: readAny(source['last_used_at']),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      createdBy: AccountPaymentMethodPaymentMethodCreatedBy.fromMap(
          source['created_by']),
      lastUpdatedBy: AccountPaymentMethodPaymentMethodLastUpdatedBy.fromMap(
          source['last_updated_by']),
      version: readInteger(source['version']),
    );
  }

  final String? object;

  final String? id;

  final String? processorType;

  final String? status;

  final bool? isDefault;

  final bool? restrictedToOrders;

  /// Untyped: null in every record measured.
  final Object? specifiedOrderIds;

  final AccountPaymentMethodPaymentMethodProcessor? processor;

  final String? reference;

  final int? paymentCount;

  /// Untyped: null in every record measured.
  final Object? lastUsedAt;

  final String? createdOn;

  final String? lastUpdatedOn;

  final AccountPaymentMethodPaymentMethodCreatedBy? createdBy;

  final AccountPaymentMethodPaymentMethodLastUpdatedBy? lastUpdatedBy;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'processor_type': processorType,
        'status': status,
        'default': isDefault,
        'restricted_to_orders': restrictedToOrders,
        'specified_order_ids': specifiedOrderIds,
        'processor': processor,
        'reference': reference,
        'payment_count': paymentCount,
        'last_used_at': lastUsedAt,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
      };
}

/// One entry of a [AccountNoteFileList]'s `data`.
class AccountNoteFileEntry extends Dto {
  const AccountNoteFileEntry({
    this.uuid,
    this.filename,
    this.contentType,
    this.size,
    this.href,
  });

  static AccountNoteFileEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountNoteFileEntry(
      uuid: readText(source['uuid']),
      filename: readText(source['filename']),
      contentType: readText(source['content_type']),
      size: readInteger(source['size']),
      href: readText(source['href']),
    );
  }

  final String? uuid;

  final String? filename;

  final String? contentType;

  final int? size;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'uuid': uuid,
        'filename': filename,
        'content_type': contentType,
        'size': size,
        'href': href,
      };
}

/// One entry of a [AccountInvoiceList]'s `data`.
class AccountInvoice extends Dto {
  const AccountInvoice({
    this.object,
    this.id,
    this.status,
    this.type,
    this.customForm,
    this.currency,
    this.account,
    this.order,
    this.customerPurchaseOrderId,
    this.origin,
    this.invoiceNote,
    this.priceTaxInclusive,
    this.paymentStatus,
    this.billingStartDate,
    this.alternateBillingStartDate,
    this.billingEndDate,
    this.alternateBillingEndDate,
    this.issueDate,
    this.alternateIssueDate,
    this.dueDate,
    this.alternateDueDate,
    this.subtotal,
    this.tax,
    this.taxTotal,
    this.total,
    this.paid,
    this.due,
    this.discountAmount,
    this.lastPayment,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
  });

  static AccountInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoice(
      object: readText(source['object']),
      id: readText(source['id']),
      status: readText(source['status']),
      type: readText(source['type']),
      customForm: AccountInvoiceCustomForm.fromMap(source['custom_form']),
      currency: AccountInvoiceCurrency.fromMap(source['currency']),
      account: AccountInvoiceAccount.fromMap(source['account']),
      order: AccountInvoiceOrder.fromMap(source['order']),
      customerPurchaseOrderId: readText(source['customer_purchase_order_id']),
      origin: readText(source['origin']),
      invoiceNote: readText(source['invoice_note']),
      priceTaxInclusive: readFlag(source['price_tax_inclusive']),
      paymentStatus: readText(source['payment_status']),
      billingStartDate: readText(source['billing_start_date']),
      alternateBillingStartDate:
          readText(source['alternate_billing_start_date']),
      billingEndDate: readText(source['billing_end_date']),
      alternateBillingEndDate: readText(source['alternate_billing_end_date']),
      issueDate: readText(source['issue_date']),
      alternateIssueDate: readText(source['alternate_issue_date']),
      dueDate: readText(source['due_date']),
      alternateDueDate: readText(source['alternate_due_date']),
      subtotal: readText(source['subtotal']),
      tax: readText(source['tax']),
      taxTotal: readText(source['tax_total']),
      total: readText(source['total']),
      paid: readText(source['paid']),
      due: readText(source['due']),
      discountAmount: readDecimal(source['discount_amount']),
      lastPayment: AccountInvoiceLastPayment.fromMap(source['last_payment']),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      createdBy: AccountInvoiceCreatedBy.fromMap(source['created_by']),
      lastUpdatedBy:
          AccountInvoiceLastUpdatedBy.fromMap(source['last_updated_by']),
      version: readInteger(source['version']),
    );
  }

  final String? object;

  final String? id;

  final String? status;

  final String? type;

  final AccountInvoiceCustomForm? customForm;

  final AccountInvoiceCurrency? currency;

  final AccountInvoiceAccount? account;

  final AccountInvoiceOrder? order;

  final String? customerPurchaseOrderId;

  final String? origin;

  final String? invoiceNote;

  final bool? priceTaxInclusive;

  final String? paymentStatus;

  final String? billingStartDate;

  final String? alternateBillingStartDate;

  final String? billingEndDate;

  final String? alternateBillingEndDate;

  final String? issueDate;

  final String? alternateIssueDate;

  final String? dueDate;

  final String? alternateDueDate;

  final String? subtotal;

  final String? tax;

  final String? taxTotal;

  final String? total;

  final String? paid;

  final String? due;

  final double? discountAmount;

  final AccountInvoiceLastPayment? lastPayment;

  final String? createdOn;

  final String? lastUpdatedOn;

  final AccountInvoiceCreatedBy? createdBy;

  final AccountInvoiceLastUpdatedBy? lastUpdatedBy;

  final int? version;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'status': status,
        'type': type,
        'custom_form': customForm,
        'currency': currency,
        'account': account,
        'order': order,
        'customer_purchase_order_id': customerPurchaseOrderId,
        'origin': origin,
        'invoice_note': invoiceNote,
        'price_tax_inclusive': priceTaxInclusive,
        'payment_status': paymentStatus,
        'billing_start_date': billingStartDate,
        'alternate_billing_start_date': alternateBillingStartDate,
        'billing_end_date': billingEndDate,
        'alternate_billing_end_date': alternateBillingEndDate,
        'issue_date': issueDate,
        'alternate_issue_date': alternateIssueDate,
        'due_date': dueDate,
        'alternate_due_date': alternateDueDate,
        'subtotal': subtotal,
        'tax': tax,
        'tax_total': taxTotal,
        'total': total,
        'paid': paid,
        'due': due,
        'discount_amount': discountAmount,
        'last_payment': lastPayment,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
      };
}

/// One entry of a [AccountCreditNoteList]'s `data`.
class AccountCreditNote extends Dto {
  const AccountCreditNote({
    this.object,
    this.id,
    this.status,
    this.code,
    this.account,
    this.currency,
    this.payment,
    this.invoices,
    this.issueDate,
    this.initialAmount,
    this.refundAmount,
    this.remainingAmount,
    this.refundable,
    this.customAttributes,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.version,
    this.href,
  });

  static AccountCreditNote? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCreditNote(
      object: readText(source['object']),
      id: readText(source['id']),
      status: readText(source['status']),
      code: readText(source['code']),
      account: AccountCreditNoteAccount.fromMap(source['account']),
      currency: AccountCreditNoteCurrency.fromMap(source['currency']),
      payment: AccountCreditNotePayment.fromMap(source['payment']),
      invoices: readList<AccountCreditNoteInvoice>(
          source['invoices'], AccountCreditNoteInvoice.fromMap),
      issueDate: readText(source['issue_date']),
      initialAmount: readText(source['initial_amount']),
      refundAmount: readText(source['refund_amount']),
      remainingAmount: readText(source['remaining_amount']),
      refundable: readFlag(source['refundable']),
      customAttributes: readList<AccountCreditNoteCustomAttribute>(
          source['custom_attributes'],
          AccountCreditNoteCustomAttribute.fromMap),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      createdBy: AccountCreditNoteCreatedBy.fromMap(source['created_by']),
      lastUpdatedBy:
          AccountCreditNoteLastUpdatedBy.fromMap(source['last_updated_by']),
      version: readInteger(source['version']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? status;

  final String? code;

  final AccountCreditNoteAccount? account;

  final AccountCreditNoteCurrency? currency;

  final AccountCreditNotePayment? payment;

  final List<AccountCreditNoteInvoice?>? invoices;

  final String? issueDate;

  final String? initialAmount;

  final String? refundAmount;

  final String? remainingAmount;

  final bool? refundable;

  final List<AccountCreditNoteCustomAttribute?>? customAttributes;

  final String? createdOn;

  final String? lastUpdatedOn;

  final AccountCreditNoteCreatedBy? createdBy;

  final AccountCreditNoteLastUpdatedBy? lastUpdatedBy;

  final int? version;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'status': status,
        'code': code,
        'account': account,
        'currency': currency,
        'payment': payment,
        'invoices': invoices,
        'issue_date': issueDate,
        'initial_amount': initialAmount,
        'refund_amount': refundAmount,
        'remaining_amount': remainingAmount,
        'refundable': refundable,
        'custom_attributes': customAttributes,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'version': version,
        'href': href,
      };
}

/// One entry of a [AccountCustomObjectList]'s `data`.
class AccountCustomObjectEntry extends Dto {
  const AccountCustomObjectEntry({
    this.object,
    this.id,
    this.name,
    this.displayName,
    this.description,
    this.useIn,
    this.customComponent,
    this.relation,
    this.createdOn,
    this.lastUpdatedOn,
    this.createdBy,
    this.lastUpdatedBy,
    this.href,
  });

  static AccountCustomObjectEntry? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCustomObjectEntry(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      displayName: readText(source['display_name']),
      description: readText(source['description']),
      useIn: readText(source['use_in']),
      customComponent: readAny(source['custom_component']),
      relation: readText(source['relation']),
      createdOn: readText(source['created_on']),
      lastUpdatedOn: readText(source['last_updated_on']),
      createdBy: readAny(source['created_by']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? displayName;

  final String? description;

  final String? useIn;

  /// Untyped: null in every record measured.
  final Object? customComponent;

  final String? relation;

  final String? createdOn;

  final String? lastUpdatedOn;

  /// Untyped: null in every record measured.
  final Object? createdBy;

  /// Untyped: null in every record measured.
  final Object? lastUpdatedBy;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'display_name': displayName,
        'description': description,
        'use_in': useIn,
        'custom_component': customComponent,
        'relation': relation,
        'created_on': createdOn,
        'last_updated_on': lastUpdatedOn,
        'created_by': createdBy,
        'last_updated_by': lastUpdatedBy,
        'href': href,
      };
}

/// A [AccountNotes]'s `account`.
class AccountNotesAccount extends Dto {
  const AccountNotesAccount({
    this.object,
    this.id,
    this.href,
  });

  static AccountNotesAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountNotesAccount(
      object: readText(source['object']),
      id: readText(source['id']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'href': href,
      };
}

/// One entry of a [AccountNotes]'s `attachments`.
class AccountNotesAttachment extends Dto {
  const AccountNotesAttachment({
    this.uuid,
    this.filename,
    this.contentType,
    this.size,
    this.href,
  });

  static AccountNotesAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountNotesAttachment(
      uuid: readText(source['uuid']),
      filename: readText(source['filename']),
      contentType: readText(source['content_type']),
      size: readInteger(source['size']),
      href: readText(source['href']),
    );
  }

  final String? uuid;

  final String? filename;

  final String? contentType;

  final int? size;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'uuid': uuid,
        'filename': filename,
        'content_type': contentType,
        'size': size,
        'href': href,
      };
}

/// One entry of a [AccountNotes]'s `watchers`.
class AccountNotesWatcher extends Dto {
  const AccountNotesWatcher({
    this.type,
    this.name,
    this.email,
  });

  static AccountNotesWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountNotesWatcher(
      type: readText(source['type']),
      name: readText(source['name']),
      email: readAny(source['email']),
    );
  }

  final String? type;

  final String? name;

  /// Untyped: null in every record measured.
  final Object? email;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'type': type,
        'name': name,
        'email': email,
      };
}

/// A [AccountNotes]'s `created_by`.
class AccountNotesCreatedBy extends Dto {
  const AccountNotesCreatedBy({
    this.object,
    this.name,
  });

  static AccountNotesCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountNotesCreatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// A [AccountNotes]'s `last_updated_by`.
class AccountNotesLastUpdatedBy extends Dto {
  const AccountNotesLastUpdatedBy({
    this.object,
    this.name,
  });

  static AccountNotesLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountNotesLastUpdatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// A [AccountContactEntry]'s `name`.
class AccountContactEntryName extends Dto {
  const AccountContactEntryName({
    this.salutation,
    this.first,
    this.middle,
    this.last,
    this.designation,
  });

  static AccountContactEntryName? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactEntryName(
      salutation: readText(source['salutation']),
      first: readText(source['first']),
      middle: readText(source['middle']),
      last: readText(source['last']),
      designation: readText(source['designation']),
    );
  }

  final String? salutation;

  final String? first;

  final String? middle;

  final String? last;

  final String? designation;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'salutation': salutation,
        'first': first,
        'middle': middle,
        'last': last,
        'designation': designation,
      };
}

/// A [AccountContactEntry]'s `email`.
class AccountContactEntryEmail extends Dto {
  const AccountContactEntryEmail({
    this.address,
    this.emailOptedOut,
  });

  static AccountContactEntryEmail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactEntryEmail(
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

/// A [AccountContactEntry]'s `phone`.
class AccountContactEntryPhone extends Dto {
  const AccountContactEntryPhone({
    this.dialingCode,
    this.areaCode,
    this.number,
    this.formatted,
    this.callOptedOut,
  });

  static AccountContactEntryPhone? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactEntryPhone(
      dialingCode: readText(source['dialing_code']),
      areaCode: readText(source['area_code']),
      number: readText(source['number']),
      formatted: readText(source['formatted']),
      callOptedOut: readFlag(source['call_opted_out']),
    );
  }

  final String? dialingCode;

  final String? areaCode;

  final String? number;

  final String? formatted;

  final bool? callOptedOut;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'dialing_code': dialingCode,
        'area_code': areaCode,
        'number': number,
        'formatted': formatted,
        'call_opted_out': callOptedOut,
      };
}

/// A [AccountContactEntry]'s `fax`.
class AccountContactEntryFax extends Dto {
  const AccountContactEntryFax({
    this.dialingCode,
    this.areaCode,
    this.number,
    this.formatted,
    this.callOptedOut,
  });

  static AccountContactEntryFax? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactEntryFax(
      dialingCode: readText(source['dialing_code']),
      areaCode: readText(source['area_code']),
      number: readText(source['number']),
      formatted: readText(source['formatted']),
      callOptedOut: readFlag(source['call_opted_out']),
    );
  }

  final String? dialingCode;

  final String? areaCode;

  final String? number;

  final String? formatted;

  final bool? callOptedOut;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'dialing_code': dialingCode,
        'area_code': areaCode,
        'number': number,
        'formatted': formatted,
        'call_opted_out': callOptedOut,
      };
}

/// A [AccountContactEntry]'s `mobile`.
class AccountContactEntryMobile extends Dto {
  const AccountContactEntryMobile({
    this.dialingCode,
    this.areaCode,
    this.number,
    this.formatted,
    this.callOptedOut,
  });

  static AccountContactEntryMobile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactEntryMobile(
      dialingCode: readText(source['dialing_code']),
      areaCode: readText(source['area_code']),
      number: readText(source['number']),
      formatted: readText(source['formatted']),
      callOptedOut: readFlag(source['call_opted_out']),
    );
  }

  final String? dialingCode;

  final String? areaCode;

  final String? number;

  final String? formatted;

  final bool? callOptedOut;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'dialing_code': dialingCode,
        'area_code': areaCode,
        'number': number,
        'formatted': formatted,
        'call_opted_out': callOptedOut,
      };
}

/// A [AccountContactEntry]'s `address`.
class AccountContactEntryAddress extends Dto {
  const AccountContactEntryAddress({
    this.line1,
    this.line2,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.countryCode,
  });

  static AccountContactEntryAddress? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactEntryAddress(
      line1: readText(source['line_1']),
      line2: readText(source['line_2']),
      city: readText(source['city']),
      state: readText(source['state']),
      postalCode: readText(source['postal_code']),
      country: readText(source['country']),
      countryCode: readAny(source['country_code']),
    );
  }

  final String? line1;

  final String? line2;

  final String? city;

  final String? state;

  final String? postalCode;

  final String? country;

  /// Untyped: null in every record measured.
  final Object? countryCode;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'line_1': line1,
        'line_2': line2,
        'city': city,
        'state': state,
        'postal_code': postalCode,
        'country': country,
        'country_code': countryCode,
      };
}

/// One entry of a [AccountContactEntry]'s `custom_attributes`.
class AccountContactEntryCustomAttribute extends Dto {
  const AccountContactEntryCustomAttribute({
    this.name,
    this.value,
  });

  static AccountContactEntryCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactEntryCustomAttribute(
      name: readText(source['name']),
      value: readAny(source['value']),
    );
  }

  final String? name;

  /// Untyped: the records measured disagree on its type.
  final Object? value;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'value': value,
      };
}

/// A [AccountContactEntry]'s `created_by`.
class AccountContactEntryCreatedBy extends Dto {
  const AccountContactEntryCreatedBy({
    this.object,
    this.name,
  });

  static AccountContactEntryCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactEntryCreatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// A [AccountContactEntry]'s `last_updated_by`.
class AccountContactEntryLastUpdatedBy extends Dto {
  const AccountContactEntryLastUpdatedBy({
    this.object,
    this.name,
  });

  static AccountContactEntryLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactEntryLastUpdatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// A [AccountContactContacts]'s `name`.
class AccountContactContactsName extends Dto {
  const AccountContactContactsName({
    this.salutation,
    this.first,
    this.middle,
    this.last,
    this.designation,
  });

  static AccountContactContactsName? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactContactsName(
      salutation: readText(source['salutation']),
      first: readText(source['first']),
      middle: readText(source['middle']),
      last: readText(source['last']),
      designation: readText(source['designation']),
    );
  }

  final String? salutation;

  final String? first;

  final String? middle;

  final String? last;

  final String? designation;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'salutation': salutation,
        'first': first,
        'middle': middle,
        'last': last,
        'designation': designation,
      };
}

/// A [AccountContactContacts]'s `email`.
class AccountContactContactsEmail extends Dto {
  const AccountContactContactsEmail({
    this.address,
    this.emailOptedOut,
  });

  static AccountContactContactsEmail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactContactsEmail(
      address: readText(source['address']),
      emailOptedOut: readAny(source['email_opted_out']),
    );
  }

  final String? address;

  /// Untyped: null in every record measured.
  final Object? emailOptedOut;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'address': address,
        'email_opted_out': emailOptedOut,
      };
}

/// A [AccountContactContacts]'s `phone`.
class AccountContactContactsPhone extends Dto {
  const AccountContactContactsPhone({
    this.dialingCode,
    this.areaCode,
    this.number,
    this.formatted,
    this.callOptedOut,
  });

  static AccountContactContactsPhone? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactContactsPhone(
      dialingCode: readText(source['dialing_code']),
      areaCode: readText(source['area_code']),
      number: readText(source['number']),
      formatted: readText(source['formatted']),
      callOptedOut: readAny(source['call_opted_out']),
    );
  }

  final String? dialingCode;

  final String? areaCode;

  final String? number;

  final String? formatted;

  /// Untyped: null in every record measured.
  final Object? callOptedOut;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'dialing_code': dialingCode,
        'area_code': areaCode,
        'number': number,
        'formatted': formatted,
        'call_opted_out': callOptedOut,
      };
}

/// A [AccountContactContacts]'s `mobile`.
class AccountContactContactsMobile extends Dto {
  const AccountContactContactsMobile({
    this.dialingCode,
    this.areaCode,
    this.number,
    this.formatted,
    this.callOptedOut,
  });

  static AccountContactContactsMobile? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactContactsMobile(
      dialingCode: readText(source['dialing_code']),
      areaCode: readText(source['area_code']),
      number: readText(source['number']),
      formatted: readText(source['formatted']),
      callOptedOut: readAny(source['call_opted_out']),
    );
  }

  final String? dialingCode;

  final String? areaCode;

  final String? number;

  final String? formatted;

  /// Untyped: null in every record measured.
  final Object? callOptedOut;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'dialing_code': dialingCode,
        'area_code': areaCode,
        'number': number,
        'formatted': formatted,
        'call_opted_out': callOptedOut,
      };
}

/// A [AccountContactContacts]'s `address`.
class AccountContactContactsAddress extends Dto {
  const AccountContactContactsAddress({
    this.line1,
    this.line2,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.countryCode,
  });

  static AccountContactContactsAddress? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactContactsAddress(
      line1: readText(source['line_1']),
      line2: readAny(source['line_2']),
      city: readText(source['city']),
      state: readText(source['state']),
      postalCode: readText(source['postal_code']),
      country: readText(source['country']),
      countryCode: readAny(source['country_code']),
    );
  }

  final String? line1;

  /// Untyped: null in every record measured.
  final Object? line2;

  final String? city;

  final String? state;

  final String? postalCode;

  final String? country;

  /// Untyped: null in every record measured.
  final Object? countryCode;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'line_1': line1,
        'line_2': line2,
        'city': city,
        'state': state,
        'postal_code': postalCode,
        'country': country,
        'country_code': countryCode,
      };
}

/// A [AccountContactContacts]'s `created_by`.
class AccountContactContactsCreatedBy extends Dto {
  const AccountContactContactsCreatedBy({
    this.object,
    this.name,
  });

  static AccountContactContactsCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactContactsCreatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// A [AccountContactContacts]'s `last_updated_by`.
class AccountContactContactsLastUpdatedBy extends Dto {
  const AccountContactContactsLastUpdatedBy({
    this.object,
    this.name,
  });

  static AccountContactContactsLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountContactContactsLastUpdatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// A [AccountPaymentMethodPaymentMethod]'s `processor`.
class AccountPaymentMethodPaymentMethodProcessor extends Dto {
  const AccountPaymentMethodPaymentMethodProcessor({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static AccountPaymentMethodPaymentMethodProcessor? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPaymentMethodPaymentMethodProcessor(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'href': href,
      };
}

/// A [AccountPaymentMethodPaymentMethod]'s `created_by`.
class AccountPaymentMethodPaymentMethodCreatedBy extends Dto {
  const AccountPaymentMethodPaymentMethodCreatedBy({
    this.object,
    this.name,
  });

  static AccountPaymentMethodPaymentMethodCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPaymentMethodPaymentMethodCreatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// A [AccountPaymentMethodPaymentMethod]'s `last_updated_by`.
class AccountPaymentMethodPaymentMethodLastUpdatedBy extends Dto {
  const AccountPaymentMethodPaymentMethodLastUpdatedBy({
    this.object,
    this.name,
  });

  static AccountPaymentMethodPaymentMethodLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountPaymentMethodPaymentMethodLastUpdatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// A [AccountInvoice]'s `custom_form`.
class AccountInvoiceCustomForm extends Dto {
  const AccountInvoiceCustomForm({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static AccountInvoiceCustomForm? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceCustomForm(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'href': href,
      };
}

/// A [AccountInvoice]'s `currency`.
class AccountInvoiceCurrency extends Dto {
  const AccountInvoiceCurrency({
    this.object,
    this.id,
    this.name,
    this.code,
    this.href,
  });

  static AccountInvoiceCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceCurrency(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'code': code,
        'href': href,
      };
}

/// A [AccountInvoice]'s `account`.
class AccountInvoiceAccount extends Dto {
  const AccountInvoiceAccount({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static AccountInvoiceAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceAccount(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'href': href,
      };
}

/// A [AccountInvoice]'s `order`.
class AccountInvoiceOrder extends Dto {
  const AccountInvoiceOrder({
    this.object,
    this.id,
    this.name,
    this.href,
  });

  static AccountInvoiceOrder? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceOrder(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'href': href,
      };
}

/// A [AccountInvoice]'s `last_payment`.
class AccountInvoiceLastPayment extends Dto {
  const AccountInvoiceLastPayment({
    this.id,
    this.amount,
    this.createdOn,
  });

  static AccountInvoiceLastPayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceLastPayment(
      id: readText(source['id']),
      amount: readText(source['amount']),
      createdOn: readText(source['created_on']),
    );
  }

  final String? id;

  final String? amount;

  final String? createdOn;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'id': id,
        'amount': amount,
        'created_on': createdOn,
      };
}

/// A [AccountInvoice]'s `created_by`.
class AccountInvoiceCreatedBy extends Dto {
  const AccountInvoiceCreatedBy({
    this.object,
    this.name,
  });

  static AccountInvoiceCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceCreatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// A [AccountInvoice]'s `last_updated_by`.
class AccountInvoiceLastUpdatedBy extends Dto {
  const AccountInvoiceLastUpdatedBy({
    this.object,
    this.name,
  });

  static AccountInvoiceLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountInvoiceLastUpdatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// A [AccountCreditNote]'s `account`.
class AccountCreditNoteAccount extends Dto {
  const AccountCreditNoteAccount({
    this.object,
    this.id,
    this.name,
    this.code,
    this.href,
  });

  static AccountCreditNoteAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCreditNoteAccount(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'code': code,
        'href': href,
      };
}

/// A [AccountCreditNote]'s `currency`.
class AccountCreditNoteCurrency extends Dto {
  const AccountCreditNoteCurrency({
    this.object,
    this.id,
    this.name,
    this.code,
    this.href,
  });

  static AccountCreditNoteCurrency? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCreditNoteCurrency(
      object: readText(source['object']),
      id: readText(source['id']),
      name: readText(source['name']),
      code: readText(source['code']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? name;

  final String? code;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'name': name,
        'code': code,
        'href': href,
      };
}

/// A [AccountCreditNote]'s `payment`.
class AccountCreditNotePayment extends Dto {
  const AccountCreditNotePayment({
    this.object,
    this.id,
    this.href,
  });

  static AccountCreditNotePayment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCreditNotePayment(
      object: readText(source['object']),
      id: readText(source['id']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'href': href,
      };
}

/// One entry of a [AccountCreditNote]'s `invoices`.
class AccountCreditNoteInvoice extends Dto {
  const AccountCreditNoteInvoice({
    this.object,
    this.id,
    this.href,
  });

  static AccountCreditNoteInvoice? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCreditNoteInvoice(
      object: readText(source['object']),
      id: readText(source['id']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'href': href,
      };
}

/// One entry of a [AccountCreditNote]'s `custom_attributes`.
class AccountCreditNoteCustomAttribute extends Dto {
  const AccountCreditNoteCustomAttribute({
    this.object,
    this.id,
    this.type,
    this.name,
    this.value,
    this.href,
  });

  static AccountCreditNoteCustomAttribute? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCreditNoteCustomAttribute(
      object: readText(source['object']),
      id: readText(source['id']),
      type: readText(source['type']),
      name: readText(source['name']),
      value: readAny(source['value']),
      href: readText(source['href']),
    );
  }

  final String? object;

  final String? id;

  final String? type;

  final String? name;

  /// Untyped: the records measured disagree on its type.
  final Object? value;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'id': id,
        'type': type,
        'name': name,
        'value': value,
        'href': href,
      };
}

/// A [AccountCreditNote]'s `created_by`.
class AccountCreditNoteCreatedBy extends Dto {
  const AccountCreditNoteCreatedBy({
    this.object,
    this.name,
  });

  static AccountCreditNoteCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCreditNoteCreatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// A [AccountCreditNote]'s `last_updated_by`.
class AccountCreditNoteLastUpdatedBy extends Dto {
  const AccountCreditNoteLastUpdatedBy({
    this.object,
    this.name,
  });

  static AccountCreditNoteLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountCreditNoteLastUpdatedBy(
      object: readText(source['object']),
      name: readText(source['name']),
    );
  }

  final String? object;

  final String? name;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'name': name,
      };
}

/// The account note body.
class AccountNote extends Dto {
  const AccountNote({
    this.account,
    this.attachments,
    this.content,
    this.createdBy,
    this.createdOn,
    this.group,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.user,
    this.version,
    this.watchers,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/notes',
    'GET /api/{api_version}/accounts/{account_id}/notes/{note_id}',
    'POST /api/{api_version}/accounts/{account_id}/notes',
    'PATCH /api/{api_version}/accounts/{account_id}/notes/{note_id}',
  ];

  static AccountNote? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'note');
    if (source == null) return null;
    return AccountNote(
      account: AccountNoteAccount.fromMap(source['account']),
      attachments: readList<AccountNoteAttachment>(
          source['attachments'], AccountNoteAttachment.fromMap),
      content: readText(source['content']),
      createdBy: AccountNoteCreatedBy.fromMap(source['created_by']),
      createdOn: readText(source['created_on']),
      group: readAny(source['group']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy:
          AccountNoteLastUpdatedBy.fromMap(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      object: readText(source['object']),
      user: readAny(source['user']),
      version: readInteger(source['version']),
      watchers: readList<AccountNoteWatcher>(
          source['watchers'], AccountNoteWatcher.fromMap),
    );
  }

  final AccountNoteAccount? account;

  final List<AccountNoteAttachment?>? attachments;

  final String? content;

  final AccountNoteCreatedBy? createdBy;

  final String? createdOn;

  /// Untyped: never populated in the records measured.
  final Object? group;

  final String? href;

  final String? id;

  final AccountNoteLastUpdatedBy? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? object;

  /// Untyped: never populated in the records measured.
  final Object? user;

  final int? version;

  final List<AccountNoteWatcher?>? watchers;

  @override
  String? get envelopeKey => 'note';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account': account,
        'attachments': attachments,
        'content': content,
        'created_by': createdBy,
        'created_on': createdOn,
        'group': group,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'user': user,
        'version': version,
        'watchers': watchers,
      };
}

/// A page of AccountNote records.
class AccountNoteList extends Dto {
  const AccountNoteList({
    this.data,
    this.object,
    this.pagination,
    this.url,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/notes',
  ];

  static AccountNoteList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountNoteList(
      data: readList<AccountNote>(source['data'], AccountNote.fromMap),
      object: readText(source['object']),
      pagination: Pagination.fromMap(source['pagination']),
      url: readText(source['url']),
    );
  }

  final List<AccountNote?>? data;

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

/// A [AccountNote]'s `account`.
class AccountNoteAccount extends Dto {
  const AccountNoteAccount({
    this.href,
    this.id,
    this.object,
  });

  static AccountNoteAccount? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountNoteAccount(
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

/// One entry of a [AccountNote]'s `attachments`.
class AccountNoteAttachment extends Dto {
  const AccountNoteAttachment({
    this.contentType,
    this.filename,
    this.href,
    this.size,
    this.uuid,
  });

  static AccountNoteAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountNoteAttachment(
      contentType: readText(source['content_type']),
      filename: readText(source['filename']),
      href: readText(source['href']),
      size: readInteger(source['size']),
      uuid: readText(source['uuid']),
    );
  }

  final String? contentType;

  final String? filename;

  final String? href;

  final int? size;

  final String? uuid;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'content_type': contentType,
        'filename': filename,
        'href': href,
        'size': size,
        'uuid': uuid,
      };
}

/// One entry of a [AccountNote]'s `watchers`.
class AccountNoteWatcher extends Dto {
  const AccountNoteWatcher({
    this.email,
    this.name,
    this.type,
  });

  static AccountNoteWatcher? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountNoteWatcher(
      email: readText(source['email']),
      name: readText(source['name']),
      type: readText(source['type']),
    );
  }

  final String? email;

  final String? name;

  final String? type;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'email': email,
        'name': name,
        'type': type,
      };
}

/// A [AccountNote]'s `created_by`.
class AccountNoteCreatedBy extends Dto {
  const AccountNoteCreatedBy({
    this.name,
    this.object,
  });

  static AccountNoteCreatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountNoteCreatedBy(
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

/// A [AccountNote]'s `last_updated_by`.
class AccountNoteLastUpdatedBy extends Dto {
  const AccountNoteLastUpdatedBy({
    this.name,
    this.object,
  });

  static AccountNoteLastUpdatedBy? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountNoteLastUpdatedBy(
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

/// A file attached to a note.
class NoteAttachment extends Dto {
  const NoteAttachment({
    this.uuid,
    this.filename,
    this.contentType,
    this.size,
    this.href,
  });

  static NoteAttachment? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return NoteAttachment(
      uuid: readText(source['uuid']),
      filename: readText(source['filename']),
      contentType: readText(source['content_type']),
      size: readInteger(source['size']),
      href: readText(source['href']),
    );
  }

  final String? uuid;

  final String? filename;

  final String? contentType;

  final int? size;

  final String? href;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'uuid': uuid,
        'filename': filename,
        'content_type': contentType,
        'size': size,
        'href': href,
      };
}

/// A listing of one note's attachments - the same envelope, different records.
class NoteFileList extends Dto {
  const NoteFileList({
    this.object,
    this.url,
    this.data,
    this.pagination,
  });

  static NoteFileList? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return NoteFileList(
      object: readText(source['object']),
      url: readText(source['url']),
      data: readList<NoteAttachment>(source['data'], NoteAttachment.fromMap),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  final String? object;

  final String? url;

  final List<NoteAttachment?>? data;

  final Pagination? pagination;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'url': url,
        'data': data,
        'pagination': pagination,
      };
}

/// What `getAccountKpis` answers, under `account_kpis`.
class AccountKpis extends Dto {
  const AccountKpis({
    this.object,
    this.totalRevenue,
    this.monthlyRecurringRevenue,
    this.totalCollected,
    this.totalRefunded,
    this.totalOutstanding,
    this.totalOverdue,
    this.totalBalance,
    this.totalCreditBalance,
    this.totalOrders,
    this.activeOrders,
    this.lastReactivatedAt,
    this.lastCancelledAt,
    this.deletedAt,
    this.computedAt,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/kpis',
  ];

  static AccountKpis? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'account_kpis');
    if (source == null) return null;
    return AccountKpis(
      object: readText(source['object']),
      totalRevenue: readText(source['total_revenue']),
      monthlyRecurringRevenue: readText(source['monthly_recurring_revenue']),
      totalCollected: readText(source['total_collected']),
      totalRefunded: readText(source['total_refunded']),
      totalOutstanding: readText(source['total_outstanding']),
      totalOverdue: readText(source['total_overdue']),
      totalBalance: readText(source['total_balance']),
      totalCreditBalance: readText(source['total_credit_balance']),
      totalOrders: readInteger(source['total_orders']),
      activeOrders: readInteger(source['active_orders']),
      lastReactivatedAt: readAny(source['last_reactivated_at']),
      lastCancelledAt: readAny(source['last_cancelled_at']),
      deletedAt: readAny(source['deleted_at']),
      computedAt: readText(source['computed_at']),
    );
  }

  final String? object;

  final String? totalRevenue;

  final String? monthlyRecurringRevenue;

  final String? totalCollected;

  final String? totalRefunded;

  final String? totalOutstanding;

  final String? totalOverdue;

  final String? totalBalance;

  final String? totalCreditBalance;

  final int? totalOrders;

  final int? activeOrders;

  /// Null in every record measured, so untyped.
  final Object? lastReactivatedAt;

  /// Null in every record measured, so untyped.
  final Object? lastCancelledAt;

  /// Null in every record measured, so untyped.
  final Object? deletedAt;

  final String? computedAt;

  @override
  String? get envelopeKey => 'account_kpis';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'object': object,
        'total_revenue': totalRevenue,
        'monthly_recurring_revenue': monthlyRecurringRevenue,
        'total_collected': totalCollected,
        'total_refunded': totalRefunded,
        'total_outstanding': totalOutstanding,
        'total_overdue': totalOverdue,
        'total_balance': totalBalance,
        'total_credit_balance': totalCreditBalance,
        'total_orders': totalOrders,
        'active_orders': activeOrders,
        'last_reactivated_at': lastReactivatedAt,
        'last_cancelled_at': lastCancelledAt,
        'deleted_at': deletedAt,
        'computed_at': computedAt,
      };
}

/// What `getAccountFinancialSummary` answers, under `account`: its `name` and
/// the `financial_summary` itself.
class AccountFinancialSummary extends Dto {
  const AccountFinancialSummary({
    this.name,
    this.financialSummary,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/financial_summary',
  ];

  static AccountFinancialSummary? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'account');
    if (source == null) return null;
    return AccountFinancialSummary(
      name: readText(source['name']),
      financialSummary:
          AccountFinancialSummaryDetail.fromMap(source['financial_summary']),
    );
  }

  final String? name;

  final AccountFinancialSummaryDetail? financialSummary;

  @override
  String? get envelopeKey => 'account';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'name': name,
        'financial_summary': financialSummary,
      };
}

/// A [AccountFinancialSummary]'s `financial_summary`.
class AccountFinancialSummaryDetail extends Dto {
  const AccountFinancialSummaryDetail({
    this.totalDue,
    this.totalGrand,
    this.totalPaid,
    this.invoiceCount,
    this.totalDueInvoiceCount,
    this.totalOverdueAmount,
    this.totalOverdueInvoiceCount,
    this.collectedThisMonth,
  });

  static AccountFinancialSummaryDetail? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return AccountFinancialSummaryDetail(
      totalDue: readText(source['total_due']),
      totalGrand: readText(source['total_grand']),
      totalPaid: readText(source['total_paid']),
      invoiceCount: readInteger(source['invoice_count']),
      totalDueInvoiceCount: readInteger(source['total_due_invoice_count']),
      totalOverdueAmount: readText(source['total_overdue_amount']),
      totalOverdueInvoiceCount:
          readInteger(source['total_overdue_invoice_count']),
      collectedThisMonth: readText(source['collected_this_month']),
    );
  }

  final String? totalDue;

  final String? totalGrand;

  final String? totalPaid;

  final int? invoiceCount;

  final int? totalDueInvoiceCount;

  final String? totalOverdueAmount;

  final int? totalOverdueInvoiceCount;

  final String? collectedThisMonth;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'total_due': totalDue,
        'total_grand': totalGrand,
        'total_paid': totalPaid,
        'invoice_count': invoiceCount,
        'total_due_invoice_count': totalDueInvoiceCount,
        'total_overdue_amount': totalOverdueAmount,
        'total_overdue_invoice_count': totalOverdueInvoiceCount,
        'collected_this_month': collectedThisMonth,
      };
}

/// What `getAccountCustomObject` answers, under `custom_object`: the schema,
/// with the account's instances of it and their own `pagination`.
class AccountCustomObjectRead extends Dto {
  const AccountCustomObjectRead({
    this.createdBy,
    this.createdOn,
    this.customComponent,
    this.description,
    this.displayName,
    this.href,
    this.id,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.name,
    this.object,
    this.relation,
    this.useIn,
    this.instances,
    this.pagination,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/custom_objects/{custom_object_id}',
  ];

  static AccountCustomObjectRead? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_object');
    if (source == null) return null;
    return AccountCustomObjectRead(
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      customComponent: readAny(source['custom_component']),
      description: readText(source['description']),
      displayName: readText(source['display_name']),
      href: readText(source['href']),
      id: readText(source['id']),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readText(source['last_updated_on']),
      name: readText(source['name']),
      object: readText(source['object']),
      relation: readText(source['relation']),
      useIn: readText(source['use_in']),
      instances: readList<Object>(source['instances'], readAny),
      pagination: Pagination.fromMap(source['pagination']),
    );
  }

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  /// Null in every record measured, so untyped.
  final Object? customComponent;

  final String? description;

  final String? displayName;

  final String? href;

  final String? id;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  final String? lastUpdatedOn;

  final String? name;

  final String? object;

  final String? relation;

  final String? useIn;

  /// Empty in every record measured, so its entries are untyped.
  final List<Object?>? instances;

  final Pagination? pagination;

  @override
  String? get envelopeKey => 'custom_object';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_component': customComponent,
        'description': description,
        'display_name': displayName,
        'href': href,
        'id': id,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'name': name,
        'object': object,
        'relation': relation,
        'use_in': useIn,
        'instances': instances,
        'pagination': pagination,
      };
}

/// What `getAccountComponentObject` answers, under `custom_component_object`:
/// the fields of one entry of the listing `getAccountComponentObjects` answers.
class AccountComponentObject extends Dto {
  const AccountComponentObject({
    this.accounts,
    this.attributeGroups,
    this.attributes,
    this.code,
    this.component,
    this.createdBy,
    this.createdOn,
    this.customForm,
    this.customObjects,
    this.href,
    this.id,
    this.items,
    this.lastUpdatedBy,
    this.lastUpdatedOn,
    this.object,
    this.orders,
    this.parents,
    this.quotes,
    this.restrictions,
    this.status,
    this.version,
    this.workflowData,
    this.workflowStage,
    this.workflowStatus,
    this.workflowStatusUuid,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/accounts/{account_id}/component/{component_id}/{component_object_id}',
  ];

  static AccountComponentObject? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'custom_component_object');
    if (source == null) return null;
    return AccountComponentObject(
      accounts: readList<Object>(source['accounts'], readAny),
      attributeGroups: readList<Object>(source['attribute_groups'], readAny),
      attributes: readList<Object>(source['attributes'], readAny),
      code: readText(source['code']),
      component: ComponentObjectsDataDetail.fromMap(source['component']),
      createdBy: readAny(source['created_by']),
      createdOn: readText(source['created_on']),
      customForm: ComponentObjectsDataCustomForm.fromMap(source['custom_form']),
      customObjects: readList<Object>(source['custom_objects'], readAny),
      href: readText(source['href']),
      id: readText(source['id']),
      items: readList<Object>(source['items'], readAny),
      lastUpdatedBy: readAny(source['last_updated_by']),
      lastUpdatedOn: readAny(source['last_updated_on']),
      object: readText(source['object']),
      orders: readList<Object>(source['orders'], readAny),
      parents: readList<ComponentObjectsDataParent>(
          source['parents'], ComponentObjectsDataParent.fromMap),
      quotes: readList<Object>(source['quotes'], readAny),
      restrictions: readList<Object>(source['restrictions'], readAny),
      status: readText(source['status']),
      version: readInteger(source['version']),
      workflowData: readList<Object>(source['workflow_data'], readAny),
      workflowStage: readAny(source['workflow_stage']),
      workflowStatus: readAny(source['workflow_status']),
      workflowStatusUuid: readAny(source['workflow_status_uuid']),
    );
  }

  final List<Object?>? accounts;

  final List<Object?>? attributeGroups;

  final List<Object?>? attributes;

  final String? code;

  final ComponentObjectsDataDetail? component;

  /// Null in every record measured, so untyped.
  final Object? createdBy;

  final String? createdOn;

  final ComponentObjectsDataCustomForm? customForm;

  final List<Object?>? customObjects;

  final String? href;

  final String? id;

  final List<Object?>? items;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedBy;

  /// Null in every record measured, so untyped.
  final Object? lastUpdatedOn;

  final String? object;

  final List<Object?>? orders;

  final List<ComponentObjectsDataParent?>? parents;

  final List<Object?>? quotes;

  final List<Object?>? restrictions;

  final String? status;

  final int? version;

  final List<Object?>? workflowData;

  /// Null in every record measured, so untyped.
  final Object? workflowStage;

  /// Null in every record measured, so untyped.
  final Object? workflowStatus;

  /// Null in every record measured, so untyped.
  final Object? workflowStatusUuid;

  @override
  String? get envelopeKey => 'custom_component_object';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounts': accounts,
        'attribute_groups': attributeGroups,
        'attributes': attributes,
        'code': code,
        'component': component,
        'created_by': createdBy,
        'created_on': createdOn,
        'custom_form': customForm,
        'custom_objects': customObjects,
        'href': href,
        'id': id,
        'items': items,
        'last_updated_by': lastUpdatedBy,
        'last_updated_on': lastUpdatedOn,
        'object': object,
        'orders': orders,
        'parents': parents,
        'quotes': quotes,
        'restrictions': restrictions,
        'status': status,
        'version': version,
        'workflow_data': workflowData,
        'workflow_stage': workflowStage,
        'workflow_status': workflowStatus,
        'workflow_status_uuid': workflowStatusUuid,
      };
}
