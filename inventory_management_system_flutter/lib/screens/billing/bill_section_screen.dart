import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillSectionScreen extends StatefulWidget {
  const BillSectionScreen({super.key});

  @override
  State<BillSectionScreen> createState() => _BillSectionScreenState();
}

class _BillSectionScreenState extends State<BillSectionScreen> {
  bool _isLoading = false;
  final currencyFormatter = NumberFormat.currency(symbol: '\$');
  final dateFormatter = DateFormat('MMM dd, yyyy');
  
  @override
  void initState() {
    super.initState();
    _loadBillingData();
  }

  Future<void> _loadBillingData() async {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Billing'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Show search
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterOptions();
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildBillingContent(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _navigateToCreateBill();
        },
        label: const Text('New Bill'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBillingContent() {
    // Sample data for recent bills
    final recentBills = List.generate(20, (index) {
      final date = DateTime.now().subtract(Duration(days: index));
      final isPaid = index % 3 != 0;
      final isPartiallyPaid = !isPaid && index % 4 == 0;
      
      return {
        'id': 'BL${10000 + index}',
        'customer': 'Customer ${index + 1}',
        'date': date,
        'amount': 500.0 + (index * 125.50),
        'status': isPaid
            ? 'Paid'
            : isPartiallyPaid
                ? 'Partially Paid'
                : 'Pending',
        'items': 3 + (index % 5),
      };
    });

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBillingSummaryCards(),
          const SizedBox(height: 24),
          const Text(
            'Recent Bills',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recentBills.length,
            itemBuilder: (context, index) {
              final bill = recentBills[index];
              
              Color statusColor;
              switch (bill['status']) {
                case 'Paid':
                  statusColor = Colors.green;
                  break;
                case 'Partially Paid':
                  statusColor = Colors.amber;
                  break;
                case 'Pending':
                  statusColor = Colors.red;
                  break;
                default:
                  statusColor = Colors.grey;
              }
              
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  onTap: () => _viewBillDetails(bill),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bill['customer'].toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Bill #${bill['id']}',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  currencyFormatter.format(bill['amount']),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${bill['items']} items',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(height: 1),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Date: ${dateFormatter.format(bill['date'] as DateTime)}',
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: statusColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                bill['status'].toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: statusColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (bill['status'] == 'Pending' || bill['status'] == 'Partially Paid')
                              OutlinedButton.icon(
                                onPressed: () => _recordPayment(bill),
                                icon: const Icon(Icons.payment, size: 16),
                                label: const Text('Record Payment'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.blue,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                              ),
                            const SizedBox(width: 8),
                            OutlinedButton.icon(
                              onPressed: () => _downloadBill(bill),
                              icon: const Icon(Icons.download, size: 16),
                              label: const Text('Download'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.grey[700],
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBillingSummaryCards() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Billing Summary',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildSummaryItem(
                    title: 'Total Bills',
                    value: '248',
                    icon: Icons.receipt_long,
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: _buildSummaryItem(
                    title: 'Pending',
                    value: '32',
                    icon: Icons.hourglass_empty,
                    color: Colors.orange,
                  ),
                ),
                Expanded(
                  child: _buildSummaryItem(
                    title: 'Paid',
                    value: '216',
                    icon: Icons.check_circle,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildAmountSummary(
                    title: 'Total Revenue',
                    amount: 142580.75,
                    isPositive: true,
                  ),
                ),
                Expanded(
                  child: _buildAmountSummary(
                    title: 'Pending Amount',
                    amount: 23450.50,
                    isPositive: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildAmountSummary({
    required String title,
    required double amount,
    required bool isPositive,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          currencyFormatter.format(amount),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: isPositive ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filter Bills',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Status',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  FilterChip(
                    label: const Text('All'),
                    selected: true,
                    onSelected: (selected) {},
                  ),
                  FilterChip(
                    label: const Text('Paid'),
                    selected: false,
                    onSelected: (selected) {},
                  ),
                  FilterChip(
                    label: const Text('Pending'),
                    selected: false,
                    onSelected: (selected) {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Date Range',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  FilterChip(
                    label: const Text('Today'),
                    selected: false,
                    onSelected: (selected) {},
                  ),
                  FilterChip(
                    label: const Text('This Week'),
                    selected: false,
                    onSelected: (selected) {},
                  ),
                  FilterChip(
                    label: const Text('This Month'),
                    selected: true,
                    onSelected: (selected) {},
                  ),
                  FilterChip(
                    label: const Text('Custom'),
                    selected: false,
                    onSelected: (selected) {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Apply Filters'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToCreateBill() {
    // Navigate to create bill form
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create New Bill'),
          content: const Text('This would navigate to a comprehensive bill creation form.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _viewBillDetails(Map<String, dynamic> bill) {
    // Navigate to bill details screen
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bill Details: ${bill['id']}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Customer: ${bill['customer']}'),
              Text('Amount: ${currencyFormatter.format(bill['amount'])}'),
              Text('Date: ${dateFormatter.format(bill['date'] as DateTime)}'),
              Text('Status: ${bill['status']}'),
              Text('Items: ${bill['items']}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _recordPayment(Map<String, dynamic> bill) {
    // Show payment recording dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Record Payment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: 'Cash',
                items: ['Cash', 'Card', 'Bank Transfer', 'Check', 'UPI']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
                decoration: const InputDecoration(
                  labelText: 'Payment Method',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Record'),
              onPressed: () {
                Navigator.of(context).pop();
                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Payment recorded successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _downloadBill(Map<String, dynamic> bill) {
    // Show download in progress and then success
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Downloading bill...'),
      ),
    );
    
    // Simulate download delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {  // Add mounted check to avoid using BuildContext after disposal
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bill downloaded successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    });
  }
}