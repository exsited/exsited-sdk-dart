/// Bookings path templates and body keys; the client fills `{api_version}`.
library;

class BookingsUrls {
  BookingsUrls._();

  static const String booking = '/api/{api_version}/booking';
  static const String bookingById = '/api/{api_version}/booking/{booking_id}';
  static const String bookingPreview = '/api/{api_version}/booking/preview';
  static const String bookingNotes = '/api/{api_version}/booking/notes';
  static const String bookingBillingPreferences =
      '/api/{api_version}/booking/{booking_id}/billing_preferences';
  static const String bookingChange =
      '/api/{api_version}/booking/{booking_id}/change';
  static const String bookingChangePreview =
      '/api/{api_version}/booking/{booking_id}/change/preview';
  static const String bookingInformation =
      '/api/{api_version}/booking/{booking_id}/information';
  static const String bookingLines =
      '/api/{api_version}/booking/{booking_id}/lines';
  static const String bookingLine =
      '/api/{api_version}/booking/{booking_id}/lines/{line_uuid}';
  static const String bookingLineBillingPreferences =
      '/api/{api_version}/booking/{booking_id}/lines/{line_uuid}/billing_preferences';
  static const String bookingCustomObjects =
      '/api/{api_version}/booking/{booking_id}/custom_objects';
  static const String bookingCustomObject =
      '/api/{api_version}/booking/{booking_id}/custom_objects/{custom_object_id}';
  static const String bookingCustomObjectInstance =
      '/api/{api_version}/booking/{booking_id}/custom_objects/{custom_object_id}/instances/{instance_id}';
  static const String bookingCustomObjectsInstances =
      '/api/{api_version}/booking/{booking_id}/custom_objects_instances';
  static const String bookingCustomObjectsInstance =
      '/api/{api_version}/booking/{booking_id}/custom_objects_instances/{custom_object_id}';
  static const String bookingCustomObjectsInstanceInstance =
      '/api/{api_version}/booking/{booking_id}/custom_objects_instances/{custom_object_id}/instances/{instance_id}';
  static const String bookingInvoices =
      '/api/{api_version}/booking/{booking_id}/invoices';
  static const String bookingItemFulfillments =
      '/api/{api_version}/booking/{booking_id}/item_fulfillments';
  static const String bookingItemFulfillment =
      '/api/{api_version}/booking/{booking_id}/item_fulfillments/{fulfillment_id}';
  static const String bookingKpis =
      '/api/{api_version}/booking/{booking_id}/kpis';
  static const String bookingPaymentMethods =
      '/api/{api_version}/booking/{booking_id}/payment_methods';
  static const String bookingPaymentMethod =
      '/api/{api_version}/booking/{booking_id}/payment_methods/{payment_method_ref}';
  static const String bookingPayments =
      '/api/{api_version}/booking/{booking_id}/payments';
  static const String bookingPayment =
      '/api/{api_version}/booking/{booking_id}/payments/{payment_id}';
  static const String bookingPdf =
      '/api/{api_version}/booking/{booking_id}/pdf';
  static const String bookingQuotePartialInvoices =
      '/api/{api_version}/booking/{booking_id}/quote_partial_invoices';
  static const String bookingShippingPdf =
      '/api/{api_version}/booking/{booking_id}/shipping_pdf/{shipping_line_id}';

  /// The key a listing's records arrive under.
  static const String dataKey = 'data';

  /// The envelopes one record arrives under, read off this family's views.
  static const String orderKey = 'order';
}
