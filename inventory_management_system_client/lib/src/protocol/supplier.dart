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

abstract class Supplier implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
