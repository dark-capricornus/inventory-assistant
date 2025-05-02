// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ml_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesPrediction _$SalesPredictionFromJson(Map<String, dynamic> json) =>
    SalesPrediction(
      date: DateTime.parse(json['date'] as String),
      predictedSales: (json['predictedSales'] as num).toDouble(),
      confidence: (json['confidence'] as num).toDouble(),
      historicalData: (json['historicalData'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$SalesPredictionToJson(SalesPrediction instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'predictedSales': instance.predictedSales,
      'confidence': instance.confidence,
      'historicalData': instance.historicalData,
    };

InventoryOptimization _$InventoryOptimizationFromJson(
        Map<String, dynamic> json) =>
    InventoryOptimization(
      productId: json['productId'] as String,
      currentStock: (json['currentStock'] as num).toInt(),
      recommendedStock: (json['recommendedStock'] as num).toInt(),
      reorderPoint: (json['reorderPoint'] as num).toDouble(),
      safetyStock: (json['safetyStock'] as num).toDouble(),
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$InventoryOptimizationToJson(
        InventoryOptimization instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'currentStock': instance.currentStock,
      'recommendedStock': instance.recommendedStock,
      'reorderPoint': instance.reorderPoint,
      'safetyStock': instance.safetyStock,
      'reason': instance.reason,
    };

PricingSuggestion _$PricingSuggestionFromJson(Map<String, dynamic> json) =>
    PricingSuggestion(
      productId: json['productId'] as String,
      currentPrice: (json['currentPrice'] as num).toDouble(),
      suggestedPrice: (json['suggestedPrice'] as num).toDouble(),
      expectedDemand: (json['expectedDemand'] as num).toDouble(),
      priceElasticity: (json['priceElasticity'] as num).toDouble(),
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$PricingSuggestionToJson(PricingSuggestion instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'currentPrice': instance.currentPrice,
      'suggestedPrice': instance.suggestedPrice,
      'expectedDemand': instance.expectedDemand,
      'priceElasticity': instance.priceElasticity,
      'reason': instance.reason,
    };
