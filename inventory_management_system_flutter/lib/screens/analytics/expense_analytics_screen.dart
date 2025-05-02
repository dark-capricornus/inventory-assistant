import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../models/expense_analytics.dart';
import 'dart:math'; // For generating sample data

class ExpenseAnalyticsScreen extends StatefulWidget {
  const ExpenseAnalyticsScreen({super.key});

  @override
  State<ExpenseAnalyticsScreen> createState() => _ExpenseAnalyticsScreenState();
}

class _ExpenseAnalyticsScreenState extends State<ExpenseAnalyticsScreen> {
  bool _isLoading = true;
  String? _error;
  ExpenseAnalytics? _expenseAnalytics;

  @override
  void initState() {
    super.initState();
    _loadExpenseAnalytics();
  }

  Future<void> _loadExpenseAnalytics() async {
    try {
      if (!mounted) return;
      
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Simulating API call with a delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Generate sample data
      final random = Random();
      final totalExpenses = 18500.0 + random.nextDouble() * 3000;
      final averageMonthly = totalExpenses / 12;
      final growthRate = 5.0 + random.nextDouble() * 10;
      final expenseRatio = 35.0 + random.nextDouble() * 15;
      
      // Generate expense trend data for the last 6 months
      final now = DateTime.now();
      final expenseTrends = List.generate(6, (index) {
        final month = now.month - 5 + index;
        final adjustedMonth = month <= 0 ? month + 12 : month;
        final date = DateTime(now.year + (month <= 0 ? -1 : 0), adjustedMonth, 1);
        return ExpenseTrend(
          date: date,
          amount: 2500 + random.nextDouble() * 1500,
        );
      });
      
      // Generate top expense categories
      final categories = [
        ExpenseCategory(
          name: 'Rent', 
          amount: 5000.0, 
          percentage: 28.0
        ),
        ExpenseCategory(
          name: 'Salaries', 
          amount: 8000.0, 
          percentage: 42.0
        ),
        ExpenseCategory(
          name: 'Utilities', 
          amount: 2000.0, 
          percentage: 11.0
        ),
        ExpenseCategory(
          name: 'Marketing', 
          amount: 1500.0, 
          percentage: 9.0
        ),
        ExpenseCategory(
          name: 'Others', 
          amount: 2000.0, 
          percentage: 10.0
        ),
      ];
      
      _expenseAnalytics = ExpenseAnalytics(
        totalExpenses: totalExpenses,
        averageMonthly: averageMonthly,
        growthRate: growthRate,
        expenseRatio: expenseRatio,
        expenseTrend: expenseTrends,
        topExpenseCategories: categories,
      );

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _error = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $_error'),
            ElevatedButton(
              onPressed: _loadExpenseAnalytics,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSummaryCards(),
          const SizedBox(height: 24),
          _buildExpenseChart(),
          const SizedBox(height: 24),
          _buildTopExpenseCategories(),
        ],
      ),
    );
  }

  Widget _buildSummaryCards() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.7, // Increased from 1.5 to provide more vertical space
      children: [
        _buildSummaryCard(
          'Total Expenses',
          '\$${_expenseAnalytics!.totalExpenses.toStringAsFixed(2)}',
          Icons.money_off,
          Colors.red,
        ),
        _buildSummaryCard(
          'Average Monthly',
          '\$${_expenseAnalytics!.averageMonthly.toStringAsFixed(2)}',
          Icons.calendar_today,
          Colors.blue,
        ),
        _buildSummaryCard(
          'Growth Rate',
          '${_expenseAnalytics!.growthRate.toStringAsFixed(1)}%',
          Icons.trending_up,
          Colors.orange,
        ),
        _buildSummaryCard(
          'Expense Ratio',
          '${_expenseAnalytics!.expenseRatio.toStringAsFixed(1)}%',
          Icons.analytics,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: color, width: 3)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Use minimum required space
          children: [
            Icon(icon, color: color, size: 24), // Reduced size
            const SizedBox(height: 4), // Reduced spacing
            Flexible(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 2), // Reduced spacing
            Flexible(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpenseChart() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Expense Trend',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() >= 0 && value.toInt() < _expenseAnalytics!.expenseTrend.length) {
                            final date = _expenseAnalytics!.expenseTrend[value.toInt()].date;
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                '${date.month}/${date.year.toString().substring(2)}',
                                style: const TextStyle(fontSize: 10),
                              ),
                            );
                          }
                          return const SideTitleWidget(
                            axisSide: AxisSide.bottom,
                            child: Text(''),
                          );
                        },
                        reservedSize: 30,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              '\$${value.toInt()}',
                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        },
                        reservedSize: 40,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: _expenseAnalytics!.expenseTrend
                          .asMap()
                          .entries
                          .map((entry) => FlSpot(
                                entry.key.toDouble(),
                                entry.value.amount,
                              ))
                          .toList(),
                      isCurved: true,
                      color: Colors.red,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: 4,
                            color: Colors.white,
                            strokeWidth: 2,
                            strokeColor: Colors.red,
                          );
                        },
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.red.withOpacity(0.2),
                      ),
                    ),
                  ],
                  minY: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopExpenseCategories() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Top Expense Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _expenseAnalytics!.topExpenseCategories.length,
              itemBuilder: (context, index) {
                final category = _expenseAnalytics!.topExpenseCategories[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 40,
                        color: _getCategoryColor(index),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category.name,
                              style: const TextStyle(fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Amount: \$${category.amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getCategoryColor(index).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${category.percentage.toStringAsFixed(1)}%',
                          style: TextStyle(
                            color: _getCategoryColor(index),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  
  Color _getCategoryColor(int index) {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
    ];
    return colors[index % colors.length];
  }
}