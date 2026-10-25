import '../errors.dart';
import 'exsited_client.dart';

/// Builds one resource family over a client.
typedef ResourceFactory = Object Function(ExsitedClient client);

final Map<String, ResourceFactory> _resourceModules = <String, ResourceFactory>{
  'abaFiles': (ExsitedClient client) => client.abaFiles,
  'accountEmails': (ExsitedClient client) => client.accountEmails,
  'accountGroups': (ExsitedClient client) => client.accountGroups,
  'accountingCodes': (ExsitedClient client) => client.accountingCodes,
  'accounts': (ExsitedClient client) => client.accounts,
  'actionScripts': (ExsitedClient client) => client.actionScripts,
  'additionalCodes': (ExsitedClient client) => client.additionalCodes,
  'alertResponsibilities': (ExsitedClient client) =>
      client.alertResponsibilities,
  'alertResponsibility': (ExsitedClient client) => client.alertResponsibility,
  'alerts': (ExsitedClient client) => client.alerts,
  'applications': (ExsitedClient client) => client.applications,
  'approvalProfiles': (ExsitedClient client) => client.approvalProfiles,
  'approvalUserGroups': (ExsitedClient client) => client.approvalUserGroups,
  'approvals': (ExsitedClient client) => client.approvals,
  'attributeAttachments': (ExsitedClient client) => client.attributeAttachments,
  'billingPeriods': (ExsitedClient client) => client.billingPeriods,
  'bookings': (ExsitedClient client) => client.bookings,
  'chargingPeriods': (ExsitedClient client) => client.chargingPeriods,
  'communicationProfiles': (ExsitedClient client) =>
      client.communicationProfiles,
  'communications': (ExsitedClient client) => client.communications,
  'countries': (ExsitedClient client) => client.countries,
  'creditNoteApplications': (ExsitedClient client) =>
      client.creditNoteApplications,
  'creditNotes': (ExsitedClient client) => client.creditNotes,
  'customAttributes': (ExsitedClient client) => client.customAttributes,
  'customComponents': (ExsitedClient client) => client.customComponents,
  'customEvents': (ExsitedClient client) => client.customEvents,
  'customFeatures': (ExsitedClient client) => client.customFeatures,
  'customFields': (ExsitedClient client) => client.customFields,
  'customForms': (ExsitedClient client) => client.customForms,
  'dayOfMonth': (ExsitedClient client) => client.dayOfMonth,
  'departments': (ExsitedClient client) => client.departments,
  'designations': (ExsitedClient client) => client.designations,
  'documentTemplates': (ExsitedClient client) => client.documentTemplates,
  'emailTemplates': (ExsitedClient client) => client.emailTemplates,
  'employees': (ExsitedClient client) => client.employees,
  'events': (ExsitedClient client) => client.events,
  'express': (ExsitedClient client) => client.express,
  'externalDatabases': (ExsitedClient client) => client.externalDatabases,
  'fulfillmentProfiles': (ExsitedClient client) => client.fulfillmentProfiles,
  'fulfillmentTerms': (ExsitedClient client) => client.fulfillmentTerms,
  'giftCertificates': (ExsitedClient client) => client.giftCertificates,
  'integrationConnections': (ExsitedClient client) =>
      client.integrationConnections,
  'inventoryAdjustments': (ExsitedClient client) => client.inventoryAdjustments,
  'invoiceTerms': (ExsitedClient client) => client.invoiceTerms,
  'invoices': (ExsitedClient client) => client.invoices,
  'itemFulfillments': (ExsitedClient client) => client.itemFulfillments,
  'itemReceipts': (ExsitedClient client) => client.itemReceipts,
  'items': (ExsitedClient client) => client.items,
  'labours': (ExsitedClient client) => client.labours,
  'milestones': (ExsitedClient client) => client.milestones,
  'noteAttachments': (ExsitedClient client) => client.noteAttachments,
  'noteGroups': (ExsitedClient client) => client.noteGroups,
  'orders': (ExsitedClient client) => client.orders,
  'organisation': (ExsitedClient client) => client.organisation,
  'organisations': (ExsitedClient client) => client.organisations,
  'payments': (ExsitedClient client) => client.payments,
  'portals': (ExsitedClient client) => client.portals,
  'pricingPeriods': (ExsitedClient client) => client.pricingPeriods,
  'proformaInvoices': (ExsitedClient client) => client.proformaInvoices,
  'purchaseCreditNoteApplications': (ExsitedClient client) =>
      client.purchaseCreditNoteApplications,
  'purchaseCreditNotes': (ExsitedClient client) => client.purchaseCreditNotes,
  'purchaseExpress': (ExsitedClient client) => client.purchaseExpress,
  'purchaseInvoices': (ExsitedClient client) => client.purchaseInvoices,
  'purchaseOrders': (ExsitedClient client) => client.purchaseOrders,
  'purchasePayments': (ExsitedClient client) => client.purchasePayments,
  'purchaseRefunds': (ExsitedClient client) => client.purchaseRefunds,
  'quoteOrders': (ExsitedClient client) => client.quoteOrders,
  'receiveTerms': (ExsitedClient client) => client.receiveTerms,
  'reconciliations': (ExsitedClient client) => client.reconciliations,
  'refunds': (ExsitedClient client) => client.refunds,
  'rentalAssets': (ExsitedClient client) => client.rentalAssets,
  'reports': (ExsitedClient client) => client.reports,
  'returnMerchandiseAuthorisations': (ExsitedClient client) =>
      client.returnMerchandiseAuthorisations,
  'returnVendorAuthorizations': (ExsitedClient client) =>
      client.returnVendorAuthorizations,
  'roles': (ExsitedClient client) => client.roles,
  'salesReps': (ExsitedClient client) => client.salesReps,
  'salutations': (ExsitedClient client) => client.salutations,
  'settings': (ExsitedClient client) => client.settings,
  'settingsWorkflows': (ExsitedClient client) => client.settingsWorkflows,
  'shippingPackages': (ExsitedClient client) => client.shippingPackages,
  'shippingRules': (ExsitedClient client) => client.shippingRules,
  'systemEvents': (ExsitedClient client) => client.systemEvents,
  'tasks': (ExsitedClient client) => client.tasks,
  'teams': (ExsitedClient client) => client.teams,
  'timePeriods': (ExsitedClient client) => client.timePeriods,
  'timesheets': (ExsitedClient client) => client.timesheets,
  'uom': (ExsitedClient client) => client.uom,
  'usages': (ExsitedClient client) => client.usages,
  'webhooks': (ExsitedClient client) => client.webhooks,
  'workflows': (ExsitedClient client) => client.workflows,
  'zones': (ExsitedClient client) => client.zones,
};

/// Names the client answers by itself, which a resource must not shadow.
const Set<String> _clientMemberNames = <String>{
  'config',
  'name',
  'abaFiles',
  'accountEmails',
  'accountGroups',
  'accountingCodes',
  'accounts',
  'actionScripts',
  'additionalCodes',
  'alertResponsibilities',
  'alertResponsibility',
  'alerts',
  'applications',
  'approvalProfiles',
  'approvalUserGroups',
  'approvals',
  'attributeAttachments',
  'billingPeriods',
  'bookings',
  'chargingPeriods',
  'communicationProfiles',
  'communications',
  'countries',
  'creditNoteApplications',
  'creditNotes',
  'customAttributes',
  'customComponents',
  'customEvents',
  'customFeatures',
  'customFields',
  'customForms',
  'dayOfMonth',
  'departments',
  'designations',
  'documentTemplates',
  'emailTemplates',
  'employees',
  'events',
  'express',
  'externalDatabases',
  'fulfillmentProfiles',
  'fulfillmentTerms',
  'giftCertificates',
  'integrationConnections',
  'inventoryAdjustments',
  'invoiceTerms',
  'invoices',
  'itemFulfillments',
  'itemReceipts',
  'items',
  'labours',
  'milestones',
  'noteAttachments',
  'noteGroups',
  'orders',
  'organisation',
  'organisations',
  'payments',
  'portals',
  'pricingPeriods',
  'proformaInvoices',
  'purchaseCreditNoteApplications',
  'purchaseCreditNotes',
  'purchaseExpress',
  'purchaseInvoices',
  'purchaseOrders',
  'purchasePayments',
  'purchaseRefunds',
  'quoteOrders',
  'receiveTerms',
  'reconciliations',
  'refunds',
  'rentalAssets',
  'reports',
  'returnMerchandiseAuthorisations',
  'returnVendorAuthorizations',
  'roles',
  'salesReps',
  'salutations',
  'settings',
  'settingsWorkflows',
  'shippingPackages',
  'shippingRules',
  'systemEvents',
  'tasks',
  'teams',
  'timePeriods',
  'timesheets',
  'uom',
  'usages',
  'webhooks',
  'workflows',
  'zones',
  'listResourceNames',
  'resourceByName',
  'sendApiRequest',
  'sendGetRequest',
  'sendPostRequest',
  'sendPutRequest',
  'sendPatchRequest',
  'sendDeleteRequest',
  'isClosed',
  'close',
  'closeClient',
  'hashCode',
  'runtimeType',
  'noSuchMethod',
  'toString',
};

/// Dart's reserved words, which can never name a member.
const Set<String> _reservedWords = <String>{
  'assert',
  'break',
  'case',
  'catch',
  'class',
  'const',
  'continue',
  'default',
  'do',
  'else',
  'enum',
  'extends',
  'false',
  'final',
  'finally',
  'for',
  'if',
  'in',
  'is',
  'new',
  'null',
  'rethrow',
  'return',
  'super',
  'switch',
  'this',
  'throw',
  'true',
  'try',
  'var',
  'void',
  'while',
  'with',
};

final RegExp _identifier = RegExp(r'^[A-Za-z][A-Za-z0-9_$]*$');

/// Make a resource family reachable as `client.resourceByName(resourceName)`.
void registerResourceModule(String resourceName, ResourceFactory factory) {
  if (resourceName.startsWith('_') ||
      !_identifier.hasMatch(resourceName) ||
      _reservedWords.contains(resourceName)) {
    throw SdkUsageError(
        "cannot register resource '$resourceName': a resource name must be a "
        'Dart identifier that is not a reserved word and does not start with an '
        'underscore, or no lookup could ever reach it - pick another name');
  }
  if (_clientMemberNames.contains(resourceName)) {
    throw SdkUsageError(
        "cannot register resource '$resourceName': ExsitedClient already "
        'has a member of that name, and it would win every lookup - pick '
        'another name');
  }
  final registered = _resourceModules[resourceName];
  if (registered != null && registered != factory) {
    // Re-registering the same factory is a no-op; a different one is refused.
    throw SdkUsageError(
        "cannot register resource '$resourceName': it is already registered "
        'against a different factory, and clients built before the change would '
        'keep the old one - pick another name');
  }
  _resourceModules[resourceName] = factory;
}

/// Every registered resource name, sorted, so the order does not depend on registration order.
List<String> registeredResourceNames() =>
    List<String>.unmodifiable(_resourceModules.keys.toList()..sort());

/// The factory registered under [resourceName].
ResourceFactory resolveResourceModule(String resourceName) {
  final factory = _resourceModules[resourceName];
  if (factory == null) {
    throw SdkAttributeError("no resource '$resourceName'; available: "
        '${registeredResourceNames().join(', ')}');
  }
  return factory;
}

/// A resource family with its client already applied, looked up by name.
class BoundResource {
  /// Bind the family registered under [name] to [client].
  BoundResource(this.name, ExsitedClient client)
      : value = resolveResourceModule(name)(client);

  /// The registered resource name, e.g. `'accounts'`.
  final String name;

  /// The constructed family; cast it to its concrete type.
  final Object value;

  @override
  String toString() => "BoundResource('$name', ${value.runtimeType})";
}
