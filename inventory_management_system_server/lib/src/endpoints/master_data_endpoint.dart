import 'package:serverpod/serverpod.dart';
import 'package:inventory_management_system_server/src/generated/protocol.dart';

class MasterDataEndpoint extends Endpoint {
  // Product CRUD operations
  Future<Product> createProduct(
    Session session,
    String name,
    String description,
    String sku,
    String category,
    String unit,
    double purchasePrice,
    double sellingPrice,
    int minStockLevel,
    int currentStock,
  ) async {
    final product = Product(
      name: name,
      description: description,
      sku: sku,
      category: category,
      unit: unit,
      purchasePrice: purchasePrice,
      sellingPrice: sellingPrice,
      minStockLevel: minStockLevel,
      currentStock: currentStock,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final insertedProducts = await session.db.insert([product]);
    return insertedProducts.first;
  }

  Future<Product> updateProduct(
    Session session,
    String sku,
    String name,
    String description,
    String category,
    String unit,
    double purchasePrice,
    double sellingPrice,
    int minStockLevel,
    int currentStock,
  ) async {
    final products = await session.db.find(
      where: Product.t.sku.equals(sku),
    );

    if (products.isEmpty) {
      throw Exception('Product not found');
    }

    final product = products.first as Product;
    product.name = name;
    product.description = description;
    product.category = category;
    product.unit = unit;
    product.purchasePrice = purchasePrice;
    product.sellingPrice = sellingPrice;
    product.minStockLevel = minStockLevel;
    product.currentStock = currentStock;
    product.updatedAt = DateTime.now();

    final updatedProducts = await session.db.update([product]);
    return updatedProducts.first;
  }

  Future<void> deleteProduct(
    Session session,
    String sku,
  ) async {
    final products = await session.db.find(
      where: Product.t.sku.equals(sku),
    );

    if (products.isEmpty) {
      throw Exception('Product not found');
    }

    await session.db.delete([products.first]);
  }

  Future<List<Product>> getAllProducts(Session session) async {
    return await session.db.find();
  }

  Future<Product?> getProductBySku(
    Session session,
    String sku,
  ) async {
    final products = await session.db.find(
      where: Product.t.sku.equals(sku),
    );

    if (products.isEmpty) {
      return null;
    }

    return products.first as Product;
  }

  // Supplier CRUD operations
  Future<Supplier> createSupplier(
    Session session,
    String name,
    String contactPerson,
    String email,
    String phone,
    String address,
    String? gstin,
  ) async {
    final supplier = Supplier(
      supplierCode: 'SUP${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      contactPerson: contactPerson,
      email: email,
      phone: phone,
      address: address,
      gstin: gstin,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final insertedSuppliers = await session.db.insert([supplier]);
    return insertedSuppliers.first;
  }

  Future<Supplier> updateSupplier(
    Session session,
    int id,
    String name,
    String contactPerson,
    String email,
    String phone,
    String address,
    String? gstin,
  ) async {
    final suppliers = await session.db.find<Supplier>(
      where: Supplier.t.id.equals(id),
    );

    if (suppliers.isEmpty) {
      throw Exception('Supplier not found');
    }

    final supplier = suppliers.first;
    supplier.name = name;
    supplier.contactPerson = contactPerson;
    supplier.email = email;
    supplier.phone = phone;
    supplier.address = address;
    supplier.gstin = gstin;
    supplier.updatedAt = DateTime.now();

    final updatedSuppliers = await session.db.update([supplier]);
    return updatedSuppliers.first;
  }

  Future<void> deleteSupplier(
    Session session,
    int id,
  ) async {
    final suppliers = await session.db.find<Supplier>(
      where: Supplier.t.id.equals(id),
    );

    if (suppliers.isEmpty) {
      throw Exception('Supplier not found');
    }

    await session.db.delete<Supplier>(suppliers);
  }

  Future<List<Supplier>> getAllSuppliers(Session session) async {
    return await session.db.find<Supplier>();
  }

  // Customer CRUD operations
  Future<Customer> createCustomer(
    Session session,
    String name,
    String contactPerson,
    String email,
    String phone,
    String address,
    String? gstin,
  ) async {
    final customer = Customer(
      customerCode: 'CUS${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      contactPerson: contactPerson,
      email: email,
      phone: phone,
      address: address,
      gstin: gstin,
      currentBalance: 0,
      orderCount: 0,
      lifetimeValue: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final insertedCustomers = await session.db.insert([customer]);
    return insertedCustomers.first;
  }

  Future<Customer> updateCustomer(
    Session session,
    int id,
    String name,
    String contactPerson,
    String email,
    String phone,
    String address,
    String? gstin,
  ) async {
    final customers = await session.db.find<Customer>(
      where: Customer.t.id.equals(id),
    );

    if (customers.isEmpty) {
      throw Exception('Customer not found');
    }

    final customer = customers.first;
    customer.name = name;
    customer.contactPerson = contactPerson;
    customer.email = email;
    customer.phone = phone;
    customer.address = address;
    customer.gstin = gstin;
    customer.updatedAt = DateTime.now();

    final updatedCustomers = await session.db.update([customer]);
    return updatedCustomers.first;
  }

  Future<void> deleteCustomer(
    Session session,
    int id,
  ) async {
    final customers = await session.db.find<Customer>(
      where: Customer.t.id.equals(id),
    );

    if (customers.isEmpty) {
      throw Exception('Customer not found');
    }

    await session.db.delete<Customer>(customers);
  }

  Future<List<Customer>> getAllCustomers(Session session) async {
    return await session.db.find<Customer>();
  }

  // Category CRUD operations
  Future<Category> createCategory(
    Session session,
    String name,
    String? description,
    int? parentCategoryId,
  ) async {
    final category = Category(
      name: name,
      description: description,
      parentCategoryId: parentCategoryId,
      productCount: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final insertedCategories = await session.db.insert([category]);
    return insertedCategories.first;
  }

  Future<Category> updateCategory(
    Session session,
    int id,
    String name,
    String? description,
    int? parentCategoryId,
  ) async {
    final categories = await session.db.find<Category>(
      where: Category.t.id.equals(id),
    );

    if (categories.isEmpty) {
      throw Exception('Category not found');
    }

    final category = categories.first;
    category.name = name;
    category.description = description;
    category.parentCategoryId = parentCategoryId;
    category.updatedAt = DateTime.now();

    final updatedCategories = await session.db.update([category]);
    return updatedCategories.first;
  }

  Future<void> deleteCategory(
    Session session,
    int id,
  ) async {
    final categories = await session.db.find<Category>(
      where: Category.t.id.equals(id),
    );

    if (categories.isEmpty) {
      throw Exception('Category not found');
    }

    await session.db.delete<Category>(categories);
  }

  Future<List<Category>> getAllCategories(Session session) async {
    return await session.db.find<Category>();
  }

  Future<List<Category>> getAllCategoriesDetailed(Session session) async {
    return await session.db.find<Category>();
  }

  // Keep the existing methods below
  // Category operations - rename this to getAllCategoryNames to avoid conflict
  Future<List<String>> getAllCategoryNames(Session session) async {
    final products = await session.db.find();
    return products.map((p) => (p as Product).category).toSet().toList();
  }

  // Unit operations
  Future<List<String>> getAllUnits(Session session) async {
    final products = await session.db.find();
    return products.map((p) => (p as Product).unit).toSet().toList();
  }

  // Expense CRUD operations
  Future<Expense> createExpense(
    Session session,
    String expenseNumber,
    String category,
    double amount,
    String? description,
    DateTime date,
    String paymentMethod,
    String status,
    int userId,
  ) async {
    final expense = Expense(
      expenseNumber: expenseNumber,
      category: category,
      amount: amount,
      description: description,
      date: date,
      paymentMethod: paymentMethod,
      status: status,
      userId: userId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final insertedExpenses = await session.db.insert([expense]);
    return insertedExpenses.first;
  }

  Future<Expense> updateExpense(
    Session session,
    String expenseNumber,
    String category,
    double amount,
    String? description,
    DateTime date,
    String paymentMethod,
    String status,
  ) async {
    final expenses = await session.db.find(
      where: Expense.t.expenseNumber.equals(expenseNumber),
    );

    if (expenses.isEmpty) {
      throw Exception('Expense not found');
    }

    final expense = expenses.first as Expense;
    expense.category = category;
    expense.amount = amount;
    expense.description = description;
    expense.date = date;
    expense.paymentMethod = paymentMethod;
    expense.status = status;
    expense.updatedAt = DateTime.now();

    final updatedExpenses = await session.db.update([expense]);
    return updatedExpenses.first;
  }

  Future<void> deleteExpense(
    Session session,
    String expenseNumber,
  ) async {
    final expenses = await session.db.find(
      where: Expense.t.expenseNumber.equals(expenseNumber),
    );

    if (expenses.isEmpty) {
      throw Exception('Expense not found');
    }

    await session.db.delete([expenses.first]);
  }

  Future<List<Expense>> getAllExpenses(Session session) async {
    return await session.db.find();
  }

  Future<Expense?> getExpenseByNumber(
    Session session,
    String expenseNumber,
  ) async {
    final expenses = await session.db.find(
      where: Expense.t.expenseNumber.equals(expenseNumber),
    );

    if (expenses.isEmpty) {
      return null;
    }

    return expenses.first as Expense;
  }

  // Expense category operations
  Future<List<String>> getAllExpenseCategories(Session session) async {
    final expenses = await session.db.find();
    return expenses.map((e) => (e as Expense).category).toSet().toList();
  }

  // Expense status operations
  Future<List<String>> getAllExpenseStatuses(Session session) async {
    final expenses = await session.db.find();
    return expenses.map((e) => (e as Expense).status).toSet().toList();
  }
}