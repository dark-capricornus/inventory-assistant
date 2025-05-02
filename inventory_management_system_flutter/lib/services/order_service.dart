import 'package:flutter/material.dart';
import 'package:inventory_management_system_client/inventory_management_system_client.dart';
import '../main.dart';

class OrderService {
  // Singleton pattern
  static final OrderService _instance = OrderService._internal();
  factory OrderService() => _instance;
  OrderService._internal();
  
  // Get all sales/orders from server
  Future<List<Sale>> getSalesOrders() async {
    try {
      // Get sales from the last 90 days by default
      final now = DateTime.now();
      final ninetyDaysAgo = DateTime(now.year, now.month, now.day - 90);
      
      return await client.billing.getSalesByDateRange(ninetyDaysAgo, now);
    } catch (e) {
      debugPrint('Error fetching sales orders: $e');
      throw Exception('Failed to fetch orders: $e');
    }
  }
  
  // Create a new sales order
  Future<Sale> createSalesOrder({
    required String customer,
    required double amount,
    required List<Map<String, dynamic>> items,
    String? notes,
  }) async {
    try {
      // Convert customer name to an actual partyId in a real implementation
      // For now, we'll just use a mock ID
      final partyId = 'CUST-${DateTime.now().millisecondsSinceEpoch}';
      
      // Calculate tax amount (e.g., 10% of total)
      final taxAmount = amount * 0.1;
      final totalAmount = amount;
      final netAmount = totalAmount + taxAmount;
      
      // Call API to create a new sale with proper type conversions
      final sale = await client.billing.createSale(
        partyId, 
        totalAmount.toInt(), // Convert to int as required by the API
        taxAmount, 
        netAmount, 
        0.0,  // initial paid amount is 0
        0.0,  // Status as double (0.0 = Pending)
        0.0,  // Notes as double (0.0 = empty)
        items.toString(),  // Convert items to String
        DateTime.now().toString(),  // Order date as string
        DateTime.now().add(const Duration(days: 7)).millisecondsSinceEpoch,  // Due date as timestamp
        'Regular'  // Order type
      );
      
      return sale;
    } catch (e) {
      debugPrint('Error creating sales order: $e');
      throw Exception('Failed to create sales order: $e');
    }
  }
  
  // Update an order's status
  Future<Sale> updateOrderStatus(String invoiceNumber, String newStatus) async {
    try {
      return await client.billing.updateSaleStatus(invoiceNumber, newStatus);
    } catch (e) {
      debugPrint('Error updating order status: $e');
      throw Exception('Failed to update order status: $e');
    }
  }
  
  // Record payment for an order
  Future<Sale> recordPayment(String invoiceNumber, double amount) async {
    try {
      return await client.billing.recordPayment(invoiceNumber, amount);
    } catch (e) {
      debugPrint('Error recording payment: $e');
      throw Exception('Failed to record payment: $e');
    }
  }
}