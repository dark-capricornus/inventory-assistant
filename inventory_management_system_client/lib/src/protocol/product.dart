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

abstract class Product implements _i1.SerializableModel {
  Product._({
    this.id,
    required this.name,
    this.description,
    required this.sku,
    required this.category,
    required this.unit,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.minStockLevel,
    required this.currentStock,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product({
    int? id,
    required String name,
    String? description,
    required String sku,
    required String category,
    required String unit,
    required double purchasePrice,
    required double sellingPrice,
    required int minStockLevel,
    required int currentStock,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProductImpl;

  factory Product.fromJson(Map<String, dynamic> jsonSerialization) {
    return Product(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      sku: jsonSerialization['sku'] as String,
      category: jsonSerialization['category'] as String,
      unit: jsonSerialization['unit'] as String,
      purchasePrice: (jsonSerialization['purchasePrice'] as num).toDouble(),
      sellingPrice: (jsonSerialization['sellingPrice'] as num).toDouble(),
      minStockLevel: jsonSerialization['minStockLevel'] as int,
      currentStock: jsonSerialization['currentStock'] as int,
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

  String name;

  String? description;

  String sku;

  String category;

  String unit;

  double purchasePrice;

  double sellingPrice;

  int minStockLevel;

  int currentStock;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Product copyWith({
    int? id,
    String? name,
    String? description,
    String? sku,
    String? category,
    String? unit,
    double? purchasePrice,
    double? sellingPrice,
    int? minStockLevel,
    int? currentStock,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'sku': sku,
      'category': category,
      'unit': unit,
      'purchasePrice': purchasePrice,
      'sellingPrice': sellingPrice,
      'minStockLevel': minStockLevel,
      'currentStock': currentStock,
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

class _ProductImpl extends Product {
  _ProductImpl({
    int? id,
    required String name,
    String? description,
    required String sku,
    required String category,
    required String unit,
    required double purchasePrice,
    required double sellingPrice,
    required int minStockLevel,
    required int currentStock,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          name: name,
          description: description,
          sku: sku,
          category: category,
          unit: unit,
          purchasePrice: purchasePrice,
          sellingPrice: sellingPrice,
          minStockLevel: minStockLevel,
          currentStock: currentStock,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Product copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    String? sku,
    String? category,
    String? unit,
    double? purchasePrice,
    double? sellingPrice,
    int? minStockLevel,
    int? currentStock,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      sku: sku ?? this.sku,
      category: category ?? this.category,
      unit: unit ?? this.unit,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      minStockLevel: minStockLevel ?? this.minStockLevel,
      currentStock: currentStock ?? this.currentStock,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
