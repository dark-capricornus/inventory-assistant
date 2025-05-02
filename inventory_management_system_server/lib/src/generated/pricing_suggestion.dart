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

abstract class PricingSuggestion
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PricingSuggestion._({
    required this.productId,
    required this.currentPrice,
    required this.suggestedPrice,
    required this.expectedDemand,
    required this.priceElasticity,
    required this.expectedImpact,
    required this.reason,
  });

  factory PricingSuggestion({
    required String productId,
    required double currentPrice,
    required double suggestedPrice,
    required double expectedDemand,
    required double priceElasticity,
    required double expectedImpact,
    required String reason,
  }) = _PricingSuggestionImpl;

  factory PricingSuggestion.fromJson(Map<String, dynamic> jsonSerialization) {
    return PricingSuggestion(
      productId: jsonSerialization['productId'] as String,
      currentPrice: (jsonSerialization['currentPrice'] as num).toDouble(),
      suggestedPrice: (jsonSerialization['suggestedPrice'] as num).toDouble(),
      expectedDemand: (jsonSerialization['expectedDemand'] as num).toDouble(),
      priceElasticity: (jsonSerialization['priceElasticity'] as num).toDouble(),
      expectedImpact: (jsonSerialization['expectedImpact'] as num).toDouble(),
      reason: jsonSerialization['reason'] as String,
    );
  }

  String productId;

  double currentPrice;

  double suggestedPrice;

  double expectedDemand;

  double priceElasticity;

  double expectedImpact;

  String reason;

  /// Returns a shallow copy of this [PricingSuggestion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PricingSuggestion copyWith({
    String? productId,
    double? currentPrice,
    double? suggestedPrice,
    double? expectedDemand,
    double? priceElasticity,
    double? expectedImpact,
    String? reason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'currentPrice': currentPrice,
      'suggestedPrice': suggestedPrice,
      'expectedDemand': expectedDemand,
      'priceElasticity': priceElasticity,
      'expectedImpact': expectedImpact,
      'reason': reason,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'productId': productId,
      'currentPrice': currentPrice,
      'suggestedPrice': suggestedPrice,
      'expectedDemand': expectedDemand,
      'priceElasticity': priceElasticity,
      'expectedImpact': expectedImpact,
      'reason': reason,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PricingSuggestionImpl extends PricingSuggestion {
  _PricingSuggestionImpl({
    required String productId,
    required double currentPrice,
    required double suggestedPrice,
    required double expectedDemand,
    required double priceElasticity,
    required double expectedImpact,
    required String reason,
  }) : super._(
          productId: productId,
          currentPrice: currentPrice,
          suggestedPrice: suggestedPrice,
          expectedDemand: expectedDemand,
          priceElasticity: priceElasticity,
          expectedImpact: expectedImpact,
          reason: reason,
        );

  /// Returns a shallow copy of this [PricingSuggestion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PricingSuggestion copyWith({
    String? productId,
    double? currentPrice,
    double? suggestedPrice,
    double? expectedDemand,
    double? priceElasticity,
    double? expectedImpact,
    String? reason,
  }) {
    return PricingSuggestion(
      productId: productId ?? this.productId,
      currentPrice: currentPrice ?? this.currentPrice,
      suggestedPrice: suggestedPrice ?? this.suggestedPrice,
      expectedDemand: expectedDemand ?? this.expectedDemand,
      priceElasticity: priceElasticity ?? this.priceElasticity,
      expectedImpact: expectedImpact ?? this.expectedImpact,
      reason: reason ?? this.reason,
    );
  }
}
