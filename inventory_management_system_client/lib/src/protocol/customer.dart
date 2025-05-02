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

abstract class Customer implements _i1.SerializableModel {
  Customer._({
    this.id,
    required this.customerCode,
    required this.name,
    this.contactPerson,
    this.email,
    this.phone,
    this.address,
    this.gstin,
    this.creditLimit,
    required this.currentBalance,
    this.orderCount,
    this.lifetimeValue,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Customer({
    int? id,
    required String customerCode,
    required String name,
    String? contactPerson,
    String? email,
    String? phone,
    String? address,
    String? gstin,
    double? creditLimit,
    required double currentBalance,
    int? orderCount,
    double? lifetimeValue,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CustomerImpl;

  factory Customer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Customer(
      id: jsonSerialization['id'] as int?,
      customerCode: jsonSerialization['customerCode'] as String,
      name: jsonSerialization['name'] as String,
      contactPerson: jsonSerialization['contactPerson'] as String?,
      email: jsonSerialization['email'] as String?,
      phone: jsonSerialization['phone'] as String?,
      address: jsonSerialization['address'] as String?,
      gstin: jsonSerialization['gstin'] as String?,
      creditLimit: (jsonSerialization['creditLimit'] as num?)?.toDouble(),
      currentBalance: (jsonSerialization['currentBalance'] as num).toDouble(),
      orderCount: jsonSerialization['orderCount'] as int?,
      lifetimeValue: (jsonSerialization['lifetimeValue'] as num?)?.toDouble(),
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

  String customerCode;

  String name;

  String? contactPerson;

  String? email;

  String? phone;

  String? address;

  String? gstin;

  double? creditLimit;

  double currentBalance;

  int? orderCount;

  double? lifetimeValue;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Customer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Customer copyWith({
    int? id,
    String? customerCode,
    String? name,
    String? contactPerson,
    String? email,
    String? phone,
    String? address,
    String? gstin,
    double? creditLimit,
    double? currentBalance,
    int? orderCount,
    double? lifetimeValue,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'customerCode': customerCode,
      'name': name,
      if (contactPerson != null) 'contactPerson': contactPerson,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (gstin != null) 'gstin': gstin,
      if (creditLimit != null) 'creditLimit': creditLimit,
      'currentBalance': currentBalance,
      if (orderCount != null) 'orderCount': orderCount,
      if (lifetimeValue != null) 'lifetimeValue': lifetimeValue,
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

class _CustomerImpl extends Customer {
  _CustomerImpl({
    int? id,
    required String customerCode,
    required String name,
    String? contactPerson,
    String? email,
    String? phone,
    String? address,
    String? gstin,
    double? creditLimit,
    required double currentBalance,
    int? orderCount,
    double? lifetimeValue,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          customerCode: customerCode,
          name: name,
          contactPerson: contactPerson,
          email: email,
          phone: phone,
          address: address,
          gstin: gstin,
          creditLimit: creditLimit,
          currentBalance: currentBalance,
          orderCount: orderCount,
          lifetimeValue: lifetimeValue,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Customer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Customer copyWith({
    Object? id = _Undefined,
    String? customerCode,
    String? name,
    Object? contactPerson = _Undefined,
    Object? email = _Undefined,
    Object? phone = _Undefined,
    Object? address = _Undefined,
    Object? gstin = _Undefined,
    Object? creditLimit = _Undefined,
    double? currentBalance,
    Object? orderCount = _Undefined,
    Object? lifetimeValue = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Customer(
      id: id is int? ? id : this.id,
      customerCode: customerCode ?? this.customerCode,
      name: name ?? this.name,
      contactPerson:
          contactPerson is String? ? contactPerson : this.contactPerson,
      email: email is String? ? email : this.email,
      phone: phone is String? ? phone : this.phone,
      address: address is String? ? address : this.address,
      gstin: gstin is String? ? gstin : this.gstin,
      creditLimit: creditLimit is double? ? creditLimit : this.creditLimit,
      currentBalance: currentBalance ?? this.currentBalance,
      orderCount: orderCount is int? ? orderCount : this.orderCount,
      lifetimeValue:
          lifetimeValue is double? ? lifetimeValue : this.lifetimeValue,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
