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

abstract class ExpenseDataPoint implements _i1.SerializableModel {
  ExpenseDataPoint._({
    required this.date,
    required this.amount,
  });

  factory ExpenseDataPoint({
    required DateTime date,
    required double amount,
  }) = _ExpenseDataPointImpl;

  factory ExpenseDataPoint.fromJson(Map<String, dynamic> jsonSerialization) {
    return ExpenseDataPoint(
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      amount: (jsonSerialization['amount'] as num).toDouble(),
    );
  }

  DateTime date;

  double amount;

  /// Returns a shallow copy of this [ExpenseDataPoint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ExpenseDataPoint copyWith({
    DateTime? date,
    double? amount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'date': date.toJson(),
      'amount': amount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ExpenseDataPointImpl extends ExpenseDataPoint {
  _ExpenseDataPointImpl({
    required DateTime date,
    required double amount,
  }) : super._(
          date: date,
          amount: amount,
        );

  /// Returns a shallow copy of this [ExpenseDataPoint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ExpenseDataPoint copyWith({
    DateTime? date,
    double? amount,
  }) {
    return ExpenseDataPoint(
      date: date ?? this.date,
      amount: amount ?? this.amount,
    );
  }
}
