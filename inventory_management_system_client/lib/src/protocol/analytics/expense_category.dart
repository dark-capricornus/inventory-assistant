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

abstract class ExpenseCategory implements _i1.SerializableModel {
  ExpenseCategory._({
    required this.name,
    required this.amount,
    required this.percentage,
  });

  factory ExpenseCategory({
    required String name,
    required double amount,
    required double percentage,
  }) = _ExpenseCategoryImpl;

  factory ExpenseCategory.fromJson(Map<String, dynamic> jsonSerialization) {
    return ExpenseCategory(
      name: jsonSerialization['name'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      percentage: (jsonSerialization['percentage'] as num).toDouble(),
    );
  }

  String name;

  double amount;

  double percentage;

  /// Returns a shallow copy of this [ExpenseCategory]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ExpenseCategory copyWith({
    String? name,
    double? amount,
    double? percentage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'percentage': percentage,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ExpenseCategoryImpl extends ExpenseCategory {
  _ExpenseCategoryImpl({
    required String name,
    required double amount,
    required double percentage,
  }) : super._(
          name: name,
          amount: amount,
          percentage: percentage,
        );

  /// Returns a shallow copy of this [ExpenseCategory]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ExpenseCategory copyWith({
    String? name,
    double? amount,
    double? percentage,
  }) {
    return ExpenseCategory(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      percentage: percentage ?? this.percentage,
    );
  }
}
