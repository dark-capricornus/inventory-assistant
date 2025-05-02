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

abstract class DailySales implements _i1.SerializableModel {
  DailySales._({
    required this.date,
    required this.totalSales,
    required this.totalQuantity,
    required this.numberOfOrders,
  });

  factory DailySales({
    required DateTime date,
    required double totalSales,
    required int totalQuantity,
    required int numberOfOrders,
  }) = _DailySalesImpl;

  factory DailySales.fromJson(Map<String, dynamic> jsonSerialization) {
    return DailySales(
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      totalSales: (jsonSerialization['totalSales'] as num).toDouble(),
      totalQuantity: jsonSerialization['totalQuantity'] as int,
      numberOfOrders: jsonSerialization['numberOfOrders'] as int,
    );
  }

  DateTime date;

  double totalSales;

  int totalQuantity;

  int numberOfOrders;

  /// Returns a shallow copy of this [DailySales]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DailySales copyWith({
    DateTime? date,
    double? totalSales,
    int? totalQuantity,
    int? numberOfOrders,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'date': date.toJson(),
      'totalSales': totalSales,
      'totalQuantity': totalQuantity,
      'numberOfOrders': numberOfOrders,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DailySalesImpl extends DailySales {
  _DailySalesImpl({
    required DateTime date,
    required double totalSales,
    required int totalQuantity,
    required int numberOfOrders,
  }) : super._(
          date: date,
          totalSales: totalSales,
          totalQuantity: totalQuantity,
          numberOfOrders: numberOfOrders,
        );

  /// Returns a shallow copy of this [DailySales]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DailySales copyWith({
    DateTime? date,
    double? totalSales,
    int? totalQuantity,
    int? numberOfOrders,
  }) {
    return DailySales(
      date: date ?? this.date,
      totalSales: totalSales ?? this.totalSales,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      numberOfOrders: numberOfOrders ?? this.numberOfOrders,
    );
  }
}
