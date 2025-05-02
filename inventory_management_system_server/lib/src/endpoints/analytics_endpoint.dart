import 'package:serverpod/serverpod.dart';
import 'package:inventory_management_system_server/src/generated/protocol.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Endpoint for handling analytics and ML predictions.
/// Communicates with the Python ML service for sales forecasting,
/// inventory optimization, and pricing suggestions.
class AnalyticsEndpoint extends Endpoint {
  /// Base URL for the ML service
  final String _mlServiceUrl = 'http://localhost:5000';

  /// Gets sales forecast from the ML service.
  /// 
  /// [session] The current server session.
  /// [startDate] The start date for the sales forecast.
  /// [endDate] The end date for the sales forecast.
  /// Returns a SalesPrediction object containing the predicted sales and confidence.
  /// Throws [Exception] if the request fails or ML service is unavailable.
  Future<SalesPrediction> getSalesForecast(
    Session session,
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_mlServiceUrl/predict/sales'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'start_date': startDate.toIso8601String(),
          'end_date': endDate.toIso8601String(),
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return SalesPrediction(
          date: DateTime.parse(data['date']),
          predictedSales: data['predicted_sales'].toDouble(),
          confidence: data['confidence'].toDouble(),
          historicalData: List<double>.from(data['historical_data']),
        );
      } else {
        throw Exception('Failed to get sales forecast: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error getting sales forecast: $e');
    }
  }

  /// Gets inventory optimization suggestions from the ML service.
  /// 
  /// [session] The current server session.
  /// [productId] The ID of the product for which to get inventory optimization.
  /// Returns an InventoryOptimization object containing the recommended stock levels and reorder point.
  /// Throws [Exception] if the request fails or ML service is unavailable.
  Future<InventoryOptimization> getInventoryOptimization(
    Session session,
    String productId,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_mlServiceUrl/predict/inventory'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'product_id': productId,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return InventoryOptimization(
          productId: data['product_id'],
          currentStock: data['current_stock'],
          recommendedStock: data['recommended_stock'],
          reorderPoint: data['reorder_point'],
          safetyStock: data['safety_stock'],
          reason: data['reason'],
        );
      } else {
        throw Exception('Failed to get inventory optimization: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error getting inventory optimization: $e');
    }
  }

  /// Gets pricing suggestions from the ML service.
  /// 
  /// [session] The current server session.
  /// [productId] The ID of the product for which to get pricing suggestion.
  /// Returns a PricingSuggestion object containing the suggested price and other details.
  /// Throws [Exception] if the request fails or ML service is unavailable.
  Future<PricingSuggestion> getPricingSuggestion(
    Session session,
    String productId,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_mlServiceUrl/predict/pricing'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'product_id': productId,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return PricingSuggestion(
          productId: data['product_id'],
          currentPrice: data['current_price'].toDouble(),
          suggestedPrice: data['suggested_price'].toDouble(),
          expectedDemand: data['expected_demand'].toDouble(),
          priceElasticity: data['price_elasticity'].toDouble(),
          expectedImpact: data['expected_impact'].toDouble(),
          reason: data['reason'],
        );
      } else {
        throw Exception('Failed to get pricing suggestion: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error getting pricing suggestion: $e');
    }
  }
} 