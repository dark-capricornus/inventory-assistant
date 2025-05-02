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
import '../analytics/expense_data_point.dart' as _i2;
import '../analytics/expense_category.dart' as _i3;

abstract class ExpenseAnalytics implements _i1.SerializableModel {
  ExpenseAnalytics._({
    required this.totalExpenses,
    required this.avgMonthlyExpense,
    required this.growthRate,
    required this.expenseRatio,
    required this.trendData,
    required this.topCategories,
  });

  factory ExpenseAnalytics({
    required double totalExpenses,
    required double avgMonthlyExpense,
    required double growthRate,
    required double expenseRatio,
    required List<_i2.ExpenseDataPoint> trendData,
    required List<_i3.ExpenseCategory> topCategories,
  }) = _ExpenseAnalyticsImpl;

  factory ExpenseAnalytics.fromJson(Map<String, dynamic> jsonSerialization) {
    return ExpenseAnalytics(
      totalExpenses: (jsonSerialization['totalExpenses'] as num).toDouble(),
      avgMonthlyExpense:
          (jsonSerialization['avgMonthlyExpense'] as num).toDouble(),
      growthRate: (jsonSerialization['growthRate'] as num).toDouble(),
      expenseRatio: (jsonSerialization['expenseRatio'] as num).toDouble(),
      trendData: (jsonSerialization['trendData'] as List)
          .map(
              (e) => _i2.ExpenseDataPoint.fromJson((e as Map<String, dynamic>)))
          .toList(),
      topCategories: (jsonSerialization['topCategories'] as List)
          .map((e) => _i3.ExpenseCategory.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  double totalExpenses;

  double avgMonthlyExpense;

  double growthRate;

  double expenseRatio;

  List<_i2.ExpenseDataPoint> trendData;

  List<_i3.ExpenseCategory> topCategories;

  /// Returns a shallow copy of this [ExpenseAnalytics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ExpenseAnalytics copyWith({
    double? totalExpenses,
    double? avgMonthlyExpense,
    double? growthRate,
    double? expenseRatio,
    List<_i2.ExpenseDataPoint>? trendData,
    List<_i3.ExpenseCategory>? topCategories,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'totalExpenses': totalExpenses,
      'avgMonthlyExpense': avgMonthlyExpense,
      'growthRate': growthRate,
      'expenseRatio': expenseRatio,
      'trendData': trendData.toJson(valueToJson: (v) => v.toJson()),
      'topCategories': topCategories.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ExpenseAnalyticsImpl extends ExpenseAnalytics {
  _ExpenseAnalyticsImpl({
    required double totalExpenses,
    required double avgMonthlyExpense,
    required double growthRate,
    required double expenseRatio,
    required List<_i2.ExpenseDataPoint> trendData,
    required List<_i3.ExpenseCategory> topCategories,
  }) : super._(
          totalExpenses: totalExpenses,
          avgMonthlyExpense: avgMonthlyExpense,
          growthRate: growthRate,
          expenseRatio: expenseRatio,
          trendData: trendData,
          topCategories: topCategories,
        );

  /// Returns a shallow copy of this [ExpenseAnalytics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ExpenseAnalytics copyWith({
    double? totalExpenses,
    double? avgMonthlyExpense,
    double? growthRate,
    double? expenseRatio,
    List<_i2.ExpenseDataPoint>? trendData,
    List<_i3.ExpenseCategory>? topCategories,
  }) {
    return ExpenseAnalytics(
      totalExpenses: totalExpenses ?? this.totalExpenses,
      avgMonthlyExpense: avgMonthlyExpense ?? this.avgMonthlyExpense,
      growthRate: growthRate ?? this.growthRate,
      expenseRatio: expenseRatio ?? this.expenseRatio,
      trendData:
          trendData ?? this.trendData.map((e0) => e0.copyWith()).toList(),
      topCategories: topCategories ??
          this.topCategories.map((e0) => e0.copyWith()).toList(),
    );
  }
}
