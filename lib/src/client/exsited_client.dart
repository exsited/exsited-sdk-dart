import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../auth/token_provider.dart';
import '../auth/token_store.dart';
import '../config/auth_config.dart';
import '../config/sdk_config.dart';
import '../errors.dart';
import '../http/query_params.dart';
import '../http/retry_policy.dart';
import '../http/transport.dart';
import '../http/url_builder.dart';
import '../redaction.dart';
import '../resources/aba_files/aba_files_bound.dart';
import '../resources/account_emails/account_emails_bound.dart';
import '../resources/account_groups/account_groups_bound.dart';
import '../resources/accounting_codes/accounting_codes_bound.dart';
import '../resources/accounts/accounts_bound.dart';
import '../resources/action_scripts/action_scripts_bound.dart';
import '../resources/additional_codes/additional_codes_bound.dart';
import '../resources/alert_responsibilities/alert_responsibilities_bound.dart';
import '../resources/alert_responsibility/alert_responsibility_bound.dart';
import '../resources/alerts/alerts_bound.dart';
import '../resources/applications/applications_bound.dart';
import '../resources/approval_profiles/approval_profiles_bound.dart';
import '../resources/approval_user_groups/approval_user_groups_bound.dart';
import '../resources/approvals/approvals_bound.dart';
import '../resources/attribute_attachments/attribute_attachments_bound.dart';
import '../resources/billing_periods/billing_periods_bound.dart';
import '../resources/bookings/bookings_bound.dart';
import '../resources/charging_periods/charging_periods_bound.dart';
import '../resources/communication_profiles/communication_profiles_bound.dart';
import '../resources/communications/communications_bound.dart';
import '../resources/countries/countries_bound.dart';
import '../resources/credit_note_applications/credit_note_applications_bound.dart';
import '../resources/credit_notes/credit_notes_bound.dart';
import '../resources/custom_attributes/custom_attributes_bound.dart';
import '../resources/custom_components/custom_components_bound.dart';
import '../resources/custom_events/custom_events_bound.dart';
import '../resources/custom_features/custom_features_bound.dart';
import '../resources/custom_fields/custom_fields_bound.dart';
import '../resources/custom_forms/custom_forms_bound.dart';
import '../resources/day_of_month/day_of_month_bound.dart';
import '../resources/departments/departments_bound.dart';
import '../resources/designations/designations_bound.dart';
import '../resources/document_templates/document_templates_bound.dart';
import '../resources/email_templates/email_templates_bound.dart';
import '../resources/employees/employees_bound.dart';
import '../resources/events/events_bound.dart';
import '../resources/express/express_bound.dart';
import '../resources/external_databases/external_databases_bound.dart';
import '../resources/fulfillment_profiles/fulfillment_profiles_bound.dart';
import '../resources/fulfillment_terms/fulfillment_terms_bound.dart';
import '../resources/gift_certificates/gift_certificates_bound.dart';
import '../resources/integration_connections/integration_connections_bound.dart';
import '../resources/inventory_adjustments/inventory_adjustments_bound.dart';
import '../resources/invoice_terms/invoice_terms_bound.dart';
import '../resources/invoices/invoices_bound.dart';
import '../resources/item_fulfillments/item_fulfillments_bound.dart';
import '../resources/item_receipts/item_receipts_bound.dart';
import '../resources/items/items_bound.dart';
import '../resources/labours/labours_bound.dart';
import '../resources/milestones/milestones_bound.dart';
import '../resources/note_attachments/note_attachments_bound.dart';
import '../resources/note_groups/note_groups_bound.dart';
import '../resources/orders/orders_bound.dart';
import '../resources/organisation/organisation_bound.dart';
import '../resources/organisations/organisations_bound.dart';
import '../resources/payments/payments_bound.dart';
import '../resources/portals/portals_bound.dart';
import '../resources/pricing_periods/pricing_periods_bound.dart';
import '../resources/proforma_invoices/proforma_invoices_bound.dart';
import '../resources/purchase_credit_note_applications/purchase_credit_note_applications_bound.dart';
import '../resources/purchase_credit_notes/purchase_credit_notes_bound.dart';
import '../resources/purchase_express/purchase_express_bound.dart';
import '../resources/purchase_invoices/purchase_invoices_bound.dart';
import '../resources/purchase_orders/purchase_orders_bound.dart';
import '../resources/purchase_payments/purchase_payments_bound.dart';
import '../resources/purchase_refunds/purchase_refunds_bound.dart';
import '../resources/quote_orders/quote_orders_bound.dart';
import '../resources/receive_terms/receive_terms_bound.dart';
import '../resources/reconciliations/reconciliations_bound.dart';
import '../resources/refunds/refunds_bound.dart';
import '../resources/rental_assets/rental_assets_bound.dart';
import '../resources/reports/reports_bound.dart';
import '../resources/return_merchandise_authorisations/return_merchandise_authorisations_bound.dart';
import '../resources/return_vendor_authorizations/return_vendor_authorizations_bound.dart';
import '../resources/roles/roles_bound.dart';
import '../resources/sales_reps/sales_reps_bound.dart';
import '../resources/salutations/salutations_bound.dart';
import '../resources/settings/settings_bound.dart';
import '../resources/settings_workflows/settings_workflows_bound.dart';
import '../resources/shipping_packages/shipping_packages_bound.dart';
import '../resources/shipping_rules/shipping_rules_bound.dart';
import '../resources/system_events/system_events_bound.dart';
import '../resources/tasks/tasks_bound.dart';
import '../resources/teams/teams_bound.dart';
import '../resources/time_periods/time_periods_bound.dart';
import '../resources/timesheets/timesheets_bound.dart';
import '../resources/uom/uom_bound.dart';
import '../resources/usages/usages_bound.dart';
import '../resources/webhooks/webhooks_bound.dart';
import '../resources/workflows/workflows_bound.dart';
import '../resources/zones/zones_bound.dart';
import 'api_response.dart';
import 'client_registry.dart';
import 'console.dart';
import 'default_token_store_web.dart'
    if (dart.library.io) 'default_token_store_io.dart';
import 'dto.dart';
import 'file_log_web.dart' if (dart.library.io) 'file_log_io.dart';
import 'insecure_transport.dart';
import 'resource_binding.dart';
import 'terminal_web.dart' if (dart.library.io) 'terminal_io.dart';

/// The prefix of every logger name, e.g. `exsited.default`.
const String loggerName = 'exsited';

/// Flatten a `clientName` into one logger-name segment.
String _loggerSafe(String clientName) =>
    Uri.encodeComponent(clientName).replaceAll('.', '%2E');

/// The header v4 uses to collapse a repeated create into one.
const String idempotencyHeader = 'X-Idempotency-Key';

/// The methods the SDK generates an [idempotencyHeader] for: POST alone, the one
/// method a retry or the 401 replay could otherwise turn into two records.
const Set<String> idempotencyKeyMethods = {'POST'};

/// Alias of [idempotencyKeyMethods]; not RFC 9110's idempotent set, which is
/// `RetryPolicy.idempotentMethods`.
const Set<String> idempotentMethods = idempotencyKeyMethods;

/// What a v4 401 body says when the access token is the problem rather than
/// the request, matched as whole words.
const Set<String> tokenFailureMarkers = {
  'unauthorized',
  'invalid_access_token',
  'invalid_token',
  'expired_token',
  'invalid_request',
};

/// The keys of a 401 body that may carry one of [tokenFailureMarkers], each read
/// on its own: `message` is never absent, so a `??` chain never reached `code`.
const List<String> tokenFailureKeys = ['code', 'error', 'message'];

/// The send parameters as one bundle; the flat named parameters on
/// [ExsitedClient.sendApiRequest] win over it.
class CallOptions {
  /// Bundle the send parameters.
  const CallOptions({
    this.pathParams = const {},
    this.queryParams,
    this.jsonBody,
    this.formData,
    this.files,
    this.headers = const {},
    this.authenticated = true,
    this.raiseOnError,
    this.responseFormat,
  });

  /// Values for the path template's `{name}` placeholders.
  final Map<String, Object?> pathParams;

  /// Query parameters, normalised by `QueryParams.build`.
  final Map<String, Object?>? queryParams;

  /// A map or list to encode, a JSON string sent byte-for-byte, or a [Dto].
  final Object? jsonBody;

  /// A form body.
  final Map<String, Object?>? formData;

  /// Multipart parts.
  final Map<String, Object?>? files;

  /// Headers for this call.
  final Map<String, String> headers;

  /// Skips the bearer token; the token endpoint uses this.
  final bool authenticated;

  /// Overrides the config for this call. Null defers to it.
  final bool? raiseOnError;

  /// The highest of the tiers. Null defers to the config.
  final ResponseFormat? responseFormat;

  /// A copy with some fields replaced.
  CallOptions copyWith({
    Map<String, Object?>? pathParams,
    Map<String, Object?>? queryParams,
    Object? jsonBody,
    Map<String, Object?>? formData,
    Map<String, Object?>? files,
    Map<String, String>? headers,
    bool? authenticated,
    bool? raiseOnError,
    ResponseFormat? responseFormat,
  }) =>
      CallOptions(
        pathParams: pathParams ?? this.pathParams,
        queryParams: queryParams ?? this.queryParams,
        jsonBody: jsonBody ?? this.jsonBody,
        formData: formData ?? this.formData,
        files: files ?? this.files,
        headers: headers ?? this.headers,
        authenticated: authenticated ?? this.authenticated,
        raiseOnError: raiseOnError ?? this.raiseOnError,
        responseFormat: responseFormat ?? this.responseFormat,
      );
}

/// Authenticated access to one Exsited instance: config in, [ApiResponse] out.
/// Call [close] when done; a request after that is refused before any I/O.
class ExsitedClient {
  /// Build a client over one instance's configuration; the optional collaborators are
  /// injection points, and an injected [transport] or [httpClient] stays open after [close].
  ExsitedClient(
    this.config, {
    TokenStore? tokenStore,
    Transport? transport,
    RetryPolicy? retryPolicy,
    TokenProvider? tokenProvider,
    http.Client? httpClient,
    void Function(String message)? onLog,
    void Function(InsecureTransportWarning warning)? onWarning,
  })  : _onLog = onLog,
        _onWarning = onWarning {
    // Released on any construction failure, so an unreturned client holds no descriptor.
    _logSink = FileLogSink.attach(config);
    try {
      _warnAboutInsecureTransport();
      _ownsTransport = transport == null;
      _transport = transport ??
          Transport(config,
              retryPolicy: retryPolicy,
              client: httpClient ?? config.httpClient,
              onProgress: _reportProgress);
      final store = tokenStore ?? buildDefaultTokenStore(config);
      _tokens = tokenProvider ?? TokenProvider(config, store, this);
    } on Object {
      _detachLogFile();
      rethrow;
    }
  }

  static const String _apiVersionParam = 'api_version';

  /// The configuration this client was built with.
  final SdkConfig config;
  final void Function(String message)? _onLog;
  final void Function(InsecureTransportWarning warning)? _onWarning;
  late final Transport _transport;

  /// Whether this client built its own transport, and so may close one.
  late final bool _ownsTransport;
  late final TokenProvider _tokens;
  FileLogSink? _logSink;

  /// Latched by [close] and never cleared: a closed client is not reopened.
  bool _closed = false;

  /// How many accepted calls have not finished.
  int _inFlight = 0;

  /// Whether [close] ran with calls in flight, so owned resources await release.
  bool _releasePending = false;

  /// The logical name of this instance.
  String get name => config.clientName;

  AbaFilesResource? _abaFiles;

  /// The aba files endpoints, bound to this client.
  AbaFilesResource get abaFiles => _abaFiles ??= AbaFilesResource(this);

  AccountEmailsResource? _accountEmails;

  /// The account emails endpoints, bound to this client.
  AccountEmailsResource get accountEmails =>
      _accountEmails ??= AccountEmailsResource(this);

  AccountGroupsResource? _accountGroups;

  /// The account groups endpoints, bound to this client.
  AccountGroupsResource get accountGroups =>
      _accountGroups ??= AccountGroupsResource(this);

  AccountingCodesResource? _accountingCodes;

  /// The accounting codes endpoints, bound to this client.
  AccountingCodesResource get accountingCodes =>
      _accountingCodes ??= AccountingCodesResource(this);

  AccountsResource? _accounts;

  /// The accounts endpoints, bound to this client.
  AccountsResource get accounts => _accounts ??= AccountsResource(this);

  ActionScriptsResource? _actionScripts;

  /// The action scripts endpoints, bound to this client.
  ActionScriptsResource get actionScripts =>
      _actionScripts ??= ActionScriptsResource(this);

  AdditionalCodesResource? _additionalCodes;

  /// The additional codes endpoints, bound to this client.
  AdditionalCodesResource get additionalCodes =>
      _additionalCodes ??= AdditionalCodesResource(this);

  AlertResponsibilitiesResource? _alertResponsibilities;

  /// The alert responsibilities endpoints, bound to this client.
  AlertResponsibilitiesResource get alertResponsibilities =>
      _alertResponsibilities ??= AlertResponsibilitiesResource(this);

  AlertResponsibilityResource? _alertResponsibility;

  /// The alert responsibility endpoints, bound to this client.
  AlertResponsibilityResource get alertResponsibility =>
      _alertResponsibility ??= AlertResponsibilityResource(this);

  AlertsResource? _alerts;

  /// The alerts endpoints, bound to this client.
  AlertsResource get alerts => _alerts ??= AlertsResource(this);

  ApplicationsResource? _applications;

  /// The applications endpoints, bound to this client.
  ApplicationsResource get applications =>
      _applications ??= ApplicationsResource(this);

  ApprovalProfilesResource? _approvalProfiles;

  /// The approval profiles endpoints, bound to this client.
  ApprovalProfilesResource get approvalProfiles =>
      _approvalProfiles ??= ApprovalProfilesResource(this);

  ApprovalUserGroupsResource? _approvalUserGroups;

  /// The approval user groups endpoints, bound to this client.
  ApprovalUserGroupsResource get approvalUserGroups =>
      _approvalUserGroups ??= ApprovalUserGroupsResource(this);

  ApprovalsResource? _approvals;

  /// The approvals endpoints, bound to this client.
  ApprovalsResource get approvals => _approvals ??= ApprovalsResource(this);

  AttributeAttachmentsResource? _attributeAttachments;

  /// The attribute attachments endpoints, bound to this client.
  AttributeAttachmentsResource get attributeAttachments =>
      _attributeAttachments ??= AttributeAttachmentsResource(this);

  BillingPeriodsResource? _billingPeriods;

  /// The billing periods endpoints, bound to this client.
  BillingPeriodsResource get billingPeriods =>
      _billingPeriods ??= BillingPeriodsResource(this);

  BookingsResource? _bookings;

  /// The bookings endpoints, bound to this client.
  BookingsResource get bookings => _bookings ??= BookingsResource(this);

  ChargingPeriodsResource? _chargingPeriods;

  /// The charging periods endpoints, bound to this client.
  ChargingPeriodsResource get chargingPeriods =>
      _chargingPeriods ??= ChargingPeriodsResource(this);

  CommunicationProfilesResource? _communicationProfiles;

  /// The communication profiles endpoints, bound to this client.
  CommunicationProfilesResource get communicationProfiles =>
      _communicationProfiles ??= CommunicationProfilesResource(this);

  CommunicationsResource? _communications;

  /// The communications endpoints, bound to this client.
  CommunicationsResource get communications =>
      _communications ??= CommunicationsResource(this);

  CountriesResource? _countries;

  /// The countries endpoints, bound to this client.
  CountriesResource get countries => _countries ??= CountriesResource(this);

  CreditNoteApplicationsResource? _creditNoteApplications;

  /// The credit note applications endpoints, bound to this client.
  CreditNoteApplicationsResource get creditNoteApplications =>
      _creditNoteApplications ??= CreditNoteApplicationsResource(this);

  CreditNotesResource? _creditNotes;

  /// The credit notes endpoints, bound to this client.
  CreditNotesResource get creditNotes =>
      _creditNotes ??= CreditNotesResource(this);

  CustomAttributesResource? _customAttributes;

  /// The custom attributes endpoints, bound to this client.
  CustomAttributesResource get customAttributes =>
      _customAttributes ??= CustomAttributesResource(this);

  CustomComponentsResource? _customComponents;

  /// The custom components endpoints, bound to this client.
  CustomComponentsResource get customComponents =>
      _customComponents ??= CustomComponentsResource(this);

  CustomEventsResource? _customEvents;

  /// The custom events endpoints, bound to this client.
  CustomEventsResource get customEvents =>
      _customEvents ??= CustomEventsResource(this);

  CustomFeaturesResource? _customFeatures;

  /// The custom features endpoints, bound to this client.
  CustomFeaturesResource get customFeatures =>
      _customFeatures ??= CustomFeaturesResource(this);

  CustomFieldsResource? _customFields;

  /// The custom fields endpoints, bound to this client.
  CustomFieldsResource get customFields =>
      _customFields ??= CustomFieldsResource(this);

  CustomFormsResource? _customForms;

  /// The custom forms endpoints, bound to this client.
  CustomFormsResource get customForms =>
      _customForms ??= CustomFormsResource(this);

  DayOfMonthResource? _dayOfMonth;

  /// The day of month endpoints, bound to this client.
  DayOfMonthResource get dayOfMonth => _dayOfMonth ??= DayOfMonthResource(this);

  DepartmentsResource? _departments;

  /// The departments endpoints, bound to this client.
  DepartmentsResource get departments =>
      _departments ??= DepartmentsResource(this);

  DesignationsResource? _designations;

  /// The designations endpoints, bound to this client.
  DesignationsResource get designations =>
      _designations ??= DesignationsResource(this);

  DocumentTemplatesResource? _documentTemplates;

  /// The document templates endpoints, bound to this client.
  DocumentTemplatesResource get documentTemplates =>
      _documentTemplates ??= DocumentTemplatesResource(this);

  EmailTemplatesResource? _emailTemplates;

  /// The email templates endpoints, bound to this client.
  EmailTemplatesResource get emailTemplates =>
      _emailTemplates ??= EmailTemplatesResource(this);

  EmployeesResource? _employees;

  /// The employees endpoints, bound to this client.
  EmployeesResource get employees => _employees ??= EmployeesResource(this);

  EventsResource? _events;

  /// The events endpoints, bound to this client.
  EventsResource get events => _events ??= EventsResource(this);

  ExpressResource? _express;

  /// The express endpoints, bound to this client.
  ExpressResource get express => _express ??= ExpressResource(this);

  ExternalDatabasesResource? _externalDatabases;

  /// The external databases endpoints, bound to this client.
  ExternalDatabasesResource get externalDatabases =>
      _externalDatabases ??= ExternalDatabasesResource(this);

  FulfillmentProfilesResource? _fulfillmentProfiles;

  /// The fulfillment profiles endpoints, bound to this client.
  FulfillmentProfilesResource get fulfillmentProfiles =>
      _fulfillmentProfiles ??= FulfillmentProfilesResource(this);

  FulfillmentTermsResource? _fulfillmentTerms;

  /// The fulfillment terms endpoints, bound to this client.
  FulfillmentTermsResource get fulfillmentTerms =>
      _fulfillmentTerms ??= FulfillmentTermsResource(this);

  GiftCertificatesResource? _giftCertificates;

  /// The gift certificates endpoints, bound to this client.
  GiftCertificatesResource get giftCertificates =>
      _giftCertificates ??= GiftCertificatesResource(this);

  IntegrationConnectionsResource? _integrationConnections;

  /// The integration connections endpoints, bound to this client.
  IntegrationConnectionsResource get integrationConnections =>
      _integrationConnections ??= IntegrationConnectionsResource(this);

  InventoryAdjustmentsResource? _inventoryAdjustments;

  /// The inventory adjustments endpoints, bound to this client.
  InventoryAdjustmentsResource get inventoryAdjustments =>
      _inventoryAdjustments ??= InventoryAdjustmentsResource(this);

  InvoiceTermsResource? _invoiceTerms;

  /// The invoice terms endpoints, bound to this client.
  InvoiceTermsResource get invoiceTerms =>
      _invoiceTerms ??= InvoiceTermsResource(this);

  InvoicesResource? _invoices;

  /// The invoices endpoints, bound to this client.
  InvoicesResource get invoices => _invoices ??= InvoicesResource(this);

  ItemFulfillmentsResource? _itemFulfillments;

  /// The item fulfillments endpoints, bound to this client.
  ItemFulfillmentsResource get itemFulfillments =>
      _itemFulfillments ??= ItemFulfillmentsResource(this);

  ItemReceiptsResource? _itemReceipts;

  /// The item receipts endpoints, bound to this client.
  ItemReceiptsResource get itemReceipts =>
      _itemReceipts ??= ItemReceiptsResource(this);

  ItemsResource? _items;

  /// The items endpoints, bound to this client.
  ItemsResource get items => _items ??= ItemsResource(this);

  LaboursResource? _labours;

  /// The labours endpoints, bound to this client.
  LaboursResource get labours => _labours ??= LaboursResource(this);

  MilestonesResource? _milestones;

  /// The milestones endpoints, bound to this client.
  MilestonesResource get milestones => _milestones ??= MilestonesResource(this);

  NoteAttachmentsResource? _noteAttachments;

  /// The note attachments endpoints, bound to this client.
  NoteAttachmentsResource get noteAttachments =>
      _noteAttachments ??= NoteAttachmentsResource(this);

  NoteGroupsResource? _noteGroups;

  /// The note groups endpoints, bound to this client.
  NoteGroupsResource get noteGroups => _noteGroups ??= NoteGroupsResource(this);

  OrdersResource? _orders;

  /// The orders endpoints, bound to this client.
  OrdersResource get orders => _orders ??= OrdersResource(this);

  OrganisationResource? _organisation;

  /// The organisation endpoints, bound to this client.
  OrganisationResource get organisation =>
      _organisation ??= OrganisationResource(this);

  OrganisationsResource? _organisations;

  /// The organisations endpoints, bound to this client.
  OrganisationsResource get organisations =>
      _organisations ??= OrganisationsResource(this);

  PaymentsResource? _payments;

  /// The payments endpoints, bound to this client.
  PaymentsResource get payments => _payments ??= PaymentsResource(this);

  PortalsResource? _portals;

  /// The portals endpoints, bound to this client.
  PortalsResource get portals => _portals ??= PortalsResource(this);

  PricingPeriodsResource? _pricingPeriods;

  /// The pricing periods endpoints, bound to this client.
  PricingPeriodsResource get pricingPeriods =>
      _pricingPeriods ??= PricingPeriodsResource(this);

  ProformaInvoicesResource? _proformaInvoices;

  /// The proforma invoices endpoints, bound to this client.
  ProformaInvoicesResource get proformaInvoices =>
      _proformaInvoices ??= ProformaInvoicesResource(this);

  PurchaseCreditNoteApplicationsResource? _purchaseCreditNoteApplications;

  /// The purchase credit note applications endpoints, bound to this client.
  PurchaseCreditNoteApplicationsResource get purchaseCreditNoteApplications =>
      _purchaseCreditNoteApplications ??=
          PurchaseCreditNoteApplicationsResource(this);

  PurchaseCreditNotesResource? _purchaseCreditNotes;

  /// The purchase credit notes endpoints, bound to this client.
  PurchaseCreditNotesResource get purchaseCreditNotes =>
      _purchaseCreditNotes ??= PurchaseCreditNotesResource(this);

  PurchaseExpressResource? _purchaseExpress;

  /// The purchase express endpoints, bound to this client.
  PurchaseExpressResource get purchaseExpress =>
      _purchaseExpress ??= PurchaseExpressResource(this);

  PurchaseInvoicesResource? _purchaseInvoices;

  /// The purchase invoices endpoints, bound to this client.
  PurchaseInvoicesResource get purchaseInvoices =>
      _purchaseInvoices ??= PurchaseInvoicesResource(this);

  PurchaseOrdersResource? _purchaseOrders;

  /// The purchase orders endpoints, bound to this client.
  PurchaseOrdersResource get purchaseOrders =>
      _purchaseOrders ??= PurchaseOrdersResource(this);

  PurchasePaymentsResource? _purchasePayments;

  /// The purchase payments endpoints, bound to this client.
  PurchasePaymentsResource get purchasePayments =>
      _purchasePayments ??= PurchasePaymentsResource(this);

  PurchaseRefundsResource? _purchaseRefunds;

  /// The purchase refunds endpoints, bound to this client.
  PurchaseRefundsResource get purchaseRefunds =>
      _purchaseRefunds ??= PurchaseRefundsResource(this);

  QuoteOrdersResource? _quoteOrders;

  /// The quote orders endpoints, bound to this client.
  QuoteOrdersResource get quoteOrders =>
      _quoteOrders ??= QuoteOrdersResource(this);

  ReceiveTermsResource? _receiveTerms;

  /// The receive terms endpoints, bound to this client.
  ReceiveTermsResource get receiveTerms =>
      _receiveTerms ??= ReceiveTermsResource(this);

  ReconciliationsResource? _reconciliations;

  /// The reconciliations endpoints, bound to this client.
  ReconciliationsResource get reconciliations =>
      _reconciliations ??= ReconciliationsResource(this);

  RefundsResource? _refunds;

  /// The refunds endpoints, bound to this client.
  RefundsResource get refunds => _refunds ??= RefundsResource(this);

  RentalAssetsResource? _rentalAssets;

  /// The rental assets endpoints, bound to this client.
  RentalAssetsResource get rentalAssets =>
      _rentalAssets ??= RentalAssetsResource(this);

  ReportsResource? _reports;

  /// The reports endpoints, bound to this client.
  ReportsResource get reports => _reports ??= ReportsResource(this);

  ReturnMerchandiseAuthorisationsResource? _returnMerchandiseAuthorisations;

  /// The return merchandise authorisations endpoints, bound to this client.
  ReturnMerchandiseAuthorisationsResource get returnMerchandiseAuthorisations =>
      _returnMerchandiseAuthorisations ??=
          ReturnMerchandiseAuthorisationsResource(this);

  ReturnVendorAuthorizationsResource? _returnVendorAuthorizations;

  /// The return vendor authorizations endpoints, bound to this client.
  ReturnVendorAuthorizationsResource get returnVendorAuthorizations =>
      _returnVendorAuthorizations ??= ReturnVendorAuthorizationsResource(this);

  RolesResource? _roles;

  /// The roles endpoints, bound to this client.
  RolesResource get roles => _roles ??= RolesResource(this);

  SalesRepsResource? _salesReps;

  /// The sales reps endpoints, bound to this client.
  SalesRepsResource get salesReps => _salesReps ??= SalesRepsResource(this);

  SalutationsResource? _salutations;

  /// The salutations endpoints, bound to this client.
  SalutationsResource get salutations =>
      _salutations ??= SalutationsResource(this);

  SettingsResource? _settings;

  /// The settings endpoints, bound to this client.
  SettingsResource get settings => _settings ??= SettingsResource(this);

  SettingsWorkflowsResource? _settingsWorkflows;

  /// The settings workflows endpoints, bound to this client.
  SettingsWorkflowsResource get settingsWorkflows =>
      _settingsWorkflows ??= SettingsWorkflowsResource(this);

  ShippingPackagesResource? _shippingPackages;

  /// The shipping packages endpoints, bound to this client.
  ShippingPackagesResource get shippingPackages =>
      _shippingPackages ??= ShippingPackagesResource(this);

  ShippingRulesResource? _shippingRules;

  /// The shipping rules endpoints, bound to this client.
  ShippingRulesResource get shippingRules =>
      _shippingRules ??= ShippingRulesResource(this);

  SystemEventsResource? _systemEvents;

  /// The system events endpoints, bound to this client.
  SystemEventsResource get systemEvents =>
      _systemEvents ??= SystemEventsResource(this);

  TasksResource? _tasks;

  /// The tasks endpoints, bound to this client.
  TasksResource get tasks => _tasks ??= TasksResource(this);

  TeamsResource? _teams;

  /// The teams endpoints, bound to this client.
  TeamsResource get teams => _teams ??= TeamsResource(this);

  TimePeriodsResource? _timePeriods;

  /// The time periods endpoints, bound to this client.
  TimePeriodsResource get timePeriods =>
      _timePeriods ??= TimePeriodsResource(this);

  TimesheetsResource? _timesheets;

  /// The timesheets endpoints, bound to this client.
  TimesheetsResource get timesheets => _timesheets ??= TimesheetsResource(this);

  UomResource? _uom;

  /// The uom endpoints, bound to this client.
  UomResource get uom => _uom ??= UomResource(this);

  UsagesResource? _usages;

  /// The usages endpoints, bound to this client.
  UsagesResource get usages => _usages ??= UsagesResource(this);

  WebhooksResource? _webhooks;

  /// The webhooks endpoints, bound to this client.
  WebhooksResource get webhooks => _webhooks ??= WebhooksResource(this);

  WorkflowsResource? _workflows;

  /// The workflows endpoints, bound to this client.
  WorkflowsResource get workflows => _workflows ??= WorkflowsResource(this);

  ZonesResource? _zones;

  /// The zones endpoints, bound to this client.
  ZonesResource get zones => _zones ??= ZonesResource(this);

  /// Every resource reachable as a property on this client, sorted.
  List<String> listResourceNames() => registeredResourceNames();

  /// One resource by a name [listResourceNames] reports, or an
  /// [SdkAttributeError] naming what is available.
  Object resourceByName(String name) => BoundResource(name, this).value;

  /// Send one request and return the response; [jsonBody] takes a map, a list, a
  /// raw JSON `String` sent byte for byte, or a payload DTO. A flat argument wins
  /// over the same field on [options], and [dtoDecoder] wins over [buildDto].
  Future<ApiResponse<T>> sendApiRequest<T>(
    String httpMethod,
    String path, {
    Map<String, Object?>? pathParams,
    Map<String, Object?>? queryParams,
    Object? jsonBody,
    Map<String, Object?>? formData,
    Map<String, Object?>? files,
    Map<String, String>? headers,
    bool authenticated = true,
    bool? raiseOnError,
    String? responseFormat,
    DtoDecoder? dtoDecoder,
    CallOptions? options,
    T Function(Map<String, Object?>)? buildDto,
  }) async {
    // Refused or registered in one step, before anything else; see [close].
    _refuseWhenClosed(httpMethod);
    _inFlight++;
    try {
      return await _sendAcceptedRequest<T>(httpMethod, path,
          pathParams: pathParams,
          queryParams: queryParams,
          jsonBody: jsonBody,
          formData: formData,
          files: files,
          headers: headers,
          authenticated: authenticated,
          raiseOnError: raiseOnError,
          responseFormat: responseFormat,
          dtoDecoder: dtoDecoder,
          options: options,
          buildDto: buildDto);
    } finally {
      _inFlight--;
      _releaseOwnedResourcesWhenDrained();
    }
  }

  /// The body of [sendApiRequest], run with this call registered as in flight.
  Future<ApiResponse<T>> _sendAcceptedRequest<T>(
    String httpMethod,
    String path, {
    Map<String, Object?>? pathParams,
    Map<String, Object?>? queryParams,
    Object? jsonBody,
    Map<String, Object?>? formData,
    Map<String, Object?>? files,
    Map<String, String>? headers,
    bool authenticated = true,
    bool? raiseOnError,
    String? responseFormat,
    DtoDecoder? dtoDecoder,
    CallOptions? options,
    T Function(Map<String, Object?>)? buildDto,
  }) async {
    final method = normaliseHttpMethod(httpMethod);
    _validatePath(path);
    // Copied before any caller code runs: a payload's toMap holds these same maps.
    final pathValues = <String, Object?>{
      ...?options?.pathParams,
      ...?pathParams
    };
    final queryValues = <String, Object?>{
      ...?options?.queryParams,
      ...?queryParams
    };
    final callerHeaders = <String, String>{...?options?.headers, ...?headers};
    final formSource = formData ?? options?.formData;
    final formValues =
        formSource == null ? null : Map<String, Object?>.of(formSource);
    final fileSource = files ?? options?.files;
    final fileValues =
        fileSource == null ? null : Map<String, Object?>.of(fileSource);
    final isAuthenticated = authenticated && (options?.authenticated ?? true);
    final format = _resolveResponseFormat(
        responseFormat ?? options?.responseFormat?.wireName);
    // The transport's own rule, run here so it fires before the token grant below.
    validateRequestHeaders(callerHeaders);

    final resolvedPath = UrlBuilder.substitutePathParams(
        path, _seedApiVersion(path, pathValues));
    final url = UrlBuilder.buildUrl(config.baseUrl, resolvedPath);
    final normalisedParams = QueryParams.build(queryValues);
    _rejectDuplicatedQueryParams(url, normalisedParams);

    // A payload DTO becomes its map before validation, joining the map path.
    final body = _resolvePayload(jsonBody ?? options?.jsonBody);
    _validatePayload(jsonBody: body, formData: formValues, files: fileValues);

    // Snapshotted before the first await: every attempt sends the validated bytes.
    final reportedPayload = body ?? formValues;
    final canonical = TransportRequest(
      method,
      url,
      queryParams: normalisedParams,
      jsonBody: body,
      formData: formValues,
      files: fileValues,
      responseFormat: format,
      dtoDecoder: dtoDecoder ?? _decoderFor(buildDto),
      // Identifier-free, since it names the call in every default rendering.
      endpointTemplate: deriveEndpointTemplate(path),
      // One summariser for the record and the render, so they cannot disagree.
      requestInfoBody: Redaction.redactValue(
          Console.summarisePayload(reportedPayload, fileValues)),
      // Charged in the constructor, so an oversize payload is refused before the grant.
      maxRequestBytes: config.maxRequestBytes,
      maxRequestSourceBytes: config.maxRequestSourceBytes,
      maxMultipartOverheadBytes: config.maxMultipartOverheadBytes,
    );
    // One key for the whole call, so a retry and the 401 replay repeat the first.
    final sentHeaders = Map<String, String>.unmodifiable(
        _withIdempotencyKey(method, callerHeaders));

    // Reported from the snapshot, so what is printed is what was sent.
    final reportedBody = canonical.jsonBody ?? canonical.formData;

    var token = isAuthenticated ? await _tokens.accessToken() : null;
    var response = await _sendOnce<T>(canonical, token, sentHeaders,
        reportedBody: reportedBody);

    if (isAuthenticated &&
        response.statusCode == 401 &&
        meansExpiredToken(response.map, method)) {
      // Before the replay, so a 401 -> refresh -> 200 sequence shows the 401.
      _reportExchange(response, reportedBody,
          files: canonical.files, formData: canonical.formData, warning: true);
      final dead = token;
      try {
        token = await _tokens.refresh(dead);
      } on Object {
        // Evicted, or every later process would inherit a token certain to 401.
        await _tokens.invalidateAccessToken(dead);
        rethrow;
      }
      response = await _sendOnce<T>(canonical, token, sentHeaders,
          reportedBody: reportedBody);
    }
    _reportExchange(response, reportedBody,
        files: canonical.files, formData: canonical.formData, warning: false);

    final shouldRaise =
        raiseOnError ?? options?.raiseOnError ?? config.raiseOnError;
    return shouldRaise ? response.raiseForStatus() : response;
  }

  /// GET a path. One delegating call to [sendApiRequest].
  Future<ApiResponse<T>> sendGetRequest<T>(
    String path, {
    Map<String, Object?>? pathParams,
    Map<String, Object?>? queryParams,
    Object? jsonBody,
    Map<String, Object?>? formData,
    Map<String, Object?>? files,
    Map<String, String>? headers,
    bool authenticated = true,
    bool? raiseOnError,
    String? responseFormat,
    DtoDecoder? dtoDecoder,
    CallOptions? options,
    T Function(Map<String, Object?>)? buildDto,
  }) =>
      sendApiRequest<T>('GET', path,
          pathParams: pathParams,
          queryParams: queryParams,
          jsonBody: jsonBody,
          formData: formData,
          files: files,
          headers: headers,
          authenticated: authenticated,
          raiseOnError: raiseOnError,
          responseFormat: responseFormat,
          dtoDecoder: dtoDecoder,
          options: options,
          buildDto: buildDto);

  /// POST a path. One delegating call to [sendApiRequest].
  Future<ApiResponse<T>> sendPostRequest<T>(
    String path, {
    Map<String, Object?>? pathParams,
    Map<String, Object?>? queryParams,
    Object? jsonBody,
    Map<String, Object?>? formData,
    Map<String, Object?>? files,
    Map<String, String>? headers,
    bool authenticated = true,
    bool? raiseOnError,
    String? responseFormat,
    DtoDecoder? dtoDecoder,
    CallOptions? options,
    T Function(Map<String, Object?>)? buildDto,
  }) =>
      sendApiRequest<T>('POST', path,
          pathParams: pathParams,
          queryParams: queryParams,
          jsonBody: jsonBody,
          formData: formData,
          files: files,
          headers: headers,
          authenticated: authenticated,
          raiseOnError: raiseOnError,
          responseFormat: responseFormat,
          dtoDecoder: dtoDecoder,
          options: options,
          buildDto: buildDto);

  /// PUT a path. One delegating call to [sendApiRequest].
  Future<ApiResponse<T>> sendPutRequest<T>(
    String path, {
    Map<String, Object?>? pathParams,
    Map<String, Object?>? queryParams,
    Object? jsonBody,
    Map<String, Object?>? formData,
    Map<String, Object?>? files,
    Map<String, String>? headers,
    bool authenticated = true,
    bool? raiseOnError,
    String? responseFormat,
    DtoDecoder? dtoDecoder,
    CallOptions? options,
    T Function(Map<String, Object?>)? buildDto,
  }) =>
      sendApiRequest<T>('PUT', path,
          pathParams: pathParams,
          queryParams: queryParams,
          jsonBody: jsonBody,
          formData: formData,
          files: files,
          headers: headers,
          authenticated: authenticated,
          raiseOnError: raiseOnError,
          responseFormat: responseFormat,
          dtoDecoder: dtoDecoder,
          options: options,
          buildDto: buildDto);

  /// PATCH a path. One delegating call to [sendApiRequest].
  Future<ApiResponse<T>> sendPatchRequest<T>(
    String path, {
    Map<String, Object?>? pathParams,
    Map<String, Object?>? queryParams,
    Object? jsonBody,
    Map<String, Object?>? formData,
    Map<String, Object?>? files,
    Map<String, String>? headers,
    bool authenticated = true,
    bool? raiseOnError,
    String? responseFormat,
    DtoDecoder? dtoDecoder,
    CallOptions? options,
    T Function(Map<String, Object?>)? buildDto,
  }) =>
      sendApiRequest<T>('PATCH', path,
          pathParams: pathParams,
          queryParams: queryParams,
          jsonBody: jsonBody,
          formData: formData,
          files: files,
          headers: headers,
          authenticated: authenticated,
          raiseOnError: raiseOnError,
          responseFormat: responseFormat,
          dtoDecoder: dtoDecoder,
          options: options,
          buildDto: buildDto);

  /// DELETE a path. One delegating call to [sendApiRequest].
  Future<ApiResponse<T>> sendDeleteRequest<T>(
    String path, {
    Map<String, Object?>? pathParams,
    Map<String, Object?>? queryParams,
    Object? jsonBody,
    Map<String, Object?>? formData,
    Map<String, Object?>? files,
    Map<String, String>? headers,
    bool authenticated = true,
    bool? raiseOnError,
    String? responseFormat,
    DtoDecoder? dtoDecoder,
    CallOptions? options,
    T Function(Map<String, Object?>)? buildDto,
  }) =>
      sendApiRequest<T>('DELETE', path,
          pathParams: pathParams,
          queryParams: queryParams,
          jsonBody: jsonBody,
          formData: formData,
          files: files,
          headers: headers,
          authenticated: authenticated,
          raiseOnError: raiseOnError,
          responseFormat: responseFormat,
          dtoDecoder: dtoDecoder,
          options: options,
          buildDto: buildDto);

  /// Whether [close] has been called; a closed client is not reopened.
  bool get isClosed => _closed;

  /// Release pooled connections and the `logFile` handle, and refuse later requests.
  void close() {
    // Latched first, so a throwing transport close still leaves the client refusing.
    _closed = true;
    if (_inFlight > 0) {
      // An accepted call keeps its resources: the last one to return releases them.
      _releasePending = true;
      return;
    }
    _releaseOwnedResources();
  }

  /// Release what this client owns once the last accepted call has returned.
  void _releaseOwnedResourcesWhenDrained() {
    if (!_releasePending || _inFlight > 0) return;
    _releasePending = false;
    _releaseOwnedResources();
  }

  void _releaseOwnedResources() {
    try {
      if (_ownsTransport) _transport.closeTransport();
    } finally {
      _detachLogFile();
    }
  }

  /// Release pooled connections and the `logFile` handle. An alias for [close].
  void closeClient() => close();

  /// Refuse a request on a closed client with an [SdkUsageError], before any I/O.
  void _refuseWhenClosed(String httpMethod) {
    if (!_closed) return;
    throw SdkUsageError(
        "client '${config.clientName}' is closed: close() released its HTTP "
        'client, so this $httpMethod cannot be sent. A closed client is not '
        'reopened - build a new one.');
  }

  /// Send the canonical request once, under the headers this attempt's token produces.
  Future<ApiResponse<T>> _sendOnce<T>(TransportRequest canonical,
      String? accessToken, Map<String, String> callerHeaders,
      {required Object? reportedBody}) async {
    final headers = _buildRequestHeaders(callerHeaders, accessToken);
    try {
      return await _transport.sendHttpRequest<T>(canonical.withHeaders(headers,
          requestInfoHeaders: Redaction.redactMapping(headers)));
    } on SdkError catch (error) {
      // A failed send is still an exchange worth showing; rethrown untouched.
      final info = error.requestInfo;
      if (info is RequestInfo) {
        _reportFailure(info, reportedBody,
            files: canonical.files, formData: canonical.formData);
      }
      rethrow;
    }
  }

  /// Report that a request is in flight, or that a retry is waiting.
  void _reportProgress(String message) {
    if (config.printApiInfo && !config.printOnlyOnError) {
      // ignore: avoid_print
      print(encodeForConsole(neutraliseControls(message)));
    }
    _log('INFO', message);
  }

  bool get _wantsPrint =>
      config.printApiInfo ||
      config.printRequestPayload ||
      config.printResponseBody ||
      config.printHeaders ||
      config.printCurl;

  /// Print and log a send that never produced a response.
  void _reportFailure(
    RequestInfo info,
    Object? reportedBody, {
    Map<String, Object?>? files,
    Map<String, Object?>? formData,
  }) {
    if (_wantsPrint) {
      // ignore: avoid_print
      print(Console.renderFailure(info, reportedBody, config,
          files: files, formEncoded: formData != null));
    }
    _log(
        'ERROR',
        '${info.httpMethod} ${info.endpointTemplate} -> '
            '${Console.noResponseStatus} in ${info.elapsedSeconds}s '
            '(attempt ${info.attemptCount}/${info.maxAttempts})');
  }

  void _reportExchange(
    ApiResponse<Object?> response,
    Object? reportedBody, {
    Map<String, Object?>? files,
    Map<String, Object?>? formData,
    required bool warning,
  }) {
    final RequestInfo? info = response.requestInfo;
    // Gated on a request record, which renderExchange reads and a Transport may omit.
    if (info != null &&
        _wantsPrint &&
        !(config.printOnlyOnError && response.succeeded)) {
      // ignore: avoid_print
      print(Console.renderExchange(response, reportedBody, config,
          files: files, formEncoded: formData != null));
    }

    if (info != null) {
      final level = warning ? 'WARNING' : 'INFO';
      // The template, not the resolved URL, which carries a record's id.
      _log(
          level,
          '${info.httpMethod} ${info.endpointTemplate} -> ${response.statusCode} '
          'in ${info.elapsedSeconds}s '
          '(attempt ${info.attemptCount}/${info.maxAttempts})');
    }

    // Outside the record guard: the bodies do not come from the record.
    if (config.logBodies) {
      // Rendered, so a byte body reads `<N bytes>` and a map renders as JSON.
      _log(
          'DEBUG',
          'payload=${Console.renderJsonValue(Redaction.redactValue(reportedBody), compact: true)} '
              'response=${Console.renderJsonValue(Redaction.redactValue(response.map), compact: true)}');
    }
  }

  /// One record to both the `onLog` hook and the `logFile` sink, gated by `logLevel`.
  void _log(String level, String message) {
    final threshold = _levelRanks[config.logLevel] ?? 2;
    if ((_levelRanks[level] ?? 1) < threshold) return;
    _onLog?.call('$level $message');
    _writeLogFile(level, message);
  }

  static const Map<String, int> _levelRanks = <String, int>{
    'DEBUG': 0,
    'INFO': 1,
    'WARNING': 2,
    'ERROR': 3,
    'CRITICAL': 4,
  };

  void _writeLogFile(String level, String message) {
    final sink = _logSink;
    if (sink == null) return;
    // Neutralised: a log read back with cat is a terminal, and obeys an escape.
    sink.write(neutraliseControls('${DateTime.now().toIso8601String()} $level '
        '$loggerName.${_loggerSafe(config.clientName)} $message'));
  }

  void _detachLogFile() {
    final sink = _logSink;
    if (sink == null) return;
    _logSink = null;
    sink.release();
  }

  /// Warn when TLS verification is off or a plain `http://` URL leaves this machine.
  void _warnAboutInsecureTransport() {
    if (!config.verifySsl) {
      const message = 'TLS verification is disabled (verifySsl: false); '
          'responses cannot be trusted';
      _log('WARNING', message);
      if (_warningsShown.add(message)) _emitWarning(message);
    }
    final plaintext = plaintextTransportWarning(config.baseUrl);
    if (plaintext != null) {
      _log('WARNING', plaintext);
      // Once per origin per process: a client per call would repeat it forever.
      if (takeInsecureBaseUrlWarning(config.baseUrl) != null) {
        _emitWarning(plaintext);
      }
    }
  }

  /// Emitted once per isolate per message, though logged on every client construction.
  static final Set<String> _warningsShown = <String>{};

  /// Re-arm the once-per-isolate insecure-transport warning.
  static void resetWarningDeduplication() {
    _warningsShown.clear();
    resetInsecureBaseUrlWarnings();
  }

  void _emitWarning(String message) {
    final warning = InsecureTransportWarning(message);
    _onWarning?.call(warning);
    // To stderr, never stdout, which the rendered exchanges own.
    writeWarning(warning.toString());
  }

  /// Merge headers case-insensitively; the SDK's `Authorization` cannot be overridden.
  Map<String, String> _buildRequestHeaders(
      Map<String, String>? callerHeaders, String? accessToken) {
    final canonical = <String, String>{};
    final byLowerName = <String, String>{};

    _putHeader(canonical, byLowerName, 'Accept', 'application/json');
    _putHeader(canonical, byLowerName, 'User-Agent', config.userAgent);
    config.defaultHeaders.forEach(
        (name, value) => _putHeader(canonical, byLowerName, name, value));
    callerHeaders?.forEach(
        (name, value) => _putHeader(canonical, byLowerName, name, value));
    if (accessToken != null) {
      // Last, and under the canonical spelling whatever casing a caller used.
      byLowerName.remove('authorization');
      _putHeader(
          canonical, byLowerName, 'Authorization', 'Bearer $accessToken');
    }
    final merged = <String, String>{};
    byLowerName.forEach((lower, value) => merged[canonical[lower]!] = value);
    return merged;
  }

  static void _putHeader(Map<String, String> canonical,
      Map<String, String> byLowerName, String name, String value) {
    _validateHeader(name, value);
    final lower = name.toLowerCase();
    canonical.putIfAbsent(lower, () => name);
    if (lower == 'authorization' ||
        lower == 'accept' ||
        lower == 'user-agent') {
      canonical[lower] = switch (lower) {
        'authorization' => 'Authorization',
        'accept' => 'Accept',
        _ => 'User-Agent',
      };
    }
    byLowerName[lower] = value;
  }

  /// Reject a merged header the wire cannot carry, naming it but never its value.
  static void _validateHeader(String name, String value) {
    if (name.contains('\r') || name.contains('\n')) {
      throw SdkUsageError('headers: a header name may not contain a line '
          'break, got ${jsonEncode(name)}');
    }
    if (value.contains('\r') || value.contains('\n')) {
      throw SdkUsageError('headers: the value for ${jsonEncode(name)} may not '
          'contain a line break');
    }
    if (value.isNotEmpty && (value.startsWith(' ') || value.startsWith('\t'))) {
      throw SdkUsageError('headers: the value for ${jsonEncode(name)} may not '
          'begin with whitespace');
    }
    validateRequestHeaders(<String, String>{name: value});
  }

  /// Add an idempotency key when one is due; a caller's own key, in any casing, wins.
  static Map<String, String> _withIdempotencyKey(
      String method, Map<String, String> headers) {
    final merged = <String, String>{...headers};
    if (!idempotencyKeyMethods.contains(method)) return merged;
    final wanted = idempotencyHeader.toLowerCase();
    if (merged.keys.any((key) => key.toLowerCase() == wanted)) return merged;
    // Random, not derived from the payload: two deliberate creates are two records.
    merged[idempotencyHeader] = _randomUuid();
    return merged;
  }

  /// A random version 4 UUID.
  static String _randomUuid() {
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    bytes[6] = (bytes[6] & 0x0f) | 0x40;
    bytes[8] = (bytes[8] & 0x3f) | 0x80;
    final hex =
        bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
    return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-'
        '${hex.substring(12, 16)}-${hex.substring(16, 20)}-${hex.substring(20)}';
  }

  Map<String, Object?> _seedApiVersion(
      String path, Map<String, Object?> pathParams) {
    final resolved = Map<String, Object?>.of(pathParams);
    if (UrlBuilder.findPathParamNames(path).contains(_apiVersionParam) &&
        !resolved.containsKey(_apiVersionParam)) {
      resolved[_apiVersionParam] = config.apiVersion.pathSegment;
    }
    return resolved;
  }

  static void _validatePath(String path) {
    if (path.trim().isEmpty) {
      throw SdkUsageError(
          'path must name an endpoint - an empty path requests the instance '
          'root');
    }
  }

  static DtoDecoder? _decoderFor<T>(T Function(Map<String, Object?>)? build) {
    if (build == null) return null;
    return (Object? body) =>
        body is Map ? build(Map<String, Object?>.from(body)) : null;
  }

  /// A payload DTO's map, or the body unchanged.
  static Object? _resolvePayload(Object? jsonBody) =>
      jsonBody is Dto ? jsonBody.toMap() : jsonBody;

  /// The form this call's response takes: the parameter if given, else the config's.
  String _resolveResponseFormat(String? responseFormat) {
    if (responseFormat == null) return config.responseFormat;
    final named = responseFormat.trim().toLowerCase();
    if (SdkConfig.responseFormats.contains(named)) return named;
    throw SdkUsageError('responseFormat: expected one of '
        "${SdkConfig.responseFormats.join(', ')}, got '$responseFormat'");
  }

  static void _validatePayload({
    Object? jsonBody,
    Map<String, Object?>? formData,
    Map<String, Object?>? files,
  }) {
    if (jsonBody != null && formData != null) {
      throw SdkUsageError(
          'pass jsonBody or formData, not both - they are different content '
          'types and only one can be sent');
    }
    if (jsonBody != null && files != null) {
      throw SdkUsageError(
          'pass jsonBody or files, not both - a multipart body replaces the '
          'JSON one, so the JSON would be discarded unsent');
    }
    // Checked here, so a caller mistake surfaces before the token grant.
    files?.forEach(validateFilePart);

    if (jsonBody == null) return;
    // A raw JSON string is parsed only to verify it, and sent exactly as written.
    if (jsonBody is String) {
      final Object? decoded;
      try {
        decoded = jsonDecode(jsonBody);
      } on FormatException catch (error) {
        // The parser's own message, which names what it found and where.
        throw SdkUsageError('jsonBody: not valid JSON: ${error.message}',
            cause: error);
      }
      if (decoded is! Map && decoded is! List) {
        throw SdkUsageError(
            'jsonBody: a JSON string must hold an object or an array, got '
            '${decoded.runtimeType}');
      }
      return;
    }
    if (jsonBody is! Map && jsonBody is! List) {
      throw SdkUsageError(
          'jsonBody must be a JSON string, a map, a list or a payload DTO, got '
          '${jsonBody.runtimeType}');
    }
    try {
      // jsonEncode throws a bare JsonUnsupportedObjectError, not an SdkError.
      jsonEncode(jsonBody);
    } on JsonUnsupportedObjectError catch (error) {
      // Names the offending type, never the object, which may carry customer details.
      throw SdkUsageError(
          'jsonBody is not JSON-serialisable: it holds a '
          '${error.unsupportedObject.runtimeType}, which jsonEncode cannot '
          'write. The value is not shown: it is the payload, and this message '
          "renders by default. The encoder's own error is on cause",
          cause: error);
    }
  }

  static void _rejectDuplicatedQueryParams(
      String url, Map<String, Object?> queryParams) {
    final mark = url.indexOf('?');
    if (queryParams.isEmpty || mark < 0) return;
    final existing = <String>{};
    for (final chunk in url.substring(mark + 1).split('&')) {
      final equals = chunk.indexOf('=');
      existing.add(equals < 0 ? chunk : chunk.substring(0, equals));
    }
    final clash = queryParams.keys.where(existing.contains).toList()..sort();
    if (clash.isNotEmpty) {
      throw SdkUsageError(
          "query params ${clash.join(', ')} already appear in the path's own "
          'query string, so each would be sent twice with two values and the '
          'API chooses - pass them once, in one place');
    }
  }
}

/// Whether a 401 is a stale access token rather than a business rejection: a
/// marker in any of [tokenFailureKeys], or a non-JSON body on a safe method.
bool meansExpiredToken(Object? body, String method) {
  if (body is! Map) {
    return safeMethods.contains(method.trim().toUpperCase());
  }
  for (final key in tokenFailureKeys) {
    if (_namesATokenFailure(body[key])) return true;
  }
  return false;
}

// Whole words, not substrings, so "unauthorizedaccess" is not read as a dead token.
bool _namesATokenFailure(Object? value) {
  if (value is! String) return false;
  final text = value.trim().toLowerCase();
  if (text.isEmpty) return false;
  if (tokenFailureMarkers.contains(text)) return true;
  return text.split(RegExp(r'\s+')).any(tokenFailureMarkers.contains);
}

const Object _unset = SdkConfig.noOverride;

/// Build a client for one registered instance: the default, or the one [instance]
/// names by index or `clientName`.
ExsitedClient buildClient({
  Object? instance,
  List<Object>? credentials,
  AuthConfig? auth,
  ApiVersion? apiVersion,
  double? timeoutSeconds,
  double? connectTimeoutSeconds,
  int? maxRetries,
  Set<int>? retryableHttpCodes,
  Set<int>? unsafeRetryableHttpCodes,
  double? retryBackoffSeconds,
  double? retryBackoffMaxSeconds,
  bool? verifySsl,
  Object? caBundle = _unset,
  Object? proxyUrl = _unset,
  int? poolMaxsize,
  int? maxResponseBytes,
  int? maxRequestBytes,
  int? maxRequestSourceBytes,
  int? maxMultipartOverheadBytes,
  int? maxTokenCacheBytes,
  int? maxCaBundleBytes,
  Map<String, String>? defaultHeaders,
  bool? raiseOnError,
  String? userAgent,
  String? logLevel,
  bool? logBodies,
  Object? logFile = _unset,
  bool? printApiInfo,
  bool? printRequestPayload,
  bool? printResponseBody,
  bool? printHeaders,
  bool? printCurl,
  bool? printOnlyOnError,
  String? printFormat,
  bool? printColor,
  int? printMaxChars,
  String? responseFormat,
  http.Client? httpClient,
}) {
  final blocks = credentials ?? ClientRegistry.getRegisteredInstances();
  // Overrides are forwarded to SdkConfig.fromCredentials, so both entry points agree.
  final config = SdkConfig.fromCredentials(
    blocks,
    instance: instance,
    auth: auth,
    apiVersion: apiVersion,
    timeoutSeconds: timeoutSeconds,
    connectTimeoutSeconds: connectTimeoutSeconds,
    maxRetries: maxRetries,
    retryableHttpCodes: retryableHttpCodes,
    unsafeRetryableHttpCodes: unsafeRetryableHttpCodes,
    retryBackoffSeconds: retryBackoffSeconds,
    retryBackoffMaxSeconds: retryBackoffMaxSeconds,
    verifySsl: verifySsl,
    caBundle: caBundle,
    proxyUrl: proxyUrl,
    poolMaxsize: poolMaxsize,
    maxResponseBytes: maxResponseBytes,
    maxRequestBytes: maxRequestBytes,
    maxRequestSourceBytes: maxRequestSourceBytes,
    maxMultipartOverheadBytes: maxMultipartOverheadBytes,
    maxTokenCacheBytes: maxTokenCacheBytes,
    maxCaBundleBytes: maxCaBundleBytes,
    defaultHeaders: defaultHeaders,
    raiseOnError: raiseOnError,
    userAgent: userAgent,
    logLevel: logLevel,
    logBodies: logBodies,
    logFile: logFile,
    printApiInfo: printApiInfo,
    printRequestPayload: printRequestPayload,
    printResponseBody: printResponseBody,
    printHeaders: printHeaders,
    printCurl: printCurl,
    printOnlyOnError: printOnlyOnError,
    printFormat: printFormat,
    printColor: printColor,
    printMaxChars: printMaxChars,
    responseFormat: responseFormat,
    httpClient: httpClient,
  );
  return ExsitedClient(config);
}
