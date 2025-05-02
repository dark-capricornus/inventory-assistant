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
import '../analytics/top_product.dart' as _i2;
import '../analytics/category_breakdown.dart' as _i3;

abstract class SalesTrend implements _i1.SerializableModel {
  SalesTrend._({
    required this.period,
    required this.totalSales,
    required this.totalQuantity,
    required this.averageOrderValue,
    required this.growthRate,
    required this.topProducts,
    required this.categoryBreakdown,
  });

  factory SalesTrend({
    required String period,
    required double totalSales,
    required int totalQuantity,
    required double averageOrderValue,
    required double growthRate,
    required List<_i2.TopProduct> topProducts,
    required List<_i3.CategoryBreakdown> categoryBreakdown,
  }) = _SalesTrendImpl;

  factory SalesTrend.fromJson(Map<String, dynamic> jsonSerialization) {
    return SalesTrend(
      period: jsonSerialization['period'] as String,
      totalSales: (jsonSerialization['totalSales'] as num).toDouble(),
      totalQuantity: jsonSerialization['totalQuantity'] as int,
      averageOrderValue:
          (jsonSerialization['averageOrderValue'] as num).toDouble(),
      growthRate: (jsonSerialization['growthRate'] as num).toDouble(),
      topProducts: (jsonSerialization['topProducts'] as List)
          .map((e) => _i2.TopProduct.fromJson((e as Map<String, dynamic>)))
          .toList(),
      categoryBreakdown: (jsonSerialization['categoryBreakdown'] as List)
          .map((e) =>
              _i3.CategoryBreakdown.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  String period;

  double totalSales;

  int totalQuantity;

  double averageOrderValue;

  double growthRate;

  List<_i2.TopProduct> topProducts;

  List<_i3.CategoryBreakdown> categoryBreakdown;

  /// Returns a shallow copy of this [SalesTrend]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesTrend copyWith({
    String? period,
    double? totalSales,
    int? totalQuantity,
    double? averageOrderValue,
    double? growthRate,
    List<_i2.TopProduct>? topProducts,
    List<_i3.CategoryBreakdown>? categoryBreakdown,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'period': period,
      'totalSales': totalSales,
      'totalQuantity': totalQuantity,
      'averageOrderValue': averageOrderValue,
      'growthRate': growthRate,
      'topProducts': topProducts.toJson(valueToJson: (v) => v.toJson()),
      'categoryBreakdown':
          categoryBreakdown.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SalesTrendImpl extends SalesTrend {
  _SalesTrendImpl({
    required String period,
    required double totalSales,
    required int totalQuantity,
    required double averageOrderValue,
    required double growthRate,
    required List<_i2.TopProduct> topProducts,
    required List<_i3.CategoryBreakdown> categoryBreakdown,
  }) : super._(
          period: period,
          totalSales: totalSales,
          totalQuantity: totalQuantity,
          averageOrderValue: averageOrderValue,
          growthRate: growthRate,
          topProducts: topProducts,
          categoryBreakdown: categoryBreakdown,
        );

  /// Returns a shallow copy of this [SalesTrend]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesTrend copyWith({
    String? period,
    double? totalSales,
    int? totalQuantity,
    double? averageOrderValue,
    double? growthRate,
    List<_i2.TopProduct>? topProducts,
    List<_i3.CategoryBreakdown>? categoryBreakdown,
  }) {
    return SalesTrend(
      period: period ?? this.period,
      totalSales: totalSales ?? this.totalSales,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      averageOrderValue: averageOrderValue ?? this.averageOrderValue,
      growthRate: growthRate ?? this.growthRate,
      topProducts:
          topProducts ?? this.topProducts.map((e0) => e0.copyWith()).toList(),
      categoryBreakdown: categoryBreakdown ??
          this.categoryBreakdown.map((e0) => e0.copyWith()).toList(),
    );
  }
}
