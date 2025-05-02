/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Expense
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = ExpenseTable();

  static const db = ExpenseRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static ExpenseInclude include() {
    return ExpenseInclude._();
  }

  static ExpenseIncludeList includeList({
    _i1.WhereExpressionBuilder<ExpenseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ExpenseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExpenseTable>? orderByList,
    ExpenseInclude? include,
  }) {
    return ExpenseIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Expense.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Expense.t),
      include: include,
    );
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

class ExpenseTable extends _i1.Table<int?> {
  ExpenseTable({super.tableRelation}) : super(tableName: 'expenses') {
    expenseNumber = _i1.ColumnString(
      'expenseNumber',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    amount = _i1.ColumnDouble(
      'amount',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    paymentMethod = _i1.ColumnString(
      'paymentMethod',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final _i1.ColumnString expenseNumber;

  late final _i1.ColumnString category;

  late final _i1.ColumnDouble amount;

  late final _i1.ColumnString description;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnString paymentMethod;

  late final _i1.ColumnString status;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        expenseNumber,
        category,
        amount,
        description,
        date,
        paymentMethod,
        status,
        userId,
        createdAt,
        updatedAt,
      ];
}

class ExpenseInclude extends _i1.IncludeObject {
  ExpenseInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Expense.t;
}

class ExpenseIncludeList extends _i1.IncludeList {
  ExpenseIncludeList._({
    _i1.WhereExpressionBuilder<ExpenseTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Expense.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Expense.t;
}

class ExpenseRepository {
  const ExpenseRepository._();

  /// Returns a list of [Expense]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Expense>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExpenseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ExpenseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExpenseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Expense>(
      where: where?.call(Expense.t),
      orderBy: orderBy?.call(Expense.t),
      orderByList: orderByList?.call(Expense.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Expense] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Expense?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExpenseTable>? where,
    int? offset,
    _i1.OrderByBuilder<ExpenseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExpenseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Expense>(
      where: where?.call(Expense.t),
      orderBy: orderBy?.call(Expense.t),
      orderByList: orderByList?.call(Expense.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Expense] by its [id] or null if no such row exists.
  Future<Expense?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Expense>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Expense]s in the list and returns the inserted rows.
  ///
  /// The returned [Expense]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Expense>> insert(
    _i1.Session session,
    List<Expense> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Expense>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Expense] and returns the inserted row.
  ///
  /// The returned [Expense] will have its `id` field set.
  Future<Expense> insertRow(
    _i1.Session session,
    Expense row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Expense>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Expense]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Expense>> update(
    _i1.Session session,
    List<Expense> rows, {
    _i1.ColumnSelections<ExpenseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Expense>(
      rows,
      columns: columns?.call(Expense.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Expense]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Expense> updateRow(
    _i1.Session session,
    Expense row, {
    _i1.ColumnSelections<ExpenseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Expense>(
      row,
      columns: columns?.call(Expense.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Expense]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Expense>> delete(
    _i1.Session session,
    List<Expense> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Expense>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Expense].
  Future<Expense> deleteRow(
    _i1.Session session,
    Expense row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Expense>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Expense>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ExpenseTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Expense>(
      where: where(Expense.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExpenseTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Expense>(
      where: where?.call(Expense.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
