import 'package:json_annotation/json_annotation.dart';

part 'ml_prediction.g.dart';

@JsonSerializable()
class SalesPrediction {
  final DateTime date;
  final double predictedSales;
  final double confidence;
  final List<double> historicalData;

  SalesPrediction({
    required this.date,
    required this.predictedSales,
    required this.confidence,
    required this.historicalData,
  });

  factory SalesPrediction.fromJson(Map<String, dynamic> json) =>
      _$SalesPredictionFromJson(json);

  Map<String, dynamic> toJson() => _$SalesPredictionToJson(this);
}

@JsonSerializable()
class InventoryOptimization {
  final String productId;
  final int currentStock;
  final int recommendedStock;
  final double reorderPoint;
  final double safetyStock;
  final String reason;

  InventoryOptimization({
    required this.productId,
    required this.currentStock,
    required this.recommendedStock,
    required this.reorderPoint,
    required this.safetyStock,
    required this.reason,
  });

  factory InventoryOptimization.fromJson(Map<String, dynamic> json) =>
      _$InventoryOptimizationFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryOptimizationToJson(this);
}

@JsonSerializable()
class PricingSuggestion {
  final String productId;
  final double currentPrice;
  final double suggestedPrice;
  final double expectedDemand;
  final double priceElasticity;
  final String reason;

  PricingSuggestion({
    required this.productId,
    required this.currentPrice,
    required this.suggestedPrice,
    required this.expectedDemand,
    required this.priceElasticity,
    required this.reason,
  });

  factory PricingSuggestion.fromJson(Map<String, dynamic> json) =>
      _$PricingSuggestionFromJson(json);

  Map<String, dynamic> toJson() => _$PricingSuggestionToJson(this);
} 