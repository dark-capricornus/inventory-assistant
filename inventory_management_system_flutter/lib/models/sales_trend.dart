// This file defines the SalesTrend class needed by sales_trends_screen.dart

class SalesTrend {
  final double totalSales;
  final int totalQuantity;
  final double averageOrderValue;
  final double growthRate;
  final List<SalesTrendPoint> trendData;
  final List<TopProduct> topProducts;

  SalesTrend({
    required this.totalSales,
    required this.totalQuantity,
    required this.averageOrderValue,
    required this.growthRate,
    required this.trendData,
    required this.topProducts,
  });

  // Factory constructor to create an empty instance for development
  factory SalesTrend.empty() {
    return SalesTrend(
      totalSales: 0.0,
      totalQuantity: 0,
      averageOrderValue: 0.0,
      growthRate: 0.0,
      trendData: [],
      topProducts: [],
    );
  }
}

class SalesTrendPoint {
  final DateTime date;
  final double sales;
  final int quantity;

  SalesTrendPoint({
    required this.date,
    required this.sales,
    required this.quantity,
  });
}

class TopProduct {
  final String name;
  final double sales;
  final int quantity;

  TopProduct({
    required this.name,
    required this.sales,
    required this.quantity,
  });
}