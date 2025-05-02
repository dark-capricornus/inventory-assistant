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

abstract class SaleItem implements _i1.SerializableModel {
  SaleItem._({
    this.id,
    required this.saleId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    this.discount,
    required this.tax,
    required this.totalAmount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SaleItem({
    int? id,
    required int saleId,
    required int productId,
    required double quantity,
    required double unitPrice,
    double? discount,
    required double tax,
    required double totalAmount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SaleItemImpl;

  factory SaleItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return SaleItem(
      id: jsonSerialization['id'] as int?,
      saleId: jsonSerialization['saleId'] as int,
      productId: jsonSerialization['productId'] as int,
      quantity: (jsonSerialization['quantity'] as num).toDouble(),
      unitPrice: (jsonSerialization['unitPrice'] as num).toDouble(),
      discount: (jsonSerialization['discount'] as num?)?.toDouble(),
      tax: (jsonSerialization['tax'] as num).toDouble(),
      totalAmount: (jsonSerialization['totalAmount'] as num).toDouble(),
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

  int saleId;

  int productId;

  double quantity;

  double unitPrice;

  double? discount;

  double tax;

  double totalAmount;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [SaleItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SaleItem copyWith({
    int? id,
    int? saleId,
    int? productId,
    double? quantity,
    double? unitPrice,
    double? discount,
    double? tax,
    double? totalAmount,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'saleId': saleId,
      'productId': productId,
      'quantity': quantity,
      'unitPrice': unitPrice,
      if (discount != null) 'discount': discount,
      'tax': tax,
      'totalAmount': totalAmount,
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

class _SaleItemImpl extends SaleItem {
  _SaleItemImpl({
    int? id,
    required int saleId,
    required int productId,
    required double quantity,
    required double unitPrice,
    double? discount,
    required double tax,
    required double totalAmount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          saleId: saleId,
          productId: productId,
          quantity: quantity,
          unitPrice: unitPrice,
          discount: discount,
          tax: tax,
          totalAmount: totalAmount,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [SaleItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SaleItem copyWith({
    Object? id = _Undefined,
    int? saleId,
    int? productId,
    double? quantity,
    double? unitPrice,
    Object? discount = _Undefined,
    double? tax,
    double? totalAmount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SaleItem(
      id: id is int? ? id : this.id,
      saleId: saleId ?? this.saleId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      discount: discount is double? ? discount : this.discount,
      tax: tax ?? this.tax,
      totalAmount: totalAmount ?? this.totalAmount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
