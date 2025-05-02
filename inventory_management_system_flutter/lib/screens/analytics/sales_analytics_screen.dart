import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;

// Define SalesAnalytics class directly if needed
class SalesAnalytics {
  final double totalSales;
  final double totalRevenue;
  final double averageOrderValue;
  final int numberOfOrders;
  final List<SalesDataPoint> dailySales;
  final List<TopProduct> topProducts;
  
  SalesAnalytics({
    required this.totalSales,
    required this.totalRevenue,
    required this.averageOrderValue,
    required this.numberOfOrders,
    required this.dailySales,
    required this.topProducts,
  });
  
  // Factory constructor for empty analytics
  factory SalesAnalytics.empty() {
    return SalesAnalytics(
      totalSales: 0.0,
      totalRevenue: 0.0,
      averageOrderValue: 0.0,
      numberOfOrders: 0,
      dailySales: [],
      topProducts: [],
    );
  }
  
  // Generate sample data for development
  factory SalesAnalytics.generateSample() {
    final random = math.Random();
    
    // Generate daily sales for the last 30 days
    final List<SalesDataPoint> dailySales = List.generate(
      30,
      (index) {
        final date = DateTime.now().subtract(Duration(days: 30 - index));
        final sales = 1000.0 + random.nextDouble() * 2000.0;
        return SalesDataPoint(date: date, amount: sales);
      },
    );
    
    // Calculate totals from daily sales
    final totalSales = dailySales.fold(0.0, (sum, item) => sum + item.amount);
    final numberOfOrders = 100 + random.nextInt(150);
    final averageOrderValue = totalSales / numberOfOrders;
    
    // Apply profit margin for revenue
    final totalRevenue = totalSales * 0.25; // 25% profit margin
    
    // Generate sample top products
    final List<String> productNames = [
      'Laptop Pro',
      'Smartphone X',
      'Wireless Earbuds',
      'Gaming Console',
      'Smart Watch',
      'Tablet Air',
      'Bluetooth Speaker',
      'Desk Chair',
      'Office Desk',
      'Monitor 4K',
    ];
    
    final List<TopProduct> topProducts = List.generate(
      10,
      (index) {
        final name = productNames[index];
        final quantity = 10 + random.nextInt(50);
        final revenue = (50.0 + random.nextDouble() * 200.0) * quantity;
        return TopProduct(
          name: name,
          quantity: quantity,
          revenue: revenue,
        );
      },
    );
    
    // Sort by revenue descending
    topProducts.sort((a, b) => b.revenue.compareTo(a.revenue));
    
    return SalesAnalytics(
      totalSales: totalSales,
      totalRevenue: totalRevenue,
      averageOrderValue: averageOrderValue,
      numberOfOrders: numberOfOrders,
      dailySales: dailySales,
      topProducts: topProducts,
    );
  }
}

class SalesDataPoint {
  final DateTime date;
  final double amount;
  
  SalesDataPoint({required this.date, required this.amount});
}

class TopProduct {
  final String name;
  final int quantity;
  final double revenue;
  
  TopProduct({
    required this.name,
    required this.quantity,
    required this.revenue,
  });
}

class SalesAnalyticsScreen extends StatefulWidget {
  const SalesAnalyticsScreen({super.key});

  @override
  State<SalesAnalyticsScreen> createState() => _SalesAnalyticsScreenState();
}

class _SalesAnalyticsScreenState extends State<SalesAnalyticsScreen> {
  bool _isLoading = true;
  String? _error;
  SalesAnalytics? _salesAnalytics;
  
  // Date range selection
  String _selectedPeriod = 'Monthly';
  final List<String> _periodOptions = ['Weekly', 'Monthly', 'Quarterly', 'Yearly'];

  @override
  void initState() {
    super.initState();
    _loadSalesAnalytics();
  }

  Future<void> _loadSalesAnalytics() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Use mock data until API is implemented
      await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay
      _salesAnalytics = SalesAnalytics.generateSample();

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
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
              onPressed: _loadSalesAnalytics,
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
          _buildPeriodSelector(),
          const SizedBox(height: 16),
          _buildSummaryCards(),
          const SizedBox(height: 24),
          _buildSalesChart(),
          const SizedBox(height: 24),
          _buildTopProductsList(),
        ],
      ),
    );
  }

  Widget _buildPeriodSelector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: DropdownButton<String>(
          value: _selectedPeriod,
          isExpanded: true,
          underline: const SizedBox(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                _selectedPeriod = newValue;
                _loadSalesAnalytics(); // Reload with new period
              });
            }
          },
          items: _periodOptions.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSummaryCards() {
    final analytics = _salesAnalytics!;
    
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildSummaryCard(
          title: 'Total Sales',
          value: '\$${analytics.totalSales.toStringAsFixed(2)}',
          icon: Icons.attach_money,
          color: Colors.green,
        ),
        _buildSummaryCard(
          title: 'Total Revenue',
          value: '\$${analytics.totalRevenue.toStringAsFixed(2)}',
          icon: Icons.trending_up,
          color: Colors.blue,
        ),
        _buildSummaryCard(
          title: 'Avg. Order Value',
          value: '\$${analytics.averageOrderValue.toStringAsFixed(2)}',
          icon: Icons.shopping_cart,
          color: Colors.orange,
        ),
        _buildSummaryCard(
          title: 'Orders',
          value: analytics.numberOfOrders.toString(),
          icon: Icons.receipt_long,
          color: Colors.purple,
        ),
      ],
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 18),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Spacer(),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesChart() {
    final analytics = _salesAnalytics!;
    
    if (analytics.dailySales.isEmpty) {
      return const Center(child: Text('No sales data available'));
    }

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sales Trend',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Last 30 days',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: 1,
                    verticalInterval: 1,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          // Show dates for every 5th day
                          if (value.toInt() % 5 == 0 && value.toInt() < analytics.dailySales.length) {
                            final date = analytics.dailySales[value.toInt()].date;
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                '${date.day}/${date.month}',
                                style: const TextStyle(fontSize: 10),
                              ),
                            );
                          }
                          return const SideTitleWidget(
                            axisSide: AxisSide.bottom,
                            child: Text(''),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 52,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              '\$${value.toInt()}',
                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: List.generate(
                        analytics.dailySales.length,
                        (index) => FlSpot(index.toDouble(), analytics.dailySales[index].amount),
                      ),
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blue.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopProductsList() {
    final analytics = _salesAnalytics!;
    
    if (analytics.topProducts.isEmpty) {
      return const Center(child: Text('No top products data available'));
    }

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Products',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: math.min(analytics.topProducts.length, 5),  // Limit to top 5 to avoid overflow
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final product = analytics.topProducts[index];
                return Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.primaries[index % Colors.primaries.length],
                      child: Text('${index + 1}', style: const TextStyle(fontSize: 12)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis, // Prevent text overflow
                          ),
                          Text(
                            '${product.quantity} units sold',
                            style: TextStyle(
                              fontSize: 12, 
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis, // Prevent text overflow
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '\$${product.revenue.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis, // Prevent text overflow
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}