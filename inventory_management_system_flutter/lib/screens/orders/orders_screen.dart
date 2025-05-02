import 'package:flutter/material.dart';
import 'package:inventory_management_system_client/inventory_management_system_client.dart';
import '../../services/order_service.dart';

/// Screen to manage and view orders
class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final _orderService = OrderService();
  bool _isLoading = true;
  String? _error;
  List<Sale> _orders = [];

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Fetch orders using the order service
      final orders = await _orderService.getSalesOrders();
      
      if (mounted) {
        setState(() {
          _orders = orders;
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

  Future<void> _createNewOrder() async {
    // Show dialog to create new order
    if (!mounted) return;

    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext dialogContext) {
        String customer = '';
        double amount = 0.0;
        String notes = '';
        
        return AlertDialog(
          title: const Text('Create New Order'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Customer Name',
                    hintText: 'Enter customer name',
                  ),
                  onChanged: (value) {
                    customer = value;
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Order Amount',
                    hintText: 'Enter total amount',
                    prefixText: '\$',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    amount = double.tryParse(value) ?? 0.0;
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Notes (Optional)',
                    hintText: 'Enter any additional notes',
                  ),
                  maxLines: 2,
                  onChanged: (value) {
                    notes = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(null);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (customer.isEmpty || amount <= 0) {
                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter valid customer name and amount'),
                    ),
                  );
                  return;
                }
                
                Navigator.of(dialogContext).pop({
                  'customer': customer,
                  'amount': amount,
                  'notes': notes.isNotEmpty ? notes : null,
                });
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );

    // If dialog was cancelled or dismissed
    if (result == null) return;
    
    try {
      if (!mounted) return;
      setState(() => _isLoading = true);
      
      // Create order with minimal data
      final items = <Map<String, dynamic>>[
        {'product': 'Product', 'quantity': 1, 'price': result['amount']}
      ];
      
      // Save order using the service
      await _orderService.createSalesOrder(
        customer: result['customer'],
        amount: result['amount'],
        items: items,
        notes: result['notes'],
      );
      
      // Reload orders to see the new one
      await _loadOrders();
      
      if (!mounted) return;
      
      // Using a post-frame callback to avoid BuildContext across async gaps
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Order created successfully!'),
            ),
          );
        }
      });
      
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      
      // Using a post-frame callback to avoid BuildContext across async gaps
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to create order: ${e.toString()}'),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadOrders,
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _createNewOrder,
          ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewOrder,
        heroTag: 'orders_fab', // Add unique hero tag
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $_error'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadOrders,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.inbox_outlined, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'No orders available',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Create New Order'),
              onPressed: _createNewOrder,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _orders.length,
      itemBuilder: (context, index) {
        final order = _orders[index];
        final orderDate = order.createdAt;
        final dateStr = '${orderDate.day}/${orderDate.month}/${orderDate.year}';
        
        // Determine status color
        Color statusColor;
        switch (order.status) {
          case 'Completed':
            statusColor = Colors.green;
            break;
          case 'Processing':
            statusColor = Colors.blue;
            break;
          case 'Pending':
            statusColor = Colors.orange;
            break;
          default:
            statusColor = Colors.grey;
        }
        
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: ExpansionTile(
            title: Text('Order #${order.invoiceNumber}'),
            subtitle: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: statusColor),
                  ),
                  child: Text(
                    order.status,
                    style: TextStyle(color: statusColor, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),
                Text('• Date: $dateStr'),
              ],
            ),
            trailing: Text(
              '\$${order.netAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Customer ID: ${order.partyId}'), // In a real app, you'd fetch customer name
                    if (order.notes != null && order.notes!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text('Notes: ${order.notes}'),
                      ),
                    const SizedBox(height: 8),
                    Text('Total Amount: \$${order.totalAmount.toStringAsFixed(2)}'),
                    Text('Tax: \$${order.taxAmount.toStringAsFixed(2)}'),
                    if (order.discountAmount != null && order.discountAmount! > 0)
                      Text('Discount: \$${order.discountAmount!.toStringAsFixed(2)}'),
                    Text(
                      'Net Amount: \$${order.netAmount.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Paid: \$${order.paidAmount.toStringAsFixed(2)}'),
                    Text(
                      'Balance: \$${(order.netAmount - order.paidAmount).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: order.netAmount > order.paidAmount ? Colors.red : Colors.green,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (order.netAmount > order.paidAmount)
                          TextButton(
                            onPressed: () async {
                              // Record payment
                              final remainingAmount = order.netAmount - order.paidAmount;
                              
                              if (!mounted) return;

                              // Use dialog with result callback pattern
                              final paymentResult = await showDialog<double>(
                                context: context,
                                builder: (BuildContext dialogContext) {
                                  double paymentAmount = remainingAmount;
                                  
                                  return AlertDialog(
                                    title: const Text('Record Payment'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Remaining balance: \$${remainingAmount.toStringAsFixed(2)}',
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 16),
                                        TextField(
                                          decoration: const InputDecoration(
                                            labelText: 'Payment Amount',
                                            hintText: 'Enter amount',
                                            prefixText: '\$',
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {
                                            paymentAmount = double.tryParse(value) ?? remainingAmount;
                                          },
                                          controller: TextEditingController(
                                            text: remainingAmount.toStringAsFixed(2),
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(dialogContext).pop(null);
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (paymentAmount <= 0 || paymentAmount > remainingAmount) {
                                            ScaffoldMessenger.of(dialogContext).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Please enter a valid amount (not exceeding the balance)',
                                                ),
                                              ),
                                            );
                                            return;
                                          }
                                          Navigator.of(dialogContext).pop(paymentAmount);
                                        },
                                        child: const Text('Record'),
                                      ),
                                    ],
                                  );
                                },
                              );

                              if (paymentResult == null) return; // User cancelled

                              try {
                                if (!mounted) return;
                                setState(() => _isLoading = true);
                                
                                await _orderService.recordPayment(
                                  order.invoiceNumber,
                                  paymentResult,
                                );
                                
                                await _loadOrders();
                                
                                if (!mounted) return;
                                
                                // Use post-frame callback to avoid BuildContext warning
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Payment of \$${paymentResult.toStringAsFixed(2)} recorded successfully',
                                        ),
                                      ),
                                    );
                                  }
                                });
                              } catch (e) {
                                if (!mounted) return;
                                setState(() => _isLoading = false);
                                
                                // Use post-frame callback to avoid BuildContext warning
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Failed to record payment: $e'),
                                      ),
                                    );
                                  }
                                });
                              }
                            },
                            child: const Text('Record Payment'),
                          ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () async {
                            // Update order status
                            final options = ['Pending', 'Processing', 'Completed'];
                            final currentStatus = order.status;
                            
                            if (!mounted) return;

                            // Use dialog with a result callback pattern
                            final selectedStatus = await showDialog<String>(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return SimpleDialog(
                                  title: const Text('Update Order Status'),
                                  children: options.map((option) {
                                    return SimpleDialogOption(
                                      onPressed: () {
                                        Navigator.of(dialogContext).pop(option);
                                      },
                                      child: Text(option),
                                    );
                                  }).toList(),
                                );
                              },
                            );

                            // If dialog was cancelled or dismissed
                            if (selectedStatus == null || selectedStatus == currentStatus) return;

                            try {
                              if (!mounted) return;
                              setState(() => _isLoading = true);
                              
                              await _orderService.updateOrderStatus(
                                order.invoiceNumber,
                                selectedStatus,
                              );
                              
                              await _loadOrders();
                              
                              if (!mounted) return;
                              
                              // Use post-frame callback to avoid BuildContext warning
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Order status updated to $selectedStatus'),
                                    ),
                                  );
                                }
                              });
                            } catch (e) {
                              if (!mounted) return;
                              setState(() => _isLoading = false);
                              
                              // Use post-frame callback to avoid BuildContext warning
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Failed to update status: $e'),
                                    ),
                                  );
                                }
                              });
                            }
                          },
                          child: const Text('Update Status'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}