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

abstract class Sale implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Sale._({
    this.id,
    required this.invoiceNumber,
    required this.saleDate,
    required this.partyId,
    required this.totalAmount,
    this.discountAmount,
    required this.taxAmount,
    required this.netAmount,
    required this.paidAmount,
    required this.balanceAmount,
    required this.saleType,
    required this.status,
    required this.userId,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Sale({
    int? id,
    required String invoiceNumber,
    required DateTime saleDate,
    required int partyId,
    required double totalAmount,
    double? discountAmount,
    required double taxAmount,
    required double netAmount,
    required double paidAmount,
    required double balanceAmount,
    required String saleType,
    required String status,
    required int userId,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SaleImpl;

  factory Sale.fromJson(Map<String, dynamic> jsonSerialization) {
    return Sale(
      id: jsonSerialization['id'] as int?,
      invoiceNumber: jsonSerialization['invoiceNumber'] as String,
      saleDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['saleDate']),
      partyId: jsonSerialization['partyId'] as int,
      totalAmount: (jsonSerialization['totalAmount'] as num).toDouble(),
      discountAmount: (jsonSerialization['discountAmount'] as num?)?.toDouble(),
      taxAmount: (jsonSerialization['taxAmount'] as num).toDouble(),
      netAmount: (jsonSerialization['netAmount'] as num).toDouble(),
      paidAmount: (jsonSerialization['paidAmount'] as num).toDouble(),
      balanceAmount: (jsonSerialization['balanceAmount'] as num).toDouble(),
      saleType: jsonSerialization['saleType'] as String,
      status: jsonSerialization['status'] as String,
      userId: jsonSerialization['userId'] as int,
      notes: jsonSerialization['notes'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = SaleTable();

  static const db = SaleRepository._();

  @override
  int? id;

  String invoiceNumber;

  DateTime saleDate;

  int partyId;

  double totalAmount;

  double? discountAmount;

  double taxAmount;

  double netAmount;

  double paidAmount;

  double balanceAmount;

  String saleType;

  String status;

  int userId;

  String? notes;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Sale]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Sale copyWith({
    int? id,
    String? invoiceNumber,
    DateTime? saleDate,
    int? partyId,
    double? totalAmount,
    double? discountAmount,
    double? taxAmount,
    double? netAmount,
    double? paidAmount,
    double? balanceAmount,
    String? saleType,
    String? status,
    int? userId,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'invoiceNumber': invoiceNumber,
      'saleDate': saleDate.toJson(),
      'partyId': partyId,
      'totalAmount': totalAmount,
      if (discountAmount != null) 'discountAmount': discountAmount,
      'taxAmount': taxAmount,
      'netAmount': netAmount,
      'paidAmount': paidAmount,
      'balanceAmount': balanceAmount,
      'saleType': saleType,
      'status': status,
      'userId': userId,
      if (notes != null) 'notes': notes,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'invoiceNumber': invoiceNumber,
      'saleDate': saleDate.toJson(),
      'partyId': partyId,
      'totalAmount': totalAmount,
      if (discountAmount != null) 'discountAmount': discountAmount,
      'taxAmount': taxAmount,
      'netAmount': netAmount,
      'paidAmount': paidAmount,
      'balanceAmount': balanceAmount,
      'saleType': saleType,
      'status': status,
      'userId': userId,
      if (notes != null) 'notes': notes,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static SaleInclude include() {
    return SaleInclude._();
  }

  static SaleIncludeList includeList({
    _i1.WhereExpressionBuilder<SaleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SaleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SaleTable>? orderByList,
    SaleInclude? include,
  }) {
    return SaleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Sale.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Sale.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SaleImpl extends Sale {
  _SaleImpl({
    int? id,
    required String invoiceNumber,
    required DateTime saleDate,
    required int partyId,
    required double totalAmount,
    double? discountAmount,
    required double taxAmount,
    required double netAmount,
    required double paidAmount,
    required double balanceAmount,
    required String saleType,
    required String status,
    required int userId,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          invoiceNumber: invoiceNumber,
          saleDate: saleDate,
          partyId: partyId,
          totalAmount: totalAmount,
          discountAmount: discountAmount,
          taxAmount: taxAmount,
          netAmount: netAmount,
          paidAmount: paidAmount,
          balanceAmount: balanceAmount,
          saleType: saleType,
          status: status,
          userId: userId,
          notes: notes,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Sale]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Sale copyWith({
    Object? id = _Undefined,
    String? invoiceNumber,
    DateTime? saleDate,
    int? partyId,
    double? totalAmount,
    Object? discountAmount = _Undefined,
    double? taxAmount,
    double? netAmount,
    double? paidAmount,
    double? balanceAmount,
    String? saleType,
    String? status,
    int? userId,
    Object? notes = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Sale(
      id: id is int? ? id : this.id,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      saleDate: saleDate ?? this.saleDate,
      partyId: partyId ?? this.partyId,
      totalAmount: totalAmount ?? this.totalAmount,
      discountAmount:
          discountAmount is double? ? discountAmount : this.discountAmount,
      taxAmount: taxAmount ?? this.taxAmount,
      netAmount: netAmount ?? this.netAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      balanceAmount: balanceAmount ?? this.balanceAmount,
      saleType: saleType ?? this.saleType,
      status: status ?? this.status,
      userId: userId ?? this.userId,
      notes: notes is String? ? notes : this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class SaleTable extends _i1.Table<int?> {
  SaleTable({super.tableRelation}) : super(tableName: 'sales') {
    invoiceNumber = _i1.ColumnString(
      'invoiceNumber',
      this,
    );
    saleDate = _i1.ColumnDateTime(
      'saleDate',
      this,
    );
    partyId = _i1.ColumnInt(
      'partyId',
      this,
    );
    totalAmount = _i1.ColumnDouble(
      'totalAmount',
      this,
    );
    discountAmount = _i1.ColumnDouble(
      'discountAmount',
      this,
    );
    taxAmount = _i1.ColumnDouble(
      'taxAmount',
      this,
    );
    netAmount = _i1.ColumnDouble(
      'netAmount',
      this,
    );
    paidAmount = _i1.ColumnDouble(
      'paidAmount',
      this,
    );
    balanceAmount = _i1.ColumnDouble(
      'balanceAmount',
      this,
    );
    saleType = _i1.ColumnString(
      'saleType',
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
    notes = _i1.ColumnString(
      'notes',
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

  late final _i1.ColumnString invoiceNumber;

  late final _i1.ColumnDateTime saleDate;

  late final _i1.ColumnInt partyId;

  late final _i1.ColumnDouble totalAmount;

  late final _i1.ColumnDouble discountAmount;

  late final _i1.ColumnDouble taxAmount;

  late final _i1.ColumnDouble netAmount;

  late final _i1.ColumnDouble paidAmount;

  late final _i1.ColumnDouble balanceAmount;

  late final _i1.ColumnString saleType;

  late final _i1.ColumnString status;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString notes;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        invoiceNumber,
        saleDate,
        partyId,
        totalAmount,
        discountAmount,
        taxAmount,
        netAmount,
        paidAmount,
        balanceAmount,
        saleType,
        status,
        userId,
        notes,
        createdAt,
        updatedAt,
      ];
}

class SaleInclude extends _i1.IncludeObject {
  SaleInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Sale.t;
}

class SaleIncludeList extends _i1.IncludeList {
  SaleIncludeList._({
    _i1.WhereExpressionBuilder<SaleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Sale.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Sale.t;
}

class SaleRepository {
  const SaleRepository._();

  /// Returns a list of [Sale]s matching the given query parameters.
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
  Future<List<Sale>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SaleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SaleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SaleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Sale>(
      where: where?.call(Sale.t),
      orderBy: orderBy?.call(Sale.t),
      orderByList: orderByList?.call(Sale.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Sale] matching the given query parameters.
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
  Future<Sale?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SaleTable>? where,
    int? offset,
    _i1.OrderByBuilder<SaleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SaleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Sale>(
      where: where?.call(Sale.t),
      orderBy: orderBy?.call(Sale.t),
      orderByList: orderByList?.call(Sale.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Sale] by its [id] or null if no such row exists.
  Future<Sale?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Sale>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Sale]s in the list and returns the inserted rows.
  ///
  /// The returned [Sale]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Sale>> insert(
    _i1.Session session,
    List<Sale> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Sale>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Sale] and returns the inserted row.
  ///
  /// The returned [Sale] will have its `id` field set.
  Future<Sale> insertRow(
    _i1.Session session,
    Sale row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Sale>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Sale]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Sale>> update(
    _i1.Session session,
    List<Sale> rows, {
    _i1.ColumnSelections<SaleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Sale>(
      rows,
      columns: columns?.call(Sale.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Sale]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Sale> updateRow(
    _i1.Session session,
    Sale row, {
    _i1.ColumnSelections<SaleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Sale>(
      row,
      columns: columns?.call(Sale.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Sale]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Sale>> delete(
    _i1.Session session,
    List<Sale> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Sale>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Sale].
  Future<Sale> deleteRow(
    _i1.Session session,
    Sale row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Sale>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Sale>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SaleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Sale>(
      where: where(Sale.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SaleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Sale>(
      where: where?.call(Sale.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
