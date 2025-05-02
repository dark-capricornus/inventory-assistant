import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// Add import for PurchaseOrderService
import '../../services/purchase_order_service.dart';
import '../../models/purchase_order.dart';

/// Screen to manage and view purchase orders
class PurchaseOrdersScreen extends StatefulWidget {
  const PurchaseOrdersScreen({super.key});

  @override
  State<PurchaseOrdersScreen> createState() => _PurchaseOrdersScreenState();
}

class _PurchaseOrdersScreenState extends State<PurchaseOrdersScreen> {
  bool _isLoading = true;
  String? _error;
  List<PurchaseOrder> _purchaseOrders = [];
  final currencyFormatter = NumberFormat.currency(symbol: '\$');
  final dateFormatter = DateFormat('MMM dd, yyyy');
  // Add the purchase order service instance
  final _purchaseOrderService = PurchaseOrderService();

  @override
  void initState() {
    super.initState();
    _loadPurchaseOrders();
  }

  Future<void> _loadPurchaseOrders() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // In a real app, this would be a proper API call
      // await http.get(Uri.parse('https://your-api.com/purchase-orders'));
      
      // For now, simulate API response with mock data
      await Future.delayed(const Duration(seconds: 1));
      
      // Mock purchase orders data
      final mockData = List.generate(10, (index) {
        final orderDate = DateTime.now().subtract(Duration(days: index * 3));
        final statusOptions = ['Pending', 'Received', 'Partially Received', 'Cancelled'];
        final status = statusOptions[index % statusOptions.length];
        
        return {
          'id': 'PO${10000 + index}',
          'supplierName': 'Supplier ${index + 1}',
          'orderDate': orderDate.toIso8601String(),
          'totalAmount': 1000.0 + (index * 250.75),
          'status': status,
          'items': List.generate(2 + (index % 3), (itemIndex) => {
            'productId': 'PROD${100 + itemIndex}',
            'productName': 'Product ${itemIndex + 1}',
            'quantity': 5 + (itemIndex * 2),
            'unitPrice': 50.0 + (itemIndex * 10.25),
          }),
        };
      });
      
      final purchaseOrders = mockData
          .map((data) => PurchaseOrder.fromJson(data))
          .toList();
      
      setState(() {
        _purchaseOrders = purchaseOrders;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase Orders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadPurchaseOrders,
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddPurchaseOrderDialog(context),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  // Show dialog to create a new purchase order
  Future<void> _showAddPurchaseOrderDialog(BuildContext context) async {
    final TextEditingController supplierController = TextEditingController();
    final List<PurchaseOrderItemForm> items = [PurchaseOrderItemForm()];
    double total = 0.0;
    
    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            // Calculate total amount
            total = items.fold(0, (sum, item) {
              final quantity = int.tryParse(item.quantityController.text) ?? 0;
              final price = double.tryParse(item.priceController.text) ?? 0.0;
              return sum + (quantity * price);
            });
            
            return AlertDialog(
              title: const Text('Create Purchase Order'),
              content: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: supplierController,
                        decoration: const InputDecoration(
                          labelText: 'Supplier Name',
                          hintText: 'Enter supplier name',
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Order Items',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      ...items.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  controller: item.productController,
                                  decoration: const InputDecoration(
                                    labelText: 'Product',
                                    hintText: 'Product name',
                                    isDense: true,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  controller: item.quantityController,
                                  decoration: const InputDecoration(
                                    labelText: 'Qty',
                                    isDense: true,
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (_) => setState(() {}),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  controller: item.priceController,
                                  decoration: const InputDecoration(
                                    labelText: 'Price',
                                    prefixText: '\$',
                                    isDense: true,
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (_) => setState(() {}),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: items.length > 1
                                    ? () => setState(() => items.removeAt(index))
                                    : null,
                                color: Colors.red,
                                iconSize: 20,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      TextButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text('Add Item'),
                        onPressed: () => setState(() => items.add(PurchaseOrderItemForm())),
                      ),
                      const Divider(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Total: ${currencyFormatter.format(total)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('CANCEL'),
                ),
                TextButton(
                  onPressed: () {
                    if (supplierController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter supplier name'),
                        ),
                      );
                      return;
                    }
                    
                    if (items.any((item) => 
                        item.productController.text.trim().isEmpty ||
                        item.quantityController.text.trim().isEmpty ||
                        item.priceController.text.trim().isEmpty)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please complete all item fields'),
                        ),
                      );
                      return;
                    }
                    
                    _createPurchaseOrder(
                      supplierController.text.trim(),
                      items,
                      total,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text('CREATE'),
                ),
              ],
            );
          },
        );
      },
    );
    
    // Clean up controllers
    supplierController.dispose();
    for (var item in items) {
      item.dispose();
    }
  }
  
  void _createPurchaseOrder(
    String supplierName, 
    List<PurchaseOrderItemForm> items,
    double total,
  ) async {
    try {
      setState(() {
        _isLoading = true;
      });
      
      // In a real app, this would be an API call
      // await http.post(Uri.parse('https://your-api.com/purchase-orders'), 
      //   body: jsonEncode({...}));
      
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Create new mock purchase order
      final newId = 'PO${10000 + _purchaseOrders.length}';
      final newPurchaseOrder = PurchaseOrder(
        id: newId,
        supplierName: supplierName,
        orderDate: DateTime.now(),
        totalAmount: total,
        status: 'Pending',
        items: items.map((item) => PurchaseOrderItem(
          productId: 'PROD${DateTime.now().millisecondsSinceEpoch % 10000}',
          productName: item.productController.text,
          quantity: int.tryParse(item.quantityController.text) ?? 0,
          unitPrice: double.tryParse(item.priceController.text) ?? 0.0,
        )).toList(),
      );
      
      setState(() {
        _purchaseOrders.insert(0, newPurchaseOrder);
        _isLoading = false;
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Purchase order $newId created successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create purchase order: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _receivePurchaseOrder(String orderId) async {
    setState(() {
      _isLoading = true;
    });
    
    try {
      
      await _purchaseOrderService.updatePurchaseOrderStatus(orderId, 'Received');
      
      // Refresh purchase orders list
      await _loadPurchaseOrders();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Purchase order received successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update purchase order: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
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
              onPressed: _loadPurchaseOrders,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_purchaseOrders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'No purchase orders available',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Create New Purchase Order'),
              onPressed: () => _showAddPurchaseOrderDialog(context),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _purchaseOrders.length,
      itemBuilder: (context, index) {
        final order = _purchaseOrders[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order.id,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    _buildStatusChip(order.status),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Supplier: ${order.supplierName}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  'Order Date: ${dateFormatter.format(order.orderDate)}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  'Total: ${currencyFormatter.format(order.totalAmount)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${order.items.length} item(s)',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.visibility),
                      label: const Text('Details'),
                      onPressed: () => _showPurchaseOrderDetails(context, order),
                    ),
                    const SizedBox(width: 8),
                    if (order.status == 'Pending')
                      TextButton.icon(
                        icon: const Icon(Icons.check_circle),
                        label: const Text('Receive'),
                        onPressed: () => _receivePurchaseOrder(order.id),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status) {
      case 'Received':
        color = Colors.green;
        break;
      case 'Partially Received':
        color = Colors.orange;
        break;
      case 'Cancelled':
        color = Colors.red;
        break;
      default:
        color = Colors.blue;
    }
    return Chip(
      label: Text(status),
      backgroundColor: color.withOpacity(0.2),
      labelStyle: TextStyle(color: color),
    );
  }

  void _showPurchaseOrderDetails(BuildContext context, PurchaseOrder order) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Purchase Order ${order.id}'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('Supplier', order.supplierName),
                _buildInfoRow('Date', dateFormatter.format(order.orderDate)),
                _buildInfoRow('Status', order.status),
                _buildInfoRow('Total', currencyFormatter.format(order.totalAmount)),
                const SizedBox(height: 16),
                const Text('Items:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...order.items.map((item) => Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.productName, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text('Quantity: ${item.quantity}'),
                        Text('Unit Price: ${currencyFormatter.format(item.unitPrice)}'),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
            if (order.status == 'Pending')
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _receivePurchaseOrder(order.id);
                },
                child: const Text('Receive Order'),
              ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class PurchaseOrderItemForm {
  final TextEditingController productController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  void dispose() {
    productController.dispose();
    quantityController.dispose();
    priceController.dispose();
  }
}