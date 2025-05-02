// This file defines the ExpenseAnalytics class needed by expense_analytics_screen.dart

class ExpenseAnalytics {
  final double totalExpenses;
  final double averageMonthly;
  final double growthRate;
  final double expenseRatio;
  final List<ExpenseTrend> expenseTrend;
  final List<ExpenseCategory> topExpenseCategories;

  ExpenseAnalytics({
    required this.totalExpenses,
    required this.averageMonthly,
    required this.growthRate,
    required this.expenseRatio,
    required this.expenseTrend,
    required this.topExpenseCategories,
  });

  // Factory constructor to create an empty instance for development
  factory ExpenseAnalytics.empty() {
    return ExpenseAnalytics(
      totalExpenses: 0.0,
      averageMonthly: 0.0,
      growthRate: 0.0,
      expenseRatio: 0.0,
      expenseTrend: [],
      topExpenseCategories: [],
    );
  }
}

class ExpenseTrend {
  final DateTime date;
  final double amount;

  ExpenseTrend({
    required this.date,
    required this.amount,
  });
}

class ExpenseCategory {
  final String name;
  final double amount;
  final double percentage;

  ExpenseCategory({
    required this.name,
    required this.amount,
    required this.percentage,
  });
}