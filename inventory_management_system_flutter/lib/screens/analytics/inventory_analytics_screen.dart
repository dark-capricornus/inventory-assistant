import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../models/inventory_analytics.dart';
import 'dart:math'; // For generating sample data

class InventoryAnalyticsScreen extends StatefulWidget {
  const InventoryAnalyticsScreen({super.key});

  @override
  State<InventoryAnalyticsScreen> createState() => _InventoryAnalyticsScreenState();
}

class _InventoryAnalyticsScreenState extends State<InventoryAnalyticsScreen> {
  bool _isLoading = true;
  String? _error;
  InventoryAnalytics? _inventoryAnalytics;

  @override
  void initState() {
    super.initState();
    _loadInventoryAnalytics();
  }

  Future<void> _loadInventoryAnalytics() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Simulating API call with a delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Generate sample data
      final random = Random();
      
      // Generate category values for pie chart
      final categories = <String, double>{
        'Electronics': 25000.0 + random.nextDouble() * 5000,
        'Clothing': 18000.0 + random.nextDouble() * 4000,
        'Groceries': 12000.0 + random.nextDouble() * 3000,
        'Furniture': 15000.0 + random.nextDouble() * 3500,
        'Books': 8000.0 + random.nextDouble() * 2000,
      };
      
      // Calculate total value from categories
      final totalValue = categories.values.fold(0.0, (sum, value) => sum + value);
      
      // Generate low stock items
      final lowStockList = [
        LowStockItem(
          name: 'Smartphone XYZ',
          currentStock: 3,
          reorderPoint: 5,
        ),
        LowStockItem(
          name: 'Laptop Pro',
          currentStock: 2,
          reorderPoint: 4,
        ),
        LowStockItem(
          name: 'Wireless Earbuds',
          currentStock: 4,
          reorderPoint: 10,
        ),
        LowStockItem(
          name: 'Smart Watch',
          currentStock: 1,
          reorderPoint: 3,
        ),
        LowStockItem(
          name: 'USB-C Cable',
          currentStock: 8,
          reorderPoint: 15,
        ),
      ];
      
      _inventoryAnalytics = InventoryAnalytics(
        totalProducts: 120 + random.nextInt(30),
        totalValue: totalValue,
        lowStockItems: lowStockList.length,
        outOfStock: 2 + random.nextInt(3),
        categoryValues: categories,
        lowStockList: lowStockList,
      );

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
              onPressed: _loadInventoryAnalytics,
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
          _buildInventoryChart(),
          const SizedBox(height: 24),
          _buildLowStockList(),
        ],
      ),
    );
  }

  Widget _buildSummaryCards() {
    // Use the _inventoryAnalytics field to display actual values
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.7, // Increased from 1.5 to provide more vertical space
      children: [
        _buildSummaryCard(
          'Total Products',
          _inventoryAnalytics?.totalProducts.toString() ?? '0',
          Icons.inventory,
          Colors.blue,
        ),
        _buildSummaryCard(
          'Total Value',
          '\$${_inventoryAnalytics?.totalValue.toStringAsFixed(2) ?? '0.00'}',
          Icons.attach_money,
          Colors.green,
        ),
        _buildSummaryCard(
          'Low Stock Items',
          _inventoryAnalytics?.lowStockItems.toString() ?? '0',
          Icons.warning,
          Colors.orange,
        ),
        _buildSummaryCard(
          'Out of Stock',
          _inventoryAnalytics?.outOfStock.toString() ?? '0',
          Icons.error,
          Colors.red,
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
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
            const SizedBox(height: 2),
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

  Widget _buildInventoryChart() {
    // Use _inventoryAnalytics to generate chart sections
    List<PieChartSectionData> sections = [];
    
    if (_inventoryAnalytics != null && _inventoryAnalytics!.categoryValues.isNotEmpty) {
      int i = 0;
      final colors = [
        Colors.blue, 
        Colors.green, 
        Colors.orange, 
        Colors.purple, 
        Colors.red,
        Colors.teal,
      ];
      
      _inventoryAnalytics!.categoryValues.forEach((category, value) {
        sections.add(
          PieChartSectionData(
            color: colors[i % colors.length],
            value: value,
            title: category,
            radius: 50,
            titleStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
        i++;
      });
    }
    
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Inventory Value by Category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: sections,
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLowStockList() {
    final lowStockItems = _inventoryAnalytics?.lowStockList ?? [];
    
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Low Stock Items',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: lowStockItems.length,
              itemBuilder: (context, index) {
                final item = lowStockItems[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Current Stock: ${item.currentStock}'),
                  trailing: Text('Reorder Point: ${item.reorderPoint}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}