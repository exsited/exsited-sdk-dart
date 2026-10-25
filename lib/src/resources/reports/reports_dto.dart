/// Typed views over the v4 reports bodies.
library;

import '../../client/dto.dart';

/// The reports accounts account overview body.
class ReportsAccountsAccountOverview extends Dto {
  const ReportsAccountsAccountOverview({
    this.accounts,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/reports/accounts/account_overview',
  ];

  static ReportsAccountsAccountOverview? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'report');
    if (source == null) return null;
    return ReportsAccountsAccountOverview(
      accounts:
          ReportsAccountsAccountOverviewAccounts.fromMap(source['accounts']),
    );
  }

  final ReportsAccountsAccountOverviewAccounts? accounts;

  @override
  String? get envelopeKey => 'report';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'accounts': accounts,
      };
}

/// What `getReportsInvoicesInvoiceOverview` answers, under `report`.
class ReportsInvoicesInvoiceOverview extends Dto {
  const ReportsInvoicesInvoiceOverview({
    this.invoices,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/reports/invoices/invoice_overview',
  ];

  static ReportsInvoicesInvoiceOverview? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'report');
    if (source == null) return null;
    return ReportsInvoicesInvoiceOverview(
      invoices:
          ReportsInvoicesInvoiceOverviewInvoices.fromMap(source['invoices']),
    );
  }

  final ReportsInvoicesInvoiceOverviewInvoices? invoices;

  @override
  String? get envelopeKey => 'report';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'invoices': invoices,
      };
}

/// What `getReportsOrdersOrderOverview` answers, under `report`.
class ReportsOrdersOrderOverview extends Dto {
  const ReportsOrdersOrderOverview({
    this.orders,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/reports/orders/order_overview',
  ];

  static ReportsOrdersOrderOverview? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'report');
    if (source == null) return null;
    return ReportsOrdersOrderOverview(
      orders: ReportsOrdersOrderOverviewOrders.fromMap(source['orders']),
    );
  }

  final ReportsOrdersOrderOverviewOrders? orders;

  @override
  String? get envelopeKey => 'report';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'orders': orders,
      };
}

/// What `getReportsPurchaseInvoicesPurchaseInvoiceOverview` answers, under `report`.
class ReportsPurchaseInvoicesPurchaseInvoiceOverview extends Dto {
  const ReportsPurchaseInvoicesPurchaseInvoiceOverview({
    this.purchaseInvoices,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/reports/purchase_invoices/purchase_invoice_overview',
  ];

  static ReportsPurchaseInvoicesPurchaseInvoiceOverview? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'report');
    if (source == null) return null;
    return ReportsPurchaseInvoicesPurchaseInvoiceOverview(
      purchaseInvoices:
          ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoices
              .fromMap(source['purchase_invoices']),
    );
  }

  final ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoices?
      purchaseInvoices;

  @override
  String? get envelopeKey => 'report';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'purchase_invoices': purchaseInvoices,
      };
}

/// What `getReportsPurchaseOrdersPurchaseOrderOverview` answers, under `report`.
class ReportsPurchaseOrdersPurchaseOrderOverview extends Dto {
  const ReportsPurchaseOrdersPurchaseOrderOverview({
    this.purchaseOrders,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/reports/purchase_orders/purchase_order_overview',
  ];

  static ReportsPurchaseOrdersPurchaseOrderOverview? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'report');
    if (source == null) return null;
    return ReportsPurchaseOrdersPurchaseOrderOverview(
      purchaseOrders:
          ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrders.fromMap(
              source['purchase_orders']),
    );
  }

  final ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrders?
      purchaseOrders;

  @override
  String? get envelopeKey => 'report';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'purchase_orders': purchaseOrders,
      };
}

/// What `getReportsPurchaseTransactionsPurchasePaymentAndRefundOverview` answers, under `report`.
class ReportsPurchaseTransactionsPurchasePaymentAndRefundOverview extends Dto {
  const ReportsPurchaseTransactionsPurchasePaymentAndRefundOverview({
    this.purchasePaymentAndRefundOverview,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/reports/purchase_transactions/purchase_payment_and_refund_overview',
  ];

  static ReportsPurchaseTransactionsPurchasePaymentAndRefundOverview? fromMap(
      Object? body) {
    final source = readRecord(body, envelopeKey: 'report');
    if (source == null) return null;
    return ReportsPurchaseTransactionsPurchasePaymentAndRefundOverview(
      purchasePaymentAndRefundOverview:
          ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverview
              .fromMap(source['purchase_payment_and_refund_overview']),
    );
  }

  final ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverview?
      purchasePaymentAndRefundOverview;

  @override
  String? get envelopeKey => 'report';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'purchase_payment_and_refund_overview':
            purchasePaymentAndRefundOverview,
      };
}

/// What `getReportsTransactionsPaymentAndRefundOverview` answers, under `report`.
class ReportsTransactionsPaymentAndRefundOverview extends Dto {
  const ReportsTransactionsPaymentAndRefundOverview({
    this.paymentAndRefundOverview,
  });

  static const List<String> measuredFrom = [
    'GET /api/{api_version}/reports/transactions/payment_and_refund_overview',
  ];

  static ReportsTransactionsPaymentAndRefundOverview? fromMap(Object? body) {
    final source = readRecord(body, envelopeKey: 'report');
    if (source == null) return null;
    return ReportsTransactionsPaymentAndRefundOverview(
      paymentAndRefundOverview:
          ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverview
              .fromMap(source['payment_and_refund_overview']),
    );
  }

  final ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverview?
      paymentAndRefundOverview;

  @override
  String? get envelopeKey => 'report';

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'payment_and_refund_overview': paymentAndRefundOverview,
      };
}

/// A [ReportsAccountsAccountOverview]'s `accounts`.
class ReportsAccountsAccountOverviewAccounts extends Dto {
  const ReportsAccountsAccountOverviewAccounts({
    this.accountOverview,
  });

  static ReportsAccountsAccountOverviewAccounts? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsAccountsAccountOverviewAccounts(
      accountOverview:
          readList<ReportsAccountsAccountOverviewAccountsAccountOverview>(
              source['account_overview'],
              ReportsAccountsAccountOverviewAccountsAccountOverview.fromMap),
    );
  }

  final List<ReportsAccountsAccountOverviewAccountsAccountOverview?>?
      accountOverview;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'account_overview': accountOverview,
      };
}

/// A [ReportsInvoicesInvoiceOverview]'s `invoices`.
class ReportsInvoicesInvoiceOverviewInvoices extends Dto {
  const ReportsInvoicesInvoiceOverviewInvoices({
    this.invoiceOverview,
  });

  static ReportsInvoicesInvoiceOverviewInvoices? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsInvoicesInvoiceOverviewInvoices(
      invoiceOverview:
          readList<ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverview>(
              source['invoice_overview'],
              ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverview.fromMap),
    );
  }

  final List<ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverview?>?
      invoiceOverview;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'invoice_overview': invoiceOverview,
      };
}

/// A [ReportsOrdersOrderOverview]'s `orders`.
class ReportsOrdersOrderOverviewOrders extends Dto {
  const ReportsOrdersOrderOverviewOrders({
    this.orderOverview,
  });

  static ReportsOrdersOrderOverviewOrders? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsOrdersOrderOverviewOrders(
      orderOverview: readList<ReportsOrdersOrderOverviewOrdersOrderOverview>(
          source['order_overview'],
          ReportsOrdersOrderOverviewOrdersOrderOverview.fromMap),
    );
  }

  final List<ReportsOrdersOrderOverviewOrdersOrderOverview?>? orderOverview;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'order_overview': orderOverview,
      };
}

/// A [ReportsPurchaseInvoicesPurchaseInvoiceOverview]'s `purchase_invoices`.
class ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoices
    extends Dto {
  const ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoices({
    this.purchaseInvoiceOverview,
  });

  static ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoices?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoices(
      purchaseInvoiceOverview: readList<
              ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverview>(
          source['purchase_invoice_overview'],
          ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverview
              .fromMap),
    );
  }

  final List<
          ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverview?>?
      purchaseInvoiceOverview;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'purchase_invoice_overview': purchaseInvoiceOverview,
      };
}

/// A [ReportsPurchaseOrdersPurchaseOrderOverview]'s `purchase_orders`.
class ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrders extends Dto {
  const ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrders({
    this.purchaseOrderOverview,
  });

  static ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrders? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrders(
      purchaseOrderOverview: readList<
              ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverview>(
          source['purchase_order_overview'],
          ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverview
              .fromMap),
    );
  }

  final List<
          ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverview?>?
      purchaseOrderOverview;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'purchase_order_overview': purchaseOrderOverview,
      };
}

/// A [ReportsPurchaseTransactionsPurchasePaymentAndRefundOverview]'s `purchase_payment_and_refund_overview`.
class ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverview
    extends Dto {
  const ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverview({
    this.purchasePayments,
    this.purchaseRefunds,
  });

  static ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverview?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverview(
      purchasePayments: readList<
              ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePayment>(
          source['purchase_payments'],
          ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePayment
              .fromMap),
      purchaseRefunds: readList<
              ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefund>(
          source['purchase_refunds'],
          ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefund
              .fromMap),
    );
  }

  final List<
          ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePayment?>?
      purchasePayments;

  final List<
          ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefund?>?
      purchaseRefunds;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'purchase_payments': purchasePayments,
        'purchase_refunds': purchaseRefunds,
      };
}

/// A [ReportsTransactionsPaymentAndRefundOverview]'s `payment_and_refund_overview`.
class ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverview
    extends Dto {
  const ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverview({
    this.payments,
    this.refunds,
  });

  static ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverview?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverview(
      payments: readList<
              ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPayment>(
          source['payments'],
          ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPayment
              .fromMap),
      refunds: readList<
              ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefund>(
          source['refunds'],
          ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefund
              .fromMap),
    );
  }

  final List<
          ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPayment?>?
      payments;

  final List<
          ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefund?>?
      refunds;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'payments': payments,
        'refunds': refunds,
      };
}

/// One entry of a [ReportsAccountsAccountOverviewAccounts]'s `account_overview`.
class ReportsAccountsAccountOverviewAccountsAccountOverview extends Dto {
  const ReportsAccountsAccountOverviewAccountsAccountOverview({
    this.cancelled,
    this.date,
    this.deleted,
    this.netGain,
    this.newValue,
    this.reactivated,
  });

  static ReportsAccountsAccountOverviewAccountsAccountOverview? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsAccountsAccountOverviewAccountsAccountOverview(
      cancelled: readText(source['cancelled']),
      date: readText(source['date']),
      deleted: readText(source['deleted']),
      netGain: readText(source['net_gain']),
      newValue: readText(source['new']),
      reactivated: readText(source['reactivated']),
    );
  }

  final String? cancelled;

  final String? date;

  final String? deleted;

  final String? netGain;

  final String? newValue;

  final String? reactivated;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'cancelled': cancelled,
        'date': date,
        'deleted': deleted,
        'net_gain': netGain,
        'new': newValue,
        'reactivated': reactivated,
      };
}

/// One entry of a [ReportsInvoicesInvoiceOverviewInvoices]'s `invoice_overview`.
class ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverview extends Dto {
  const ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverview({
    this.amended,
    this.cancelled,
    this.date,
    this.invoiceTotal,
    this.netGain,
    this.newValue,
    this.reactivated,
    this.voided,
  });

  static ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverview? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverview(
      amended:
          ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewAmended.fromMap(
              source['amended']),
      cancelled: ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewCancelled
          .fromMap(source['cancelled']),
      date: readText(source['date']),
      invoiceTotal: readText(source['invoice_total']),
      netGain:
          ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewNetGain.fromMap(
              source['net_gain']),
      newValue:
          ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewNew.fromMap(
              source['new']),
      reactivated:
          ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewReactivated
              .fromMap(source['reactivated']),
      voided:
          ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewVoided.fromMap(
              source['voided']),
    );
  }

  final ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewAmended? amended;

  final ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewCancelled?
      cancelled;

  final String? date;

  final String? invoiceTotal;

  final ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewNetGain? netGain;

  final ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewNew? newValue;

  final ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewReactivated?
      reactivated;

  final ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewVoided? voided;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amended': amended,
        'cancelled': cancelled,
        'date': date,
        'invoice_total': invoiceTotal,
        'net_gain': netGain,
        'new': newValue,
        'reactivated': reactivated,
        'voided': voided,
      };
}

/// One entry of a [ReportsOrdersOrderOverviewOrders]'s `order_overview`.
class ReportsOrdersOrderOverviewOrdersOrderOverview extends Dto {
  const ReportsOrdersOrderOverviewOrdersOrderOverview({
    this.cancelled,
    this.changed,
    this.date,
    this.deleted,
    this.netGain,
    this.newValue,
    this.orderTotal,
    this.reactivated,
  });

  static ReportsOrdersOrderOverviewOrdersOrderOverview? fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsOrdersOrderOverviewOrdersOrderOverview(
      cancelled: ReportsOrdersOrderOverviewOrdersOrderOverviewCancelled.fromMap(
          source['cancelled']),
      changed: ReportsOrdersOrderOverviewOrdersOrderOverviewChanged.fromMap(
          source['changed']),
      date: readText(source['date']),
      deleted: ReportsOrdersOrderOverviewOrdersOrderOverviewDeleted.fromMap(
          source['deleted']),
      netGain: ReportsOrdersOrderOverviewOrdersOrderOverviewNetGain.fromMap(
          source['net_gain']),
      newValue: ReportsOrdersOrderOverviewOrdersOrderOverviewNew.fromMap(
          source['new']),
      orderTotal: readText(source['order_total']),
      reactivated:
          ReportsOrdersOrderOverviewOrdersOrderOverviewReactivated.fromMap(
              source['reactivated']),
    );
  }

  final ReportsOrdersOrderOverviewOrdersOrderOverviewCancelled? cancelled;

  final ReportsOrdersOrderOverviewOrdersOrderOverviewChanged? changed;

  final String? date;

  final ReportsOrdersOrderOverviewOrdersOrderOverviewDeleted? deleted;

  final ReportsOrdersOrderOverviewOrdersOrderOverviewNetGain? netGain;

  final ReportsOrdersOrderOverviewOrdersOrderOverviewNew? newValue;

  final String? orderTotal;

  final ReportsOrdersOrderOverviewOrdersOrderOverviewReactivated? reactivated;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'cancelled': cancelled,
        'changed': changed,
        'date': date,
        'deleted': deleted,
        'net_gain': netGain,
        'new': newValue,
        'order_total': orderTotal,
        'reactivated': reactivated,
      };
}

/// One entry of a [ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoices]'s `purchase_invoice_overview`.
class ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverview
    extends Dto {
  const ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverview({
    this.amended,
    this.cancelled,
    this.date,
    this.netGain,
    this.newValue,
    this.purchaseInvoiceTotal,
    this.reactivated,
    this.voided,
  });

  static ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverview?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverview(
      amended:
          ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewAmended
              .fromMap(source['amended']),
      cancelled:
          ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewCancelled
              .fromMap(source['cancelled']),
      date: readText(source['date']),
      netGain:
          ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewNetGain
              .fromMap(source['net_gain']),
      newValue:
          ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewNew
              .fromMap(source['new']),
      purchaseInvoiceTotal: readText(source['purchase_invoice_total']),
      reactivated:
          ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewReactivated
              .fromMap(source['reactivated']),
      voided:
          ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewVoided
              .fromMap(source['voided']),
    );
  }

  final ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewAmended?
      amended;

  final ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewCancelled?
      cancelled;

  final String? date;

  final ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewNetGain?
      netGain;

  final ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewNew?
      newValue;

  final String? purchaseInvoiceTotal;

  final ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewReactivated?
      reactivated;

  final ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewVoided?
      voided;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amended': amended,
        'cancelled': cancelled,
        'date': date,
        'net_gain': netGain,
        'new': newValue,
        'purchase_invoice_total': purchaseInvoiceTotal,
        'reactivated': reactivated,
        'voided': voided,
      };
}

/// One entry of a [ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrders]'s `purchase_order_overview`.
class ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverview
    extends Dto {
  const ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverview({
    this.cancelled,
    this.changed,
    this.date,
    this.deleted,
    this.netPurchases,
    this.newValue,
    this.purchaseOrderTotal,
    this.reactivated,
  });

  static ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverview?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverview(
      cancelled:
          ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewCancelled
              .fromMap(source['cancelled']),
      changed:
          ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewChanged
              .fromMap(source['changed']),
      date: readText(source['date']),
      deleted:
          ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewDeleted
              .fromMap(source['deleted']),
      netPurchases:
          ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewNetPurchases
              .fromMap(source['net_purchases']),
      newValue:
          ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewNew
              .fromMap(source['new']),
      purchaseOrderTotal: readText(source['purchase_order_total']),
      reactivated:
          ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewReactivated
              .fromMap(source['reactivated']),
    );
  }

  final ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewCancelled?
      cancelled;

  final ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewChanged?
      changed;

  final String? date;

  final ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewDeleted?
      deleted;

  final ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewNetPurchases?
      netPurchases;

  final ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewNew?
      newValue;

  final String? purchaseOrderTotal;

  final ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewReactivated?
      reactivated;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'cancelled': cancelled,
        'changed': changed,
        'date': date,
        'deleted': deleted,
        'net_purchases': netPurchases,
        'new': newValue,
        'purchase_order_total': purchaseOrderTotal,
        'reactivated': reactivated,
      };
}

/// One entry of a [ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverview]'s `purchase_payments`.
class ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePayment
    extends Dto {
  const ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePayment({
    this.date,
    this.deleted,
    this.newValue,
    this.purchasePaymentApplied,
  });

  static ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePayment?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePayment(
      date: readText(source['date']),
      deleted:
          ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePaymentDeleted
              .fromMap(source['deleted']),
      newValue:
          ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePaymentNew
              .fromMap(source['new']),
      purchasePaymentApplied: readText(source['purchase_payment_applied']),
    );
  }

  final String? date;

  final ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePaymentDeleted?
      deleted;

  final ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePaymentNew?
      newValue;

  final String? purchasePaymentApplied;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'date': date,
        'deleted': deleted,
        'new': newValue,
        'purchase_payment_applied': purchasePaymentApplied,
      };
}

/// One entry of a [ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverview]'s `purchase_refunds`.
class ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefund
    extends Dto {
  const ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefund({
    this.date,
    this.deleted,
    this.newValue,
  });

  static ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefund?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefund(
      date: readText(source['date']),
      deleted:
          ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefundDeleted
              .fromMap(source['deleted']),
      newValue:
          ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefundNew
              .fromMap(source['new']),
    );
  }

  final String? date;

  final ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefundDeleted?
      deleted;

  final ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefundNew?
      newValue;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'date': date,
        'deleted': deleted,
        'new': newValue,
      };
}

/// One entry of a [ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverview]'s `payments`.
class ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPayment
    extends Dto {
  const ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPayment({
    this.date,
    this.deleted,
    this.newValue,
    this.paymentApplied,
  });

  static ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPayment?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPayment(
      date: readText(source['date']),
      deleted:
          ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPaymentDeleted
              .fromMap(source['deleted']),
      newValue:
          ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPaymentNew
              .fromMap(source['new']),
      paymentApplied: readText(source['payment_applied']),
    );
  }

  final String? date;

  final ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPaymentDeleted?
      deleted;

  final ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPaymentNew?
      newValue;

  final String? paymentApplied;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'date': date,
        'deleted': deleted,
        'new': newValue,
        'payment_applied': paymentApplied,
      };
}

/// One entry of a [ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverview]'s `refunds`.
class ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefund
    extends Dto {
  const ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefund({
    this.date,
    this.deleted,
    this.newValue,
  });

  static ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefund?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefund(
      date: readText(source['date']),
      deleted:
          ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefundDeleted
              .fromMap(source['deleted']),
      newValue:
          ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefundNew
              .fromMap(source['new']),
    );
  }

  final String? date;

  final ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefundDeleted?
      deleted;

  final ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefundNew?
      newValue;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'date': date,
        'deleted': deleted,
        'new': newValue,
      };
}

/// A [ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverview]'s `new`.
class ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewNew extends Dto {
  const ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewNew({
    this.amount,
    this.count,
  });

  static ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewNew? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewNew(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverview]'s `cancelled`.
class ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewCancelled
    extends Dto {
  const ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewCancelled({
    this.amount,
    this.count,
  });

  static ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewCancelled?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewCancelled(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverview]'s `reactivated`.
class ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewReactivated
    extends Dto {
  const ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewReactivated({
    this.amount,
    this.count,
  });

  static ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewReactivated?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewReactivated(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverview]'s `voided`.
class ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewVoided extends Dto {
  const ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewVoided({
    this.amount,
    this.count,
  });

  static ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewVoided? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewVoided(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverview]'s `amended`.
class ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewAmended extends Dto {
  const ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewAmended({
    this.amount,
    this.count,
  });

  static ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewAmended? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewAmended(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverview]'s `net_gain`.
class ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewNetGain extends Dto {
  const ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewNetGain({
    this.amount,
    this.count,
  });

  static ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewNetGain? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsInvoicesInvoiceOverviewInvoicesInvoiceOverviewNetGain(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsOrdersOrderOverviewOrdersOrderOverview]'s `new`.
class ReportsOrdersOrderOverviewOrdersOrderOverviewNew extends Dto {
  const ReportsOrdersOrderOverviewOrdersOrderOverviewNew({
    this.amount,
    this.count,
  });

  static ReportsOrdersOrderOverviewOrdersOrderOverviewNew? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsOrdersOrderOverviewOrdersOrderOverviewNew(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsOrdersOrderOverviewOrdersOrderOverview]'s `cancelled`.
class ReportsOrdersOrderOverviewOrdersOrderOverviewCancelled extends Dto {
  const ReportsOrdersOrderOverviewOrdersOrderOverviewCancelled({
    this.amount,
    this.count,
  });

  static ReportsOrdersOrderOverviewOrdersOrderOverviewCancelled? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsOrdersOrderOverviewOrdersOrderOverviewCancelled(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsOrdersOrderOverviewOrdersOrderOverview]'s `reactivated`.
class ReportsOrdersOrderOverviewOrdersOrderOverviewReactivated extends Dto {
  const ReportsOrdersOrderOverviewOrdersOrderOverviewReactivated({
    this.amount,
    this.count,
  });

  static ReportsOrdersOrderOverviewOrdersOrderOverviewReactivated? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsOrdersOrderOverviewOrdersOrderOverviewReactivated(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsOrdersOrderOverviewOrdersOrderOverview]'s `changed`.
class ReportsOrdersOrderOverviewOrdersOrderOverviewChanged extends Dto {
  const ReportsOrdersOrderOverviewOrdersOrderOverviewChanged({
    this.amount,
    this.count,
  });

  static ReportsOrdersOrderOverviewOrdersOrderOverviewChanged? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsOrdersOrderOverviewOrdersOrderOverviewChanged(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsOrdersOrderOverviewOrdersOrderOverview]'s `deleted`.
class ReportsOrdersOrderOverviewOrdersOrderOverviewDeleted extends Dto {
  const ReportsOrdersOrderOverviewOrdersOrderOverviewDeleted({
    this.amount,
    this.count,
  });

  static ReportsOrdersOrderOverviewOrdersOrderOverviewDeleted? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsOrdersOrderOverviewOrdersOrderOverviewDeleted(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsOrdersOrderOverviewOrdersOrderOverview]'s `net_gain`.
class ReportsOrdersOrderOverviewOrdersOrderOverviewNetGain extends Dto {
  const ReportsOrdersOrderOverviewOrdersOrderOverviewNetGain({
    this.amount,
    this.count,
  });

  static ReportsOrdersOrderOverviewOrdersOrderOverviewNetGain? fromMap(
      Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsOrdersOrderOverviewOrdersOrderOverviewNetGain(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverview]'s `new`.
class ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewNew
    extends Dto {
  const ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewNew({
    this.amount,
    this.count,
  });

  static ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewNew?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewNew(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverview]'s `cancelled`.
class ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewCancelled
    extends Dto {
  const ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewCancelled({
    this.amount,
    this.count,
  });

  static ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewCancelled?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewCancelled(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverview]'s `reactivated`.
class ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewReactivated
    extends Dto {
  const ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewReactivated({
    this.amount,
    this.count,
  });

  static ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewReactivated?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewReactivated(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverview]'s `voided`.
class ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewVoided
    extends Dto {
  const ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewVoided({
    this.amount,
    this.count,
  });

  static ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewVoided?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewVoided(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverview]'s `amended`.
class ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewAmended
    extends Dto {
  const ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewAmended({
    this.amount,
    this.count,
  });

  static ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewAmended?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewAmended(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverview]'s `net_gain`.
class ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewNetGain
    extends Dto {
  const ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewNetGain({
    this.amount,
    this.count,
  });

  static ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewNetGain?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseInvoicesPurchaseInvoiceOverviewPurchaseInvoicesPurchaseInvoiceOverviewNetGain(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverview]'s `new`.
class ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewNew
    extends Dto {
  const ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewNew({
    this.amount,
    this.count,
  });

  static ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewNew?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewNew(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverview]'s `cancelled`.
class ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewCancelled
    extends Dto {
  const ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewCancelled({
    this.amount,
    this.count,
  });

  static ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewCancelled?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewCancelled(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverview]'s `reactivated`.
class ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewReactivated
    extends Dto {
  const ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewReactivated({
    this.amount,
    this.count,
  });

  static ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewReactivated?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewReactivated(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverview]'s `changed`.
class ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewChanged
    extends Dto {
  const ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewChanged({
    this.amount,
    this.count,
  });

  static ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewChanged?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewChanged(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverview]'s `deleted`.
class ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewDeleted
    extends Dto {
  const ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewDeleted({
    this.amount,
    this.count,
  });

  static ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewDeleted?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewDeleted(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverview]'s `net_purchases`.
class ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewNetPurchases
    extends Dto {
  const ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewNetPurchases({
    this.amount,
    this.count,
  });

  static ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewNetPurchases?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseOrdersPurchaseOrderOverviewPurchaseOrdersPurchaseOrderOverviewNetPurchases(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePayment]'s `new`.
class ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePaymentNew
    extends Dto {
  const ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePaymentNew({
    this.amount,
    this.count,
  });

  static ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePaymentNew?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePaymentNew(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePayment]'s `deleted`.
class ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePaymentDeleted
    extends Dto {
  const ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePaymentDeleted({
    this.amount,
    this.count,
  });

  static ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePaymentDeleted?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchasePaymentDeleted(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefund]'s `new`.
class ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefundNew
    extends Dto {
  const ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefundNew({
    this.amount,
    this.count,
  });

  static ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefundNew?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefundNew(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefund]'s `deleted`.
class ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefundDeleted
    extends Dto {
  const ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefundDeleted({
    this.amount,
    this.count,
  });

  static ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefundDeleted?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsPurchaseTransactionsPurchasePaymentAndRefundOverviewPurchasePaymentAndRefundOverviewPurchaseRefundDeleted(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPayment]'s `new`.
class ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPaymentNew
    extends Dto {
  const ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPaymentNew({
    this.amount,
    this.count,
  });

  static ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPaymentNew?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPaymentNew(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPayment]'s `deleted`.
class ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPaymentDeleted
    extends Dto {
  const ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPaymentDeleted({
    this.amount,
    this.count,
  });

  static ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPaymentDeleted?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewPaymentDeleted(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefund]'s `new`.
class ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefundNew
    extends Dto {
  const ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefundNew({
    this.amount,
    this.count,
  });

  static ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefundNew?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefundNew(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}

/// A [ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefund]'s `deleted`.
class ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefundDeleted
    extends Dto {
  const ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefundDeleted({
    this.amount,
    this.count,
  });

  static ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefundDeleted?
      fromMap(Object? body) {
    final source = readRecord(body);
    if (source == null) return null;
    return ReportsTransactionsPaymentAndRefundOverviewPaymentAndRefundOverviewRefundDeleted(
      amount: readText(source['amount']),
      count: readText(source['count']),
    );
  }

  final String? amount;

  final String? count;

  @override
  Map<String, Object?> get fields => <String, Object?>{
        'amount': amount,
        'count': count,
      };
}
