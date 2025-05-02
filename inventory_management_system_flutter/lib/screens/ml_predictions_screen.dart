import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/ml_prediction.dart';
import '../services/ml_service.dart';

class MLPredictionsScreen extends StatefulWidget {
  final String productId;
  final double currentPrice;

  const MLPredictionsScreen({
    super.key,
    required this.productId,
    required this.currentPrice,
  });

  @override
  State<MLPredictionsScreen> createState() => _MLPredictionsScreenState();
}

class _MLPredictionsScreenState extends State<MLPredictionsScreen> {
  final MLService _mlService = MLService();
  bool _isLoading = false;
  String? _error;
  SalesPrediction? _salesPrediction;
  InventoryOptimization? _inventoryOptimization;
  PricingSuggestion? _pricingSuggestion;
  static const List<String> _inventoryTitles = ['Optimal', 'Reorder', 'Safety'];

  @override
  void initState() {
    super.initState();
    _loadPredictions();
  }

  Future<void> _loadPredictions() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final salesPrediction = await _mlService.getSalesForecast(
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 30)),
      );
      final inventoryOptimization = await _mlService.getInventoryOptimization(
        productId: widget.productId,
      );
      final pricingSuggestion = await _mlService.getPricingSuggestion(
        productId: widget.productId,
      );

      setState(() {
        _salesPrediction = salesPrediction;
        _inventoryOptimization = inventoryOptimization;
        _pricingSuggestion = pricingSuggestion;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Widget _buildSalesChart() {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: true),
          titlesData: const FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 0),
                FlSpot(1, _salesPrediction!.predictedSales),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              dotData: const FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInventoryChart() {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: _inventoryOptimization!.recommendedStock * 1.2,
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: _inventoryOptimization!.recommendedStock.toDouble(),
                  color: Colors.green,
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: _inventoryOptimization!.reorderPoint,
                  color: Colors.orange,
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: _inventoryOptimization!.safetyStock,
                  color: Colors.red,
                ),
              ],
            ),
          ],
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(_inventoryTitles[value.toInt()]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPricingChart() {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: true),
          titlesData: const FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(widget.currentPrice, 0),
                FlSpot(_pricingSuggestion!.suggestedPrice, _pricingSuggestion!.expectedDemand),
              ],
              isCurved: true,
              color: Colors.purple,
              barWidth: 3,
              dotData: const FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ML Predictions'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error: $_error',
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadPredictions,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_salesPrediction != null) ...[
                        const Text(
                          'Sales Forecast',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildSalesChart(),
                        Text(
                          'Predicted sales: ${_salesPrediction!.predictedSales.toStringAsFixed(2)}',
                        ),
                        Text(
                          'Confidence: ${_salesPrediction!.confidence.toStringAsFixed(2)}%',
                        ),
                        const SizedBox(height: 16),
                      ],
                      if (_inventoryOptimization != null) ...[
                        const Text(
                          'Inventory Optimization',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildInventoryChart(),
                        Text(
                          'Optimal stock level: ${_inventoryOptimization!.recommendedStock.toStringAsFixed(2)}',
                        ),
                        Text(
                          'Reorder point: ${_inventoryOptimization!.reorderPoint.toStringAsFixed(2)}',
                        ),
                        Text(
                          'Safety stock: ${_inventoryOptimization!.safetyStock.toStringAsFixed(2)}',
                        ),
                        const SizedBox(height: 16),
                      ],
                      if (_pricingSuggestion != null) ...[
                        const Text(
                          'Pricing Suggestion',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildPricingChart(),
                        Text(
                          'Suggested price: ${_pricingSuggestion!.suggestedPrice.toStringAsFixed(2)}',
                        ),
                        Text(
                          'Expected demand: ${_pricingSuggestion!.expectedDemand.toStringAsFixed(2)}',
                        ),
                        Text(
                          'Price elasticity: ${_pricingSuggestion!.priceElasticity.toStringAsFixed(2)}',
                        ),
                        const SizedBox(height: 16),
                      ],
                    ],
                  ),
                ),
    );
  }
} 