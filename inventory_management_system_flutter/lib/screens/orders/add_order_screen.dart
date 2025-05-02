import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management_system_client/inventory_management_system_client.dart';
import '../../services/order_service.dart';
import '../../main.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _orderService = OrderService();
  
  bool _isLoading = false;
  String? _error;
  
  // Customer information
  List<Customer> _customers = [];
  Customer? _selectedCustomer;
  
  // Order items
  final List<Map<String, dynamic>> _orderItems = [];
  
  // Product information
  List<Product> _products = [];
  Product? _selectedProduct;
  final _quantityController = TextEditingController(text: '1');
  double _itemDiscount = 0;

  // Order information
  final _invoiceNumberController = TextEditingController();
  final _notesController = TextEditingController();
  double _totalAmount = 0;
  double _discountAmount = 0;
  final double _taxRate = 18; // Default tax rate (%)
  double _taxAmount = 0;
  double _netAmount = 0;
  String _paymentMethod = 'Cash';
  String _orderStatus = 'Pending';
  DateTime _orderDate = DateTime.now();

  final _currencyFormat = NumberFormat.currency(symbol: '\$');

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _generateInvoiceNumber();
    _recalculateTotals();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _invoiceNumberController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialData() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Load customers and products in parallel
      final customersResult = client.masterData.getAllCustomers();
      final productsResult = client.masterData.getAllProducts();

      final results = await Future.wait([
        customersResult,
        productsResult,
      ]);

      if (mounted) {
        setState(() {
          _customers = results[0] as List<Customer>;
          _products = results[1] as List<Product>;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  void _generateInvoiceNumber() {
    // Generate a simple invoice number with date and random component
    final now = DateTime.now();
    final random = now.microsecond % 1000;
    final invoiceNumber = 'INV-${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}-$random';
    _invoiceNumberController.text = invoiceNumber;
  }

  void _addItemToOrder() {
    if (_selectedProduct == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a product')),
      );
      return;
    }

    final quantity = int.tryParse(_quantityController.text);
    if (quantity == null || quantity <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid quantity')),
      );
      return;
    }

    if (quantity > _selectedProduct!.currentStock) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Not enough stock available')),
      );
      return;
    }

    // Calculate item total
    final itemPrice = _selectedProduct!.sellingPrice;
    final itemTotal = itemPrice * quantity;
    final discount = (itemTotal * _itemDiscount) / 100;
    final netItemTotal = itemTotal - discount;

    final newItem = {
      'product': _selectedProduct!,
      'quantity': quantity,
      'unitPrice': itemPrice,
      'discount': _itemDiscount,
      'total': netItemTotal,
    };

    setState(() {
      _orderItems.add(newItem);
      _selectedProduct = null;
      _quantityController.text = '1';
      _itemDiscount = 0;
    });

    _recalculateTotals();
  }

  void _removeItem(int index) {
    setState(() {
      _orderItems.removeAt(index);
    });
    _recalculateTotals();
  }

  void _recalculateTotals() {
    final subtotal = _orderItems.fold<double>(0, (sum, item) => sum + item['total']);
    final taxableAmount = subtotal - _discountAmount;
    final tax = taxableAmount * (_taxRate / 100);

    setState(() {
      _totalAmount = subtotal;
      _taxAmount = tax;
      _netAmount = taxableAmount + tax;
    });
  }

  void _updateDiscount(String value) {
    final discount = double.tryParse(value) ?? 0;
    if (discount >= 0 && discount <= _totalAmount) {
      setState(() {
        _discountAmount = discount;
      });
      _recalculateTotals();
    }
  }

  Future<void> _submitOrder() async {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    if (_selectedCustomer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a customer')),
      );
      return;
    }

    if (_orderItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one item to the order')),
      );
      return;
    }

    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Create order items list for API
      final items = _orderItems.map((item) => {
        'productId': item['product'].id,
        'quantity': item['quantity'],
        'unitPrice': item['unitPrice'],
        'total': item['total'],
      }).toList();

      // Create and submit order with named parameters matching the service method
      await _orderService.createSalesOrder(
        customer: _selectedCustomer!.name,
        amount: _totalAmount,
        items: items,
        notes: _notesController.text,
      );

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        
        // Show success message and navigate back
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Order created successfully')),
        );
        
        Navigator.pop(context, true); // Return true to indicate success
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create order: $_error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Order'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _submitOrder,
            tooltip: 'Save Order',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: $_error', style: const TextStyle(color: Colors.red)),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadInitialData,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildOrderInfoSection(),
                              const SizedBox(height: 16),
                              _buildCustomerSection(),
                              const SizedBox(height: 16),
                              _buildAddItemSection(),
                              const SizedBox(height: 16),
                              _buildOrderItemsList(),
                              const SizedBox(height: 16),
                              _buildOrderTotals(),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _notesController,
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  labelText: 'Order Notes',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _buildBottomBar(),
                    ],
                  ),
                ),
    );
  }

  Widget _buildOrderInfoSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _invoiceNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Invoice Number',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter an invoice number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: _orderDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now().add(const Duration(days: 30)),
                      );
                      if (picked != null && picked != _orderDate) {
                        setState(() {
                          _orderDate = picked;
                        });
                      }
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Order Date',
                        border: OutlineInputBorder(),
                      ),
                      child: Text(
                        DateFormat('yyyy-MM-dd').format(_orderDate),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Payment Method',
                      border: OutlineInputBorder(),
                    ),
                    value: _paymentMethod,
                    items: ['Cash', 'Credit Card', 'Bank Transfer', 'Check']
                        .map((method) => DropdownMenuItem(
                              value: method,
                              child: Text(method),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _paymentMethod = value;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(),
                    ),
                    value: _orderStatus,
                    items: ['Pending', 'Completed', 'Cancelled']
                        .map((status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _orderStatus = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Customer Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('New Customer'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_customer')
                        .then((_) => _loadInitialData());
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<Customer>(
              decoration: const InputDecoration(
                labelText: 'Select Customer',
                border: OutlineInputBorder(),
              ),
              value: _selectedCustomer,
              items: _customers
                  .map((customer) => DropdownMenuItem(
                        value: customer,
                        child: Text('${customer.name} (${customer.phone})'),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCustomer = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select a customer';
                }
                return null;
              },
            ),
            if (_selectedCustomer != null) ...[
              const SizedBox(height: 16),
              Text(
                'Contact: ${_selectedCustomer!.contactPerson}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                'Address: ${_selectedCustomer!.address}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                'Phone: ${_selectedCustomer!.phone}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                'Email: ${_selectedCustomer!.email}',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAddItemSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add Items',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('New Product'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_product')
                        .then((_) => _loadInitialData());
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<Product>(
              decoration: const InputDecoration(
                labelText: 'Select Product',
                border: OutlineInputBorder(),
              ),
              value: _selectedProduct,
              items: _products
                  .map((product) => DropdownMenuItem(
                        value: product,
                        child: Text('${product.name} (${_currencyFormat.format(product.sellingPrice)})'),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedProduct = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _quantityController,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    initialValue: _itemDiscount.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Discount (%)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final discount = double.tryParse(value) ?? 0;
                      setState(() {
                        _itemDiscount = discount;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_selectedProduct != null) ...[
              Text(
                'Available Stock: ${_selectedProduct!.currentStock}',
                style: TextStyle(
                  color: _selectedProduct!.currentStock > 0 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Price: ${_currencyFormat.format(_selectedProduct!.sellingPrice)}',
              ),
            ],
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: _addItemToOrder,
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Add to Order'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItemsList() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Items',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          for (var i = 0; i < _orderItems.length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, // Align items center vertically
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _orderItems[i]['product'].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis, // Prevent text overflow
                          maxLines: 1,
                        ),
                        Text(
                          'SKU: ${_orderItems[i]['product'].sku}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis, // Prevent text overflow
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '${_orderItems[i]['quantity']} x ${_currencyFormat.format(_orderItems[i]['unitPrice'])}',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis, // Prevent text overflow
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  if (_orderItems[i]['discount'] > 0)
                    Expanded(
                      flex: 1,
                      child: Text(
                        '-${_orderItems[i]['discount']}%',
                        style: const TextStyle(color: Colors.red, fontSize: 13),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis, // Prevent text overflow
                      ),
                    )
                  else
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      _currencyFormat.format(_orderItems[i]['total']),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis, // Prevent text overflow
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeItem(i),
                      iconSize: 18, // Smaller icon
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(), // Remove default constraints
                    ),
                  ),
                ],
              ),
            ),
            if (i < _orderItems.length - 1) const Divider(height: 1),
          ],
        ],
      ),
    );
  }

  Widget _buildOrderTotals() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Totals',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal:'),
                Text(
                  _currencyFormat.format(_totalAmount),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Expanded(child: Text('Discount:')),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    initialValue: _discountAmount.toString(),
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: _updateDiscount,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tax (${_taxRate.toStringAsFixed(0)}%):'),
                Text(
                  _currencyFormat.format(_taxAmount),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _currencyFormat.format(_netAmount),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Cancel'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: _submitOrder,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Create Order'),
            ),
          ),
        ],
      ),
    );
  }
}