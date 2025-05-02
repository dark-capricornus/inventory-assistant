/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:inventory_management_system_client/src/protocol/sales_prediction.dart'
    as _i3;
import 'package:inventory_management_system_client/src/protocol/inventory_optimization.dart'
    as _i4;
import 'package:inventory_management_system_client/src/protocol/pricing_suggestion.dart'
    as _i5;
import 'package:inventory_management_system_client/src/protocol/user.dart'
    as _i6;
import 'package:inventory_management_system_client/src/protocol/sale.dart'
    as _i7;
import 'package:inventory_management_system_client/src/protocol/greeting.dart'
    as _i8;
import 'package:inventory_management_system_client/src/protocol/product.dart'
    as _i9;
import 'package:inventory_management_system_client/src/protocol/purchase_order.dart'
    as _i10;
import 'package:inventory_management_system_client/src/protocol/supplier.dart'
    as _i11;
import 'package:inventory_management_system_client/src/protocol/customer.dart'
    as _i12;
import 'package:inventory_management_system_client/src/protocol/category.dart'
    as _i13;
import 'package:inventory_management_system_client/src/protocol/expense.dart'
    as _i14;
import 'protocol.dart' as _i15;

/// Endpoint for handling analytics and ML predictions.
/// Communicates with the Python ML service for sales forecasting,
/// inventory optimization, and pricing suggestions.
/// {@category Endpoint}
class EndpointAnalytics extends _i1.EndpointRef {
  EndpointAnalytics(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'analytics';

  /// Gets sales forecast from the ML service.
  ///
  /// [session] The current server session.
  /// [startDate] The start date for the sales forecast.
  /// [endDate] The end date for the sales forecast.
  /// Returns a SalesPrediction object containing the predicted sales and confidence.
  /// Throws [Exception] if the request fails or ML service is unavailable.
  _i2.Future<_i3.SalesPrediction> getSalesForecast(
    DateTime startDate,
    DateTime endDate,
  ) =>
      caller.callServerEndpoint<_i3.SalesPrediction>(
        'analytics',
        'getSalesForecast',
        {
          'startDate': startDate,
          'endDate': endDate,
        },
      );

  /// Gets inventory optimization suggestions from the ML service.
  ///
  /// [session] The current server session.
  /// [productId] The ID of the product for which to get inventory optimization.
  /// Returns an InventoryOptimization object containing the recommended stock levels and reorder point.
  /// Throws [Exception] if the request fails or ML service is unavailable.
  _i2.Future<_i4.InventoryOptimization> getInventoryOptimization(
          String productId) =>
      caller.callServerEndpoint<_i4.InventoryOptimization>(
        'analytics',
        'getInventoryOptimization',
        {'productId': productId},
      );

  /// Gets pricing suggestions from the ML service.
  ///
  /// [session] The current server session.
  /// [productId] The ID of the product for which to get pricing suggestion.
  /// Returns a PricingSuggestion object containing the suggested price and other details.
  /// Throws [Exception] if the request fails or ML service is unavailable.
  _i2.Future<_i5.PricingSuggestion> getPricingSuggestion(String productId) =>
      caller.callServerEndpoint<_i5.PricingSuggestion>(
        'analytics',
        'getPricingSuggestion',
        {'productId': productId},
      );
}

/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  _i2.Future<_i6.User?> login(
    String username,
    String password,
  ) =>
      caller.callServerEndpoint<_i6.User?>(
        'auth',
        'login',
        {
          'username': username,
          'password': password,
        },
      );

  _i2.Future<_i6.User> register(
    String username,
    String email,
    String password,
    String role,
  ) =>
      caller.callServerEndpoint<_i6.User>(
        'auth',
        'register',
        {
          'username': username,
          'email': email,
          'password': password,
          'role': role,
        },
      );
}

/// {@category Endpoint}
class EndpointBilling extends _i1.EndpointRef {
  EndpointBilling(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'billing';

  _i2.Future<_i7.Sale> createSale(
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
  ) =>
      caller.callServerEndpoint<_i7.Sale>(
        'billing',
        'createSale',
        {
          'invoiceNumber': invoiceNumber,
          'partyId': partyId,
          'totalAmount': totalAmount,
          'discountAmount': discountAmount,
          'taxAmount': taxAmount,
          'netAmount': netAmount,
          'paidAmount': paidAmount,
          'saleType': saleType,
          'status': status,
          'userId': userId,
          'notes': notes,
        },
      );

  _i2.Future<List<_i7.Sale>> getSalesByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) =>
      caller.callServerEndpoint<List<_i7.Sale>>(
        'billing',
        'getSalesByDateRange',
        {
          'startDate': startDate,
          'endDate': endDate,
        },
      );

  _i2.Future<List<_i7.Sale>> getSalesByParty(int partyId) =>
      caller.callServerEndpoint<List<_i7.Sale>>(
        'billing',
        'getSalesByParty',
        {'partyId': partyId},
      );

  _i2.Future<_i7.Sale> updateSaleStatus(
    String invoiceNumber,
    String newStatus,
  ) =>
      caller.callServerEndpoint<_i7.Sale>(
        'billing',
        'updateSaleStatus',
        {
          'invoiceNumber': invoiceNumber,
          'newStatus': newStatus,
        },
      );

  _i2.Future<_i7.Sale> recordPayment(
    String invoiceNumber,
    double amount,
  ) =>
      caller.callServerEndpoint<_i7.Sale>(
        'billing',
        'recordPayment',
        {
          'invoiceNumber': invoiceNumber,
          'amount': amount,
        },
      );
}

/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  _i2.Future<_i8.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i8.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointInventory extends _i1.EndpointRef {
  EndpointInventory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'inventory';

  _i2.Future<List<_i9.Product>> getStockStatus() =>
      caller.callServerEndpoint<List<_i9.Product>>(
        'inventory',
        'getStockStatus',
        {},
      );

  _i2.Future<List<_i9.Product>> getLowStockItems() =>
      caller.callServerEndpoint<List<_i9.Product>>(
        'inventory',
        'getLowStockItems',
        {},
      );

  _i2.Future<_i9.Product> updateStock(
    int productId,
    int newStockLevel,
  ) =>
      caller.callServerEndpoint<_i9.Product>(
        'inventory',
        'updateStock',
        {
          'productId': productId,
          'newStockLevel': newStockLevel,
        },
      );

  _i2.Future<List<_i10.PurchaseOrder>> generatePurchaseOrders() =>
      caller.callServerEndpoint<List<_i10.PurchaseOrder>>(
        'inventory',
        'generatePurchaseOrders',
        {},
      );
}

/// {@category Endpoint}
class EndpointMasterData extends _i1.EndpointRef {
  EndpointMasterData(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'masterData';

  _i2.Future<_i9.Product> createProduct(
    String name,
    String description,
    String sku,
    String category,
    String unit,
    double purchasePrice,
    double sellingPrice,
    int minStockLevel,
    int currentStock,
  ) =>
      caller.callServerEndpoint<_i9.Product>(
        'masterData',
        'createProduct',
        {
          'name': name,
          'description': description,
          'sku': sku,
          'category': category,
          'unit': unit,
          'purchasePrice': purchasePrice,
          'sellingPrice': sellingPrice,
          'minStockLevel': minStockLevel,
          'currentStock': currentStock,
        },
      );

  _i2.Future<_i9.Product> updateProduct(
    String sku,
    String name,
    String description,
    String category,
    String unit,
    double purchasePrice,
    double sellingPrice,
    int minStockLevel,
    int currentStock,
  ) =>
      caller.callServerEndpoint<_i9.Product>(
        'masterData',
        'updateProduct',
        {
          'sku': sku,
          'name': name,
          'description': description,
          'category': category,
          'unit': unit,
          'purchasePrice': purchasePrice,
          'sellingPrice': sellingPrice,
          'minStockLevel': minStockLevel,
          'currentStock': currentStock,
        },
      );

  _i2.Future<void> deleteProduct(String sku) => caller.callServerEndpoint<void>(
        'masterData',
        'deleteProduct',
        {'sku': sku},
      );

  _i2.Future<List<_i9.Product>> getAllProducts() =>
      caller.callServerEndpoint<List<_i9.Product>>(
        'masterData',
        'getAllProducts',
        {},
      );

  _i2.Future<_i9.Product?> getProductBySku(String sku) =>
      caller.callServerEndpoint<_i9.Product?>(
        'masterData',
        'getProductBySku',
        {'sku': sku},
      );

  _i2.Future<_i11.Supplier> createSupplier(
    String name,
    String contactPerson,
    String email,
    String phone,
    String address,
    String? gstin,
  ) =>
      caller.callServerEndpoint<_i11.Supplier>(
        'masterData',
        'createSupplier',
        {
          'name': name,
          'contactPerson': contactPerson,
          'email': email,
          'phone': phone,
          'address': address,
          'gstin': gstin,
        },
      );

  _i2.Future<_i11.Supplier> updateSupplier(
    int id,
    String name,
    String contactPerson,
    String email,
    String phone,
    String address,
    String? gstin,
  ) =>
      caller.callServerEndpoint<_i11.Supplier>(
        'masterData',
        'updateSupplier',
        {
          'id': id,
          'name': name,
          'contactPerson': contactPerson,
          'email': email,
          'phone': phone,
          'address': address,
          'gstin': gstin,
        },
      );

  _i2.Future<void> deleteSupplier(int id) => caller.callServerEndpoint<void>(
        'masterData',
        'deleteSupplier',
        {'id': id},
      );

  _i2.Future<List<_i11.Supplier>> getAllSuppliers() =>
      caller.callServerEndpoint<List<_i11.Supplier>>(
        'masterData',
        'getAllSuppliers',
        {},
      );

  _i2.Future<_i12.Customer> createCustomer(
    String name,
    String contactPerson,
    String email,
    String phone,
    String address,
    String? gstin,
  ) =>
      caller.callServerEndpoint<_i12.Customer>(
        'masterData',
        'createCustomer',
        {
          'name': name,
          'contactPerson': contactPerson,
          'email': email,
          'phone': phone,
          'address': address,
          'gstin': gstin,
        },
      );

  _i2.Future<_i12.Customer> updateCustomer(
    int id,
    String name,
    String contactPerson,
    String email,
    String phone,
    String address,
    String? gstin,
  ) =>
      caller.callServerEndpoint<_i12.Customer>(
        'masterData',
        'updateCustomer',
        {
          'id': id,
          'name': name,
          'contactPerson': contactPerson,
          'email': email,
          'phone': phone,
          'address': address,
          'gstin': gstin,
        },
      );

  _i2.Future<void> deleteCustomer(int id) => caller.callServerEndpoint<void>(
        'masterData',
        'deleteCustomer',
        {'id': id},
      );

  _i2.Future<List<_i12.Customer>> getAllCustomers() =>
      caller.callServerEndpoint<List<_i12.Customer>>(
        'masterData',
        'getAllCustomers',
        {},
      );

  _i2.Future<_i13.Category> createCategory(
    String name,
    String? description,
    int? parentCategoryId,
  ) =>
      caller.callServerEndpoint<_i13.Category>(
        'masterData',
        'createCategory',
        {
          'name': name,
          'description': description,
          'parentCategoryId': parentCategoryId,
        },
      );

  _i2.Future<_i13.Category> updateCategory(
    int id,
    String name,
    String? description,
    int? parentCategoryId,
  ) =>
      caller.callServerEndpoint<_i13.Category>(
        'masterData',
        'updateCategory',
        {
          'id': id,
          'name': name,
          'description': description,
          'parentCategoryId': parentCategoryId,
        },
      );

  _i2.Future<void> deleteCategory(int id) => caller.callServerEndpoint<void>(
        'masterData',
        'deleteCategory',
        {'id': id},
      );

  _i2.Future<List<_i13.Category>> getAllCategories() =>
      caller.callServerEndpoint<List<_i13.Category>>(
        'masterData',
        'getAllCategories',
        {},
      );

  _i2.Future<List<_i13.Category>> getAllCategoriesDetailed() =>
      caller.callServerEndpoint<List<_i13.Category>>(
        'masterData',
        'getAllCategoriesDetailed',
        {},
      );

  _i2.Future<List<String>> getAllCategoryNames() =>
      caller.callServerEndpoint<List<String>>(
        'masterData',
        'getAllCategoryNames',
        {},
      );

  _i2.Future<List<String>> getAllUnits() =>
      caller.callServerEndpoint<List<String>>(
        'masterData',
        'getAllUnits',
        {},
      );

  _i2.Future<_i14.Expense> createExpense(
    String expenseNumber,
    String category,
    double amount,
    String? description,
    DateTime date,
    String paymentMethod,
    String status,
    int userId,
  ) =>
      caller.callServerEndpoint<_i14.Expense>(
        'masterData',
        'createExpense',
        {
          'expenseNumber': expenseNumber,
          'category': category,
          'amount': amount,
          'description': description,
          'date': date,
          'paymentMethod': paymentMethod,
          'status': status,
          'userId': userId,
        },
      );

  _i2.Future<_i14.Expense> updateExpense(
    String expenseNumber,
    String category,
    double amount,
    String? description,
    DateTime date,
    String paymentMethod,
    String status,
  ) =>
      caller.callServerEndpoint<_i14.Expense>(
        'masterData',
        'updateExpense',
        {
          'expenseNumber': expenseNumber,
          'category': category,
          'amount': amount,
          'description': description,
          'date': date,
          'paymentMethod': paymentMethod,
          'status': status,
        },
      );

  _i2.Future<void> deleteExpense(String expenseNumber) =>
      caller.callServerEndpoint<void>(
        'masterData',
        'deleteExpense',
        {'expenseNumber': expenseNumber},
      );

  _i2.Future<List<_i14.Expense>> getAllExpenses() =>
      caller.callServerEndpoint<List<_i14.Expense>>(
        'masterData',
        'getAllExpenses',
        {},
      );

  _i2.Future<_i14.Expense?> getExpenseByNumber(String expenseNumber) =>
      caller.callServerEndpoint<_i14.Expense?>(
        'masterData',
        'getExpenseByNumber',
        {'expenseNumber': expenseNumber},
      );

  _i2.Future<List<String>> getAllExpenseCategories() =>
      caller.callServerEndpoint<List<String>>(
        'masterData',
        'getAllExpenseCategories',
        {},
      );

  _i2.Future<List<String>> getAllExpenseStatuses() =>
      caller.callServerEndpoint<List<String>>(
        'masterData',
        'getAllExpenseStatuses',
        {},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i15.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    analytics = EndpointAnalytics(this);
    auth = EndpointAuth(this);
    billing = EndpointBilling(this);
    greeting = EndpointGreeting(this);
    inventory = EndpointInventory(this);
    masterData = EndpointMasterData(this);
  }

  late final EndpointAnalytics analytics;

  late final EndpointAuth auth;

  late final EndpointBilling billing;

  late final EndpointGreeting greeting;

  late final EndpointInventory inventory;

  late final EndpointMasterData masterData;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'analytics': analytics,
        'auth': auth,
        'billing': billing,
        'greeting': greeting,
        'inventory': inventory,
        'masterData': masterData,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
