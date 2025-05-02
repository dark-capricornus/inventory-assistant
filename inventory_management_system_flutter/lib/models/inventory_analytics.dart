// This file defines the InventoryAnalytics class needed by inventory_analytics_screen.dart

class InventoryAnalytics {
  final int totalProducts;
  final double totalValue;
  final int lowStockItems;
  final int outOfStock;
  final Map<String, double> categoryValues;
  final List<LowStockItem> lowStockList;

  InventoryAnalytics({
    required this.totalProducts,
    required this.totalValue,
    required this.lowStockItems,
    required this.outOfStock,
    required this.categoryValues,
    required this.lowStockList,
  });

  // Factory constructor to create an empty instance for development
  factory InventoryAnalytics.empty() {
    return InventoryAnalytics(
      totalProducts: 0,
      totalValue: 0.0,
      lowStockItems: 0,
      outOfStock: 0,
      categoryValues: {},
      lowStockList: [],
    );
  }
}

class LowStockItem {
  final String name;
  final int currentStock;
  final int reorderPoint;

  LowStockItem({
    required this.name,
    required this.currentStock,
    required this.reorderPoint,
  });
}