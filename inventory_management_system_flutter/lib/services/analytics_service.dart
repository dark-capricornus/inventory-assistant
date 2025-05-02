import 'package:flutter/material.dart';
import 'package:inventory_management_system_client/inventory_management_system_client.dart';
import '../main.dart';
import '../models/profit_margin.dart';

class AnalyticsService {
  // Singleton pattern
  static final AnalyticsService _instance = AnalyticsService._internal();
  factory AnalyticsService() => _instance;
  AnalyticsService._internal();
  
  // Get profit analytics data from the server
  Future<ProfitMargin> getProfitAnalytics() async {
    try {
      // Get sales data from the server for the last 6 months
      final now = DateTime.now();
      final sixMonthsAgo = DateTime(now.year, now.month - 6, now.day);
      
      final sales = await client.billing.getSalesByDateRange(sixMonthsAgo, now);
      
      // Calculate profit metrics from sales data
      double totalSales = 0;
      
      for (final sale in sales) {
        totalSales += sale.netAmount;
      }
      
      double grossProfit = totalSales;
      // Assuming expenses are around 10% of gross profit
      double expenses = grossProfit * 0.1; 
      double netProfit = grossProfit - expenses;
      
      double grossMarginPercentage = sales.isEmpty ? 0 : (grossProfit / totalSales) * 100;
      double netMarginPercentage = sales.isEmpty ? 0 : (netProfit / totalSales) * 100;
      
      // Generate trend data from monthly sales
      final trendData = <ProfitTrend>[];
      for (int i = 5; i >= 0; i--) {
        final monthStart = DateTime(now.year, now.month - i, 1);
        final monthEnd = i > 0 
            ? DateTime(now.year, now.month - i + 1, 0) 
            : DateTime(now.year, now.month, now.day);
            
        final monthlySales = await client.billing.getSalesByDateRange(monthStart, monthEnd);
        
        double monthlyProfit = 0;
        for (final sale in monthlySales) {
          // Safely convert to double, removing unnecessary null-aware operator
          final double saleNetAmount = sale.netAmount.toDouble();
          monthlyProfit += saleNetAmount * 0.3; // Simplified profit calculation
        }
        
        trendData.add(ProfitTrend(date: monthStart, profit: monthlyProfit));
      }
      
      // Get products for profit breakdown by category
      final products = await client.masterData.getAllProducts();
      
      // Group products by category and calculate profit contribution
      final Map<String, double> categoryProfits = {};
      for (final product in products) {
        // Explicitly convert everything to double
        final double sellingPrice = product.sellingPrice;  // Already double from class definition
        final double purchasePrice = product.purchasePrice;  // Already double from class definition
        final double stockLevelAsDouble = product.currentStock.toDouble();  // Convert int to double
        
        // Perform calculation with all doubles
        final double profit = (sellingPrice - purchasePrice) * stockLevelAsDouble;
        
        if (categoryProfits.containsKey(product.category)) {
          categoryProfits[product.category] = categoryProfits[product.category]! + profit;
        } else {
          categoryProfits[product.category] = profit;
        }
      }
      
      // Calculate total category profit and percentages
      double totalCategoryProfit = categoryProfits.values.fold(0, (sum, profit) => sum + profit);
      
      // Convert to profit breakdown objects
      final List<ProfitBreakdown> breakdownData = [];
      categoryProfits.forEach((category, profit) {
        final percentage = totalCategoryProfit > 0 ? (profit / totalCategoryProfit) * 100 : 0;
        breakdownData.add(ProfitBreakdown(
          category: category,
          amount: profit,
          percentage: percentage.toDouble()
        ));
      });
      
      // Sort breakdown data by percentage (descending)
      breakdownData.sort((a, b) => b.percentage.compareTo(a.percentage));
      
      return ProfitMargin(
        grossProfit: grossProfit,
        netProfit: netProfit,
        grossMarginPercentage: grossMarginPercentage,
        netMarginPercentage: netMarginPercentage,
        profitTrend: trendData,
        profitBreakdown: breakdownData,
      );
    } catch (e) {
      debugPrint('Error fetching profit analytics: $e');
      
      // If server call fails, return empty object rather than mock data
      return ProfitMargin.empty();
    }
  }
  
  // Get sales prediction data from ML service
  Future<SalesPrediction> getSalesPrediction(DateTime startDate, DateTime endDate) async {
    try {
      final prediction = await client.analytics.getSalesForecast(startDate, endDate);
      return prediction;
    } catch (e) {
      debugPrint('Error getting sales prediction: $e');
      
      // Throw the error rather than returning mock data
      throw Exception('Failed to get sales prediction: $e');
    }
  }
  
  // Get inventory optimization suggestions
  Future<InventoryOptimization> getInventoryOptimization(String productId) async {
    try {
      final optimization = await client.analytics.getInventoryOptimization(productId);
      return optimization;
    } catch (e) {
      debugPrint('Error getting inventory optimization: $e');
      
      // Throw the error rather than returning mock data
      throw Exception('Failed to get inventory optimization: $e');
    }
  }
  
  // Get pricing suggestions from ML service
  Future<PricingSuggestion> getPricingSuggestion(String productId) async {
    try {
      final suggestion = await client.analytics.getPricingSuggestion(productId);
      return suggestion;
    } catch (e) {
      debugPrint('Error getting pricing suggestion: $e');
      
      // Throw the error rather than returning mock data
      throw Exception('Failed to get pricing suggestion: $e');
    }
  }
  
  // Get all pricing suggestions for multiple products
  Future<List<PricingSuggestion>> getAllPricingSuggestions() async {
    try {
      // Get all products
      final products = await client.masterData.getAllProducts();
      
      // Get pricing suggestions for each product
      final suggestions = <PricingSuggestion>[];
      for (final product in products) {
        try {
          final suggestion = await client.analytics.getPricingSuggestion(product.id.toString());
          suggestions.add(suggestion);
        } catch (e) {
          // Skip products that fail
          debugPrint('Failed to get pricing suggestion for product ${product.id}: $e');
        }
      }
      
      return suggestions;
    } catch (e) {
      debugPrint('Error getting all pricing suggestions: $e');
      throw Exception('Failed to get pricing suggestions: $e');
    }
  }
}