import 'package:serverpod/serverpod.dart';
import 'package:inventory_management_system_server/src/generated/protocol.dart';

class BillingEndpoint extends Endpoint {
  // Create a new sale
  Future<Sale> createSale(
    Session session,
    String invoiceNumber,
    int partyId,
    double totalAmount,
    double? discountAmount,
    double taxAmount,
    double netAmount,
    double paidAmount,
    String saleType,
    String status,
    int userId,
    String? notes,
  ) async {
    final sale = Sale(
      invoiceNumber: invoiceNumber,
      saleDate: DateTime.now(),
      partyId: partyId,
      totalAmount: totalAmount,
      discountAmount: discountAmount,
      taxAmount: taxAmount,
      netAmount: netAmount,
      paidAmount: paidAmount,
      balanceAmount: netAmount - paidAmount,
      saleType: saleType,
      status: status,
      userId: userId,
      notes: notes,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final insertedSales = await session.db.insert([sale]);
    return insertedSales.first;
  }

  // Get sales by date range
  Future<List<Sale>> getSalesByDateRange(
    Session session,
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await session.db.find(
      where: (Sale.t.saleDate >= startDate) & (Sale.t.saleDate <= endDate),
    );
  }

  // Get sales by party
  Future<List<Sale>> getSalesByParty(
    Session session,
    int partyId,
  ) async {
    return await session.db.find(
      where: Sale.t.partyId.equals(partyId),
    );
  }

  // Update sale status
  Future<Sale> updateSaleStatus(
    Session session,
    String invoiceNumber,
    String newStatus,
  ) async {
    final sales = await session.db.find(
      where: Sale.t.invoiceNumber.equals(invoiceNumber),
    );

    if (sales.isEmpty) {
      throw Exception('Sale not found');
    }

    final sale = sales.first as Sale;
    sale.status = newStatus;
    sale.updatedAt = DateTime.now();

    final updatedSales = await session.db.update([sale]);
    return updatedSales.first;
  }

  // Record payment for a sale
  Future<Sale> recordPayment(
    Session session,
    String invoiceNumber,
    double amount,
  ) async {
    final sales = await session.db.find(
      where: Sale.t.invoiceNumber.equals(invoiceNumber),
    );

    if (sales.isEmpty) {
      throw Exception('Sale not found');
    }

    final sale = sales.first as Sale;
    sale.paidAmount += amount;
    sale.balanceAmount = sale.netAmount - sale.paidAmount;
    sale.updatedAt = DateTime.now();

    if (sale.balanceAmount <= 0) {
      sale.status = 'completed';
    }

    final updatedSales = await session.db.update([sale]);
    return updatedSales.first;
  }
} 