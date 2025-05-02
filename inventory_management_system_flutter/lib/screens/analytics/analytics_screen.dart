import 'package:flutter/material.dart';
import 'analytics_dashboard_screen.dart';
import 'sales_analytics_screen.dart';
import 'inventory_analytics_screen.dart';
import 'expense_analytics_screen.dart';
import 'profit_analytics_screen.dart';
import 'sales_trends_screen.dart';

/// Analytics Screen that serves as a hub for all analytics features
class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => AnalyticsScreenState();
}

class AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.dashboard),
            tooltip: 'Go to dashboard',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnalyticsDashboardScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today),
            tooltip: 'Select date range',
            onPressed: () {
              _showDateRangePicker(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSummaryMetrics(context),
            const SizedBox(height: 24),
            const Text(
              'Analytics Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildAnalyticsGrid(context),
            const SizedBox(height: 24),
            _buildRecommendations(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryMetrics(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'May 2025 Performance',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                        size: 12,
                      ),
                      SizedBox(width: 2),
                      Text(
                        '+15.3%',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMetricItem(
                  context,
                  label: 'Revenue',
                  value: '\$124,582',
                  change: '+8.4%',
                  isPositive: true,
                  color: Colors.blue,
                ),
                const SizedBox(width: 16),
                _buildMetricItem(
                  context,
                  label: 'Orders',
                  value: '1,284',
                  change: '+12.7%',
                  isPositive: true,
                  color: Colors.purple,
                ),
                const SizedBox(width: 16),
                _buildMetricItem(
                  context,
                  label: 'Profit',
                  value: '\$38,245',
                  change: '+15.3%',
                  isPositive: true,
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricItem(
    BuildContext context, {
    required String label,
    required String value,
    required String change,
    required bool isPositive,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: color, width: 3),
          ),
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isPositive ? Colors.green : Colors.red,
                  size: 12,
                ),
                const SizedBox(width: 4),
                Text(
                  change,
                  style: TextStyle(
                    fontSize: 12,
                    color: isPositive ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsGrid(BuildContext context) {
    final categories = [
      {
        'title': 'Sales Analytics',
        'icon': Icons.show_chart,
        'color': Colors.blue,
        'description': 'Revenue, transactions, and customer metrics',
        'screen': const SalesAnalyticsScreen(),
      },
      {
        'title': 'Inventory Analytics',
        'icon': Icons.inventory_2,
        'color': Colors.orange,
        'description': 'Stock levels, turnover, and item performance',
        'screen': const InventoryAnalyticsScreen(),
      },
      {
        'title': 'Expense Analytics',
        'icon': Icons.account_balance_wallet,
        'color': Colors.red,
        'description': 'Cost breakdown and spending analysis',
        'screen': const ExpenseAnalyticsScreen(),
      },
      {
        'title': 'Profit Analytics',
        'icon': Icons.savings,
        'color': Colors.green,
        'description': 'Margin analysis and profit optimization',
        'screen': const ProfitAnalyticsScreen(),
      },
      {
        'title': 'Sales Trends',
        'icon': Icons.trending_up,
        'color': Colors.purple,
        'description': 'Pattern analysis and future projections',
        'screen': const SalesTrendsScreen(),
      },
      {
        'title': 'Custom Reports',
        'icon': Icons.analytics,
        'color': Colors.teal,
        'description': 'Build and save personalized reports',
        'screen': null,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return _buildAnalyticsCard(
          context,
          title: category['title'] as String,
          icon: category['icon'] as IconData,
          color: category['color'] as Color,
          description: category['description'] as String,
          onTap: () {
            final screen = category['screen'] as Widget?;
            if (screen != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => screen),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Custom Reports coming soon!'),
                ),
              );
            }
          },
        );
      },
    );
  }

  Widget _buildAnalyticsCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: color, width: 3)),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: color,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendations(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'AI Insights',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Chip(
                  label: Text(
                    'NEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildInsightItem(
              context,
              title: 'Inventory Optimization',
              message: 'Consider reducing stock of "Product X" by 15% to optimize storage costs.',
              icon: Icons.lightbulb_outline,
              color: Colors.amber,
            ),
            const Divider(),
            _buildInsightItem(
              context,
              title: 'Sales Opportunity',
              message: 'Product "Y" is trending in your region. Consider increasing your supply.',
              icon: Icons.trending_up,
              color: Colors.green,
            ),
            const Divider(),
            _buildInsightItem(
              context,
              title: 'Cost Reduction',
              message: 'Supplier "Z" is offering a 10% discount for orders placed this week.',
              icon: Icons.savings,
              color: Colors.blue,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                icon: const Icon(Icons.visibility),
                label: const Text('View All Insights'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('All insights coming soon!'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightItem(
    BuildContext context, {
    required String title,
    required String message,
    required IconData icon,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDateRangePicker(BuildContext context) async {
    // Store current context for later reference
    final currentContext = context;
    
    final initialDateRange = DateTimeRange(
      start: DateTime.now().subtract(const Duration(days: 30)),
      end: DateTime.now(),
    );

    final pickedDateRange = await showDateRangePicker(
      context: currentContext,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: initialDateRange,
      builder: (context, child) {
        return Theme(
          data: Theme.of(currentContext).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(currentContext).primaryColor,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    // Convert AnalyticsScreen from StatelessWidget to StatefulWidget
    // and add this check before using context after the async gap
    if (pickedDateRange != null && currentContext.mounted) {
      // Process the selected date range
      // You would update analytics based on this range
      ScaffoldMessenger.of(currentContext).showSnackBar(
        SnackBar(
          content: Text(
            'Date range selected: ${pickedDateRange.start.toString().substring(0, 10)} to ${pickedDateRange.end.toString().substring(0, 10)}',
          ),
        ),
      );
    }
  }
}