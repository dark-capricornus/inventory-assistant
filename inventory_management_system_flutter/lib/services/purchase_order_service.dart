import 'package:flutter/material.dart';
import '../models/purchase_order.dart' as local;

class PurchaseOrderService {
  // Singleton pattern
  static final PurchaseOrderService _instance = PurchaseOrderService._internal();
  factory PurchaseOrderService() => _instance;
  PurchaseOrderService._internal();

  /// Fetches all purchase orders
  Future<List<local.PurchaseOrder>> getPurchaseOrders() async {
    try {
      // In a real implementation, this would call the server endpoint
      // For now, returning mock data due to lack of server-side implementation
      await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
      
      // Generate mock purchase orders
      return List.generate(8, (index) {
        final orderDate = DateTime.now().subtract(Duration(days: index * 3));
        final statusOptions = ['Pending', 'Received', 'Partially Received', 'Cancelled'];
        final status = statusOptions[index % statusOptions.length];
        
        return local.PurchaseOrder(
          id: 'PO${10000 + index}',
          supplierName: 'Supplier ${index + 1}',
          orderDate: orderDate,
          totalAmount: 1000.0 + (index * 250.75),
          status: status,
          items: List.generate(2 + (index % 3), (itemIndex) => 
            local.PurchaseOrderItem(
              productId: 'PROD${100 + itemIndex}',
              productName: 'Product ${itemIndex + 1}',
              quantity: 5 + (itemIndex * 2),
              unitPrice: 50.0 + (itemIndex * 10.25),
            )
          ),
        );
      });
    } catch (e) {
      debugPrint('Error fetching purchase orders: $e');
      throw Exception('Failed to load purchase orders: $e');
    }
  }

  /// Updates the status of a purchase order
  Future<local.PurchaseOrder> updatePurchaseOrderStatus(String orderId, String status) async {
    try {
      // In a real implementation, this would call the server endpoint
      // For now, simulating a successful update
      await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay
      
      // Find and update the purchase order in our mock data based on ID
      final orders = await getPurchaseOrders();
      final orderIndex = orders.indexWhere((order) => order.id == orderId);
      
      if (orderIndex == -1) {
        throw Exception('Purchase order not found');
      }
      
      final updatedOrder = orders[orderIndex].copyWith(status: status);
      return updatedOrder;
    } catch (e) {
      debugPrint('Error updating purchase order status: $e');
      throw Exception('Failed to update purchase order: $e');
    }
  }

  /// Creates a new purchase order
  Future<local.PurchaseOrder> createPurchaseOrder(local.PurchaseOrder order) async {
    try {
      // In a real implementation, this would call the server endpoint
      // For now, simulating a successful creation
      await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
      
      // Generate a new ID for the order if one isn't provided
      final newId = order.id.isNotEmpty ? order.id : 'PO${DateTime.now().millisecondsSinceEpoch % 10000}';
      
      return order.copyWith(
        id: newId,
        status: 'Pending',
        orderDate: DateTime.now(),
      );
    } catch (e) {
      debugPrint('Error creating purchase order: $e');
      throw Exception('Failed to create purchase order: $e');
    }
  }

  /// Gets a specific purchase order by ID
  Future<local.PurchaseOrder> getPurchaseOrder(String orderId) async {
    try {
      // In a real implementation, this would call the server endpoint
      // For now, finding the order in our mock data based on ID
      final orders = await getPurchaseOrders();
      final order = orders.firstWhere(
        (order) => order.id == orderId,
        orElse: () => throw Exception('Purchase order not found'),
      );
      
      return order;
    } catch (e) {
      debugPrint('Error getting purchase order: $e');
      throw Exception('Failed to load purchase order: $e');
    }
  }
}