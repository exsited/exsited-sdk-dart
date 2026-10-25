/// The v4 bookings endpoints, bound to one client.
library;

import '../../client/api_response.dart';
import '../../client/exsited_client.dart';
import 'bookings.dart' as endpoints;
import 'bookings_dto.dart' as views;

/// The bookings endpoints with [client] already applied.
class BookingsResource {
  /// Bind the resource to a client; normally reached via `client.bookings`.
  const BookingsResource(this.client);

  /// The client every call below is made through.
  final ExsitedClient client;

  /// `GET /api/{api_version}/booking`
  Future<ApiResponse<views.BookingList>> getBooking({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBooking(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}`
  Future<ApiResponse<views.BookingById>> getBookingById(
    Object bookingId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingById(
        client,
        bookingId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/booking`
  Future<ApiResponse<Object?>> createBooking(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.createBooking(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/booking/preview`
  Future<ApiResponse<Object?>> previewBooking(
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.previewBooking(
        client,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `DELETE /api/{api_version}/booking/{booking_id}`
  Future<ApiResponse<Object?>> deleteBooking(
    Object bookingId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.deleteBooking(
        client,
        bookingId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/notes`
  Future<ApiResponse<views.BookingNoteList>> getBookingNotes({
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingNotes(
        client,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/billing_preferences`
  Future<ApiResponse<views.BookingBillingPreferencesView>>
      getBookingBillingPreferences(
    Object bookingId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getBookingBillingPreferences(
            client,
            bookingId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `PATCH /api/{api_version}/booking/{booking_id}/billing_preferences`
  Future<ApiResponse<views.BookingById>> updateBookingBillingPreferences(
    Object bookingId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateBookingBillingPreferences(
        client,
        bookingId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/booking/{booking_id}/change`
  Future<ApiResponse<Object?>> changeBooking(
    Object bookingId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.changeBooking(
        client,
        bookingId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `POST /api/{api_version}/booking/{booking_id}/change/preview`
  Future<ApiResponse<Object?>> previewBookingChange(
    Object bookingId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.previewBookingChange(
        client,
        bookingId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/information`
  Future<ApiResponse<views.BookingById>> getBookingInformation(
    Object bookingId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingInformation(
        client,
        bookingId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/booking/{booking_id}/information`
  Future<ApiResponse<views.BookingById>> updateBookingInformation(
    Object bookingId,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateBookingInformation(
        client,
        bookingId,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/lines`
  Future<ApiResponse<views.BookingById>> getBookingLines(
    Object bookingId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingLines(
        client,
        bookingId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/lines/{line_uuid}`
  Future<ApiResponse<views.BookingLine>> getBookingLine(
    Object bookingId,
    Object lineUuid, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingLine(
        client,
        bookingId,
        lineUuid,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/booking/{booking_id}/lines/{line_uuid}`
  Future<ApiResponse<views.BookingById>> updateBookingLine(
    Object bookingId,
    Object lineUuid,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateBookingLine(
        client,
        bookingId,
        lineUuid,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `PATCH /api/{api_version}/booking/{booking_id}/lines/{line_uuid}/billing_preferences`
  Future<ApiResponse<views.BookingById>> updateBookingLineBillingPreferences(
    Object bookingId,
    Object lineUuid,
    Object payload, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.updateBookingLineBillingPreferences(
        client,
        bookingId,
        lineUuid,
        payload,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/custom_objects`
  Future<ApiResponse<views.BookingCustomObjectList>> getBookingCustomObjects(
    Object bookingId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingCustomObjects(
        client,
        bookingId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/custom_objects/{custom_object_id}`
  Future<ApiResponse<views.BookingCustomObject>> getBookingCustomObject(
    Object bookingId,
    Object customObjectId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingCustomObject(
        client,
        bookingId,
        customObjectId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/custom_objects/{custom_object_id}/instances/{instance_id}`
  Future<ApiResponse<Object?>> getBookingCustomObjectInstance(
    Object bookingId,
    Object customObjectId,
    Object instanceId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingCustomObjectInstance(
        client,
        bookingId,
        customObjectId,
        instanceId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/custom_objects_instances`
  Future<ApiResponse<views.BookingCustomObjectList>>
      getBookingCustomObjectsInstances(
    Object bookingId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getBookingCustomObjectsInstances(
            client,
            bookingId,
            queryParams: queryParams,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/booking/{booking_id}/custom_objects_instances/{custom_object_id}`
  Future<ApiResponse<views.BookingCustomObject>>
      getBookingCustomObjectsInstance(
    Object bookingId,
    Object customObjectId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getBookingCustomObjectsInstance(
            client,
            bookingId,
            customObjectId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/booking/{booking_id}/custom_objects_instances/{custom_object_id}/instances/{instance_id}`
  Future<ApiResponse<Object?>> getBookingCustomObjectsInstanceInstance(
    Object bookingId,
    Object customObjectId,
    Object instanceId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingCustomObjectsInstanceInstance(
        client,
        bookingId,
        customObjectId,
        instanceId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/invoices`
  Future<ApiResponse<views.BookingInvoiceList>> getBookingInvoices(
    Object bookingId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingInvoices(
        client,
        bookingId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/item_fulfillments`
  Future<ApiResponse<Object?>> getBookingItemFulfillments(
    Object bookingId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingItemFulfillments(
        client,
        bookingId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/item_fulfillments/{fulfillment_id}`
  Future<ApiResponse<views.BookingItemFulfillment>> getBookingItemFulfillment(
    Object bookingId,
    Object fulfillmentId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingItemFulfillment(
        client,
        bookingId,
        fulfillmentId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/kpis`
  Future<ApiResponse<views.BookingKpis>> getBookingKpis(
    Object bookingId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingKpis(
        client,
        bookingId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/payment_methods`
  Future<ApiResponse<views.BookingPaymentMethods>> getBookingPaymentMethods(
    Object bookingId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingPaymentMethods(
        client,
        bookingId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/payment_methods/{payment_method_ref}`
  Future<ApiResponse<views.BookingPaymentMethod>> getBookingPaymentMethod(
    Object bookingId,
    Object paymentMethodRef, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingPaymentMethod(
        client,
        bookingId,
        paymentMethodRef,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/payments`
  Future<ApiResponse<views.BookingPaymentList>> getBookingPayments(
    Object bookingId, {
    Map<String, Object?>? queryParams,
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingPayments(
        client,
        bookingId,
        queryParams: queryParams,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/payments/{payment_id}`
  Future<ApiResponse<views.BookingPaymentView>> getBookingPayment(
    Object bookingId,
    Object paymentId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingPayment(
        client,
        bookingId,
        paymentId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/pdf`
  Future<ApiResponse<views.BookingPdf>> getBookingPdf(
    Object bookingId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingPdf(
        client,
        bookingId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );

  /// `GET /api/{api_version}/booking/{booking_id}/quote_partial_invoices`
  Future<ApiResponse<views.BookingQuotePartialInvoices>>
      getBookingQuotePartialInvoices(
    Object bookingId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
          endpoints.getBookingQuotePartialInvoices(
            client,
            bookingId,
            raiseOnError: raiseOnError,
            responseFormat: responseFormat,
          );

  /// `GET /api/{api_version}/booking/{booking_id}/shipping_pdf/{shipping_line_id}`
  Future<ApiResponse<Object?>> getBookingShippingPdf(
    Object bookingId,
    Object shippingLineId, {
    bool? raiseOnError,
    String? responseFormat,
  }) =>
      endpoints.getBookingShippingPdf(
        client,
        bookingId,
        shippingLineId,
        raiseOnError: raiseOnError,
        responseFormat: responseFormat,
      );
}
