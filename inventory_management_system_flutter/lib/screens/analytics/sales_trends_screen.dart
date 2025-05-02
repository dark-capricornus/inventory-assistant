import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../services/analytics_service.dart';
import 'package:inventory_management_system_client/inventory_management_system_client.dart';

class SalesTrendsScreen extends StatefulWidget {
  const SalesTrendsScreen({super.key});

  @override
  State<SalesTrendsScreen> createState() => _SalesTrendsScreenState();
}

class _SalesTrendsScreenState extends State<SalesTrendsScreen> {
  bool _isLoading = true;
  String? _error;
  final DateTime _startDate = DateTime.now().subtract(const Duration(days: 30));
  final DateTime _endDate = DateTime.now().add(const Duration(days: 30));
  SalesPrediction? _prediction;

  @override
  void initState() {
    super.initState();
    _loadSalesTrends();
  }

  Future<void> _loadSalesTrends() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Get sales prediction data from the analytics service
      final analyticsService = AnalyticsService();
      final prediction = await analyticsService.getSalesPrediction(_startDate, _endDate);

      if (mounted) {
        setState(() {
          _prediction = prediction;
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
              onPressed: _loadSalesTrends,
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
          _buildSalesTrendChart(),
          const SizedBox(height: 24),
          _buildTopProductsList(),
        ],
      ),
    );
  }

  Widget _buildSummaryCards() {
    // Use the prediction data if available
    final predictedSales = _prediction?.predictedSales ?? 0.0;
    final confidence = _prediction?.confidence ?? 0.0;
    
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildSummaryCard(
          'Predicted Sales',
          '\$${predictedSales.toStringAsFixed(2)}',
          Icons.attach_money,
          Colors.blue,
        ),
        _buildSummaryCard(
          'Confidence Level',
          '${confidence.toStringAsFixed(1)}%',
          Icons.verified,
          Colors.green,
        ),
        _buildSummaryCard(
          'Forecast Date',
          _prediction != null ? 
            '${_prediction!.date.day}/${_prediction!.date.month}/${_prediction!.date.year}' : 
            'N/A',
          Icons.calendar_today,
          Colors.orange,
        ),
        _buildSummaryCard(
          'Growth Rate',
          '0%',
          Icons.trending_up,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesTrendChart() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sales Trend',
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
                  titlesData: const FlTitlesData(show: true),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
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

    final topProducts = [
      {'name': 'Wireless Headphones', 'sales': 12500.0, 'units': 250},
      {'name': 'Smart Watch', 'sales': 9800.0, 'units': 98},
      {'name': 'Bluetooth Speaker', 'sales': 7350.0, 'units': 147},
      {'name': 'USB-C Cable', 'sales': 3250.0, 'units': 325},
      {'name': 'Wireless Charger', 'sales': 2800.0, 'units': 70},
    ];
    
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Top Products',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: topProducts.length,
              itemBuilder: (context, index) {
                final product = topProducts[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.withOpacity(0.2),
                    child: Text('${index + 1}'),
                  ),
                  title: Text(product['name'] as String),
                  subtitle: Text('Sales: \$${(product['sales'] as double).toStringAsFixed(2)}'),
                  trailing: Text('${product['units']} units'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}