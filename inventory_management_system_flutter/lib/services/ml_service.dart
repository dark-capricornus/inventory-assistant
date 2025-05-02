import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/ml_prediction.dart';

class MLService {
  static const String _baseUrl = 'http://localhost:5000';

  Future<SalesPrediction> getSalesForecast({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/sales_forecast'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'start_date': startDate.toIso8601String(),
          'end_date': endDate.toIso8601String(),
        }),
      );

      if (response.statusCode == 200) {
        return SalesPrediction.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to get sales forecast: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error getting sales forecast: $e');
    }
  }

  Future<InventoryOptimization> getInventoryOptimization({
    required String productId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/inventory_optimization'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'product_id': productId,
        }),
      );

      if (response.statusCode == 200) {
        return InventoryOptimization.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to get inventory optimization: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error getting inventory optimization: $e');
    }
  }

  Future<PricingSuggestion> getPricingSuggestion({
    required String productId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/pricing_suggestion'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'product_id': productId,
        }),
      );

      if (response.statusCode == 200) {
        return PricingSuggestion.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to get pricing suggestion: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error getting pricing suggestion: $e');
    }
  }
} 