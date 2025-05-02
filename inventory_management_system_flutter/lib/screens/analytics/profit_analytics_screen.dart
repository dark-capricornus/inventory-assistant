import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../models/profit_margin.dart';
import '../../services/analytics_service.dart';

class ProfitAnalyticsScreen extends StatefulWidget {
  const ProfitAnalyticsScreen({super.key});

  @override
  State<ProfitAnalyticsScreen> createState() => _ProfitAnalyticsScreenState();
}

class _ProfitAnalyticsScreenState extends State<ProfitAnalyticsScreen> {
  bool _isLoading = true;
  String? _error;
  ProfitMargin? _profitMargin;

  @override
  void initState() {
    super.initState();
    _loadProfitAnalytics();
  }

  Future<void> _loadProfitAnalytics() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Get profit analytics data from the analytics service
      final analyticsService = AnalyticsService();
      _profitMargin = await analyticsService.getProfitAnalytics();

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
              onPressed: _loadProfitAnalytics,
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
          _buildProfitChart(),
          const SizedBox(height: 24),
          _buildProfitBreakdown(),
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
          'Gross Profit',
          '\$${_profitMargin != null ? _profitMargin!.grossProfit.toStringAsFixed(2) : '0.00'}',
          Icons.trending_up,
          Colors.green,
        ),
        _buildSummaryCard(
          'Net Profit',
          '\$${_profitMargin != null ? _profitMargin!.netProfit.toStringAsFixed(2) : '0.00'}',
          Icons.account_balance,
          Colors.blue,
        ),
        _buildSummaryCard(
          'Gross Margin',
          '${_profitMargin != null ? _profitMargin!.grossMarginPercentage.toStringAsFixed(1) : '0'}%',
          Icons.percent,
          Colors.orange,
        ),
        _buildSummaryCard(
          'Net Margin',
          '${_profitMargin != null ? _profitMargin!.netMarginPercentage.toStringAsFixed(1) : '0'}%',
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

  Widget _buildProfitChart() {
    // Use empty list as fallback if _profitMargin or profitTrend is null
    final trendData = _profitMargin?.profitTrend ?? [];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profit Trend',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: trendData.isEmpty
                  ? const Center(child: Text('No trend data available'))
                  : LineChart(
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
                                if (value.toInt() >= 0 && value.toInt() < trendData.length) {
                                  // Use month abbreviation from the date
                                  final month = trendData[value.toInt()].date.month;
                                  final monthNames = ['', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                                  return Text(
                                    monthNames[month],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  );
                                }
                                return const Text('');
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  '\$${value.toInt()}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                );
                              },
                            ),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: const Color(0xff37434d)),
                        ),
                        minX: 0,
                        maxX: trendData.length - 1.0,
                        minY: 0,
                        maxY: trendData.isEmpty ? 5 : trendData.map((e) => e.profit).reduce((a, b) => a > b ? a : b) * 1.2,
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              for (int i = 0; i < trendData.length; i++)
                                FlSpot(i.toDouble(), trendData[i].profit),
                            ],
                            isCurved: true,
                            color: Colors.blue,
                            barWidth: 3,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: true),
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

  Widget _buildProfitBreakdown() {
    // Sample data for profit breakdown
    final sampleData = [
      ProfitBreakdown(category: 'Electronics', amount: 25000, percentage: 40),
      ProfitBreakdown(category: 'Furniture', amount: 15000, percentage: 24),
      ProfitBreakdown(category: 'Clothing', amount: 12500, percentage: 20),
      ProfitBreakdown(category: 'Accessories', amount: 10000, percentage: 16),
    ];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profit Breakdown by Category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: [
                    PieChartSectionData(
                      value: 40,
                      title: '40%',
                      color: Colors.blue,
                      radius: 100,
                    ),
                    PieChartSectionData(
                      value: 24,
                      title: '24%',
                      color: Colors.green,
                      radius: 100,
                    ),
                    PieChartSectionData(
                      value: 20,
                      title: '20%',
                      color: Colors.red,
                      radius: 100,
                    ),
                    PieChartSectionData(
                      value: 16,
                      title: '16%',
                      color: Colors.yellow,
                      radius: 100,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Category Details:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sampleData.length,
              itemBuilder: (context, index) {
                final item = sampleData[index];
                Color indicatorColor;
                switch (index) {
                  case 0:
                    indicatorColor = Colors.blue;
                    break;
                  case 1:
                    indicatorColor = Colors.green;
                    break;
                  case 2:
                    indicatorColor = Colors.red;
                    break;
                  case 3:
                    indicatorColor = Colors.yellow;
                    break;
                  default:
                    indicatorColor = Colors.grey;
                }

                return ListTile(
                  leading: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: indicatorColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  title: Text(item.category),
                  subtitle: Text('\$${item.amount.toStringAsFixed(2)}'),
                  trailing: Text('${item.percentage.toStringAsFixed(1)}%'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}