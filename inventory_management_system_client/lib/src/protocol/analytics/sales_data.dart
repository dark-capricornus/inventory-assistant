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

abstract class SalesData implements _i1.SerializableModel {
  SalesData._({
    required this.date,
    required this.sales,
    required this.revenue,
    required this.orders,
  });

  factory SalesData({
    required DateTime date,
    required double sales,
    required double revenue,
    required int orders,
  }) = _SalesDataImpl;

  factory SalesData.fromJson(Map<String, dynamic> jsonSerialization) {
    return SalesData(
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      sales: (jsonSerialization['sales'] as num).toDouble(),
      revenue: (jsonSerialization['revenue'] as num).toDouble(),
      orders: jsonSerialization['orders'] as int,
    );
  }

  DateTime date;

  double sales;

  double revenue;

  int orders;

  /// Returns a shallow copy of this [SalesData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesData copyWith({
    DateTime? date,
    double? sales,
    double? revenue,
    int? orders,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'date': date.toJson(),
      'sales': sales,
      'revenue': revenue,
      'orders': orders,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SalesDataImpl extends SalesData {
  _SalesDataImpl({
    required DateTime date,
    required double sales,
    required double revenue,
    required int orders,
  }) : super._(
          date: date,
          sales: sales,
          revenue: revenue,
          orders: orders,
        );

  /// Returns a shallow copy of this [SalesData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesData copyWith({
    DateTime? date,
    double? sales,
    double? revenue,
    int? orders,
  }) {
    return SalesData(
      date: date ?? this.date,
      sales: sales ?? this.sales,
      revenue: revenue ?? this.revenue,
      orders: orders ?? this.orders,
    );
  }
}
