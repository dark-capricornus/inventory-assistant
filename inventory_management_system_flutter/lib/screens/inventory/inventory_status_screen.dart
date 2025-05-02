import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class InventoryStatusScreen extends StatefulWidget {
  const InventoryStatusScreen({super.key});

  @override
  State<InventoryStatusScreen> createState() => _InventoryStatusScreenState();
}

class _InventoryStatusScreenState extends State<InventoryStatusScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = false;
  String? _searchQuery;
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Electronics',
    'Clothing',
    'Furniture',
    'Food',
    'Others'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadInventoryData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadInventoryData() async {
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

  void _onSearch(String query) {
    setState(() {
      _searchQuery = query.isEmpty ? null : query;
    });
  }

  void _onCategoryChanged(String? newValue) {
    if (newValue != null) {
      setState(() {
        _selectedCategory = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Status'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overall Status'),
            Tab(text: 'Low Stock'),
            Tab(text: 'Stock Value'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _buildSearchBar(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildOverallStatusTab(),
                      _buildLowStockTab(),
                      _buildStockValueTab(),
                    ],
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show add inventory item dialog or navigate to add screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search inventory items...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchQuery != null && _searchQuery!.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        _onSearch('');
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: _onSearch,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = category == _selectedCategory;
                
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        _onCategoryChanged(category);
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverallStatusTab() {
    // Sample data for inventory items
    final items = List.generate(20, (index) {
      final inStock = index % 5 != 0;
      final lowStock = index % 4 == 0 && inStock;
      final quantity = inStock ? (lowStock ? (index % 10) : (index * 3)) : 0;
      final category = _categories[1 + (index % (_categories.length - 1))];
      
      return {
        'id': 'ITEM${1000 + index}',
        'name': 'Product ${index + 1}',
        'category': category,
        'quantity': quantity,
        'price': (index + 1) * 9.99,
        'status': quantity == 0 ? 'Out of Stock' : (quantity < 10 ? 'Low Stock' : 'In Stock'),
      };
    });

    // Filter by category if not 'All'
    final filteredByCategory = _selectedCategory == 'All'
        ? items
        : items.where((item) => item['category'] == _selectedCategory).toList();

    // Further filter by search query if present
    final filteredItems = _searchQuery == null || _searchQuery!.isEmpty
        ? filteredByCategory
        : filteredByCategory
            .where((item) =>
                item['name'].toString().toLowerCase().contains(_searchQuery!.toLowerCase()) ||
                item['id'].toString().toLowerCase().contains(_searchQuery!.toLowerCase()))
            .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildInventorySummaryCards(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                'Inventory Items',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(Icons.filter_list),
              SizedBox(width: 8),
              Text('Filter'),
            ],
          ),
        ),
        Expanded(
          child: filteredItems.isEmpty
              ? const Center(
                  child: Text('No items found matching your criteria.'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    Color statusColor;
                    
                    switch (item['status']) {
                      case 'In Stock':
                        statusColor = Colors.green;
                        break;
                      case 'Low Stock':
                        statusColor = Colors.orange;
                        break;
                      case 'Out of Stock':
                        statusColor = Colors.red;
                        break;
                      default:
                        statusColor = Colors.grey;
                    }

                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.withOpacity(0.1),
                          child: Text(item['id'].toString().substring(4)),
                        ),
                        title: Text(item['name'].toString()),
                        subtitle: Text('${item['category']} • \$${item['price']}'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Qty: ${item['quantity']}'),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: statusColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                item['status'].toString(),
                                style: TextStyle(
                                  color: statusColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          // Navigate to item details
                        },
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildInventorySummaryCards() {
    return Row(
      children: [
        Expanded(
          child: _buildSummaryCard(
            title: 'Total Items',
            value: '1,234',
            icon: Icons.inventory,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildSummaryCard(
            title: 'Low Stock',
            value: '28',
            icon: Icons.warning,
            color: Colors.orange,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildSummaryCard(
            title: 'Out of Stock',
            value: '15',
            icon: Icons.error,
            color: Colors.red,
          ),
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
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLowStockTab() {
    // Sample low stock items
    final lowStockItems = List.generate(10, (index) {
      final quantity = 1 + (index % 9);
      final threshold = 10 + (index % 10);
      final category = _categories[1 + (index % (_categories.length - 1))];
      
      return {
        'id': 'ITEM${2000 + index}',
        'name': 'Low Stock Product ${index + 1}',
        'category': category,
        'quantity': quantity,
        'threshold': threshold,
        'daysToOutOfStock': 3 + (index % 14),
      };
    });

    // Filter by category if not 'All'
    final filteredItems = _selectedCategory == 'All'
        ? lowStockItems
        : lowStockItems.where((item) => item['category'] == _selectedCategory).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  'Low Stock Items',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Generate purchase orders for low stock items
                  },
                  icon: const Icon(Icons.shopping_cart, size: 16),
                  label: const Text('Order All', style: TextStyle(fontSize: 13)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: filteredItems.isEmpty
              ? const Center(
                  child: Text('No items found matching your criteria.'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    final daysLeft = item['daysToOutOfStock'] as int;
                    final urgencyColor = daysLeft < 5 ? Colors.red : (daysLeft < 10 ? Colors.orange : Colors.amber);
                    
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['name'].toString(),
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 4),
                                      Text('Category: ${item['category']}'),
                                      Text(
                                        'Qty: ${item['quantity']} (Threshold: ${item['threshold']})',
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${item['daysToOutOfStock']} days left',
                                      style: TextStyle(
                                        color: urgencyColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Create purchase order
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(60, 25),
                                        padding: EdgeInsets.zero,
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                      ),
                                      child: const Text('Order', style: TextStyle(fontSize: 12)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildStockValueTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 1200), // Limit maximum height
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Inventory Value Distribution',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: _buildCategoryValueChart(),
            ),
            const SizedBox(height: 24),
            const Text(
              'Stock Value Trend',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: _buildStockValueTrendChart(),
            ),
            const SizedBox(height: 24),
            _buildTopValueItemsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryValueChart() {
    return SizedBox(
      height: 300,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 35,
              title: '35%',
              color: Colors.blue,
              radius: 100,
              titleStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            PieChartSectionData(
              value: 25,
              title: '25%',
              color: Colors.green,
              radius: 100,
              titleStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            PieChartSectionData(
              value: 20,
              title: '20%',
              color: Colors.orange,
              radius: 100,
              titleStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            PieChartSectionData(
              value: 15,
              title: '15%',
              color: Colors.purple,
              radius: 100,
              titleStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            PieChartSectionData(
              value: 5,
              title: '5%',
              color: Colors.red,
              radius: 100,
              titleStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
          centerSpaceRadius: 40,
          sectionsSpace: 2,
        ),
      ),
    );
  }

  Widget _buildStockValueTrendChart() {
    return SizedBox(
      height: 250,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 20,
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
                getTitlesWidget: (value, meta) {
                  Widget text;
                  switch (value.toInt()) {
                    case 0:
                      text = const Text('Jan');
                      break;
                    case 2:
                      text = const Text('Mar');
                      break;
                    case 4:
                      text = const Text('May');
                      break;
                    case 6:
                      text = const Text('Jul');
                      break;
                    case 8:
                      text = const Text('Sep');
                      break;
                    case 10:
                      text = const Text('Nov');
                      break;
                    default:
                      text = const Text('');
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: text,
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
                    child: Text('\$${value.toInt()}K'),
                  );
                },
                reservedSize: 40,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey.withOpacity(0.5)),
          ),
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 150,
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 70),
                FlSpot(1, 80),
                FlSpot(2, 95),
                FlSpot(3, 90),
                FlSpot(4, 110),
                FlSpot(5, 105),
                FlSpot(6, 120),
                FlSpot(7, 130),
                FlSpot(8, 125),
                FlSpot(9, 135),
                FlSpot(10, 140),
                FlSpot(11, 130),
              ],
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
    );
  }

  Widget _buildTopValueItemsSection() {
    final topItems = [
      {'name': 'Product A', 'quantity': 125, 'value': 12500.0},
      {'name': 'Product B', 'quantity': 50, 'value': 9500.0},
      {'name': 'Product C', 'quantity': 200, 'value': 7000.0},
      {'name': 'Product D', 'quantity': 30, 'value': 6000.0},
      {'name': 'Product E', 'quantity': 80, 'value': 5600.0},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,  // Add this to avoid extra space
      children: [
        const Text(
          'Top Value Items',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...topItems.map((item) => _buildTopValueItemRow(item)),
      ],
    );
  }

  Widget _buildTopValueItemRow(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                item['name'].toString(),
                style: const TextStyle(fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Qty: ${item['quantity']}',
                overflow: TextOverflow.ellipsis, // Prevent text overflow
              ),
            ),
            FittedBox( // Wrap in FittedBox to handle large currency values
              fit: BoxFit.scaleDown,
              child: Text(
                '\$${item['value'].toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}