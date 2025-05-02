import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AccountsTrackerScreen extends StatefulWidget {
  const AccountsTrackerScreen({super.key});

  @override
  State<AccountsTrackerScreen> createState() => _AccountsTrackerScreenState();
}

class _AccountsTrackerScreenState extends State<AccountsTrackerScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = false;
  String? _searchQuery;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadAccountsData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadAccountsData() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts Tracker'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Summary'),
            Tab(text: 'Spot Sales'),
            Tab(text: 'Credit'),
            Tab(text: 'Collection'),
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
                      _buildSummaryTab(),
                      _buildSpotSalesTab(),
                      _buildCreditTab(),
                      _buildCollectionTab(),
                    ],
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTransactionDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search transactions...',
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
    );
  }

  Widget _buildSummaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFinancialSummaryCards(),
          const SizedBox(height: 24),
          _buildCashflowChart(),
          const SizedBox(height: 24),
          _buildAccountReceivableSection(),
          const SizedBox(height: 24),
          _buildRecentTransactions(),
        ],
      ),
    );
  }

  Widget _buildFinancialSummaryCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Financial Overview',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            _buildSummaryCard(
              title: 'Total Revenue',
              value: '\$124,350',
              change: '+12%',
              isPositive: true,
            ),
            _buildSummaryCard(
              title: 'Accounts Receivable',
              value: '\$42,150',
              change: '+5%',
              isPositive: false,
            ),
            _buildSummaryCard(
              title: 'Accounts Payable',
              value: '\$38,720',
              change: '-3%',
              isPositive: true,
            ),
            _buildSummaryCard(
              title: 'Cash Balance',
              value: '\$85,630',
              change: '+8%',
              isPositive: true,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required String change,
    required bool isPositive,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isPositive ? Colors.green : Colors.red,
                  size: 14,
                ),
                const SizedBox(width: 4),
                Text(
                  change,
                  style: TextStyle(
                    fontSize: 12,
                    color: isPositive ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  ' vs last month',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCashflowChart() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cash Flow',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 50,
                  minY: -20,
                  barGroups: [
                    _generateBarGroup(0, 32, -12),
                    _generateBarGroup(1, 38, -15),
                    _generateBarGroup(2, 35, -13),
                    _generateBarGroup(3, 40, -16),
                    _generateBarGroup(4, 42, -18),
                    _generateBarGroup(5, 48, -14),
                  ],
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(fontSize: 12);
                          String text;
                          switch (value.toInt()) {
                            case 0:
                              text = 'Jan';
                              break;
                            case 1:
                              text = 'Feb';
                              break;
                            case 2:
                              text = 'Mar';
                              break;
                            case 3:
                              text = 'Apr';
                              break;
                            case 4:
                              text = 'May';
                              break;
                            case 5:
                              text = 'Jun';
                              break;
                            default:
                              text = '';
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(text, style: style),
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
                            child: Text('\$${value.toInt()}K'),
                          );
                        },
                        reservedSize: 40,
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem('Income', Colors.blue),
                const SizedBox(width: 24),
                _buildLegendItem('Expenses', Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _generateBarGroup(int x, double income, double expense) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: income,
          color: Colors.blue,
          width: 12,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
        BarChartRodData(
          fromY: 0,
          toY: expense,
          color: Colors.red,
          width: 12,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
        ),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
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
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildAccountReceivableSection() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Accounts Receivable Aging',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildAgingCard(
                    title: 'Current',
                    amount: '\$18,450',
                    percentage: 43,
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: _buildAgingCard(
                    title: '1-30 Days',
                    amount: '\$12,350',
                    percentage: 29,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildAgingCard(
                    title: '31-60 Days',
                    amount: '\$7,230',
                    percentage: 17,
                    color: Colors.orange,
                  ),
                ),
                Expanded(
                  child: _buildAgingCard(
                    title: '60+ Days',
                    amount: '\$4,120',
                    percentage: 11,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgingCard({
    required String title,
    required String amount,
    required int percentage,
    required Color color,
  }) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: percentage / 100,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      color: color,
                      minHeight: 6,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '$percentage%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransactions() {
    // Sample transaction data
    final transactions = [
      {
        'id': 'TRX001',
        'type': 'Sale',
        'customer': 'ABC Corp',
        'amount': 2450.0,
        'date': '2023-06-28',
        'status': 'Completed',
      },
      {
        'id': 'TRX002',
        'type': 'Purchase',
        'customer': 'XYZ Suppliers',
        'amount': 1850.0,
        'date': '2023-06-27',
        'status': 'Pending',
      },
      {
        'id': 'TRX003',
        'type': 'Collection',
        'customer': 'Global Inc',
        'amount': 3200.0,
        'date': '2023-06-25',
        'status': 'Completed',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to full transaction list
              },
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            
            IconData iconData;
            Color iconColor;
            
            switch (transaction['type']) {
              case 'Sale':
                iconData = Icons.shopping_cart;
                iconColor = Colors.blue;
                break;
              case 'Purchase':
                iconData = Icons.shopping_bag;
                iconColor = Colors.orange;
                break;
              case 'Collection':
                iconData = Icons.account_balance_wallet;
                iconColor = Colors.green;
                break;
              default:
                iconData = Icons.receipt;
                iconColor = Colors.grey;
            }
            
            return Card(
              elevation: 1,
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: iconColor.withOpacity(0.1),
                  child: Icon(iconData, color: iconColor),
                ),
                title: Text(
                  '${transaction['type']} - ${transaction['customer']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text('${transaction['date']} • ${transaction['id']}'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${transaction['amount']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: transaction['status'] == 'Completed'
                            ? Colors.green.withOpacity(0.1)
                            : Colors.amber.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        transaction['status'] as String,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: transaction['status'] == 'Completed'
                              ? Colors.green
                              : Colors.amber[800],
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Navigate to transaction details
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSpotSalesTab() {
    // Sample spot sales data
    final spotSales = List.generate(15, (index) {
      final amount = 100.0 + (index * 153.75);
      final date = DateTime.now().subtract(Duration(days: index));
      
      return {
        'id': 'SS${1000 + index}',
        'customer': 'Customer ${index + 1}',
        'amount': amount,
        'date': '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
        'paymentMethod': index % 3 == 0 ? 'Cash' : (index % 3 == 1 ? 'Card' : 'UPI'),
      };
    });

    // Filter by search query if present
    final filteredSales = _searchQuery == null || _searchQuery!.isEmpty
        ? spotSales
        : spotSales
            .where((sale) =>
                sale['customer'].toString().toLowerCase().contains(_searchQuery!.toLowerCase()) ||
                sale['id'].toString().toLowerCase().contains(_searchQuery!.toLowerCase()))
            .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  'Spot Sales',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add new spot sale
                    _showAddTransactionDialog(initialType: 'Spot Sale');
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('New Sale'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: filteredSales.isEmpty
              ? const Center(
                  child: Text('No spot sales found matching your criteria.'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: filteredSales.length,
                  itemBuilder: (context, index) {
                    final sale = filteredSales[index];
                    Color methodColor;
                    
                    switch (sale['paymentMethod']) {
                      case 'Cash':
                        methodColor = Colors.green;
                        break;
                      case 'Card':
                        methodColor = Colors.blue;
                        break;
                      case 'UPI':
                        methodColor = Colors.purple;
                        break;
                      default:
                        methodColor = Colors.grey;
                    }

                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                      child: ListTile(
                        title: Text(
                          sale['customer'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text('${sale['date']} • ${sale['id']}'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$${sale['amount']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: methodColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                sale['paymentMethod'].toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: methodColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          // View sale details
                        },
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildCreditTab() {
    // Placeholder for credit tab implementation
    // Will be similar structure to spot sales with credit-specific fields
    return const Center(
      child: Text('Credit transactions will be displayed here'),
    );
  }

  Widget _buildCollectionTab() {
    // Placeholder for collection tab implementation
    // Will be similar structure to spot sales with collection-specific fields
    return const Center(
      child: Text('Collection records will be displayed here'),
    );
  }

  void _showAddTransactionDialog({String? initialType}) {
    final formKey = GlobalKey<FormState>();
    final typeController = TextEditingController(text: initialType);
    final customerController = TextEditingController();
    final amountController = TextEditingController();
    final dateController = TextEditingController(
        text: DateTime.now().toString().substring(0, 10));
    final paymentMethodController = TextEditingController(text: 'Cash');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add ${initialType ?? 'Transaction'}'),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    value: typeController.text.isEmpty ? null : typeController.text,
                    items: ['Spot Sale', 'Credit Sale', 'Collection', 'Purchase']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        typeController.text = newValue;
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Transaction Type',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a type';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: customerController,
                    decoration: const InputDecoration(
                      labelText: 'Customer/Supplier',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a customer/supplier';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: amountController,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      prefixText: '\$',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an amount';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      labelText: 'Date (YYYY-MM-DD)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a date';
                      }
                      // Add more validation for date format if needed
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: paymentMethodController.text.isEmpty ? null : paymentMethodController.text,
                    items: ['Cash', 'Card', 'UPI', 'Bank Transfer', 'Check']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        paymentMethodController.text = newValue;
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Payment Method',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a payment method';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Save transaction
                  Navigator.pop(context);
                  
                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Transaction added successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}