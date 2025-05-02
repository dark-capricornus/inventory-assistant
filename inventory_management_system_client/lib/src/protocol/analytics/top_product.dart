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

abstract class TopProduct implements _i1.SerializableModel {
  TopProduct._({
    required this.productId,
    required this.productName,
    required this.quantitySold,
    required this.revenue,
    required this.percentageOfTotal,
  });

  factory TopProduct({
    required String productId,
    required String productName,
    required int quantitySold,
    required double revenue,
    required double percentageOfTotal,
  }) = _TopProductImpl;

  factory TopProduct.fromJson(Map<String, dynamic> jsonSerialization) {
    return TopProduct(
      productId: jsonSerialization['productId'] as String,
      productName: jsonSerialization['productName'] as String,
      quantitySold: jsonSerialization['quantitySold'] as int,
      revenue: (jsonSerialization['revenue'] as num).toDouble(),
      percentageOfTotal:
          (jsonSerialization['percentageOfTotal'] as num).toDouble(),
    );
  }

  String productId;

  String productName;

  int quantitySold;

  double revenue;

  double percentageOfTotal;

  /// Returns a shallow copy of this [TopProduct]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TopProduct copyWith({
    String? productId,
    String? productName,
    int? quantitySold,
    double? revenue,
    double? percentageOfTotal,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'quantitySold': quantitySold,
      'revenue': revenue,
      'percentageOfTotal': percentageOfTotal,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TopProductImpl extends TopProduct {
  _TopProductImpl({
    required String productId,
    required String productName,
    required int quantitySold,
    required double revenue,
    required double percentageOfTotal,
  }) : super._(
          productId: productId,
          productName: productName,
          quantitySold: quantitySold,
          revenue: revenue,
          percentageOfTotal: percentageOfTotal,
        );

  /// Returns a shallow copy of this [TopProduct]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TopProduct copyWith({
    String? productId,
    String? productName,
    int? quantitySold,
    double? revenue,
    double? percentageOfTotal,
  }) {
    return TopProduct(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantitySold: quantitySold ?? this.quantitySold,
      revenue: revenue ?? this.revenue,
      percentageOfTotal: percentageOfTotal ?? this.percentageOfTotal,
    );
  }
}
