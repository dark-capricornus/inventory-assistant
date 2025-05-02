/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../analytics/sales_data.dart' as _i2;
import '../analytics/top_product.dart' as _i3;
import '../analytics/daily_sales.dart' as _i4;

abstract class SalesAnalytics implements _i1.SerializableModel {
  SalesAnalytics._({
    required this.totalSales,
    required this.totalRevenue,
    required this.averageOrderValue,
    required this.numberOfOrders,
    required this.salesData,
    required this.topProducts,
    required this.salesTrend,
    required this.paymentMethodBreakdown,
  });

  factory SalesAnalytics({
    required double totalSales,
    required double totalRevenue,
    required double averageOrderValue,
    required int numberOfOrders,
    required List<_i2.SalesData> salesData,
    required List<_i3.TopProduct> topProducts,
    required List<_i4.DailySales> salesTrend,
    required Map<String, double> paymentMethodBreakdown,
  }) = _SalesAnalyticsImpl;

  factory SalesAnalytics.fromJson(Map<String, dynamic> jsonSerialization) {
    return SalesAnalytics(
      totalSales: (jsonSerialization['totalSales'] as num).toDouble(),
      totalRevenue: (jsonSerialization['totalRevenue'] as num).toDouble(),
      averageOrderValue:
          (jsonSerialization['averageOrderValue'] as num).toDouble(),
      numberOfOrders: jsonSerialization['numberOfOrders'] as int,
      salesData: (jsonSerialization['salesData'] as List)
          .map((e) => _i2.SalesData.fromJson((e as Map<String, dynamic>)))
          .toList(),
      topProducts: (jsonSerialization['topProducts'] as List)
          .map((e) => _i3.TopProduct.fromJson((e as Map<String, dynamic>)))
          .toList(),
      salesTrend: (jsonSerialization['salesTrend'] as List)
          .map((e) => _i4.DailySales.fromJson((e as Map<String, dynamic>)))
          .toList(),
      paymentMethodBreakdown:
          (jsonSerialization['paymentMethodBreakdown'] as Map)
              .map((k, v) => MapEntry(
                    k as String,
                    (v as num).toDouble(),
                  )),
    );
  }

  double totalSales;

  double totalRevenue;

  double averageOrderValue;

  int numberOfOrders;

  List<_i2.SalesData> salesData;

  List<_i3.TopProduct> topProducts;

  List<_i4.DailySales> salesTrend;

  Map<String, double> paymentMethodBreakdown;

  /// Returns a shallow copy of this [SalesAnalytics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesAnalytics copyWith({
    double? totalSales,
    double? totalRevenue,
    double? averageOrderValue,
    int? numberOfOrders,
    List<_i2.SalesData>? salesData,
    List<_i3.TopProduct>? topProducts,
    List<_i4.DailySales>? salesTrend,
    Map<String, double>? paymentMethodBreakdown,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'totalSales': totalSales,
      'totalRevenue': totalRevenue,
      'averageOrderValue': averageOrderValue,
      'numberOfOrders': numberOfOrders,
      'salesData': salesData.toJson(valueToJson: (v) => v.toJson()),
      'topProducts': topProducts.toJson(valueToJson: (v) => v.toJson()),
      'salesTrend': salesTrend.toJson(valueToJson: (v) => v.toJson()),
      'paymentMethodBreakdown': paymentMethodBreakdown.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SalesAnalyticsImpl extends SalesAnalytics {
  _SalesAnalyticsImpl({
    required double totalSales,
    required double totalRevenue,
    required double averageOrderValue,
    required int numberOfOrders,
    required List<_i2.SalesData> salesData,
    required List<_i3.TopProduct> topProducts,
    required List<_i4.DailySales> salesTrend,
    required Map<String, double> paymentMethodBreakdown,
  }) : super._(
          totalSales: totalSales,
          totalRevenue: totalRevenue,
          averageOrderValue: averageOrderValue,
          numberOfOrders: numberOfOrders,
          salesData: salesData,
          topProducts: topProducts,
          salesTrend: salesTrend,
          paymentMethodBreakdown: paymentMethodBreakdown,
        );

  /// Returns a shallow copy of this [SalesAnalytics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesAnalytics copyWith({
    double? totalSales,
    double? totalRevenue,
    double? averageOrderValue,
    int? numberOfOrders,
    List<_i2.SalesData>? salesData,
    List<_i3.TopProduct>? topProducts,
    List<_i4.DailySales>? salesTrend,
    Map<String, double>? paymentMethodBreakdown,
  }) {
    return SalesAnalytics(
      totalSales: totalSales ?? this.totalSales,
      totalRevenue: totalRevenue ?? this.totalRevenue,
      averageOrderValue: averageOrderValue ?? this.averageOrderValue,
      numberOfOrders: numberOfOrders ?? this.numberOfOrders,
      salesData:
          salesData ?? this.salesData.map((e0) => e0.copyWith()).toList(),
      topProducts:
          topProducts ?? this.topProducts.map((e0) => e0.copyWith()).toList(),
      salesTrend:
          salesTrend ?? this.salesTrend.map((e0) => e0.copyWith()).toList(),
      paymentMethodBreakdown: paymentMethodBreakdown ??
          this.paymentMethodBreakdown.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
    );
  }
}
