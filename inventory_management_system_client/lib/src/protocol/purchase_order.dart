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

abstract class PurchaseOrder implements _i1.SerializableModel {
  PurchaseOrder._({
    this.id,
    required this.productId,
    required this.quantity,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PurchaseOrder({
    int? id,
    required int productId,
    required int quantity,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PurchaseOrderImpl;

  factory PurchaseOrder.fromJson(Map<String, dynamic> jsonSerialization) {
    return PurchaseOrder(
      id: jsonSerialization['id'] as int?,
      productId: jsonSerialization['productId'] as int,
      quantity: jsonSerialization['quantity'] as int,
      status: jsonSerialization['status'] as String,
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

  int productId;

  int quantity;

  String status;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [PurchaseOrder]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PurchaseOrder copyWith({
    int? id,
    int? productId,
    int? quantity,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'productId': productId,
      'quantity': quantity,
      'status': status,
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

class _PurchaseOrderImpl extends PurchaseOrder {
  _PurchaseOrderImpl({
    int? id,
    required int productId,
    required int quantity,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          productId: productId,
          quantity: quantity,
          status: status,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [PurchaseOrder]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PurchaseOrder copyWith({
    Object? id = _Undefined,
    int? productId,
    int? quantity,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PurchaseOrder(
      id: id is int? ? id : this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
