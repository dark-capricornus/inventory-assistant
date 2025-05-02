// This file defines the ProfitMargin class needed by profit_analytics_screen.dart

class ProfitMargin {
  final double grossProfit;
  final double netProfit;
  final double grossMarginPercentage;
  final double netMarginPercentage;
  final List<ProfitTrend> profitTrend;
  final List<ProfitBreakdown> profitBreakdown;

  ProfitMargin({
    required this.grossProfit,
    required this.netProfit,
    required this.grossMarginPercentage,
    required this.netMarginPercentage,
    required this.profitTrend,
    required this.profitBreakdown,
  });

  // Factory constructor to create an empty instance for development
  factory ProfitMargin.empty() {
    return ProfitMargin(
      grossProfit: 0.0,
      netProfit: 0.0,
      grossMarginPercentage: 0.0,
      netMarginPercentage: 0.0,
      profitTrend: [],
      profitBreakdown: [],
    );
  }
}

class ProfitTrend {
  final DateTime date;
  final double profit;

  ProfitTrend({
    required this.date,
    required this.profit,
  });
}

class ProfitBreakdown {
  final String category;
  final double amount;
  final double percentage;

  ProfitBreakdown({
    required this.category,
    required this.amount,
    required this.percentage,
  });
}