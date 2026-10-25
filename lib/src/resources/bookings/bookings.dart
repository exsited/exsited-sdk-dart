/// The v4 bookings endpoints, one function per endpoint taking the client first.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'bookings_dto.dart';
import 'bookings_urls.dart';

/// `GET /api/{api_version}/booking`
Future<ApiResponse<BookingList>> getBooking(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.booking,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingList.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}`
Future<ApiResponse<BookingById>> getBookingById(
  ExsitedClient client,
  Object bookingId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingById,
        pathParams: {'booking_id': bookingId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingById.fromMap);

/// `POST /api/{api_version}/booking`
///
/// Create a booking, the `createOrder` body under `order`; `201`, answered
/// under `booking`. Each line needs a labour and its booking times.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> createBooking(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(BookingsUrls.booking,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/booking/preview`
///
/// Price a booking without creating it, the `createBooking` body; `201`, with
/// no cart data in the answer, under `booking`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> previewBooking(
  ExsitedClient client,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(BookingsUrls.bookingPreview,
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `DELETE /api/{api_version}/booking/{booking_id}`
///
/// Delete a booking; `204`. The server deletes any order by this path, whatever
/// its type.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> deleteBooking(
  ExsitedClient client,
  Object bookingId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendDeleteRequest(BookingsUrls.bookingById,
        pathParams: {'booking_id': bookingId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/booking/notes`
///
/// List the notes of every order, the same list as `getOrdersNotes`;
/// `/booking/{booking_id}/notes` is refused.
Future<ApiResponse<BookingNoteList>> getBookingNotes(
  ExsitedClient client, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingNotes,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingNoteList.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/billing_preferences`
///
/// A booking's billing preferences.
Future<ApiResponse<BookingBillingPreferencesView>> getBookingBillingPreferences(
  ExsitedClient client,
  Object bookingId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingBillingPreferences,
        pathParams: {'booking_id': bookingId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingBillingPreferencesView.fromMap);

/// `PATCH /api/{api_version}/booking/{booking_id}/billing_preferences`
///
/// Update a booking's billing preferences, body `order.billing_preferences`;
/// answered with the whole booking under `order`.
Future<ApiResponse<BookingById>> updateBookingBillingPreferences(
  ExsitedClient client,
  Object bookingId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(BookingsUrls.bookingBillingPreferences,
        pathParams: {'booking_id': bookingId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingById.fromMap);

/// `POST /api/{api_version}/booking/{booking_id}/change`
///
/// Change a booking, body under `booking`: `effective_date` and `lines`. Only a
/// booking-type order is accepted.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> changeBooking(
  ExsitedClient client,
  Object bookingId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(BookingsUrls.bookingChange,
        pathParams: {'booking_id': bookingId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `POST /api/{api_version}/booking/{booking_id}/change/preview`
///
/// Preview a booking change, the `changeBooking` body; nothing is changed.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> previewBookingChange(
  ExsitedClient client,
  Object bookingId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPostRequest(BookingsUrls.bookingChangePreview,
        pathParams: {'booking_id': bookingId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/booking/{booking_id}/information`
///
/// A booking's header.
Future<ApiResponse<BookingById>> getBookingInformation(
  ExsitedClient client,
  Object bookingId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingInformation,
        pathParams: {'booking_id': bookingId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingById.fromMap);

/// `PATCH /api/{api_version}/booking/{booking_id}/information`
///
/// Update a booking's header, body under `order`; answered with the whole
/// booking under `order`.
Future<ApiResponse<BookingById>> updateBookingInformation(
  ExsitedClient client,
  Object bookingId,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(BookingsUrls.bookingInformation,
        pathParams: {'booking_id': bookingId},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingById.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/lines`
///
/// A booking with its lines, under `order`.
Future<ApiResponse<BookingById>> getBookingLines(
  ExsitedClient client,
  Object bookingId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingLines,
        pathParams: {'booking_id': bookingId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingById.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/lines/{line_uuid}`
///
/// One booking line, under `order_line`.
Future<ApiResponse<BookingLine>> getBookingLine(
  ExsitedClient client,
  Object bookingId,
  Object lineUuid, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingLine,
        pathParams: {'booking_id': bookingId, 'line_uuid': lineUuid},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingLine.fromMap);

/// `PATCH /api/{api_version}/booking/{booking_id}/lines/{line_uuid}`
///
/// Update a booking line, body `order.line`; answered with the whole booking
/// under `order`.
Future<ApiResponse<BookingById>> updateBookingLine(
  ExsitedClient client,
  Object bookingId,
  Object lineUuid,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(BookingsUrls.bookingLine,
        pathParams: {'booking_id': bookingId, 'line_uuid': lineUuid},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingById.fromMap);

/// `PATCH /api/{api_version}/booking/{booking_id}/lines/{line_uuid}/billing_preferences`
///
/// Update a line's billing preferences, body `order.line.item_properties`, not
/// `billing_preferences`.
Future<ApiResponse<BookingById>> updateBookingLineBillingPreferences(
  ExsitedClient client,
  Object bookingId,
  Object lineUuid,
  Object payload, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendPatchRequest(BookingsUrls.bookingLineBillingPreferences,
        pathParams: {'booking_id': bookingId, 'line_uuid': lineUuid},
        jsonBody: payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingById.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/custom_objects`
///
/// List the custom objects orders use, with the booking's instances.
Future<ApiResponse<BookingCustomObjectList>> getBookingCustomObjects(
  ExsitedClient client,
  Object bookingId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingCustomObjects,
        pathParams: {'booking_id': bookingId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingCustomObjectList.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/custom_objects/{custom_object_id}`
///
/// One custom object with the booking's instances of it.
Future<ApiResponse<BookingCustomObject>> getBookingCustomObject(
  ExsitedClient client,
  Object bookingId,
  Object customObjectId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingCustomObject,
        pathParams: {
          'booking_id': bookingId,
          'custom_object_id': customObjectId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingCustomObject.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/custom_objects/{custom_object_id}/instances/{instance_id}`
///
/// One custom object instance.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getBookingCustomObjectInstance(
  ExsitedClient client,
  Object bookingId,
  Object customObjectId,
  Object instanceId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingCustomObjectInstance,
        pathParams: {
          'booking_id': bookingId,
          'custom_object_id': customObjectId,
          'instance_id': instanceId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/booking/{booking_id}/custom_objects_instances`
///
/// The server's alias of `getBookingCustomObjects`.
Future<ApiResponse<BookingCustomObjectList>> getBookingCustomObjectsInstances(
  ExsitedClient client,
  Object bookingId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingCustomObjectsInstances,
        pathParams: {'booking_id': bookingId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingCustomObjectList.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/custom_objects_instances/{custom_object_id}`
///
/// The server's alias of `getBookingCustomObject`.
Future<ApiResponse<BookingCustomObject>> getBookingCustomObjectsInstance(
  ExsitedClient client,
  Object bookingId,
  Object customObjectId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingCustomObjectsInstance,
        pathParams: {
          'booking_id': bookingId,
          'custom_object_id': customObjectId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingCustomObject.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/custom_objects_instances/{custom_object_id}/instances/{instance_id}`
///
/// The server's alias of `getBookingCustomObjectInstance`.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getBookingCustomObjectsInstanceInstance(
  ExsitedClient client,
  Object bookingId,
  Object customObjectId,
  Object instanceId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingCustomObjectsInstanceInstance,
        pathParams: {
          'booking_id': bookingId,
          'custom_object_id': customObjectId,
          'instance_id': instanceId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/booking/{booking_id}/invoices`
///
/// List a booking's invoices.
Future<ApiResponse<BookingInvoiceList>> getBookingInvoices(
  ExsitedClient client,
  Object bookingId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingInvoices,
        pathParams: {'booking_id': bookingId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingInvoiceList.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/item_fulfillments`
///
/// List a booking's fulfillments.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getBookingItemFulfillments(
  ExsitedClient client,
  Object bookingId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingItemFulfillments,
        pathParams: {'booking_id': bookingId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);

/// `GET /api/{api_version}/booking/{booking_id}/item_fulfillments/{fulfillment_id}`
///
/// One fulfillment; the server does not check that the fulfillment belongs to
/// the booking.
Future<ApiResponse<BookingItemFulfillment>> getBookingItemFulfillment(
  ExsitedClient client,
  Object bookingId,
  Object fulfillmentId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingItemFulfillment,
        pathParams: {'booking_id': bookingId, 'fulfillment_id': fulfillmentId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingItemFulfillment.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/kpis`
///
/// A booking's KPIs, under `order_kpis`.
Future<ApiResponse<BookingKpis>> getBookingKpis(
  ExsitedClient client,
  Object bookingId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingKpis,
        pathParams: {'booking_id': bookingId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingKpis.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/payment_methods`
///
/// The payment methods bound to a booking; `404` when none is.
Future<ApiResponse<BookingPaymentMethods>> getBookingPaymentMethods(
  ExsitedClient client,
  Object bookingId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingPaymentMethods,
        pathParams: {'booking_id': bookingId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingPaymentMethods.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/payment_methods/{payment_method_ref}`
///
/// One bound payment method, by its reference.
Future<ApiResponse<BookingPaymentMethod>> getBookingPaymentMethod(
  ExsitedClient client,
  Object bookingId,
  Object paymentMethodRef, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingPaymentMethod,
        pathParams: {
          'booking_id': bookingId,
          'payment_method_ref': paymentMethodRef
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingPaymentMethod.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/payments`
///
/// List a booking's payments.
Future<ApiResponse<BookingPaymentList>> getBookingPayments(
  ExsitedClient client,
  Object bookingId, {
  Map<String, Object?>? queryParams,
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingPayments,
        pathParams: {'booking_id': bookingId},
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingPaymentList.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/payments/{payment_id}`
///
/// One payment; the server does not check that the payment belongs to the
/// booking.
Future<ApiResponse<BookingPaymentView>> getBookingPayment(
  ExsitedClient client,
  Object bookingId,
  Object paymentId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingPayment,
        pathParams: {'booking_id': bookingId, 'payment_id': paymentId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingPaymentView.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/pdf`
///
/// A booking's PDF links.
Future<ApiResponse<BookingPdf>> getBookingPdf(
  ExsitedClient client,
  Object bookingId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingPdf,
        pathParams: {'booking_id': bookingId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingPdf.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/quote_partial_invoices`
///
/// The deposit and instalment invoices of a converted quote.
Future<ApiResponse<BookingQuotePartialInvoices>> getBookingQuotePartialInvoices(
  ExsitedClient client,
  Object bookingId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingQuotePartialInvoices,
        pathParams: {'booking_id': bookingId},
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
        dtoDecoder: BookingQuotePartialInvoices.fromMap);

/// `GET /api/{api_version}/booking/{booking_id}/shipping_pdf/{shipping_line_id}`
///
/// A shipping line's PDF; `404` until the line has a generated shipping PDF.
///
/// No typed view: no 2xx response was recorded for it. Read `response.map`.
Future<ApiResponse<Object?>> getBookingShippingPdf(
  ExsitedClient client,
  Object bookingId,
  Object shippingLineId, {
  bool? raiseOnError,
  String? responseFormat,
}) =>
    client.sendGetRequest(BookingsUrls.bookingShippingPdf,
        pathParams: {
          'booking_id': bookingId,
          'shipping_line_id': shippingLineId
        },
        raiseOnError: raiseOnError,
        responseFormat: responseFormat);
