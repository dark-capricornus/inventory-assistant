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

abstract class Party implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
