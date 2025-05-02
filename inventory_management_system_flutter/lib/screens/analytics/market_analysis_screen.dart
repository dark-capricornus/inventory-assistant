import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MarketAnalysisScreen extends StatefulWidget {
  const MarketAnalysisScreen({super.key});

  @override
  State<MarketAnalysisScreen> createState() => _MarketAnalysisScreenState();
}

class _MarketAnalysisScreenState extends State<MarketAnalysisScreen> {
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _loadMarketData();
  }

  Future<void> _loadMarketData() async {
    setState(() {
      _isLoading = true;
    });
    
    // Simulate data loading
    await Future.delayed(const Duration(seconds: 1));
    
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Market Analysis',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 24),
          _buildSalesPredictionCard(),
          const SizedBox(height: 24),
          _buildInventoryOptimizationCard(),
          const SizedBox(height: 24),
          _buildPricingSuggestionsCard(),
          const SizedBox(height: 24),
          _buildProductDemandCard(),
        ],
      ),
    );
  }
  
  Widget _buildSalesPredictionCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sales Prediction',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement ML model refresh
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Refresh'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: 1,
                    verticalInterval: 1,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          );
                          String text;
                          switch (value.toInt()) {
                            case 0:
                              text = 'May';
                              break;
                            case 1:
                              text = 'Jun';
                              break;
                            case 2:
                              text = 'Jul';
                              break;
                            case 3:
                              text = 'Aug';
                              break;
                            case 4:
                              text = 'Sep';
                              break;
                            case 5:
                              text = 'Oct';
                              break;
                            default:
                              return Container();
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 8,
                            child: Text(text, style: style),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 10,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 8,
                            child: Text(
                              '\$${value.toInt()}K',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                        reservedSize: 42,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  ),
                  minX: 0,
                  maxX: 5,
                  minY: 0,
                  maxY: 50,
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 25),
                        FlSpot(1, 28),
                        FlSpot(2, 30),
                        FlSpot(3, 32),
                        FlSpot(4, 35),
                        FlSpot(5, 40),
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
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 25),
                        FlSpot(1, 23),
                        FlSpot(2, 26),
                        FlSpot(3, 24),
                        FlSpot(4, 30),
                        FlSpot(5, 28),
                      ],
                      isCurved: true,
                      color: Colors.grey,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dashArray: [5, 5],
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _legendItem('Predicted', Colors.blue),
                const SizedBox(width: 20),
                _legendItem('Last Year', Colors.grey),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Confidence Level: 85%',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Expected Growth: +12% in next quarter',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInventoryOptimizationCard() {
    final items = [
      {'name': 'Product A', 'current': 124, 'optimal': 100},
      {'name': 'Product B', 'current': 8, 'optimal': 25},
      {'name': 'Product C', 'current': 0, 'optimal': 15},
      {'name': 'Product D', 'current': 35, 'optimal': 30},
    ];
    
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Inventory Optimization',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Our AI suggests the following inventory adjustments:',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final int current = item['current'] as int;
                final int optimal = item['optimal'] as int;
                final bool needsRestock = current < optimal;
                final bool overstocked = current > optimal;
                
                return ListTile(
                  title: Text(
                    item['name'].toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Text('Current: ${item['current']}'),
                      const SizedBox(width: 12),
                      Text('Optimal: ${item['optimal']}'),
                    ],
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: needsRestock
                          ? Colors.red.withOpacity(0.1)
                          : overstocked
                              ? Colors.orange.withOpacity(0.1)
                              : Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      needsRestock
                          ? 'Order More'
                          : overstocked
                              ? 'Overstocked'
                              : 'Optimal',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: needsRestock
                            ? Colors.red
                            : overstocked
                                ? Colors.orange
                                : Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildPricingSuggestionsCard() {
    final items = [
      {
        'name': 'Product A',
        'current': '\$125.00',
        'suggestion': '\$129.99',
        'impact': '+3.5%'
      },
      {
        'name': 'Product B',
        'current': '\$49.99',
        'suggestion': '\$44.99',
        'impact': '-2.1%'
      },
      {
        'name': 'Product C',
        'current': '\$199.99',
        'suggestion': '\$189.99',
        'impact': '+5.2%'
      },
    ];
    
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pricing Suggestions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'ML-based pricing recommendations to maximize profit',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                
                return ListTile(
                  title: Text(
                    item['name'].toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    'Current: ${item['current']}',
                  ),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Suggest: ${item['suggestion']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Profit Impact: ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            item['impact'].toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color:
                                  item['impact'].toString().contains('+')
                                      ? Colors.green
                                      : Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Apply price suggestions
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Apply Price Suggestions'),
                        content: const Text(
                          'Are you sure you want to apply all pricing suggestions? This will update your product catalog.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _applyPriceSuggestions(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Apply'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.check),
                label: const Text('Apply Suggestions'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildProductDemandCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Product Demand Forecast',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 20,
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        String productName = '';
                        switch (group.x) {
                          case 0:
                            productName = 'Product A';
                            break;
                          case 1:
                            productName = 'Product B';
                            break;
                          case 2:
                            productName = 'Product C';
                            break;
                          case 3:
                            productName = 'Product D';
                            break;
                          case 4:
                            productName = 'Product E';
                            break;
                        }
                        return BarTooltipItem(
                          '$productName\n',
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '${rod.toY.toStringAsFixed(1)} units',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          String text = '';
                          switch (value.toInt()) {
                            case 0:
                              text = 'A';
                              break;
                            case 1:
                              text = 'B';
                              break;
                            case 2:
                              text = 'C';
                              break;
                            case 3:
                              text = 'D';
                              break;
                            case 4:
                              text = 'E';
                              break;
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(text),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(value.toInt().toString()),
                          );
                        },
                        reservedSize: 28,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 15,
                          width: 22,
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        BarChartRodData(
                          toY: 12,
                          width: 22,
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 8,
                          width: 22,
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        BarChartRodData(
                          toY: 10,
                          width: 22,
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: 10,
                          width: 22,
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        BarChartRodData(
                          toY: 7,
                          width: 22,
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(
                          toY: 18,
                          width: 22,
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        BarChartRodData(
                          toY: 14,
                          width: 22,
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [
                        BarChartRodData(
                          toY: 12,
                          width: 22,
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        BarChartRodData(
                          toY: 13,
                          width: 22,
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _legendItem('Predicted', Colors.blue),
                const SizedBox(width: 20),
                _legendItem('Current', Colors.grey.withOpacity(0.7)),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _legendItem(String title, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  void _applyPriceSuggestions(BuildContext context) {
    // Implement the logic to apply price suggestions
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Price suggestions applied successfully!'),
      ),
    );
  }
}