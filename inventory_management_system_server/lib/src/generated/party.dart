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

abstract class Party implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Party._({
    this.id,
    required this.code,
    required this.name,
    required this.type,
    this.contactPerson,
    this.email,
    required this.phone,
    required this.address,
    this.gstNumber,
    this.creditLimit,
    required this.currentBalance,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Party({
    int? id,
    required String code,
    required String name,
    required String type,
    String? contactPerson,
    String? email,
    required String phone,
    required String address,
    String? gstNumber,
    double? creditLimit,
    required double currentBalance,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PartyImpl;

  factory Party.fromJson(Map<String, dynamic> jsonSerialization) {
    return Party(
      id: jsonSerialization['id'] as int?,
      code: jsonSerialization['code'] as String,
      name: jsonSerialization['name'] as String,
      type: jsonSerialization['type'] as String,
      contactPerson: jsonSerialization['contactPerson'] as String?,
      email: jsonSerialization['email'] as String?,
      phone: jsonSerialization['phone'] as String,
      address: jsonSerialization['address'] as String,
      gstNumber: jsonSerialization['gstNumber'] as String?,
      creditLimit: (jsonSerialization['creditLimit'] as num?)?.toDouble(),
      currentBalance: (jsonSerialization['currentBalance'] as num).toDouble(),
      isActive: jsonSerialization['isActive'] as bool,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = PartyTable();

  static const db = PartyRepository._();

  @override
  int? id;

  String code;

  String name;

  String type;

  String? contactPerson;

  String? email;

  String phone;

  String address;

  String? gstNumber;

  double? creditLimit;

  double currentBalance;

  bool isActive;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Party]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Party copyWith({
    int? id,
    String? code,
    String? name,
    String? type,
    String? contactPerson,
    String? email,
    String? phone,
    String? address,
    String? gstNumber,
    double? creditLimit,
    double? currentBalance,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'code': code,
      'name': name,
      'type': type,
      if (contactPerson != null) 'contactPerson': contactPerson,
      if (email != null) 'email': email,
      'phone': phone,
      'address': address,
      if (gstNumber != null) 'gstNumber': gstNumber,
      if (creditLimit != null) 'creditLimit': creditLimit,
      'currentBalance': currentBalance,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'code': code,
      'name': name,
      'type': type,
      if (contactPerson != null) 'contactPerson': contactPerson,
      if (email != null) 'email': email,
      'phone': phone,
      'address': address,
      if (gstNumber != null) 'gstNumber': gstNumber,
      if (creditLimit != null) 'creditLimit': creditLimit,
      'currentBalance': currentBalance,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static PartyInclude include() {
    return PartyInclude._();
  }

  static PartyIncludeList includeList({
    _i1.WhereExpressionBuilder<PartyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PartyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PartyTable>? orderByList,
    PartyInclude? include,
  }) {
    return PartyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Party.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Party.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PartyImpl extends Party {
  _PartyImpl({
    int? id,
    required String code,
    required String name,
    required String type,
    String? contactPerson,
    String? email,
    required String phone,
    required String address,
    String? gstNumber,
    double? creditLimit,
    required double currentBalance,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          code: code,
          name: name,
          type: type,
          contactPerson: contactPerson,
          email: email,
          phone: phone,
          address: address,
          gstNumber: gstNumber,
          creditLimit: creditLimit,
          currentBalance: currentBalance,
          isActive: isActive,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Party]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Party copyWith({
    Object? id = _Undefined,
    String? code,
    String? name,
    String? type,
    Object? contactPerson = _Undefined,
    Object? email = _Undefined,
    String? phone,
    String? address,
    Object? gstNumber = _Undefined,
    Object? creditLimit = _Undefined,
    double? currentBalance,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Party(
      id: id is int? ? id : this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      type: type ?? this.type,
      contactPerson:
          contactPerson is String? ? contactPerson : this.contactPerson,
      email: email is String? ? email : this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      gstNumber: gstNumber is String? ? gstNumber : this.gstNumber,
      creditLimit: creditLimit is double? ? creditLimit : this.creditLimit,
      currentBalance: currentBalance ?? this.currentBalance,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class PartyTable extends _i1.Table<int?> {
  PartyTable({super.tableRelation}) : super(tableName: 'parties') {
    code = _i1.ColumnString(
      'code',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    type = _i1.ColumnString(
      'type',
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
    gstNumber = _i1.ColumnString(
      'gstNumber',
      this,
    );
    creditLimit = _i1.ColumnDouble(
      'creditLimit',
      this,
    );
    currentBalance = _i1.ColumnDouble(
      'currentBalance',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
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

  late final _i1.ColumnString code;

  late final _i1.ColumnString name;

  late final _i1.ColumnString type;

  late final _i1.ColumnString contactPerson;

  late final _i1.ColumnString email;

  late final _i1.ColumnString phone;

  late final _i1.ColumnString address;

  late final _i1.ColumnString gstNumber;

  late final _i1.ColumnDouble creditLimit;

  late final _i1.ColumnDouble currentBalance;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        code,
        name,
        type,
        contactPerson,
        email,
        phone,
        address,
        gstNumber,
        creditLimit,
        currentBalance,
        isActive,
        createdAt,
        updatedAt,
      ];
}

class PartyInclude extends _i1.IncludeObject {
  PartyInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Party.t;
}

class PartyIncludeList extends _i1.IncludeList {
  PartyIncludeList._({
    _i1.WhereExpressionBuilder<PartyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Party.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Party.t;
}

class PartyRepository {
  const PartyRepository._();

  /// Returns a list of [Party]s matching the given query parameters.
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
  Future<List<Party>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PartyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PartyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PartyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Party>(
      where: where?.call(Party.t),
      orderBy: orderBy?.call(Party.t),
      orderByList: orderByList?.call(Party.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Party] matching the given query parameters.
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
  Future<Party?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PartyTable>? where,
    int? offset,
    _i1.OrderByBuilder<PartyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PartyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Party>(
      where: where?.call(Party.t),
      orderBy: orderBy?.call(Party.t),
      orderByList: orderByList?.call(Party.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Party] by its [id] or null if no such row exists.
  Future<Party?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Party>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Party]s in the list and returns the inserted rows.
  ///
  /// The returned [Party]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Party>> insert(
    _i1.Session session,
    List<Party> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Party>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Party] and returns the inserted row.
  ///
  /// The returned [Party] will have its `id` field set.
  Future<Party> insertRow(
    _i1.Session session,
    Party row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Party>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Party]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Party>> update(
    _i1.Session session,
    List<Party> rows, {
    _i1.ColumnSelections<PartyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Party>(
      rows,
      columns: columns?.call(Party.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Party]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Party> updateRow(
    _i1.Session session,
    Party row, {
    _i1.ColumnSelections<PartyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Party>(
      row,
      columns: columns?.call(Party.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Party]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Party>> delete(
    _i1.Session session,
    List<Party> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Party>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Party].
  Future<Party> deleteRow(
    _i1.Session session,
    Party row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Party>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Party>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PartyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Party>(
      where: where(Party.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PartyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Party>(
      where: where?.call(Party.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
