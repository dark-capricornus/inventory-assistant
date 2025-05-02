import 'package:serverpod/serverpod.dart';
import 'package:inventory_management_system_server/src/generated/protocol.dart';

class InventoryEndpoint extends Endpoint {
  // Get current stock status
  Future<List<Product>> getStockStatus(Session session) async {
    return await session.db.find(
      where: Product.t.currentStock > 0,
    );
  }

  // Get low stock items
  Future<List<Product>> getLowStockItems(Session session) async {
    return await session.db.find(
      where: Product.t.currentStock <= Product.t.minStockLevel,
    );
  }

  // Update stock level
  Future<Product> updateStock(
    Session session,
    int productId,
    int newStockLevel,
  ) async {
    final products = await session.db.find(
      where: Product.t.id.equals(productId),
    );

    if (products.isEmpty) {
      throw Exception('Product not found');
    }

    final product = products.first as Product;
    product.currentStock = newStockLevel;
    product.updatedAt = DateTime.now();

    final updatedProducts = await session.db.update([product]);
    return updatedProducts.first;
  }

  // Generate purchase order for low stock items
  Future<List<PurchaseOrder>> generatePurchaseOrders(Session session) async {
    final lowStockItems = await getLowStockItems(session);
    final purchaseOrders = <PurchaseOrder>[];

    for (final item in lowStockItems) {
      final order = PurchaseOrder(
        productId: item.id!,
        quantity: item.minStockLevel * 2, // Order double the minimum stock level
        status: 'pending',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      purchaseOrders.add(order);
    }

    if (purchaseOrders.isNotEmpty) {
      await session.db.insert(purchaseOrders);
    }

    return purchaseOrders;
  }
} 