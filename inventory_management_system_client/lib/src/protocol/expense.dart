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

abstract class Expense implements _i1.SerializableModel {
  Expense._({
    this.id,
    required this.expenseNumber,
    required this.category,
    required this.amount,
    this.description,
    required this.date,
    required this.paymentMethod,
    required this.status,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Expense({
    int? id,
    required String expenseNumber,
    required String category,
    required double amount,
    String? description,
    required DateTime date,
    required String paymentMethod,
    required String status,
    required int userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ExpenseImpl;

  factory Expense.fromJson(Map<String, dynamic> jsonSerialization) {
    return Expense(
      id: jsonSerialization['id'] as int?,
      expenseNumber: jsonSerialization['expenseNumber'] as String,
      category: jsonSerialization['category'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      description: jsonSerialization['description'] as String?,
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      paymentMethod: jsonSerialization['paymentMethod'] as String,
      status: jsonSerialization['status'] as String,
      userId: jsonSerialization['userId'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String expenseNumber;

  String category;

  double amount;

  String? description;

  DateTime date;

  String paymentMethod;

  String status;

  int userId;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Expense]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Expense copyWith({
    int? id,
    String? expenseNumber,
    String? category,
    double? amount,
    String? description,
    DateTime? date,
    String? paymentMethod,
    String? status,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'expenseNumber': expenseNumber,
      'category': category,
      'amount': amount,
      if (description != null) 'description': description,
      'date': date.toJson(),
      'paymentMethod': paymentMethod,
      'status': status,
      'userId': userId,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ExpenseImpl extends Expense {
  _ExpenseImpl({
    int? id,
    required String expenseNumber,
    required String category,
    required double amount,
    String? description,
    required DateTime date,
    required String paymentMethod,
    required String status,
    required int userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          expenseNumber: expenseNumber,
          category: category,
          amount: amount,
          description: description,
          date: date,
          paymentMethod: paymentMethod,
          status: status,
          userId: userId,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Expense]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Expense copyWith({
    Object? id = _Undefined,
    String? expenseNumber,
    String? category,
    double? amount,
    Object? description = _Undefined,
    DateTime? date,
    String? paymentMethod,
    String? status,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Expense(
      id: id is int? ? id : this.id,
      expenseNumber: expenseNumber ?? this.expenseNumber,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      description: description is String? ? description : this.description,
      date: date ?? this.date,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
