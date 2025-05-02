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

abstract class Supplier
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Supplier._({
    this.id,
    required this.supplierCode,
    required this.name,
    this.contactPerson,
    this.email,
    this.phone,
    this.address,
    this.gstin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Supplier({
    int? id,
    required String supplierCode,
    required String name,
    String? contactPerson,
    String? email,
    String? phone,
    String? address,
    String? gstin,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SupplierImpl;

  factory Supplier.fromJson(Map<String, dynamic> jsonSerialization) {
    return Supplier(
      id: jsonSerialization['id'] as int?,
      supplierCode: jsonSerialization['supplierCode'] as String,
      name: jsonSerialization['name'] as String,
      contactPerson: jsonSerialization['contactPerson'] as String?,
      email: jsonSerialization['email'] as String?,
      phone: jsonSerialization['phone'] as String?,
      address: jsonSerialization['address'] as String?,
      gstin: jsonSerialization['gstin'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = SupplierTable();

  static const db = SupplierRepository._();

  @override
  int? id;

  String supplierCode;

  String name;

  String? contactPerson;

  String? email;

  String? phone;

  String? address;

  String? gstin;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Supplier]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Supplier copyWith({
    int? id,
    String? supplierCode,
    String? name,
    String? contactPerson,
    String? email,
    String? phone,
    String? address,
    String? gstin,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'supplierCode': supplierCode,
      'name': name,
      if (contactPerson != null) 'contactPerson': contactPerson,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (gstin != null) 'gstin': gstin,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'supplierCode': supplierCode,
      'name': name,
      if (contactPerson != null) 'contactPerson': contactPerson,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (gstin != null) 'gstin': gstin,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static SupplierInclude include() {
    return SupplierInclude._();
  }

  static SupplierIncludeList includeList({
    _i1.WhereExpressionBuilder<SupplierTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SupplierTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SupplierTable>? orderByList,
    SupplierInclude? include,
  }) {
    return SupplierIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Supplier.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Supplier.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SupplierImpl extends Supplier {
  _SupplierImpl({
    int? id,
    required String supplierCode,
    required String name,
    String? contactPerson,
    String? email,
    String? phone,
    String? address,
    String? gstin,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          supplierCode: supplierCode,
          name: name,
          contactPerson: contactPerson,
          email: email,
          phone: phone,
          address: address,
          gstin: gstin,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Supplier]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Supplier copyWith({
    Object? id = _Undefined,
    String? supplierCode,
    String? name,
    Object? contactPerson = _Undefined,
    Object? email = _Undefined,
    Object? phone = _Undefined,
    Object? address = _Undefined,
    Object? gstin = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Supplier(
      id: id is int? ? id : this.id,
      supplierCode: supplierCode ?? this.supplierCode,
      name: name ?? this.name,
      contactPerson:
          contactPerson is String? ? contactPerson : this.contactPerson,
      email: email is String? ? email : this.email,
      phone: phone is String? ? phone : this.phone,
      address: address is String? ? address : this.address,
      gstin: gstin is String? ? gstin : this.gstin,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class SupplierTable extends _i1.Table<int?> {
  SupplierTable({super.tableRelation}) : super(tableName: 'suppliers') {
    supplierCode = _i1.ColumnString(
      'supplierCode',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    contactPerson = _i1.ColumnString(
      'contactPerson',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    address = _i1.ColumnString(
      'address',
      this,
    );
    gstin = _i1.ColumnString(
      'gstin',
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

  late final _i1.ColumnString supplierCode;

  late final _i1.ColumnString name;

  late final _i1.ColumnString contactPerson;

  late final _i1.ColumnString email;

  late final _i1.ColumnString phone;

  late final _i1.ColumnString address;

  late final _i1.ColumnString gstin;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        supplierCode,
        name,
        contactPerson,
        email,
        phone,
        address,
        gstin,
        createdAt,
        updatedAt,
      ];
}

class SupplierInclude extends _i1.IncludeObject {
  SupplierInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Supplier.t;
}

class SupplierIncludeList extends _i1.IncludeList {
  SupplierIncludeList._({
    _i1.WhereExpressionBuilder<SupplierTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Supplier.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Supplier.t;
}

class SupplierRepository {
  const SupplierRepository._();

  /// Returns a list of [Supplier]s matching the given query parameters.
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
  Future<List<Supplier>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SupplierTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SupplierTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SupplierTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Supplier>(
      where: where?.call(Supplier.t),
      orderBy: orderBy?.call(Supplier.t),
      orderByList: orderByList?.call(Supplier.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Supplier] matching the given query parameters.
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
  Future<Supplier?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SupplierTable>? where,
    int? offset,
    _i1.OrderByBuilder<SupplierTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SupplierTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Supplier>(
      where: where?.call(Supplier.t),
      orderBy: orderBy?.call(Supplier.t),
      orderByList: orderByList?.call(Supplier.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Supplier] by its [id] or null if no such row exists.
  Future<Supplier?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Supplier>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Supplier]s in the list and returns the inserted rows.
  ///
  /// The returned [Supplier]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Supplier>> insert(
    _i1.Session session,
    List<Supplier> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Supplier>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Supplier] and returns the inserted row.
  ///
  /// The returned [Supplier] will have its `id` field set.
  Future<Supplier> insertRow(
    _i1.Session session,
    Supplier row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Supplier>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Supplier]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Supplier>> update(
    _i1.Session session,
    List<Supplier> rows, {
    _i1.ColumnSelections<SupplierTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Supplier>(
      rows,
      columns: columns?.call(Supplier.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Supplier]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Supplier> updateRow(
    _i1.Session session,
    Supplier row, {
    _i1.ColumnSelections<SupplierTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Supplier>(
      row,
      columns: columns?.call(Supplier.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Supplier]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Supplier>> delete(
    _i1.Session session,
    List<Supplier> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Supplier>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Supplier].
  Future<Supplier> deleteRow(
    _i1.Session session,
    Supplier row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Supplier>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Supplier>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SupplierTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Supplier>(
      where: where(Supplier.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SupplierTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Supplier>(
      where: where?.call(Supplier.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
