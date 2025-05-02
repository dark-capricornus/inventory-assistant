// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';

/// Represents a purchase order in the inventory management system
class PurchaseOrder {
  final String id;
  final String supplierName;
  final DateTime orderDate;
  final double totalAmount;
  final String status;
  final List<PurchaseOrderItem> items;

  PurchaseOrder({
    required this.id,
    required this.supplierName,
    required this.orderDate,
    required this.totalAmount,
    required this.status,
    required this.items,
  });

  /// Create a Purchase Order from JSON data
  factory PurchaseOrder.fromJson(Map<String, dynamic> json) {
    return PurchaseOrder(
      id: json['id'],
      supplierName: json['supplierName'],
      orderDate: DateTime.parse(json['orderDate']),
      totalAmount: json['totalAmount'].toDouble(),
      status: json['status'],
      items: (json['items'] as List)
          .map((item) => PurchaseOrderItem.fromJson(item))
          .toList(),
    );
  }

  /// Convert Purchase Order to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'supplierName': supplierName,
      'orderDate': orderDate.toIso8601String(),
      'totalAmount': totalAmount,
      'status': status,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  /// Create a copy of this Purchase Order with modified fields
  PurchaseOrder copyWith({
    String? id,
    String? supplierName,
    DateTime? orderDate,
    double? totalAmount,
    String? status,
    List<PurchaseOrderItem>? items,
  }) {
    return PurchaseOrder(
      id: id ?? this.id,
      supplierName: supplierName ?? this.supplierName,
      orderDate: orderDate ?? this.orderDate,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }
}

/// Represents an item in a purchase order
class PurchaseOrderItem {
  final String productId;
  final String productName;
  final int quantity;
  final double unitPrice;

  PurchaseOrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
  });

  /// Create a Purchase Order Item from JSON data
  factory PurchaseOrderItem.fromJson(Map<String, dynamic> json) {
    return PurchaseOrderItem(
      productId: json['productId'],
      productName: json['productName'],
      quantity: json['quantity'],
      unitPrice: json['unitPrice'].toDouble(),
    );
  }

  /// Convert Purchase Order Item to JSON
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'unitPrice': unitPrice,
    };
  }
}