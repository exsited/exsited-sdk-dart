# Changelog

All notable changes to `exsited`, the Dart SDK for the Exsited v4
API. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/);
versions follow [Semantic Versioning](https://semver.org/). Entries say what a
caller will now see, not what was edited.

No em dashes and no en dashes, here or anywhere else in this repository.

## Releasing

1. Decide the number by what a **caller** sees: major if working code must change
   or starts behaving differently, minor for an addition that breaks nothing,
   patch for a fix no working call notices. "It was a bug" does not make it a
   patch.
2. Move the `## [Unreleased]` entries under a new `## [x.y.z] - YYYY-MM-DD`
   heading, and open a fresh empty `## [Unreleased]` above it. Every released
   heading carries a version **and** a date.
3. Bump `version` in `pubspec.yaml` **and** `Sdk.version` in
   `lib/src/config/sdk_config.dart`. The number lives in two places here and both
   must move together; `Sdk.version` is what the `User-Agent` sends, and
   `sdkVersion` only aliases it.
4. Run the gate:
   `docker run --rm -v <repo>:/w -w /w dart:stable sh -c "dart pub get && dart analyze"`.
   Expect `No issues found!`. Every test is live: `dart test` is the live suite
   and needs `.env`.

## [Unreleased]

## [4.0.0] - 2026-10-25

### Changed

- **The SDK is released under the MIT License.** `LICENSE` carries the MIT text and the
  package metadata names `MIT`, so the package can be used and redistributed under those terms.

### Added

- **449 endpoints, so every v4 endpoint has one function: 864 in 91 families.**
  189 are in 47 new families and 260 in 28 of the existing ones. Each takes the
  client first, the path parameters in order and then the payload or the note,
  with `queryParams` and `files` named where the endpoint takes them, and ends
  with `raiseOnError` and `responseFormat`; each is a method on
  `client.<family>` too. New path templates and envelope keys are on each
  family's `<Family>Urls` class, and the views the endpoints answer are in its
  `_dto.dart`, each measured from the live answers.

  - The 47 new families, each its own library under `lib/`, imported with a
    prefix and answered by a getter on the client and by `resourceByName`:
    `account_groups`, `action_scripts`, `additional_codes`,
    `alert_responsibilities`, `alert_responsibility`, `applications`,
    `approval_profiles`, `approval_user_groups`, `attribute_attachments`,
    `billing_periods`, `charging_periods`, `communication_profiles`,
    `communications`, `countries`, `custom_events`, `custom_fields`,
    `custom_forms`, `day_of_month`, `departments`, `designations`,
    `document_templates`, `email_templates`, `fulfillment_profiles`,
    `fulfillment_terms`, `invoice_terms`, `note_attachments`, `organisation`,
    `organisations`, `pricing_periods`, `proforma_invoices`, `purchase_express`,
    `quote_orders`, `receive_terms`, `reconciliations`,
    `return_vendor_authorizations`, `roles`, `sales_reps`, `salutations`,
    `settings_workflows`, `shipping_packages`, `shipping_rules`,
    `system_events`, `teams`, `time_periods`, `uom`, `webhooks`, `zones`.

  - The new endpoints of the existing families, by function:
    - `accounts` (18): `getAccountKpis`, `getAccountFinancialSummary`,
      `getAccountCustomObject`, `getAccountCustomObjectInstance`,
      `getAccountComponentObjects`, `getAccountComponentObject`,
      `createAccount`, `replaceAccount`, `reactivateAccount`,
      `createAccountContacts`, `replaceAccountAddress`,
      `createAccountPaymentMethod`, `replaceAccountPaymentMethod`,
      `createAccountCustomObjectInstance`, `updateAccountCustomObjectInstance`,
      `sendAccountEmail`, `purgeAccount`, `deleteAccountNoteFile`.
    - `approvals` (2): `approveApproval`, `rejectApproval`.
    - `bookings` (31): `createBooking`, `previewBooking`, `deleteBooking`,
      `getBookingNotes`, `getBookingBillingPreferences`,
      `updateBookingBillingPreferences`, `changeBooking`,
      `previewBookingChange`, `getBookingInformation`,
      `updateBookingInformation`, `getBookingLines`, `getBookingLine`,
      `updateBookingLine`, `updateBookingLineBillingPreferences`,
      `getBookingCustomObjects`, `getBookingCustomObject`,
      `getBookingCustomObjectInstance`, `getBookingCustomObjectsInstances`,
      `getBookingCustomObjectsInstance`,
      `getBookingCustomObjectsInstanceInstance`, `getBookingInvoices`,
      `getBookingItemFulfillments`, `getBookingItemFulfillment`,
      `getBookingKpis`, `getBookingPaymentMethods`, `getBookingPaymentMethod`,
      `getBookingPayments`, `getBookingPayment`, `getBookingPdf`,
      `getBookingQuotePartialInvoices`, `getBookingShippingPdf`.
    - `credit_notes` (11): `createCreditNote`, `deleteCreditNote`,
      `applyCreditNote`, `getCreditNoteItems`,
      `getCreditNoteCreditNoteApplications`, `getCreditNoteNotes`,
      `getCreditNoteNote`, `createCreditNoteNote`, `deleteCreditNoteNote`,
      `getCreditNoteNoteFiles`, `getCreditNoteNoteFile`.
    - `custom_components` (28): `createComponent`, `updateComponent`,
      `createComponentObject`, `updateComponentObject`, `deleteComponentObject`,
      `createComponentObjectActivity`, `getComponentObjectActivityById`,
      `getComponentObjectMilestones`, `getComponentObjectMilestone`,
      `getComponentObjectHistory`, `getComponentObjectHistoryById`,
      `getComponentObjectNotes`, `getComponentObjectNote`,
      `getComponentObjectNoteFiles`, `getComponentObjectNoteFile`,
      `createComponentObjectNote`, `updateComponentObjectNote`,
      `deleteComponentObjectNote`, `deleteComponentObjectNoteFile`,
      `getComponentObjectCustomObject`,
      `createComponentObjectCustomObjectInstance`,
      `getComponentObjectCustomObjectInstance`,
      `updateComponentObjectCustomObjectInstance`,
      `deleteComponentObjectCustomObjectInstance`, `linkComponentObjectDomains`,
      `updateComponentObjectDomains`, `unlinkComponentObjectDomains`,
      `changeComponentObjectStatus`.
    - `custom_features` (3): `getCustomFeatures`, `getCustomFeatureById`,
      `deleteCustomFeatureById`.
    - `gift_certificates` (5): `amendGiftCertificate`,
      `allocateGiftCertificate`, `deallocateGiftCertificate`,
      `getGiftCertificateAllocation`, `getGiftCertificateTransaction`.
    - `invoices` (8): `getInvoiceKpis`, `getInvoiceLines`, `getInvoiceLine`,
      `getInvoiceCreditNoteApplication`, `getInvoiceCustomObjects`,
      `getInvoiceCustomObject`, `getInvoiceCustomObjectInstance`,
      `deleteInvoiceNoteFile`.
    - `item_fulfillments` (4): `deleteItemFulfillment`,
      `getItemFulfillmentNotes`, `getItemFulfillmentNote`,
      `deleteItemFulfillmentNote`.
    - `item_receipts` (2): `deleteItemReceipt`, `deleteItemReceiptNote`.
    - `items` (6): `createItemInventories`, `createItemInventory`,
      `addItemInventories`, `updateItemPackageDetail`, `deleteItemNoteFile`,
      `getItemKpis`.
    - `labours` (4): `updateLabourAvailability`, `getLabourProfileSessions`,
      `getLabourProfileSession`, `getLabourCalendar`.
    - `milestones` (2): `getMilestonesEmployeeByCode`, `getMilestone`.
    - `note_groups` (1): `getNoteGroupNotesByUser`.
    - `orders` (24): `getOrdersNotes`, `previewOrder`, `createOrderExpress`,
      `acceptOrder`, `activateOrderInvoiceFromDormant`, `previewOrderChange`,
      `changeOrderStatus`, `adjustOrderContract`,
      `previewOrderContractAdjustment`, `downgradeOrder`,
      `previewOrderDowngrade`, `upgradeOrder`, `previewOrderUpgrade`,
      `terminateOrderTrial`, `deleteOrderNoteFile`, `getOrderCustomObject`,
      `getOrderCustomObjectInstance`, `getOrderCustomObjectsInstance`,
      `getOrderCustomObjectsInstanceInstance`, `getOrderItemFulfillment`,
      `getOrderKpis`, `getOrderPayment`, `getOrderQuotePartialInvoices`,
      `getOrderShippingPdf`.
    - `payments` (3): `createPayment`, `getInvoicePayment`,
      `getPaymentNoteFiles`.
    - `portals` (1): `setPortalPassword`.
    - `purchase_credit_notes` (5): `createPurchaseCreditNote`,
      `deletePurchaseCreditNote`, `applyPurchaseCreditNote`,
      `createPurchaseCreditNoteNote`, `deletePurchaseCreditNoteNote`.
    - `purchase_invoices` (1):
      `getPurchaseInvoicePurchaseCreditNoteApplication`.
    - `purchase_orders` (2): `getPurchaseOrderKpis`,
      `deletePurchaseOrderNoteFile`.
    - `purchase_payments` (3): `getPurchasePaymentPurchaseCreditNotes`,
      `updatePurchasePaymentNote`, `deletePurchasePaymentNoteFile`.
    - `purchase_refunds` (3): `createPurchaseCreditNotePurchaseRefund`,
      `updatePurchaseRefund`, `deletePurchaseRefund`.
    - `refunds` (7): `getRefundNotes`, `getRefundNote`, `createRefundNote`,
      `deleteRefundNote`, `getRefundNoteFiles`, `getRefundNoteFile`,
      `deleteRefundNoteFile`.
    - `return_merchandise_authorisations` (14):
      `updateReturnMerchandiseAuthorisation`,
      `deleteReturnMerchandiseAuthorisation`,
      `approveReturnMerchandiseAuthorisation`,
      `rejectReturnMerchandiseAuthorisation`,
      `receiveReturnMerchandiseAuthorisation`,
      `getReturnMerchandiseAuthorisationReceive`,
      `getReturnMerchandiseAuthorisationReceiveByUuid`,
      `createReturnMerchandiseAuthorisationNote`,
      `getReturnMerchandiseAuthorisationNotes`,
      `getReturnMerchandiseAuthorisationNote`,
      `deleteReturnMerchandiseAuthorisationNote`,
      `getReturnMerchandiseAuthorisationNoteFiles`,
      `getReturnMerchandiseAuthorisationNoteFile`,
      `deleteReturnMerchandiseAuthorisationNoteFile`.
    - `settings` (52): `getSettingsCustomObjects`, `getSettingsCustomObject`,
      `createCustomObject`, `updateCustomObject`, `deleteCustomObject`,
      `createSettingsCurrency`, `updateSettingsCurrency`,
      `createSettingsCustomLogicScript`, `updateSettingsCustomLogicScript`,
      `deleteSettingsCustomLogicScript`, `createSettingsDiscountProfile`,
      `getSettingsDiscountProfile`, `updateSettingsDiscountProfile`,
      `deleteSettingsDiscountProfile`, `getSettingsFieldSettings`,
      `getSettingsFieldSetting`, `getSettingsGeneralSettings`,
      `getSettingsGeneralSetting`, `updateSettingsGeneralSettingsDashboard`,
      `updateSettingsGeneralSettingsDateAndTime`,
      `updateSettingsGeneralSettingsDisplay`,
      `updateSettingsGeneralSettingsGeneral`,
      `updateSettingsGeneralSettingsLabour`,
      `updateSettingsGeneralSettingsOrder`,
      `updateSettingsGeneralSettingsPortal`,
      `updateSettingsGeneralSettingsPurchase`,
      `updateSettingsGeneralSettingsSecurity`,
      `updateSettingsGeneralSettingsTransaction`,
      `createSettingsPaymentProcessor`, `getSettingsPaymentProcessor`,
      `updateSettingsPaymentProcessor`, `deleteSettingsPaymentProcessor`,
      `createSettingsPaymentTerm`, `getSettingsPaymentTerm`,
      `updateSettingsPaymentTerm`, `deleteSettingsPaymentTerm`,
      `createSettingsPricingLevel`, `getSettingsPricingLevel`,
      `updateSettingsPricingLevel`, `deleteSettingsPricingLevel`,
      `createSettingsShippingProfile`, `getSettingsShippingProfile`,
      `updateSettingsShippingProfile`, `deleteSettingsShippingProfile`,
      `createSettingsWarehouse`, `getSettingsWarehouse`,
      `updateSettingsWarehouse`, `deleteSettingsWarehouse`, `createSettingsTax`,
      `getSettingsTax`, `updateSettingsTax`, `deleteSettingsVariation`.
    - `tasks` (8): `createTask`, `updateTaskChecklistByUuid`,
      `deleteTaskChecklistByUuid`, `getTaskNote`, `updateTaskNote`,
      `getTaskNoteFiles`, `getTaskNoteFile`, `deleteTaskNoteFile`.
    - `timesheets` (1): `getTimesheet`.
    - `workflows` (11): `getWorkflows`, `getWorkflow`, `createWorkflow`,
      `updateWorkflow`, `deleteWorkflow`, `getWorkflowStages`,
      `getWorkflowStage`, `getWorkflowMilestone`,
      `getWorkflowCustomComponentHistory`,
      `getWorkflowCustomComponentMilestones`,
      `getWorkflowCustomComponentMilestone`.

- **Four existing views read the fields their answers carry and they did not:**
  `Account.href` and `Account.paymentMethod`, `BookingById.activityLogs`,
  `Component.activityLogs` and `InvoiceLine.itemSerialOrBatchNumber`. Nothing
  they read before changes.

- **`exsited.dart` exports the 24 new `accounts` and `items` functions and
  the views they answer.** `accounts.NoteAttachment` stays in
  `src/resources/accounts/accounts_dto.dart` only, since `items.NoteAttachment`
  already holds that name in the barrel.

- **1,364 live cases, one in each of the four files for each of the 341 new
  endpoints with a case**, so the tier counts 3,059 cases. `test/README.md`
  lists the 108 new endpoints with no case and why. `live_suite.dart` gains the
  helpers the new cases share: `Created`, `cleanUpCreated`, `readBack`,
  `lookup`, `requireRecordShape`, `requireRowsShape`, `requireEveryKeyDeclared`,
  `requireViewReadsBody` and `requireViewReadsDeclared`.

### Changed

- **The package is `exsited`, published on pub.dev.** Install it with
  `dart pub add exsited`. The import path is `package:exsited/exsited.dart`, and
  every family library moves the same way: `package:exsited_sdk/payments.dart` is
  now `package:exsited/payments.dart`. A project that depended on `exsited_sdk`
  by `path:` swaps that dependency for `exsited: ^4.0.0` and rewrites its imports;
  every class, function and family keeps its name. `Sdk.version` and `sdkVersion`
  answer `4.0.0`, so the User-Agent reports `exsited-dart-sdk/4.0.0`.

- **The token now comes from `/api/v4/oauth2/token`.** `ApiVersion.v4.tokenPath`
  and `SdkConfig.tokenPath` answer this path, and the `refresh_token` renewal is
  sent there too.

- **`custom_components.createComponentByUuid`, `updateComponentById` and
  `deleteComponentById`, and `workflows.getWorkflowComponentHistory` and
  `getWorkflowComponentCcInstanceCcMilestone`, are sent on v4**, the client's
  configured version, like every other endpoint. The live tests send their
  lookups on v4 too.

- **Every endpoint has one function, in the family that owns the first segment
  of its path.** 34 functions reached an endpoint that another family already
  calls, and they are removed, the `notes` and `quotes` families with them.
  Breaking: `package:exsited_sdk/notes.dart` and `package:exsited_sdk/quotes.dart`
  no longer exist, `client.notes` and `client.quotes` no longer resolve, and
  `resourceByName('notes')` and `resourceByName('quotes')` answer the unknown
  name error. Each removed function goes with its bound method. Every
  replacement takes the same positional arguments in the same order, and two drop
  the `queryParams` named parameter the removed function took:
  `accounts.getAccountEmail` and `accounts.getAccountNote`. Each replacement
  answers its own family's view, which ENDPOINTS.md names. The replacements:
  - `notes.getAccountNotes`, `getAccountNote`, `createAccountNote`,
    `updateAccountNote` and `deleteAccountNote`: the same names on `accounts`.
    The `accounts` writes answer `AccountNotes` where the removed ones
    answered `AccountNote`.
  - `quotes.getOrders` and `quotes.getOrder`: `orders.getOrders` and
    `orders.getOrder`.
  - `account_emails.getAccountCommunicationsEmails` and
    `getAccountCommunicationsEmail`: `accounts.getAccountEmails` and
    `accounts.getAccountEmail`. `account_emails.deleteAccountCommunicationsEmail`
    stays.
  - `invoices.getAccountInvoices`, `orders.getAccountOrders`,
    `payments.getAccountPayments`, `purchase_invoices.getAccountPurchaseInvoices`,
    `purchase_orders.getAccountPurchaseOrders`,
    `purchase_payments.getAccountPurchasePayments`,
    `purchase_refunds.getAccountPurchaseRefunds` and `refunds.getAccountRefunds`:
    the same names on `accounts`.
  - `custom_features.getComponent` and `settings.getComponent`:
    `custom_components.getComponent`. `custom_features.getComponentById` and
    `settings.getComponentById`: `custom_components.getComponentByUuid`.
  - `tasks.getEmployees`: `employees.getEmployees`. `tasks.getMilestones`:
    `milestones.getMilestones`. `milestones.getLabours`: `labours.getLabours`.
  - `item_fulfillments.getInvoiceItemFulfillments` and
    `getInvoiceItemFulfillment`, and
    `return_merchandise_authorisations.getInvoiceReturnMerchandiseAuthorisations`
    and `getInvoiceReturnMerchandiseAuthorisation`: the same names on
    `invoices`.
  - `inventory_adjustments.getItemInventoryAdjustments`:
    `items.getItemInventoryAdjustments`.
  - `purchase_credit_note_applications.getPurchaseInvoicePurchaseCreditNoteApplications`
    and `purchase_payments.getPurchaseInvoicePurchasePayments`: the same names on
    `purchase_invoices`.
  - `purchase_invoices.getPurchaseOrderPurchaseInvoices`,
    `purchase_invoices.createPurchaseOrderPurchaseInvoice` and
    `purchase_payments.getPurchaseOrderPurchasePayments`: the same names on
    `purchase_orders`.

  The account note views the accounts functions read, `AccountNote`,
  `AccountNoteList` and their five nested views, move from the notes family into
  `accounts_dto.dart`, and the main library exports them. The typed views only
  the removed functions read go with them: the quotes family's views,
  `Component`, `ComponentList` and their nested views in `custom_features` and
  `settings` (the `custom_components` ones stay), `Labour`, `LabourList` and
  their nested views in `milestones`, `Employee`, `EmployeeList`, their nested
  views and `Milestones` in `tasks`,
  `PurchaseInvoicePurchaseCreditNoteApplications` and its nested views,
  `InvoiceReturnMerchandiseAuthorisations` and its nested views,
  `ItemFulfillmentReadList` and `PurchasePaymentReadList`. So do the path
  templates only they sent to, such as `OrdersUrls.accountOrders` and
  `TasksUrls.employees`, `AccountEmailsUrls.accountCommunicationsEmails`, and the
  keys no remaining view reads, `CustomFeaturesUrls.dataKey`,
  `CustomFeaturesUrls.componentKey` and `SettingsUrls.componentKey`; the owning
  family keeps its own. The `inventory_adjustments` and
  `purchase_credit_note_applications` test files no longer write, so they lose
  the `write` tag and the ten minute timeout.

- **`OrderReadCustomAttribute.value` and `OrderReadLineItemCustomAttribute.value`
  are untyped.** Breaking: each is an `Object?` where it was a `List<String?>?`.
  A `STRING` attribute answers its value as a string, which the list reader read
  as null, so `.dto` lost it on every order read and write; the value is now
  taken through unread, a `String` or a `List`, as the API sent it.

- **`workflows.getWorkflowComponentHistory` and
  `getWorkflowComponentCcInstanceCcMilestone` send at the documented paths.**
  Breaking: the history now takes one argument, `componentObjectId`, the
  instance's code, at `/workflow/component/{component_object_id}/history`, in
  place of `ccInstanceId` and `ccId`; the milestone read takes `componentUuid`,
  the component's dashed uuid, and `componentObjectId`, in place of
  `ccInstanceId` and `ccId`. Both answer 200, under `histories` and
  `milestones`. `updateWorkflowComponentById` and
  `createWorkflowComponentCcMilestone` are unchanged: their documented routes
  take two slots where the SDK has one, and no verified body is known for them.

- **`custom_components.createComponentByUuid`, `updateComponentById` and
  `deleteComponentById` take the component's dashed uuid**, not the `cmp_` id.
  The component writes' view already unwraps the component's own name, which
  the answer is keyed by.

- **Twelve note writes take the note's text and optional files, sent as a form
  or as multipart**, where they took a JSON payload: `notes.createAccountNote`
  and `notes.updateAccountNote` (removed since with the `notes` family, see the
  one function per endpoint entry above; `accounts.createAccountNote` and
  `updateAccountNote` take the same arguments), `orders.createOrderNote`,
  `orders.updateOrderNote`,
  `invoices.createInvoiceNote`, `item_fulfillments.createItemFulfillmentNote`,
  `payments.createPaymentNote`, `purchase_invoices.createPurchaseInvoiceNote`,
  `purchase_invoices.updatePurchaseInvoiceNote`,
  `purchase_orders.createPurchaseOrderNote`,
  `purchase_payments.createPurchasePaymentNote` and `tasks.createTaskNote`.
  Breaking: each takes `String note, {Map<String, Object?>? files}` in place of
  `Object payload`, as the bound methods on the client do, and refuses an empty
  note before any request. Each endpoint reads only the form field `note` and
  optional file parts; a JSON body always answered 400 "note is required". The
  hand-written `createAccountNote`, `updateAccountNote`, `createItemNote` and
  `updateItemNote` gain the same optional `files`, so every note write can
  attach a file; without files the body stays form-encoded, with them it is
  multipart. The live suites send the text through these functions, the note
  helpers the other cases build on use them instead of the raw client, and the
  plain files gain the plan's three file variants: `createItemNoteWithFile`,
  `updateItemNoteWithFile` and `createOrderNoteMultipartWithFile`.

- **The `X-Idempotency-Key` the SDK generates is a version 4 uuid**, where it was 32
  hex digits. v4 refuses every POST without the header (400
  `x.idempotency.key.header.required`); the SDK already added one to every POST,
  JSON, form and multipart alike, once per call, so a retry and the 401 replay repeat it, and a
  caller's own key in any spelling still wins.

- **Every typed view declares every key its endpoint answered when all 447
  endpoints were measured live on 2026-09-27.** 498 fields were added to
  existing views and 1,054 classes are new: 77 views and 977 records nested in
  them, since a nested object or a list of objects is now a view of its own
  rather than an untyped `Object?`. 128 endpoints that named no view, 88 of them
  writes, now name one, so their `ApiResponse<Object?>` becomes
  `ApiResponse<TheView>` and `response.dto` is typed; the invoice and order PDF
  reads name a view of the JSON descriptor they answer. `aba_files` is still the
  one family with none, because its endpoint never answered 2xx. `map` and
  `json` are unchanged.

  Breaking: 497 declared fields changed type where the measurement contradicted
  them, mostly `Object?` and `List<Object?>?` becoming a nested view or a list
  of one, and some `String?` becoming `int?`, `bool?` or `double?`;
  `Pagination.links` is a `PaginationLinks` and `Pagination.prevCursor` a
  `String?`. A field whose earlier records disagreed on its type stays untyped.
  24 endpoints name a different view because the one they named did not fit
  their answer: `getAccountContact`, `getAccountAddress`,
  `getAccountPaymentMethod`, `getAccountInventories` and
  `getAccountQuotePartialInvoices` no longer answer `Account`; the invoice item
  fulfillment, RMA, note and note file reads no longer answer `Invoice`;
  `getItemFamilyDetails`, `getItemPackageDetails` and `getItemPackageDetail` no
  longer answer `Item`; the purchase invoice, order and payment note and note
  file reads no longer answer a sibling note view; and the general and field
  settings writes no longer answer `SettingsFieldSettingsItem`. The views they
  used to name stay. `ItemSaleView`, `ItemPurchaseView` and
  `ItemInventoriesView` unwrap the `item` envelope those reads answer under, and
  `ItemInventoriesView.id` is the `String` path code the inventories read sends.
  The component writes' view unwraps whichever component name the answer is
  keyed by, where it had hard-coded one. Each family's `<Family>Urls` names the
  envelopes its new views read, as it already did for the old ones.

- **The package needs Dart 3.5 or later.**
  `environment.sdk` is `^3.5.0` where it was `>=3.4.0 <4.0.0`. The manifest also
  names its repository and moves the dev toolchain to `lints ^6.0.0`,
  `test ^1.31.0` and `dotenv ^4.2.0`, which only the test credentials helper
  reads. `analysis_options.yaml` enables six lint rules (`prefer_final_locals`,
  `prefer_final_in_for_each`, `avoid_dynamic_calls`, `unnecessary_lambdas`,
  `prefer_single_quotes`, `directives_ordering`), excludes `scratchpad/` and
  `bin/dart-sdk/`, and drops the `todo: ignore` override. The fixes they asked
  for are import order, quote style and tear-offs, and change no behaviour.

- **Eleven account reads name the typed view another family measured from the
  same path.** `getAccountNotes`, `getAccountNote`, `getAccountEmails`,
  `getAccountEmail`,
  `getAccountOrders`, `getAccountPayments`, `getAccountRefunds`,
  `getAccountPurchaseOrders`, `getAccountPurchaseInvoices`,
  `getAccountPurchasePayments` and `getAccountPurchaseRefunds` answered
  `ApiResponse<Object?>` with a null `dto`, while the notes, account emails,
  orders, payments, refunds and purchase families declared a view measured from
  exactly those paths. Each now answers that view, the one its own family's
  function names, so `response.dto` is typed. `map` and `json` are unchanged.
  The two note views, `AccountNoteList` and `AccountNote`, have since moved into
  `accounts_dto.dart` with the removal of the `notes` family.

- **Each family's `<Family>Urls` carries its body keys.** Beside the path
  templates, `dataKey` names the key a listing's
  records arrive under (`data`) in the 41 families with a listing view, and
  `<envelope>Key` names each envelope one of the family's views unwraps
  (`NotesUrls.noteKey`, `ItemReceiptsUrls.itemReceiptHyphenatedKey` for the one
  hyphenated key), all read off the views the SDK already had. `AccountsUrls`
  and `ItemsUrls` also name the paging and sorting parameters their listings
  take in `queryParams`. Breaking: the top-level `recordKey` constant is gone
  from the 35 families that declared it; read `<Family>Urls.dataKey`. The item
  filter sets moved too: `filterableFields` and `deprecatedFilters` are now
  `ItemsUrls.filterableFields` and `ItemsUrls.deprecatedFilters`, and the main
  library no longer exports them at the top level.

- **Every endpoint function takes one per-family shape.**
  Breaking, for all 447: `responseFormat` is a `String?` (`'map'`, `'json'` or
  `'dto'`, or `SdkConfig.responseFormatMap` and its two siblings) instead of a
  `ResponseFormat`; an identifier is an `Object` rather than a `String`, so an
  integer id needs no `toString()`; a payload is a non-null `Object`, so a null
  one is refused by the type system rather than at run time, and a note text is
  a non-null `String` (an empty one is still refused with `SdkUsageError`); and
  an endpoint with no typed view answers `ApiResponse<Object?>`, where the
  generated families answered `ApiResponse<Never>`. Each function calls the
  client with flat named parameters and names its view as `dtoDecoder`, and a
  blank identifier is refused by the URL builder, still with `SdkUsageError` and
  still before any I/O, so the message now reads
  `<path template> -> blank path params: <slot>`. The bound classes behind
  `client.<family>` follow the same signatures. Every function keeps its name,
  path, verb, parameters and view.

- **Every typed view is on the `Dto` base.** Breaking: each view's `fromMap` is
  now `static X? fromMap(Object? body)`, answering `null` for a body that is not a
  map rather than taking only a `Map`, so a caller that built a view directly adds
  a `!` or a `?.`. The static `envelope` constant on a view is gone; `envelopeKey`
  answers the same key. A view declares its fields once, in `fields`, and
  `toMap()` and the redacting `toString()` come from the base, so a nested view is
  written without its own envelope, as the API sends it. `Dto.fields` is abstract,
  so a subclass of your own declares it. The fields every view declares are
  unchanged. The views read through `readRecord`, `readText`, `readInteger`,
  `readDecimal`, `readFlag`, `readAny` and `readList`; the earlier names
  (`readString`, `readInt`, `readDouble`, `readBool`, `readDto`, `readDtoList`,
  `readAnyList`, `unwrapEnvelope`, `wrapEnvelope`, `putIfPresent`) stay as
  helpers.

- **The external database functions and path constants are spelled out.**
  Breaking: `createExternalDatabas`, `getExternalDatabas`,
  `createExternalDatabasInsertRecord`, `createExternalDatabasSearch`,
  `updateExternalDatabasUpdateRecords` and `getExternalDatabasTable` are now
  `...ExternalDatabase...`, and `ExternalDatabasesUrls.externalDatabas...` is
  `externalDatabase...`. The paths are unchanged.

- **`createExpres` is `createExpress`.** Breaking: the express endpoint, on the
  family's functions and on `client.express`, took the same clipped singular as
  the external database functions did. The path and the `Express` view are
  unchanged.

- **The settings warehouse views are spelled out.** Breaking:
  `SettingsWarehous`, `SettingsWarehousCountry` and `SettingsWarehousList` are
  now `SettingsWarehouse`, `SettingsWarehouseCountry` and
  `SettingsWarehouseList`. `getSettingsWarehouses` and its path are unchanged.

- **`ExsitedClient` gains a closed state and more injection points.**
  Breaking: `close()` now latches the client closed, and a request after it is
  refused with `SdkUsageError` (`client '<name>' is closed ...`) before any I/O,
  where it used to reach a closed HTTP client. A call already in flight when
  `close()` runs keeps its connection and log file, and the last one to finish
  releases them. New: `isClosed`, `closeClient()` (an alias of `close()`), and
  the `transport`, `retryPolicy` and `tokenProvider` constructor parameters
  beside `tokenStore`, `httpClient`, `onLog` and `onWarning`. An injected
  `transport`, like an injected `httpClient`, is never closed by the client.

- **`ClientRegistry` has new names, and `buildClient` is new.**
  `ClientRegistry(credentials)` takes a list of `SdkConfig` or
  `AuthConfig` entries, `resolveIndex` selects by `clientName` or by index
  (negative counts from the end), and `getClient`, `listClientNames()` and
  `closeAllClients()` join `addClient` and `close()`; `client`, `indexOf`,
  `clientNames`, `length` and `ClientRegistry.fromAuth` stay as aliases.
  Messages changed: an empty list reads `ClientRegistry needs at least one
  credentials block`, and a failed `close()` reads `N client(s) failed to close
  (...); all were attempted and dropped`. `addClient` also refuses the
  `<index n>` placeholder label. New: `registerInstances`,
  `getRegisteredInstances` and `listInstanceNames`, on `ClientRegistry` and at
  the top level, and `buildClient({instance, credentials, ...})`, which builds
  an `ExsitedClient` for a registered instance through
  `SdkConfig.fromCredentials` with any of its overrides.

- **The resource families are members of `ExsitedClient`, and the by-name
  registry starts full.** `client.accounts` and the
  other 43 getters are now declared on the client and build their family once,
  so two reads answer the same object; `listResourceNames()` and
  `resourceByName()` are client methods too. Breaking: the
  `ExsitedClientResources` and `ExsitedClientResourceLookup` extensions are
  gone, so an import that names either in a `show` list must drop it; a call
  through `client.<family>` is unchanged. `registeredResourceNames()` lists all
  44 families before anything is registered, and `registerGeneratedResources()`
  is kept as a no-op. An unknown name reads `no resource '<name>'; available:
  ...`.

- **Logging goes through levels, and the console renders sections.** Every record
  has a level and goes to the new `onLog(String)` hook on `ExsitedClient` and to
  `logFile`, gated by `logLevel`: an INFO line per attempt sent and per exchange
  (`GET /api/{api_version}/accounts -> 200 in 0.12s (attempt 1/1)`, the template
  and never the resolved URL), a WARNING for a 401 that is refreshed and replayed
  and for insecure transport, an ERROR for a send that produced no response, and,
  with `logBodies`, a DEBUG line carrying the redacted payload and response. The
  file line is `<ISO time> LEVEL exsited.<clientName> <message>`, held open
  through a reference-counted `FileLogSink` and released by `close()`; at the
  default `WARNING` an ordinary exchange writes nothing, so set `logLevel: 'INFO'`
  to keep the old one-record-per-exchange file. What is printed is `Console`'s
  rendering under the print options: pretty sections for the call, headers,
  payload, response and a POSIX `curl` line, or one compact `exsited | ...` line,
  with colour, `printMaxChars` truncation and a `request id` row for a failed
  call. The printed endpoint row is the resolved URL, redacted. Every value still
  goes through `neutraliseControls`, and the printed block through
  `encodeForConsole`, so a control sequence in a body cannot rewrite the terminal.
  `renderExchange(response, body, files, config)`, `buildCurlCommand` and
  `Console` are exported; the old `renderExchange(response)` and
  `renderExchangeBlock` are gone. An insecure transport (plain `http://` to a
  remote host, or `verifySsl: false`) raises an `InsecureTransportWarning` through
  the new `onWarning` hook as well as to stderr, once per origin per process, and
  `ExsitedClient.resetWarningDeduplication()` re-arms it.

- **The HTTP layer is rebuilt around `Transport.sendHttpRequest`.** `Transport`
  sends through `sendHttpRequest(TransportRequest)` and answers the finished
  `ApiResponse` (`send` and `Exchange` are gone), takes `client`, `retryPolicy`
  and `onProgress`, and is exported with `TransportRequest`. A request is frozen
  and encoded once, so every attempt and the 401 replay send the same bytes;
  `maxRequestBytes`, `maxRequestSourceBytes` and `maxMultipartOverheadBytes` are
  charged while it is built, before a token is fetched, and the refusal reads
  `... passes the N-byte maxRequestBytes ceiling at M byte(s) ...`. Each attempt
  has its own `timeoutSeconds` budget shared by the headers and the body, and a
  timed-out attempt aborts its socket. A JSON body is sent as
  `application/json; charset=utf-8`. A network or timeout failure raises
  `the request failed|timed out after N attempt(s) (<type>)` with `ErrorType`, a
  `RequestInfo` and the platform error on `cause`, and the response ceiling raises
  `the response body is larger than the N-byte cap ...`. A text body is decoded by
  its declared charset. `RetryPolicy` is
  `RetryPolicy(maxAttempts, backoffSeconds, backoffMaxSeconds, ...)`,
  `RetryPolicy.defaults()` and `RetryPolicy.fromConfig(config)`, with
  `shouldRetryStatusCode`, `shouldRetryAfterException`, `computeBackoffSeconds`,
  `isUnsafeMethod`, `isIdempotentMethod`, `TransportFailureKind` and the default
  code sets; a connection that never opened is retried for any method and a
  request that may have been sent only for GET, HEAD, OPTIONS, TRACE, PUT and
  DELETE. `Retry-After` is read in the IMF-fixdate, RFC 850 and asctime forms and
  clamped to `retryBackoffMaxSeconds`. `shouldRetry`, `delay` and
  `mayReplayTransportError` remain as aliases; `HttpDate` is gone. `UrlBuilder`
  and `QueryParams` are the static classes; `buildUrl` answers a `String` and
  refuses an absolute URL on another origin or carrying credentials,
  `substitutePathParams` takes `Map<String, Object?>` and accepts an `int`, and a
  dot-only value is refused. `buildQueryParams` answers a `Map<String, Object?>`
  **in the order the caller wrote it**, where it used to sort by name, and renders
  a `DateTime` with its offset; `SortDirection` has a `value`. `QueryPair` and
  `encodeQueryParams` are gone. A `files` map sends a multipart body.
  `connectTimeoutSeconds`, `verifySsl`, `caBundle`, `proxyUrl` and the rest apply
  through the default client this SDK builds; an injected `http.Client` is used as
  it is and is never closed.
- **`ExsitedClient.sendApiRequest` and the five verb helpers take flat named
  parameters** (`pathParams`, `queryParams`,
  `jsonBody`, `formData`, `files`, `headers`, `authenticated`, `raiseOnError`,
  `responseFormat` as a `String`, `dtoDecoder`). `options: CallOptions(...)`
  and `buildDto` still compile, and a flat argument wins over them. Headers are
  merged case-insensitively with `Authorization` last, and a header that
  carries a line break, starts with whitespace or breaks the RFC 9110 grammar
  is refused with `SdkUsageError` before any I/O, naming the header and never
  its value. A query parameter named both in the path's own query string and
  in `queryParams` is refused. `idempotentMethods` is now
  `idempotencyKeyMethods`, kept under the old name too.

- **`SdkConfig` gains connection, TLS, proxy, ceiling, logging and print options,
  and renames its timing options to seconds.** Breaking: `timeout` (a `Duration`)
  is `timeoutSeconds` (a `double`, default 30.0), `retryBackoff` and
  `retryBackoffMax` are `retryBackoffSeconds` (0.5) and `retryBackoffMaxSeconds`
  (20.0), `retryableHttpCodes` and `unsafeRetryableHttpCodes` are `Set<int>` (at
  most 500 entries), `maxUploadBytes` is `maxRequestBytes` and
  `defaultMaxUploadBytes` is `SdkConfig.defaultMaxRequestBytes`, `printRequests`
  is replaced by the print options below, and `responseFormat` is a `String`
  (`SdkConfig.responseFormatMap`, `responseFormatJson`, `responseFormatDto`;
  `ResponseFormat.x.wireName` gives the same text). A blank
  `EXSITED_RESPONSE_FORMAT` and a blank `logFile` now read as unset instead of
  being refused, and a validation message no longer starts with the instance name.
  New options: `connectTimeoutSeconds` (10.0), `verifySsl` (true), `caBundle`,
  `proxyUrl` (an `https://` proxy is refused), `poolMaxsize` (10),
  `maxRequestSourceBytes` (64 MiB), `maxMultipartOverheadBytes` (1 MiB),
  `maxTokenCacheBytes` (1 MiB; validated, while the file token store keeps its own
  1 MiB ceiling), `maxCaBundleBytes` (4 MiB), `logLevel` ('WARNING'),
  `printApiInfo`, `printRequestPayload`, `printResponseBody`, `printHeaders`,
  `printCurl`, `printOnlyOnError`, `printFormat` ('pretty' or 'compact'),
  `printColor` and `printMaxChars` (0, unlimited). `defaultHeaders` is validated
  against the RFC 9110 header grammar, a blank `userAgent` is refused, and the
  header map and code sets are stored as unmodifiable copies (`defaultHeadersDict`
  answers a mutable one). New members: `withOverrides`, `fromCredentials` (an
  `SdkConfig`, an `AuthConfig` or a snake_case mapping using this SDK's own
  credential names), `selectCredentials`, `noOverride`, `normaliseProxyUrl`, the
  `default...` constants, the credential getters (`clientId`, `clientSecret`,
  `redirectUri`, `grantType`, `tokenCachePath`), `timeout` as the
  `(connect, read)` pair, and a `toString` that names every field with secrets
  masked. The `Sdk` class holds `version` and `defaultUserAgent`, and
  `readClientName` and `selectCredentials` are top-level too. `SdkConfig` is a
  `final class`. `apiVersion` stays the `ApiVersion` enum, and `httpClient` and
  `environment` stay.
- **`ApiResponse` resolves its forms lazily, and `RequestInfo` is reshaped.**
  `ApiResponse` is built from `data`, `bodyBytes`, `dtoDecoder`, `errorType` and
  a `String responseFormat`, and resolves `json` and `dto` lazily; it keeps its
  type argument, and `dto` is still null on a failed call. `getErrorMessages()`
  reads a text or byte body too and adds the RFC 7807 `detail` and `title` tier
  (`errorMessages` is kept). `raiseForStatus()` raises with the message
  `HTTP <status>` alone, and the server's messages travel on
  `getErrorMessages()` and `explain(includeSensitive: true)`, because a v4
  message can quote the rejected value; the raised error carries the
  `ErrorType` itself and the v4 envelope fields. `RequestInfo` is a
  `final class` implementing `RequestDetail`: `endpoint` is `endpointTemplate`,
  `attempt` is `attemptCount`, `elapsedMillis` is `elapsedSeconds` (a
  `double`), `queryParams` is `Map<String, Object?>`, and every field but the
  maps is nullable. `ErrorType` gains `value` and a `toString` that answers it,
  and implements `ErrorCategory`. `deriveEndpointTemplate` is exported.
  `ApiResponse.requestInfo` is nullable. Success denial stays on the v4 rule:
  a 2xx whose body's `object` is `error` has not succeeded. No `isSuccess`
  flag is read, because the Exsited API never sends one.

- **`Dto` builds `toMap()` and a redacting `toString()` from `fields`.** It
  carries `envelopeKey`, `topLevelFields` and `fields`, builds `toMap()` from
  `fields`, and has a `toString` that names every set field with secret-named
  values masked, where a view used to print as `Instance of '...'`. A view that
  still writes its own `toMap()` keeps working: its `fields` are read back from
  that body. The readers `readRecord`, `readInteger`, `readDecimal`, `readText`,
  `readFlag`, `readAny` and `readIdOrName` join `readString`, `readInt`,
  `readDouble`, `readBool` and the rest, which delegate to them; `readList` now
  answers an unmodifiable list. `DtoDecoder` is exported.

- **The errors are renamed `...Error` and gain a diagnostic surface.** `SdkError`,
  `SdkConfigError`, `SdkUsageError`, `SdkAttributeError`, `SdkAuthError`,
  `SdkTokenCacheError` and `SdkTokenLockError`; the `...Exception` names remain
  as type aliases of them, so an existing `on SdkUsageException` still catches.
  `SdkAttributeError` now extends `SdkUsageError`, so `on SdkUsageError` also
  catches an unknown resource name. The base gains `cause`, `getErrorMessages()`
  (unmodifiable; `errors` is kept as a read-only view of it), `getHint()` (`hint`
  kept), `explain({includeSensitive})`, `describeSafeShape`, and a structural
  `toString` naming the type, status, category, call template and attempt:
  `SdkError 404 not_found GET /api/v4/accounts/{id} attempt 1/1 - HTTP 404`
  where it used to print `SdkException: <message> (HTTP 404)`. `errorType` is
  typed `Object?` and holds the `ErrorType` itself. `explain()` prints the v4
  envelope's `code` and `request_id` when the body carried them. New:
  `RequestDetail`, `ErrorCategory` and `InsecureTransportWarning`.

- **Redaction is gathered into the `Redaction` class.** Every rule is a
  static on `Redaction` (`redacted`, `tooDeep`, `circular`, `unredactable`,
  `withheldStructure`, `maxDepth`, `sensitiveKeyMarkers`, `shouldRedact`,
  `redactValue`, `redactMapping`, `redactText`, `redactForDisplay`), and the
  top-level functions stay as delegates. Three things a caller can see: the
  marker `sessionid` is now `session`, so any key naming a session is masked;
  a key ending in `expired` (such as `customer_password_expired`) is a flag and
  is shown; and `redactText` redacts URLs and path queries inside free text
  only, while a JSON document held in a String is redacted by `redactValue`,
  which keeps the text byte for byte when nothing in it was secret and marks a
  document it cannot parse as `<unparsed String(N chars)>` instead of showing it.

### Added

- **`orders.createOrder`, `POST /api/{api_version}/orders`**, answered `201` and
  read as `OrderRead`, and `client.orders.createOrder`. One function takes every
  order body the collection sends: a single or multi-line order, a contract, a
  contract with a trial, order and line custom attributes, billing `properties`,
  addresses, a pre-order and a quote. A contract needs a recurring or metered
  item on a line. The plain orders file tests each genuinely different body as a
  case of its own, and the shared test helper that creates an order now sends
  through it.

- **`orders.createOrderExtendTrial`,
  `POST /api/{api_version}/orders/{order_id}/extend_trial`**, answered `200` and
  read as the new `OrderExtendTrial`, whose one field is `message`, and
  `client.orders.createOrderExtendTrial`. The new trial window must start after
  the current one ends. `OrdersUrls.orderExtendTrial` is its template.

- **`OrderRead.contractProperties`**, the new `OrderReadContractProperties`,
  which a contract order carries on the create answer and on `getOrder`, so
  `.dto` no longer drops it. Both new views were measured from the live create
  and extend answers on 2026-09-28.

- **The live tier tests every endpoint, writes included, in four files per
  family.** Nothing a caller of the package imports
  changes. Each of the 44 families has `<family>_test.dart` and
  `<family>_{map,json,dto}_test.dart` under `test/resources/<family>/`, with one
  case per endpoint in each, 415 per file kind, and the plain file adds a case
  for 33 of the 35 payload variants measured, so the tier counts 1,695 cases
  with the 2 credentials cases. The other 2 are the task note's JSON and form
  transports, which the plan measured failing; the one `createTaskNote` case
  sends the form. The cases replace the generated files' earlier
  contents: those called every GET and each write endpoint only in ways expected
  to fail (a blank id, an empty body, an unknown id), which the SDK refuses before
  any I/O. A plain case asserts the status,
  the envelope keys and the measured field types, reads a write back through a
  client of its own, and checks that a listing honours `limit`; the dto case
  asserts that the view declares every key the API sent, through its nested
  views. A write case creates the records it needs from the payloads measured on
  2026-09-27 and removes them in a `finally`, dependents first, leaving and
  naming what the API cannot remove. Only the booking dates are worked out at
  run time, the Monday at least a week ahead, so the timesheet and labour
  bookings never fall in the past. `accounts`, `items` and `invoices` gain the
  plain file they lacked, and `account_emails`, `workflows`,
  `aba_files`, `express` and `portals` gain their form files. A case where the
  API breaks its documented contract asserts the contract and fails, and an
  endpoint the measurement never made succeed keeps a case that fails until it
  is fixed. `write` is on the 156 files whose cases change the instance, so
  `-x write` selects 66 cases.

- **The test harness declares its instances and renders failures by shape.**
  Nothing a caller of the package imports changes. `test/auth/auth.dart` declares
  the instances (`Credentials.getInstances()`, one `AuthConfig` named `default`
  from the `EXSITED_` variables, read with `dotenv` from this repository's `.env`)
  and `registerInstances()`; `test/live_suite.dart` builds its client through
  `SdkConfig.fromCredentials` over them and gains the `EXSITED_TEST_VERBOSE`
  one-case gate, `report`, `reportIfVerbose`, `pathTemplateOf` and the shape-only
  `describeOutcome` and `describeUnsuccessful`, so a failed live case no longer
  prints the body the API answered. `dart_test.yaml` adds `concurrency: 1`,
  `platforms: [vm]`, `timeout: 2m` and declared tags, and every live file carries
  `@Tags` (`live` plus `endpoints`, `map`, `json` or `dto`, and `write` on the 32
  endpoint files that call a write endpoint). The new `test/credentials_test.dart`
  (tags `live`, `credentials`) mints a token at the token path and checks that
  `maxResponseBytes` refuses an oversize body; it is one of the live files.
  Missing credentials still skip every live case, now with `AuthConfig`'s refusal
  as the reason. `.env.example`, `.gitignore` and `.pubignore` are rewritten
  around the `EXSITED_` names, and the tree is kept by `dart format`, with the
  auth layer left out.

- **The main library exports the full redaction set**:
  `Redaction`, `circular`, `maxRedactionDepth`, `redactMapping`,
  `sensitiveKeyMarkers`, `shouldRedact` and `tooDeep`, beside `redactText`,
  `redactValue` and `redacted`.

- **`buildQueryParams`, `buildUrl` and `substitutePathParams` are exported from
  `package:exsited/exsited.dart`.** All three already existed under
  `lib/src/http/` and could be reached only by importing a `src/` path, which
  trips the `implementation_imports` lint. Nothing about them changed:
  `buildQueryParams` still orders by name and drops a null, `buildUrl` still
  refuses a fragment and an empty path, and `substitutePathParams` still reports
  every missing, unknown and blank slot at once.

### Fixed

- **The account detail view read 18 of the 40 keys the endpoint answers, and
  wrote back 9.** Measured read-only against the live instance on 2026-09-15,
  `GET /api/v4/accounts/{account_id}` returns **40 keys**. `Account` declared 18
  of them, so **22 arrived and were dropped on the way into the view**, and
  **17 of those 22 carried a value** on the record measured: `accounting_code`,
  `billing_preferences`, `communication_preferences`, `custom_attributes`,
  `custom_form`, `custom_objects`, `group`, `invoice_parent_account`,
  `last_updated_by`, `manager`, `origin`, `parent_account_id`, `payment_methods`,
  `portal_access`, `pricing_level`, `referral_tracking` and `time_zone`. Nothing
  was thrown: the fields did not exist, and `response.map` was the only place the
  values survived. All 22 are now declared, typed from that measurement, and the
  remaining five that the instance sent as null are declared too - `sales_rep`
  and `user_team` as a `Reference`, `workflow_status` as a String, `tax_id` and
  `tax_id_number` left untyped because nothing has ever been observed in them.

  `last_updated_by` is an **object**, not a string, which is the same mistake
  corrected in the invoice and settings families. Two new typed views come with
  it, `BillingPreferences` and `PaymentMethod`, and `PaymentMethod.isDefault`
  carries the wire key `default`, which is a Dart reserved word.

  `BillingPreferences.billingStartDayOfMonth` is deliberately **untyped**: some
  accounts send it as an `int` and others as a `String`. Claiming either would
  drop the value on every account that sends the other, silently.

- **`Address` read 9 of the 14 keys an address carries.** `address_line_2`
  through `address_line_5` and `href` were dropped, all of them populated on the
  record measured, so a street with five lines came back with one. `country` is a
  plain string on every address measured and stays one.

- **`Account.toMap` wrote 9 of the 20 fields it declared, and `AccountList.toMap`
  omitted `data` entirely.** This changes what a caller gets back from a round
  trip. `account.toMap()` now returns every field `Account.fromMap` populated -
  `currency`, `tax`, `social_links`, `created_on`, `last_updated_on`,
  `created_by`, `addresses`, `contacts`, `partial_invoices` and `inventories`
  were all read and then dropped - and `accountList.toMap()` now carries its
  records under `data`, each written **without** an `account` envelope, as the
  API sends them inside a listing. A listing that round-tripped to a page with no
  records was indistinguishable from a listing that genuinely matched nothing.

  A caller who was relying on `toMap()` to produce a **write** body should note
  that the read shape and the write shape differ: `currency` and `time_zone` go
  in as plain strings where the read returns nested objects, so posting a read
  body back unchanged is a 400. The write payload types in
  `accounts_dto.dart` are what to build a write from, and always were.

  The live suite's `filledFields` helper, since removed, enumerated a view
  through `toMap`, so eleven fields that had in fact been read were reported as
  unread. The same call now reports 34, the remaining 6 being the keys the API
  sent as null.

- **A 401 saying the access token was dead was read as a business refusal, so
  nothing was refreshed and the dead token stayed in the shared cache forever.**
  Measured read-only against the live instance on 2026-09-15. A new token grant
  on these client credentials invalidates the token issued before it, so a second
  process authenticating is enough to kill the token the first one holds. The 401
  that follows is
  `{"object":"error","request_id":"req_...","status":401,"code":"unauthorized","message":"Unauthorized access","doc_url":"..."}`
  - measured key set `code, doc_url, message, object, request_id, status`, with
  **no `error` key at all** and the word under `code`.

  **What a caller saw before.** The predicate read one tier,
  `message ?? error ?? code`. `message` is never absent on this instance, so the
  `code` arm never ran even though it was written, and `"Unauthorized access"`
  matched neither `invalid_access_token` nor `expired`. The 401 was therefore
  read as a business refusal: no refresh, no grant ("token grants after probe:
  0"), and the refused token left sitting in the token cache. With the default
  file cache that is a file shared by every process running as this user, so the
  next process read the same dead token, was refused, and left it there again.
  Every call from then on returned 401 and restarting cleared nothing, because
  nothing ever wrote over the entry.

  **What a caller sees now.** The 401 is recognised, the token is refreshed once,
  and the request is replayed with the new token - the same request, under the
  same idempotency key, so a replayed POST collapses into the first attempt at
  the server rather than writing a second record. If the refresh itself fails,
  the refused token is evicted from the cache before the error reaches the
  caller, so the next process starts clean instead of inheriting a token
  guaranteed to 401. The eviction is a compare-and-clear: a token some other
  worker minted in the meantime survives, because discarding it would set every
  worker minting its own and each grant kills the last.

  **Three tiers are read, independently** - `code`, `error`, `message` - rather
  than as a first-present chain, and the markers are `unauthorized`,
  `invalid_access_token`, `invalid_token`, `expired_token` and `invalid_request`,
  matched as whole words. Two narrowings come with the widening, and a caller may
  notice either. The bare word `expired` is **no longer** a marker: it was
  matched as a substring, and a 401 whose message says a trial or a quote has
  expired is a refusal to hand back, not a token to replace - such a call now
  returns the API's own answer instead of spending a grant first. And a 401 whose
  body is **not** a JSON object - a proxy's HTML page, or an empty body - is read
  as a dead token only for GET, HEAD, OPTIONS or TRACE. It used to be read that
  way for every method including unknown verbs, which meant a POST answered 401
  by a gateway had its whole body sent a second time, and the server may already
  have applied the first.

  `TokenProvider.invalidateAccessToken` is new and public. Callers do not need
  it; the client calls it on the one path that needs it.

### Documented

- **`getIntegrationConnections` names its status filter, `filter_status`.** v4
  ignores a plain `status` parameter and answers 200 for any value; the filter is
  `filter_status`, which `filterParam('status')` builds, and it takes `ACTIVE`,
  `INACTIVE` or `DISCONNECTED`, answering 400 for anything else. The function's
  doc says so, and the live listing case checks both answers.

- **The accounts library doc no longer says v4 cannot create an account.**
  `POST /api/v4/accounts` creates one and answers 201; the doc now says so, and
  that the SDK has no function for it yet, so `createExpress` is still the way to
  create one.

- **README.md and test/README.md are reorganised into a fixed section set.**
  The README now runs Setup, Credentials, Configuration (every `SdkConfig` option
  with its default), Bodies both ways, Multiple instances, Authentication, Requests,
  Pagination, Responses, Errors, Diagnostics, Timeouts, Retries, Transport,
  Endpoints, Adding a resource, Layout, Architecture (with the parts specific to
  Exsited), Platform notes, Behaviour worth knowing, Troubleshooting, Public
  API, Testing, License and Changing this SDK. The tests README adds run-first,
  configuration, real-calls, failure-meaning and usage-example sections, and says
  that missing credentials skip the live tier rather than stop the run.

- **Query parameter ordering is sorted by name, by choice.** Dart's `Map` is
  insertion ordered already; **nothing was changed.** `buildQueryParams` now says
  what a caller loses either way: a sorted query cannot reproduce the order the
  caller wrote, and an insertion ordered one cannot be byte compared between two
  runs that built it differently. The v4 API does not care about order.

### Removed

- **`CustomComponentsUrls.componentInstanceApiVersion` and
  `WorkflowsUrls.workflowComponentApiVersion`.** Breaking: both are gone; no
  function read them. The SDK, its docs and its tests no longer mention older
  API versions. The token cache key's format label is now `'v4'`, so a token
  cached before this release is not found and a fresh one is minted once.

- **The auth unit tests.** 4 files, `test/auth/token_store_test.dart`,
  `test/auth/token_lock_test.dart`, `test/auth/token_provider_test.dart` and
  `test/auth/token_failure_401_test.dart`, 59 offline cases, one of them skipped
  on Windows. Removed so the test tree follows the SDK test layout: the auth
  helper `test/auth/auth.dart`, the credentials test `test/credentials_test.dart`,
  the harness `test/live_suite.dart`, the tests README and the resource suites,
  four files per family under `test/resources/<family>/`, and nothing else. They
  checked the credential namespace and its SHA-256, the token file cache and its
  cross-process lock, the token provider's grant, refresh and credential checks,
  and which 401 bodies trigger the invalidate-and-replay, through a fake
  transport and with no network. The live suite still reaches the token layer on
  every run: each case takes its token from the real provider and the default
  file cache, and `postOauth2Token` mints one at the token path. The lock's
  recovery rules, the 401 replay and the namespace digest are now checked by no
  test.
  `dart test test/auth` finds no tests; `dart analyze` is the check that needs no
  instance. Nothing a caller of the package imports changes.

- **Helpers the test harness no longer needs.** In
  `test/auth/auth.dart`, `requiredVariables`, `value()` and the filter that let
  a blank exported variable fall back to `.env`: each `EXSITED_` variable is
  read as it is, and `AuthConfig` names a blank field itself. In
  `test/live_suite.dart`, `liveRaiseOnError`, `keepFirstId`, `filledFields`,
  `buildClient`'s `timeoutSeconds` parameter and its call to
  `registerInstances()`, and the variable list in the skip reason. `buildClient`
  raises on an error by default, so the family cases pass
  `raiseOnError: false` and assert what they asserted before, and the reports
  cases build their client with `buildReportsClient()` in `reports_test.dart`,
  which keeps the 120 second read timeout a report needs. The family helpers
  nothing called went too: `paceWrite` and `writeSpacing` in ten families,
  `paceRead` and `readSpacing` in `aba_files`, `buildDigits` in twenty-seven,
  `createItemWithPurchase` in `items` and `sessionDate` in `timesheets`.
  Nothing a caller of the package imports changes.

- **Every test outside the auth unit tests and the resource suites.** 15 files,
  removed because the owner asked for the test tree to hold only the harness, the
  resource tests and the auth tests:
  `test/sdk_test.dart`, `test/hardening_test.dart`,
  `test/config_hardening_test.dart`, `test/transport_test.dart`,
  `test/query_params_test.dart`, `test/console_test.dart`,
  `test/console_controls_test.dart`, `test/web_platform_test.dart`,
  `test/resource_binding_test.dart`, `test/items_test.dart`,
  `test/accounts_shape_test.dart`, `test/invoices_shape_test.dart`,
  `test/settings_envelope_test.dart`, `test/generated_families_test.dart`, and
  `tool/sha_check.dart`. They were offline unit and hardening checks of the
  client, transport, retry, URL and query building, redaction, pagination, the
  console guards, the config and transport ceilings and the typed views against
  recorded bodies, and a check over every generated family. Nothing a caller of
  the package imports changes.

  **What stays.** `test/auth/auth.dart`, `test/live_suite.dart`,
  `test/credentials_test.dart` and the four files of each of the 44 families
  under `test/resources/<family>/`. The token store, token provider and
  credential cases of the removed files had moved into `test/auth/`, and the
  first entry above has since removed them too. The idempotency key cases go
  with the rest; every live write still sends a POST the API refuses without the
  key.

  **`dart_test.yaml` names no paths.** Its offline `paths` list and its `live`
  preset are gone, so a bare `dart test` runs every file, the live suite
  included, and the tags select within the live suite as before, without
  `-P live`.
  What the removed files checked offline is now checked only where the live suite
  reaches it against the instance.

- **`conformance/conformance.json`, the cross-language behavioural contract, and
  `test/conformance_test.dart`, which ran it.** 1 data file and 1 test file. The
  offline suite of the time, itself removed by the entry above, went from
  **1,336 passing to 1,233**, the one skip unchanged: a drop of 103, being 101
  contract cases across the 10 sections the runner ran, plus the guard asserting
  the file was version 2 and the guard asserting that the two sections it skipped
  were still in the file. Nothing here fails now if one of those behaviours
  changes. **The file and its runner are in git history**; the last commit that carried them is the one before this change.
  `test/conformance_test.dart` also left the offline `paths` list then in
  `dart_test.yaml`, which the entry above has since removed.

  **What lost its only coverage.** Three behaviours were exercised by the
  contract and by nothing else in this repository, and now have no offline test
  at all:

  - **Redaction key matching, 18 cases** (`shouldRedact`). Nothing else in the
    repository calls it. This was the only enumeration of which key names the
    redactor must catch, so a name dropped from the list now fails nothing.
  - **Credential fingerprints, 3 cases** (`buildCredentialsNamespace`). This
    was the only check of the digest **value**: a shared token cache is keyed
    on these 16 hex digits, and a client that computes them differently stops
    sharing the cache silently rather than failing. The
    `credential namespace` group that checked the digest is 16 characters,
    counts code points rather than bytes, and cannot collide across a moved
    field boundary went with the auth unit tests, in the first entry above.
  - **The payload forms, 7 cases** (`_validatePayload`). The map branch is
    exercised throughout the suite; the JSON-string branch is not exercised
    anywhere else, so sending a JSON string verbatim, keeping its own spacing,
    refusing invalid JSON, refusing a bare scalar and a bare number, and
    accepting an array are now untested.

  **What was thinner but still covered** by the offline files is now covered by
  none of them: those files are removed as well, in the entry above.

  Two sections the runner never ran are unaffected: `media_type_grammar` (30) and
  `stale_echo_detection` (8) were skipped by the runner, which asserted only that
  they were still present in the shared file.

- **`hooks/pre-commit`**, the staged-credential check, and with it the
  `core.hooksPath = hooks` arrangement that installed it. 1 file. Nothing now
  stands between a staged credential and a commit. `core.hooksPath` is local git
  config rather than a committed file, so each existing clone needs
  `git config --unset core.hooksPath` or git will look for a directory that is
  gone.

- **`exsited-sdk-dart-test.bat` and `exsited-sdk-dart-test-setup.bat`**, the
  Windows Docker wrappers around the gate. 2 files. They ran the gate
  inside a `dart:3.5` container so no Dart SDK had to be installed on the
  machine, and being `.bat` they only ever worked on Windows. Run the gate
  directly instead: `dart pub get` once, then `dart analyze` (expect
  `No issues found!`), which is what `README.md`, `DEVELOPMENT.md` and the
  contributor notes document. No suite, no test and no gate changed by that removal.

### Added

- **Five filter operators the API accepts and `filterParam` refused: `in`, `nin`,
  `starts_with`, `has_value` and `does_not_have_value`.** `filterOperators`
  carried the eight the v4 collection records, so any of these five threw
  `SdkUsageException` before a request was made. Measured against the live
  instance on 2026-09-13, v4 accepts thirteen, and it says so itself: an operator
  a field's type does not take is answered `400` naming the type and listing what
  it does take. The four lists are `Text` (eq, neq, in, nin, contains,
  not_contains, starts_with, has_value, does_not_have_value), `constant` (eq, neq,
  in, nin, has_value, does_not_have_value), `Date` (eq, neq, gt, gte, lt, lte,
  has_value, does_not_have_value) and `double` (eq, neq, gt, gte, lt, lte, in,
  nin, has_value, does_not_have_value). `filterOperators` is their union.

  Two caveats, measured rather than assumed. `starts_with` is a real operator name
  - every near miss is a `400 Invalid filter field` - but every call using it
  returned `200` with zero rows, including on the exact prefixes `eq` and
  `contains` matched on the same field. And `in`/`nin` with a comma list worked on
  `constant` and `double` fields and not on `Text` ones, where the whole comma
  string is matched as one literal. Both are the API's behaviour, not the SDK's;
  the doc comments say so.

- **`filterValues`, plus `presenceOperators` and `listOperators`.** `in` and `nin`
  take a comma separated list in ONE parameter, and the obvious spelling is the
  wrong request that fails silently: `buildQueryParams` turns a list value into a
  repeated key, and `filter_status_in=ACTIVE&filter_status_in=DELETED` was
  measured to return `200` with no rows while the `nin` form returned a `400`.
  `filterValues` builds the comma form and refuses a member carrying a comma (the
  server reads it as two values) and an empty list (`filter_status_in=` returns
  zero rows, which reads as "nothing matched").

  `has_value` and `does_not_have_value` are presence checks with NO right-hand
  side: `=true`, `=false`, `=`, `=banana` and a bare key all returned the same set,
  and the two partition a listing exactly. Pair them with `true`. **Not null** -
  `buildQueryParams` drops a null, so the filter would vanish and the listing
  would come back unfiltered with a `200`.

  The per-field-type rules are still left to the API. Enforcing them needs a
  field-to-type table for 46 families that nothing here has and nothing could keep
  fresh, and a stale entry would refuse client side a filter the API would have
  accepted - invisible to the API team and needing a release to fix.

### Fixed

- **The invoice listing read its records from a key the API does not send, so
  `InvoiceList` returned null where the records were.** Measured live, GET only.

  `recordKey` was `'invoices'` and `InvoiceList.fromMap` read `raw['invoices']` to
  match. `GET /api/v4/invoices` answers `{object, url, data, pagination}` and
  carries no `invoices` key at all. A DTO converts nothing and throws nothing for a
  key that is simply absent, so this view read one of its two fields on every
  listing: `pagination` filled in, the records field was null, and a caller looping
  it iterated nothing and was told nothing. **A caller reading `dto.invoices` now
  reads `dto.data` and gets the records where they got null.** The field is
  renamed, so this is a breaking change to that one name.

  `iterRecords` was never silently short - handed `'invoices'` it refused the walk
  outright, because the pager reads the raw body rather than the typed view.
  `defaultRecordKey` is `'data'`, so a walk of this listing now needs nothing said.

  The constant carried a warning pointing at a document that does not exist. The
  dangling reference is gone with the warning, which is now a statement of what
  was confirmed and fixed.

- **The note listing built a view that was not a listing, so every field of it read
  null.** `getInvoiceNotes` built an `Invoice`, whose envelope is `invoice`.
  Measured live, `GET /api/v4/invoices/{invoice_id}/notes` answers
  the same `{object, url, data, pagination}` envelope the listing does and carries
  no `invoice` key, so `unwrapEnvelope` found nothing to unwrap and the whole view
  was empty. A new `InvoiceNoteList` reads it, and both the endpoint function and
  the bound class now answer that instead - so the return type changes from
  `ApiResponse<Invoice>` to `ApiResponse<InvoiceNoteList>`.

  Its `data` is `List<Object?>` rather than a typed note record: the note body's
  own fields were not measured, so a typed record would be a claim about fields
  nothing has read. The envelope was measured and the envelope is what it declares.

- **Five invoice fields were read through `readString` and are not text, so every
  one of them read null.** `version`, `discountAmount`, `priceTaxInclusive`,
  `createdBy` and `lastUpdatedBy`. Across 19 live detail reads the instance sent
  `29`, `0.0`, `true` and two `{object, name}` user blocks. `readString` returns
  null for a value that is not a string, so this was not an error and not a
  coercion: all five values were dropped. **A caller reading `invoice.version` or
  `invoice.createdBy` now gets the value where they got null.**

  All five are now `Object?`, taken through unread: some records send each as
  text and others as the native type, so no single type reads them all. One class
  serves both the listing
  entry and the detail read here, so a precise declaration would have to be right
  about both at once.

  The money fields are unchanged and stay `String?`: `subtotal`, `tax`, `total`,
  `due`, `paid` and `shippingCost` really are `"12.00"`. `discountAmount` is the one
  that is not, which is why it moved and they did not.

  **`Pagination` needed no correction here.** It already covered both shapes, so
  the cursor block the API answers read in full. `lib/src/client/pagination.dart` needed none either: it never named this
  family as an offset listing.

  **Not fixed, and deliberately so.** This family's field set is untouched. `Invoice` serves the listing entry, the detail read and
  several sub-resources at once, and its fields are what the collection recorded
  rather than what the instance sends. Reconciling that is a regeneration of the
  whole family, not a type correction.

  Covered by the live `invoices` dto cases, which check that the view declares
  every key the instance sends.

- **`response.dto` is null on a failed call instead of a typed view built out of
  the error envelope.** The client built the view whenever an endpoint named a
  builder and the body was a `Map`, and never asked whether the call had
  succeeded. An error envelope is a `Map` like any other, so the named view was
  built straight out of it.

  What a caller saw before: a `404` answered an `Account` and an `Item` whose
  `object` read `'error'` and whose `id`, `name`, `status` and every other real
  field read null. Measured against a live instance. Nothing was thrown and
  nothing was logged, so a well formed object stood where a refusal was due, and
  it could not be told apart from a record whose every field really is null.
  `raiseOnError` defaults to `false` so that an expected 404 is ordinary control
  flow, which means this was the default path rather than a corner of it.

  What a caller sees now: `response.dto` is null, and `response.data` is null too
  when `responseFormat` is `ResponseFormat.dto`. The guard is on the same verdict
  `response.succeeded` uses rather than on the status, so a `200` whose body says
  `{"object":"error"}` is covered by the same rule.

  `response.map` and `response.json` are unchanged and still carry the error
  envelope exactly as it arrived, as do `errorCode`, `requestId`, `docUrl`,
  `errorMessages` and `fieldErrors`: a caller diagnosing a failure reads those.
  Only the claim that the body is a record of the named type is withdrawn.

  `ApiResponse.succeededFor(statusCode, body)` is new and public: the client has
  to reach the verdict before it can construct the response, because `dto` is a
  constructor argument, and one static keeps a single definition of
  the verdict rather than two that can drift.

  **This changes behaviour for callers who read `.dto` without checking
  `.succeeded` first.** `response.dto?.name` on a failure used to be null from a
  hollow view and still is; `response.dto!.name` now throws. Check
  `response.succeeded`, or turn `raiseOnError` on.

- **`SettingsCurrencyRead` and `SettingsTimeZoneRead` read nothing at all off a
  populated `200`.** Measured live, GET only: 6 of 6 currencies and 25 of 25 time
  zones, every record agreeing.

  `GET /api/v4/settings/currencies/{id}` answers
  `{"currency": {...16 keys...}}` and `GET /api/v4/settings/time_zones/{id}`
  answers `{"time_zone": {...17 keys...}}`. Both `fromMap` factories passed
  `null` to `unwrapEnvelope`, so they looked for their fields beside the wrapper
  rather than inside it. On top of that, `currency_code`, `precision`, `uuid` and
  `display_name` on the one, and `display_name`, `favourite` and `uuid` on the
  other, are not keys this API sends at all; and the currency view read three real
  keys with `readString` against a double (`cash_rounding_interval`), an object
  (`country`) and an int (`decimal_places`), which yields null just as quietly as
  a wrong name does. **The result was a typed view null on every one of its
  fields, off a `200` carrying all of them, with nothing thrown and nothing
  logged.** A caller could not tell it from a currency whose every field really is
  null. The values were in `response.map` throughout, which is why this is the
  typed layer alone.

  Both views now declare their envelope, in `fromMap` and in `toMap` alike, and
  the fields the instance actually sends, which are exactly the ones
  `SettingsCurrency` and `SettingsTimeZone` already declared for the same record
  inside the listing. **This renames fields:** `currencyCode` is `code`,
  `precision` is `decimalPlaces` (and is an `int?`), `uuid` is `id`, `country` is
  an `Object?` holding the map rather than a `String?`, and `displayName` and
  `favourite` are gone, having never existed on the wire. Everything the API sends
  is now declared, so nothing is left behind `map`. `createdBy` and
  `lastUpdatedBy` are null in every measured record of both families and stay
  `Object?` rather than being guessed at.

  The v4 collection's saved response for the currency path is flat and uses the
  four names that do not exist, which is where they came from. It is a stale
  working document; the instance is the arbiter.

  Covered by the live `settings` dto cases for the two detail reads, which check
  that the view declares every key the instance sends.

### Changed

- **BREAKING: the client's request entry points are `sendApiRequest`,
  `sendGetRequest`, `sendPostRequest`, `sendPutRequest`, `sendPatchRequest` and
  `sendDeleteRequest`.** They were `send`, `get`, `post`, `put`, `patch` and
  `delete`.

  **What a caller does about it:** rename the call.

  ```dart
  // before
  await client.get<Account>(AccountsUrls.account, options: options);
  await client.send<void>('QUERY', path);

  // after
  await client.sendGetRequest<Account>(AccountsUrls.account, options: options);
  await client.sendApiRequest<void>('QUERY', path);
  ```

  **The old names are gone rather than deprecated.** A shim would be public API
  carried forever, and while the old spellings still appeared in every completion
  list the inconsistency this change exists to end would still be visible. The
  analyzer names every stale call site, so the rename is mechanical. Callers
  reaching the API only through the endpoint functions or `client.<family>` are
  unaffected: all 490 internal call sites moved with it - 276 `sendGetRequest`,
  106 `sendPostRequest`, 53 `sendPatchRequest`, 42 `sendDeleteRequest`, 8
  `sendApiRequest` and 5 `sendPutRequest`.

  `Pagination` needed nothing: its walkers are already `iterPages` and
  `iterRecords`.

- **BREAKING, and a behaviour change: `unsafeRetryableHttpCodes` now defaults to
  empty, so nothing state-changing is replayed on a status.** It defaulted to
  `[429, 503]`, which meant a PUT or a DELETE was replayed on either. No status
  the API answers proves the request did not commit: a 429 or a 503 is as easily
  written by a proxy, a load balancer or a gateway that never reached the origin
  as by the origin itself, and a 503 from an origin that committed and then fell
  over is the same three digits. Replaying a DELETE against a record another
  caller has since recreated deletes theirs.

  **To restore the old behaviour**, having decided that this instance's 429 and
  503 do mean the request never landed:

  ```dart
  SdkConfig(auth, unsafeRetryableHttpCodes: const [429, 503]);
  ```

  A GET is unaffected: `retryableHttpCodes` is unchanged, and a safe method is
  still retried on 429, 500, 502, 503 and 504.

- **Retry safety is an allow-list of known-safe methods rather than a deny-list
  of unsafe ones.** `safeMethods` is `{GET, HEAD, OPTIONS, TRACE}` and replaces
  the exported `unsafeMethods`; anything not in it is treated as a write. Under
  the deny-list a verb the SDK had never heard of - `QUERY`, `PURGE`, `LOCK`, or
  a caller's own through `ExsitedClient.sendApiRequest` - was absent from the
  unsafe list, so it read as safe and was replayed.

- **`FileTokenStore.withLock` fails closed.** When there is no cross-process
  lock to take it throws `SdkTokenLockException` and does not run the work,
  where it used to fall back to running it uncoordinated. That fallback was not
  exclusion between processes: two workers refreshed at once and one overwrote
  the other's entry, refresh token included, while looking from the inside
  exactly like coordination that worked. A caller who would rather have the
  token than the exclusion sets `AuthConfig.inMemoryToken`, which says so.
  `crossProcessLockingDegraded` still names the condition, and the stderr notice
  is now once per unbroken run of refusals and re-arms after a success.

- **The token cache lock is one per cache FILE, not one per namespace.** It was
  `<path>.<namespace>.lock`, and every mutation is a read-modify-write of the
  whole file, so two namespaces took two different locks and walked into the
  same file at once: each read it, each added its own entry to what it had read,
  and the second write put back a copy missing the first's. `FileTokenStore`
  exposes `lockPath` so this is inspectable.

- **`TokenStore.read` and `TokenStore.write` report a cache that cannot be
  used.** Both throw `SdkTokenCacheException`, a new type, rather than answering
  "empty". Only a program implementing its own store, or driving one directly,
  is affected: `ExsitedClient` builds and drives the store itself.

- **A progress line names the endpoint template, not the resolved URL.**
  `RequestInfo` carries a new `endpoint` field holding the path as the caller
  wrote it, `{id}` and all, and `RequestInfo.toString()` and `renderExchange`
  print that. The resolved URL is still on `RequestInfo.url` for a caller who
  wants it. Printed, it carried a record id into the terminal, the log file and
  whatever ships those logs onward, for the sake of a line whose job was to say
  which endpoint had been called.

- **A client does not close a transport it did not create.** `close()` releases
  the sockets only when the client built the `http.Client` itself; one passed in
  through the constructor or through `SdkConfig.httpClient` is left alone,
  because its lifetime is the caller's and it is very often shared.

- **Internal only, no API change: the HTTP send path moved out of the client and
  into `lib/src/http/transport.dart`.** The socket work - assembling each
  attempt's request, the retry loop and its backoff, the one deadline over the
  whole exchange, the `maxUploadBytes` and `maxResponseBytes` ceilings, the
  bounded read of the streamed body and the decode - used to sit inside
  `lib/src/client/client.dart` beside the URL building, the payload checks, the
  token refresh and the request record. `DEVELOPMENT.md` already described the
  split as though it existed.

  **What a caller does about it: nothing.** `ExsitedClient` has exactly the
  public members it had, spelled the same way and behaving the same way, and
  `Transport` is not exported from any library a caller can import. The
  ownership rule above is unchanged and now lives with the `http.Client` it is
  about: the transport closes one it created and never one it was handed.

### Added

- **`SdkConfig.maxResponseBytes`**, defaulting to 64 MiB
  (`defaultMaxResponseBytes`), bounds one response body. See *Fixed* below.

- **`SdkConfig.maxUploadBytes`**, defaulting to 64 MiB
  (`defaultMaxUploadBytes`), bounds one **request** body. The response had a
  ceiling and the request had none, so the same hazard was guarded on one side
  only: an oversized outbound body was the server's to discover, or nobody's,
  when the socket died first and what came back was a network error naming
  nothing. What is weighed is the finished request's `contentLength`, which is
  the exact byte count that goes on the wire; nothing is re-encoded to measure
  it. Over the ceiling, `SdkUsageException` is thrown and **nothing is sent**.
  The request line, the query string and the headers are not counted, and both
  the doc comment and the refusal say so.

  **To restore the old behaviour** of never bounding a request body, set it as
  high as you like:

  ```dart
  SdkConfig(auth, maxUploadBytes: 1 << 62);
  ```

- **`SdkConfig.logFile` and `SdkConfig.logBodies`** write every exchange to a
  file. `printRequests` put the same records on stdout and nowhere else, so the
  only way to keep them was to redirect the whole process, which captured
  everything else the program printed and interleaved it. Each record goes
  through the **same** control-character guard the printed path uses, because a
  log file read back in a terminal is still a terminal: `cat` obeys an "erase
  line" sequence in a response body exactly as `print` does. What the file does
  not get is the console encoding pass, which asks what one particular terminal
  can represent; a file is not that terminal. `logBodies` is off by default and
  governs the log file alone, so `printRequests` renders the body exactly as it
  always has. An unwritable path is `SdkConfigException` at construction rather
  than a surprise on the call you were trying to diagnose, and **on the web the
  setting is refused rather than ignored** - there is no filesystem to append
  to, so use `printRequests` there.

- **A base URL that is `http://` to somewhere other than this machine now warns
  once, on stderr.** `http://` encrypts nothing: the bearer token on every call,
  and the `clientId` and `clientSecret` in the token request itself, cross the
  network in cleartext, and the SDK accepted that silently. Loopback is exempt -
  `localhost`, `localhost.localdomain`, the whole of `127.0.0.0/8`, and `::1` -
  because warning about a local development instance teaches a reader to filter
  the category. The host is parsed, never resolved, so building a client does no
  DNS. The warning is emitted once per origin per process, at the client rather
  than in config validation, because validating a config must have no side
  effect. On the web it goes to `print`, there being no stderr.

  **To restore silence**, use `https://`, which is what the warning asks for. It
  cannot be switched off: a switch for it would be a switch for the only notice
  a caller gets that their credentials are readable in transit.

- **`SdkConfig.httpClient` is documented as the TLS, proxy and pool seam.** No
  behaviour changed, and that is the point of saying so: there are deliberately
  no `verifySsl`, `caBundle`, `proxyUrl` or pool-size settings here, because
  nothing this SDK guards travels through the transport. The redirect refusal
  is set on the request and read by both `IOClient` and `BrowserClient`,
  `timeout` is applied around the SDK's own future, both byte ceilings are
  applied by the client, and a transport the caller passed is never closed by
  it. So a caller who replaces the client to load a corporate CA bundle loses
  none of them, and the doc comment carries the `IOClient(HttpClient(context:
  ...))` snippet that does it. Four `dart:io` only settings would mean nothing
  in a browser, which is the platform this package's one dependency exists for.

### Fixed

- **An unreadable token cache destroyed every other namespace's token.** The
  read answered "empty" for a file it could not parse, and every write rebuilds
  the whole file from what the read returned. So one stray byte appended to a
  shared per-user path, or a read that landed while another process was
  mid-write, silently deleted every namespace whose bytes were perfectly good,
  refresh tokens included, and the owner of that token found out by being logged
  out. A read failure is now an `SdkTokenCacheException`, distinct from an
  absent cache, and a write refuses rather than truncating what it could not
  read. Entries are held as the values they arrived as and decoded one at a
  time, so a namespace this build cannot make sense of is written back byte for
  byte instead of being dropped by a rewrite that only meant to add one entry.

- **That read was unbounded**, a plain `readAsStringSync` on a well-known
  per-user path any process running as this user can append to. Bounded at
  `maxTokenCacheBytes`, 1 MiB, sized from what our own records cost: an ordinary
  entry is under 1 KB, so that is a thousand of them.

- **A response body had no ceiling at all.** One runaway export, one endpoint
  answering a database dump or one hostile body was the process, killed by the
  OS with nothing in the log naming the SDK. Capped at
  `SdkConfig.maxResponseBytes`, judged before a chunk is retained and before one
  is pulled at all when the declared `Content-Length` already exceeds it. The
  body is now read chunk by chunk rather than through
  `http.Response.fromStream`, because a ceiling cannot exist without that. The
  doc comment states the honest peak, a little over twice the cap plus one
  chunk, rather than implying the cap is the peak.

- **Token credentials are validated against their own grammars, never coerced.**
  An access token becomes an `Authorization: Bearer` header, so it must satisfy
  the RFC 6750 2.1 `b64token` grammar; a refresh token is a token-request field,
  RFC 6749 5.1 visible text, which keeps the punctuation Bearer has no room for.
  Two different grammars, deliberately. Checked at grant decoding, at cache read
  and at cache write, so a value carrying CR LF cannot split the header. The
  refusal names the problem and the credential's length, never its value.

- **Caller code ran before the URL was built.** The order was: validate the
  payload, materialise it - which runs a `Dto.toMap`, a `toJson` the encoder
  calls on an unknown object, or a lazily generated `Iterable` - and only then
  build the path, the URL and the query, with the headers built later still. So
  a payload could rewrite `pathParams`, `queryParams` and `headers` from inside
  the encode, and the request went to a different record, asked a different
  question or carried a header the call never named. Nothing raised. The URL,
  the query and the headers are built and frozen first now, and an adversarial
  test asserts the request still goes where the call named.

- **A vendor or versioned `+json` media type is read as JSON** rather than
  handed back as raw bytes, per the RFC 6839 structured suffix, so
  `application/vnd.exsited.v4+json` populates `.map` again. The same change
  stops `application/jsonp`, which is not JSON, being parsed as JSON by the old
  bare substring test.

- **An HTTP method must be an RFC 9110 token.** A value carrying CR LF was a
  request-line injection, and one carrying a space produced a request line the
  server read as a different method and target. Refused at the client, before a
  token is minted and where the mistake was written.

- **A fragment is refused by `buildUrl`**, and so at every call that goes
  through it. A `#` is never sent to a server, so the request went silently to
  the truncated URL, which is a different endpoint answering a different record.

- **The retry policy is the client's own snapshot.** It copies the caller's
  status lists rather than sharing them, so editing `config.retryableHttpCodes`
  after the client was built no longer changes the rules of a request already in
  flight. Every entry of both lists is checked as an HTTP status from 100 to
  599: `unsafeRetryableHttpCodes` validated nothing at all, so a value outside
  that range looked like configuration and was dead text.

- **The request record is a copy the caller cannot reach into**, frozen at every
  depth, with redaction applied before the freeze. It was a plain map one level
  deep, so a caller could rewrite the record of a request that had already been
  sent and every reader downstream then described a request that never happened.

- **One cache path now has one in-process guard**, resolved to an absolute path
  at construction with the directory taken through `resolveSymbolicLinksSync`.
  Held unresolved it was re-interpreted against the working directory on every
  call, so changing `Directory.current` after building the client moved the I/O
  away from the sidecar, and two spellings of one file got two guards, which is
  no guard at all.

- **The token cache lock now excludes anybody. It previously excluded nobody.**
  `FileTokenStore.withLock` guarded its read-modify-write of the cache file with
  a directory created by `Directory.createSync`, on the belief that a second
  create would throw. It does not: Dart treats an existing directory as a
  successful create, so every caller took the "lock" at once, each deleted it on
  the way out, and the stale-lock recovery underneath was unreachable code. Two
  workers refreshing at the same moment could drop each other's entry, which
  looks exactly like the lock working. The lock is now a file created with
  `File.createSync(exclusive: true)`, which does throw.

  A caller sees no API change. What changes is that concurrent workers sharing
  one `tokenCachePath` now serialise, and one that cannot take the lock says so
  rather than pretending.

- **A crashed holder no longer keeps the lock until it ages out.** The lock file
  carries a stamp - pid, host, timestamp, serial - and is broken early when the
  stamp names this host and that pid is gone. `staleLockDuration` remains the
  backstop for a zombie, a foreign host, or an unreadable stamp, and it is the
  only recovery on Windows: `Process.killPid` accepts a signal, but Dart's
  Windows implementation ignores it and calls `TerminateProcess`, so a liveness
  probe there would kill whatever process now holds that pid. Release removes the
  lock only while it still carries this holder's own stamp, so a holder whose
  lock was broken cannot delete its successor's.

- **`withLock` no longer throws on Flutter web.** There is no filesystem there, so
  `Directory.createSync` raised `UnsupportedError`, which the old catch clause did
  not cover, and every token write failed. It now degrades on the first attempt
  rather than waiting out a timeout it cannot win. Constructing an `ExsitedClient`
  on web still failed earlier, in `defaultTokenCachePath`, which the next entry
  fixes; a web build no longer reaches this store at all, so that arm now stands
  for a filesystem that refuses the operation rather than for the web.

- **A client can now be constructed on Flutter web at all.** It could not, and the
  reason was two `dart:io` imports rather than the one that was known about.
  Compiled with `dart compile js` and run under node, a default-configured client
  failed like this:

  ```
  SdkConfig(auth)          UnsupportedError: Platform._environment
  defaultTokenCachePath()  UnsupportedError: Platform._pathSeparator
  ```

  The **config** threw first: `SdkConfig` read `Platform.environment` while it was
  being built, so a web caller could not get as far as the client constructor that
  the second throw sits in. dart2js compiles a `dart:io` import and throws when it
  runs, which is why neither showed up at build time.

  Three conditional-import pairs now stand behind one name each: the environment
  read, the choice of default token store, and `FileTokenStore` itself. On the web
  the environment is an empty map, the default store is `MemoryTokenStore`, and
  every member of the web `FileTokenStore` throws an `UnsupportedError` naming
  itself so the type still resolves in both builds.

  A native caller sees no change: the same file cache at the same path.

  A web caller sees three. A default-configured client constructs, and its token
  lives in memory for the life of the page. A `tokenCachePath` spelled out
  explicitly is now **refused** with `SdkConfigException` rather than silently
  ignored, because it is the one setting a browser cannot honour. And
  `defaultTokenCachePath()` and `FileTokenStore(...)` throw `UnsupportedError`
  where they previously threw `UnsupportedError: Platform._pathSeparator`, which
  said nothing about what to do instead.

  `FileTokenStore` and `defaultTokenCachePath` moved out of
  `src/auth/token_store.dart` into `src/auth/file_token_store.dart`, which is a
  conditional export. Both names are exported from the barrel exactly as before,
  so no supported import changes; a caller reaching into `src/` for
  `FileTokenStore` must follow the move.

### Added

- **Every family is now reachable off the client: `client.accounts.getAccount(
  'W13ZGY')`.** The function style is unchanged and is still the whole API -
  `getAccount(client, 'W13ZGY')` calls exactly what it always did - and the bound
  method is a delegate to it, not a second implementation. All 46 families, 447
  methods, and only `package:exsited/exsited.dart` is needed to reach any
  of them: the getters are one extension exported from the barrel, so the family's
  own library is only needed to name a view, a path constant or the bound type.

  Each bound method mirrors its family's own function, including the
  signatures of the three families with their own shapes - `getAccount` takes no
  `queryParams`, and `createAccountNote` takes a `String? note` because that
  endpoint is form-encoded. The class is `AccountsResource`, not `Accounts`, because four families declare a
  view named exactly after the family.

- **`registerGeneratedResources()`, `client.resourceByName()` and
  `client.listResourceNames()`**, for choosing a family by a name that is not a
  literal in your source. The registry starts empty and the seed is one idempotent
  call; before it, a lookup raises `SdkAttributeException` naming the seed, and
  after it an unknown name raises one listing the 46. `registerResourceModule()`
  takes a family of your own, and refuses a name no lookup could reach: not a Dart
  identifier, a reserved word, an underscore prefix, or one the client already
  answers.

- **`ClientRegistry`**, for holding several instances open at once and selecting
  between them by the `clientName` their config already carries. Each gets its own
  client, HTTP client, token provider and token store, so two instances never
  share a token; one nothing asks for is never built and never authenticates. The
  first entry is the default. Two entries sharing a name are refused at
  construction. `close()` closes what the registry built, skips a client handed in
  through `addClient`, attempts every close even when one throws, and drops them
  all either way, so one failure cannot wedge a second call.

  This release adds no process-wide `registerInstances`: there was no
  `buildClient()` entry point at this release, so a global registration would have
  had nothing to serve.

- **`FileTokenStore.crossProcessLockingDegraded`** says why a store is
  coordinating within this isolate alone, or `null` while the lock is in force.
  The lock has always been best effort - the work runs either way, because a token
  written without the lock beats a call that failed waiting for one - but a store
  that has silently stopped coordinating is indistinguishable from one that never
  stopped, so the fallback is now reported. The first fallback per store also
  writes one line to stderr.

- **`FileTokenStore` takes optional `lockWait` and `staleAfter`**, defaulting to
  `defaultLockWait` and `staleLockDuration` as before. Named parameters rather
  than settable globals, which would be process-wide state one test leaks into
  every later one. Both defaults are now exported from the barrel so a caller can
  name what it is overriding.

- `test/auth/token_lock_test.dart`, 18 offline cases over what the lock recovers, what
  it must refuse to break, that a release does not remove a lock the holder no
  longer owns, that two acquisitions do not both enter, and that the degraded path
  reports itself. One case spawns a second isolate, because an isolate shares this
  process's pid and is the case a pid-based rule gets wrong. Removed again before
  release, with the other auth unit tests; see `### Removed`.

### Changed

- **Path templates are now static members of a class per family**, so
  `urls.accounts` reads `AccountsUrls.accounts` and the endpoint files import
  `accounts_urls.dart` without a prefix. The wire strings are byte-identical and
  no path moved; what changed is the name a caller writes. **A caller naming a
  path constant must qualify it**, and the barrel now exports `AccountsUrls` and
  `ItemsUrls` in place of the 52 individual names it used to list.

  A constant bare in the package namespace cost real names: 70 public top-level names
  were declared by more than one family, and `accounts_urls.dart` and
  `items_urls.dart`, sharing the barrel, could never spell one the same way. It
  is 44 now, the 26 that went being path constants.

- **`raiseOnError` and `responseFormat` are flat named parameters** on every
  endpoint function, replacing the trailing `CallOptions options = const
  CallOptions()`. `getAccount(client, id, options: CallOptions(raiseOnError:
  true))` becomes `getAccount(client, id, raiseOnError: true)`.

  `CallOptions` itself is unchanged and still exported: it is the client's
  argument, and `headers`, `formData`, `authenticated` and an arbitrary
  `pathParams` are reached by calling `client.sendGetRequest`,
  `client.sendPostRequest` and friends directly. **A caller who passed any of
  those to an endpoint function must move that call to the client.**

  The `_withPath` / `_withQuery` / `_withBody` helpers are gone from the 43
  generated families, and the ones in `accounts.dart` and `items.dart` no longer
  merge anything: they build the options from the identifier and the two
  overrides. That closes the trap `DEVELOPMENT.md` had recorded, where each
  helper hand-copied a different subset of `CallOptions`'s eight fields and a
  ninth field would have been dropped by whichever forgot it, with nothing in the
  suite going red.

- `CallOptions.copyWith` now covers all eight fields rather than four. Nothing in
  the SDK calls it any more; a caller who does can no longer lose `headers`,
  `authenticated`, `raiseOnError` or `responseFormat` through it.

- The live suite passes `raiseOnError: liveRaiseOnError`; `live_env.dart` declares
  `const bool liveRaiseOnError = false` where it declared `const CallOptions
  liveOptions`.

### Added

- **A live test suite**: 377 cases over the 43 generated families, calling every
  GET against a real instance and asserting that the three response members are
  all readable off one call and that a typed view came back with fields actually
  filled in.
  Reads `.env` from the package root; skips every group without it, so a fresh
  clone still runs it. Writes are called only in ways expected to fail, so
  nothing is created, updated or deleted on a shared instance.
- `test/live/live_env.dart`, hand-written: a small `.env` parser that lets a real
  environment variable win, the client the suite shares, identifier harvesting
  from a family's own listings, and `filledFields`, which reads `Dto.toMap()`
  because Dart has no reflection to enumerate a view's fields with.
- **`lib/src/client/console.dart`: what the debug console can actually print.**
  `resolveBoxGlyphs()` answers with a Unicode decoration set or an ASCII one
  keyed identically, chosen by probing the console. Every value of the Unicode
  set is probed rather than only the ones some line is drawn with, so a glyph
  added later cannot widen what counts as an encodable console without the probe
  noticing. No line the SDK draws today needs one; the resolver is where the
  first one has to come from.
- **The capability probe is split behind a conditional import**,
  `terminal_web.dart if (dart.library.io) terminal_io.dart`. On the VM
  `stdout.encoding` answers the question directly, by round trip rather than by
  waiting for a throw, since the system encoder may substitute a rune it cannot
  represent instead of failing. Flutter web has no `dart:io` and so no `stdout`
  at all, and `pubspec.yaml` names web portability as the reason `package:http`
  is the one runtime dependency, so an unguarded `dart:io` import would have
  cost the platform this package sets out to support. The web half answers
  `false`: what a web build's `print` reaches is not knowable from inside the
  program, and the two answers are not symmetric, since ASCII renders correctly
  on a Unicode console while the reverse is mojibake.
### Fixed

- **`printRequests` let a response rewrite what the SDK had already printed.**
  A terminal does not display an escape sequence, it acts on it. "Cursor up"
  followed by "erase line" inside a response body, an error message, a url or a
  request id moved the cursor onto the row `renderExchange` printed above and
  blanked it, so a server could rewrite the method, the url or the status the
  reader was looking at; a lone carriage return did most of the same with one
  character, and a newline in any one-line field forged a row indistinguishable
  from one the SDK wrote.

  `neutraliseControls` in `console.dart` now escapes C0, DEL, the C1 block and
  U+2028/U+2029 as `\uXXXX` in **every** value that came from outside the SDK -
  the method and url a caller passed, the query and body they sent, the error
  text and request id a server returned. C1 is in the set because a console
  decoding those bytes as 8-bit C1 obeys them exactly as it obeys the
  ESC-prefixed form. The two separators are in for a narrower reason: Dart's own
  `LineSplitter` does **not** break on them, but they are line terminators in the
  ECMAScript grammar, which is what a web build's output lands in, and log
  viewers commonly break on them too. The escapes are JSON's own spelling, so a
  value that arrived as a JSON document is still a document a parser accepts.

  **This is not the encoding escape that landed above it, and neither covers the
  other.** `encodeForConsole` asks what the console can *represent*; ESC is 0x1b,
  which every encoding carries, so it passed that probe untouched. This asks what
  the console will *act on*. Both now run, in that order: neutralise each value,
  then encode the assembled block. The neutraliser has to be per value because it
  cannot tell the block's own row separators from one that arrived inside a
  field, and everything it writes is ASCII, so the encoder after it can neither
  re-escape that nor need to.

  Nothing changes for an exchange carrying no control character, which is nearly
  all of them. No API surface moved: `errorMessages`, its `+N more problems`
  notice and the redactor's `<...>` depth marker all read exactly as before.

- **`printRequests` printed data it had not checked the console could carry.**
  The rendered exchange carries text nobody here authored - a url, a request
  body, a server's error text - and it went to a bare `print` unchecked. A
  Windows console defaulting to cp1252, which is what this SDK is developed on,
  cannot represent most of what a v4 response may hold, so what the reader saw
  was whatever the encoder substituted, with no way to tell a substitution from
  data the API really sent. `renderExchange` now passes its block through
  `encodeForConsole`, which returns the text untouched when the console can
  carry it and otherwise escapes **only** the runes it cannot, naming the code
  point. A name like `café` still prints as itself on cp1252, and nothing
  changes at all on a UTF-8 console.
- **The blank-identifier message in `invoices.dart` named no argument.** It was
  written `'\$what is required: …'`, escaped, so all 23 endpoints in the family
  reported the literal `$what` instead of `invoice_id` or `note_id`. The other 43
  families already named the argument. The call still threw and still sent nothing, so only
  the message was wrong.
- **`SortDirection`'s doc comment claimed no version of the API has a `direction`
  parameter**, and that direction is always a `-` prefix on the field name in
  `sort`. True for Account, Accounting Codes, Alert, Integration Connections and
  Inventory Adjustments; false for Item, Order, Usage, Purchase Order and Return
  Merchandise Authorisation, which take `order_by` plus `direction`. A caller who
  believed it would send the wrong spelling, and the wrong spelling is not an
  error: it is accepted and silently ignored, so the listing comes back unsorted
  with a 200 and nothing to notice. Item Fulfillment is documented with both and
  unconfirmed, so the comment now says so rather than picking a side.
- The `Releasing` steps above, truncated mid-sentence at step 2 since before
  1.4.0, along with the `## [Unreleased]` heading they refer to. Steps 3 and 4
  had been lost with them.

## [1.5.0] - 2026-09-01

### Changed

- **The DTOs are measured from live responses, not from the API documentation's
  recorded examples.** Real responses from 256 GET endpoints, covering 42 of the 46
  families, are now the primary evidence; the documented examples are used only
  where no live response was read, and every view records which source it rests
  on.

  **16 of 40 families disagreed with the documented examples** about the two keys
  that decide whether a typed read works at all. The API answers
  `{"object", "url", "data", "pagination"}` for 38 of 40 families, records under
  `data`; the examples named the family instead in 15 of them.
  `item_fulfillments` and `return_merchandise_authorisations` both carried an
  `invoice` envelope, and `custom_components` carried `Acc Cus Comp`.

  Neither mistake raises. A pager pointed at the wrong record key finds nothing
  and reports success. A DTO told to unwrap the wrong envelope reads every field
  null. Both were live in the released code.

- **Families with no typed view at all: 24 down to 5.** 19 families gained
  measured views.

### Added

- `captures/` is gitignored: captured response bodies can carry populated
  `email`, `address_line_1`, `phone` and `mobile` fields belonging to real people,
  so they are never committed.

### Fixed

- The record key is now `data` in 35 families, which is what the instance sends.
  It was the family's own name, which found nothing.
- A view named after a resource class: the Tasks family answers a body named
  `Milestones`, and `Milestones` is also a resource. Views now dodge every
  resource class in the SDK, not only their own.


## [1.4.0] - 2026-09-01

### Changed

- **Response fields are measured per endpoint, not pooled per family.** This is
  the headline and it is a correctness fix, not a refactor. A family's fields
  used to be pooled across all of its endpoints and the pooled union declared on
  every one of them. Measured, the median endpoint's own response carries about
  **9 percent** of the fields its family pools: `DELETE
  /accounts/{id}/notes/{note_id}` answers one field and was handed 145. The
  other 144 read null on every call.

  Nothing about that announced itself. A DTO converts nothing, so a field the
  endpoint never sends does not raise, it reads null, and null is exactly what a
  field the API has stopped sending looks like. The pooled type was wrong in the
  one way that produces a plausible answer rather than an error.

  Each measured response shape is now its own view, named after the path it was
  measured from, and shared where two endpoints answer identical fields; **202 of
  the 447 endpoints name one**.

- **Only 2xx bodies are measured.** The documented examples include whatever came
  back, and 106 of them are failures. An error envelope is `{"errors":
  {"code", "message"}}`, so measuring it declared `code` and `message` as the
  endpoint's own fields. **51 endpoints had no saved response that was not a
  failure and were typed entirely from them**: `payments/{id}/notes` declared
  `code` and `message` and nothing else. A response with no recorded status code
  is not measured either, because it cannot be shown to be a success.

- **245 of the 447 endpoints now name no view at all**, up from far fewer. That
  is the honest result rather than a regression: their own responses were never
  recorded as a success, so there is no field to read a type from. They work,
  and they answer the whole body through `.map`. Capturing those responses is
  what would change it, and nothing else should.

### Added

- **Every view carries the endpoints it was measured from**, as `measuredFrom`,
  and the offline suite now asserts that an endpoint only ever names a view
  measured from that endpoint. It cannot show the measurement is right; it does
  show that no endpoint names a view built from somewhere else, which is the exact
  shape of the defect above, and it fails loudly if a future change reintroduces
  it.

### Fixed

- An import of the pagination library by three families that no longer have a
  page wrapper to use it, which per-endpoint naming exposed.


## [1.3.0] - 2026-09-01

### Removed

- **Eleven endpoints that were never endpoints.** The API's recorded examples
  include requests that check what the API says no to, carrying ids like
  `ac_deaddead...`, `not-an-id-at-all`, `db_that_does_not_exist_xyz` and
  `ITEM-DOESNOTEXIST-99999`, and each had been published as a function. The
  removed paths, by family:

  - `accounting_codes`: `GET`, `PATCH` and `DELETE` on
    `settings/accounting_codes/{ac_deaddead.., ac_000000..deadbeef,
    not-valid-at-all}` (4 endpoints over 3 paths)
  - `alerts`: `alerts/alt_000000..deadbeef`, `alerts/not-an-id-at-all`,
    `alerts/account/ACCOUNT_DOES_NOT_EXIST_XYZ`
  - `external_databases`: `external_databases/db_that_does_not_exist_xyz`
  - `inventory_adjustments`: `inventory_adjustments/{ia_deaddead..,
    totally-invalid-id-xyz}` and `items/ITEM-DOESNOTEXIST-99999/inventory_adjustments`

  None of them could have worked. Calling one sent a literal `deadbeef` to the
  API and got the refusal the person who wrote the request was looking for.

### Changed

- **`notes` addresses an account by parameter rather than by one instance's id.**
  All five Notes endpoints were emitted from requests written against a single
  account, so the constants read `accounts/2P07FH/notes` with that account id
  baked in. Every caller reached the same account, whatever they passed. The
  paths now template it as `accounts/{account_id}/notes`, which changes the
  constant names and adds the account id to each function's arguments.
- `orders`: `/orders/{order_id}/lines/` lost its trailing slash, so it no longer
  reduces to a second, duplicate name for the endpoint above it.

### Fixed

- `.gitignore` no longer ignores `.env.example`. The credentials block listed the
  template alongside the real `.env`, so the file it describes as "meant to be
  committed" was invisible to git and could not be updated.


## [1.2.0] - 2026-09-01

Completes the v4 collection: **44 more resource families, 376 endpoints**, taking
the SDK from 2 families and 82 endpoints to 46 and 458. Nothing was renamed and
no existing export moved, so this is a minor release.

### Added

- **44 resource families**, every family in the v4 collection that was not
  already covered, `invoices` and `orders` among them. Each is
  `lib/src/resources/<family>/` with the same three files and the same call
  shape as `accounts` and `items`.
- **A public library per family**, `lib/<family>.dart`, imported with a prefix:

  ```dart
  import 'package:exsited_sdk/payments.dart' as payments;

  final response = await payments.getPayment(client, 'PAY-0001');
  ```

  Not the main barrel, and not by preference. 25 top-level names are declared by
  more than one family, and 17 families each declare `recordKey`. Dart's `export`
  cannot rename or prefix, so no `show` list makes one flat namespace work across
  46 families; `import ... as` does, and this is what it imports.
  **`exsited_sdk.dart` is unchanged**,
  so nothing that imports it today is affected.
- **20 of those families carry measured DTO types**, each field with its sample
  count in the doc comment. A field whose observed types disagree is `Object?`
  and taken through unread.
- **`test/generated_families_test.dart`**, 633 offline checks over all 44
  families, against the same `FakeTransport` the hand-written tests use. Because
  that fake sits at the HTTP layer rather than at the endpoint layer, the check
  sees the **rendered** URL: a slot an endpoint failed to fill shows as a literal
  `{` still in the path, rather than having to be inferred from what was passed.
- **`DEVELOPMENT.md`** - the toolchain, the loop, what must stay true, how to add
  a resource or an endpoint, and the rules an automated contributor must not
  break. It records two deliberate choices (path constants as top-level
  `const String` rather than statics on a class, and per-call options bundled
  into `CallOptions` rather than passed flat) and one
  place the SDK does not yet deliver what it claims (`dart:io` is imported
  directly by `config.dart` and `token_store.dart`, with no `_io` / `_web` pairs,
  so a Flutter Web build would fail on them).
- **`ENDPOINTS.md`** - every endpoint in both families, the function that calls
  it, the test that exercises it, what it accepts on the query string and what a
  success looks like, with a Notes section for the measured behaviours the table
  cannot carry. It says explicitly that **invoices are not covered**, so nobody
  reads the working offset pager as evidence that the family exists.

### Changed

- **One import, not three.** `lib/exsited_sdk.dart` is now the only library a
  caller imports. `v4.dart` and `items_v4.dart` are gone, and so is the `v4/`
  directory under `lib/src/resources/`.

  The split was never a design. `Reference`, `User` and `Pagination` were declared
  by **both** families, and a Dart library cannot export one name from two places,
  so the families could not share a namespace and each needed its own entry point.
  Those three now live in `lib/src/resources/common/common_dto.dart`, which is
  what removed the clash. Nothing else collided: no endpoint function and no path
  constant was defined twice. Each of the three is the **union** of what the two
  families measured, which costs nothing because a DTO converts nothing and a
  field the body did not send simply reads null.

  Every `export` in the barrel now carries a `show` allow-list, so that one file
  **is** the public API and adding a helper to a resource module no longer widens
  the surface by accident.

  **This breaks the import line and nothing else.** Replace
  `import 'package:exsited_sdk/v4.dart' as v4;` with
  `import 'package:exsited_sdk/exsited_sdk.dart';` and drop the prefix; every
  function, type and path constant keeps its name. The version directory went for
  a separate reason: the API version is not part of any name here at all, being an
  `{api_version}` slot filled from `SdkConfig.apiVersion` at call time, so a `v4`
  folder encoded in the tree something the tree does not decide.

  `README.md` has not caught up and still shows the old two-import form. It is
  wrong; `DEVELOPMENT.md` and `ENDPOINTS.md` are not.

- **Every em dash and en dash removed** from code, comments and documents. Plain
  ASCII hyphens only, and the pull request gate now greps for both.

### Fixed

- **`sdkVersion` was `'1.0.0'` while `pubspec.yaml` said `1.1.0`.** It is what
  the `User-Agent` reports, so every 1.1.0 build named itself 1.0.0 on every
  request. Both are `1.2.0` here.

### Noted, not changed

- **A blank path parameter is refused twice.** The resource function checks it,
  and `url.dart` checks it again while substituting. Removing the first changes
  nothing observable: the call still throws `SdkUsageException` and still sends
  nothing. The resource-level guard is kept because it names the offending
  parameter, but it is defence in depth rather
  than the only defence, and the mutation test says so.

### Not added, and why

- **24 of the 46 families have no typed views at all**, `orders` among them at 35
  endpoints. Not one of their requests carries a saved response, so no field type
  could be measured. Their endpoints work and answer `response.map`.
- **No live tests for the generated families.** A live test needs a real id on a
  real instance; written mechanically for 44 families it would assert nothing.

## [1.1.0] - 2026-08-31

### Removed

- **The second resource library.** One resource library remains, and
  `ApiVersion` has one value, `v4`.

  **Offset pagination stays**: 1,470 of the 1,640 measured v4 pagination blocks
  use it, against 170 cursor blocks.

## [1.0.0] - 2026-08-31

First release of the Dart SDK for the Exsited API, running the shared
`conformance/conformance.json` behaviour suite.

### What it covers

- The **v4 account family**, 47 endpoints.
- Three payload forms: a map, a JSON string sent byte-for-byte, or a DTO.
- Four response members: `map`, `json` and `dto` always available, `data`
  following `responseFormat`.
- OAuth2 `client_credentials` with refresh, a cross-process token cache keyed by a
  credential fingerprint, retry with full jitter, `X-Idempotency-Key` on POST, and
  redaction on everything logged.

### Decisions worth knowing about

- **One runtime dependency, `package:http`.** Dart's core `HttpClient` is unusable
  from Flutter Web. SHA-256 is
  hand-written rather than pulling in `package:crypto` for one function, and is
  checked against the FIPS 180-4 vectors in `tool/sha_check.dart`.
- **`maxRetries` counts total attempts**, so 1 means nothing is retried.
- **500 is retryable for reads and not for writes** - it does not say whether the
  server committed, so replaying a POST could create a second record.
- **401 is retried by the token layer alone.** Retrying it in the transport would
  replay the same dead token until the attempts ran out.
- **The environment sits below code** in `responseFormat` resolution.

### Verified

`dart analyze` clean under `strict-casts`, `strict-inference` and
`strict-raw-types`; 152 checks passing, none of which opens a socket. The suite
runs against recorded responses and a fake transport - **nothing here has been run
against a live instance.**

### Known wrinkle in the shared contract

The `redact_json_text` cases in `conformance/conformance.json` carry expected
strings with a `", "` separator that Dart's encoder does not emit. Those cases are
compared by content here.
