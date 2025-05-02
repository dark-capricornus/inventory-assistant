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

abstract class InventoryOptimization
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  InventoryOptimization._({
    required this.productId,
    required this.currentStock,
    required this.recommendedStock,
    required this.reorderPoint,
    required this.safetyStock,
    required this.reason,
  });

  factory InventoryOptimization({
    required String productId,
    required int currentStock,
    required int recommendedStock,
    required int reorderPoint,
    required int safetyStock,
    required String reason,
  }) = _InventoryOptimizationImpl;

  factory InventoryOptimization.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return InventoryOptimization(
      productId: jsonSerialization['productId'] as String,
      currentStock: jsonSerialization['currentStock'] as int,
      recommendedStock: jsonSerialization['recommendedStock'] as int,
      reorderPoint: jsonSerialization['reorderPoint'] as int,
      safetyStock: jsonSerialization['safetyStock'] as int,
      reason: jsonSerialization['reason'] as String,
    );
  }

  String productId;

  int currentStock;

  int recommendedStock;

  int reorderPoint;

  int safetyStock;

  String reason;

  /// Returns a shallow copy of this [InventoryOptimization]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  InventoryOptimization copyWith({
    String? productId,
    int? currentStock,
    int? recommendedStock,
    int? reorderPoint,
    int? safetyStock,
    String? reason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'currentStock': currentStock,
      'recommendedStock': recommendedStock,
      'reorderPoint': reorderPoint,
      'safetyStock': safetyStock,
      'reason': reason,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'productId': productId,
      'currentStock': currentStock,
      'recommendedStock': recommendedStock,
      'reorderPoint': reorderPoint,
      'safetyStock': safetyStock,
      'reason': reason,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _InventoryOptimizationImpl extends InventoryOptimization {
  _InventoryOptimizationImpl({
    required String productId,
    required int currentStock,
    required int recommendedStock,
    required int reorderPoint,
    required int safetyStock,
    required String reason,
  }) : super._(
          productId: productId,
          currentStock: currentStock,
          recommendedStock: recommendedStock,
          reorderPoint: reorderPoint,
          safetyStock: safetyStock,
          reason: reason,
        );

  /// Returns a shallow copy of this [InventoryOptimization]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  InventoryOptimization copyWith({
    String? productId,
    int? currentStock,
    int? recommendedStock,
    int? reorderPoint,
    int? safetyStock,
    String? reason,
  }) {
    return InventoryOptimization(
      productId: productId ?? this.productId,
      currentStock: currentStock ?? this.currentStock,
      recommendedStock: recommendedStock ?? this.recommendedStock,
      reorderPoint: reorderPoint ?? this.reorderPoint,
      safetyStock: safetyStock ?? this.safetyStock,
      reason: reason ?? this.reason,
    );
  }
}
