/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/analytics_endpoint.dart' as _i2;
import '../endpoints/auth_endpoint.dart' as _i3;
import '../endpoints/billing_endpoint.dart' as _i4;
import '../endpoints/greeting_endpoint.dart' as _i5;
import '../endpoints/inventory_endpoint.dart' as _i6;
import '../endpoints/master_data_endpoint.dart' as _i7;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'analytics': _i2.AnalyticsEndpoint()
        ..initialize(
          server,
          'analytics',
          null,
        ),
      'auth': _i3.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'billing': _i4.BillingEndpoint()
        ..initialize(
          server,
          'billing',
          null,
        ),
      'greeting': _i5.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'inventory': _i6.InventoryEndpoint()
        ..initialize(
          server,
          'inventory',
          null,
        ),
      'masterData': _i7.MasterDataEndpoint()
        ..initialize(
          server,
          'masterData',
          null,
        ),
    };
    connectors['analytics'] = _i1.EndpointConnector(
      name: 'analytics',
      endpoint: endpoints['analytics']!,
      methodConnectors: {
        'getSalesForecast': _i1.MethodConnector(
          name: 'getSalesForecast',
          params: {
            'startDate': _i1.ParameterDescription(
              name: 'startDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'endDate': _i1.ParameterDescription(
              name: 'endDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['analytics'] as _i2.AnalyticsEndpoint)
                  .getSalesForecast(
            session,
            params['startDate'],
            params['endDate'],
          ),
        ),
        'getInventoryOptimization': _i1.MethodConnector(
          name: 'getInventoryOptimization',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['analytics'] as _i2.AnalyticsEndpoint)
                  .getInventoryOptimization(
            session,
            params['productId'],
          ),
        ),
        'getPricingSuggestion': _i1.MethodConnector(
          name: 'getPricingSuggestion',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['analytics'] as _i2.AnalyticsEndpoint)
                  .getPricingSuggestion(
            session,
            params['productId'],
          ),
        ),
      },
    );
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).login(
            session,
            params['username'],
            params['password'],
          ),
        ),
        'register': _i1.MethodConnector(
          name: 'register',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'role': _i1.ParameterDescription(
              name: 'role',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).register(
            session,
            params['username'],
            params['email'],
            params['password'],
            params['role'],
          ),
        ),
      },
    );
    connectors['billing'] = _i1.EndpointConnector(
      name: 'billing',
      endpoint: endpoints['billing']!,
      methodConnectors: {
        'createSale': _i1.MethodConnector(
          name: 'createSale',
          params: {
            'invoiceNumber': _i1.ParameterDescription(
              name: 'invoiceNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'partyId': _i1.ParameterDescription(
              name: 'partyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'totalAmount': _i1.ParameterDescription(
              name: 'totalAmount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'discountAmount': _i1.ParameterDescription(
              name: 'discountAmount',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'taxAmount': _i1.ParameterDescription(
              name: 'taxAmount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'netAmount': _i1.ParameterDescription(
              name: 'netAmount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'paidAmount': _i1.ParameterDescription(
              name: 'paidAmount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'saleType': _i1.ParameterDescription(
              name: 'saleType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'notes': _i1.ParameterDescription(
              name: 'notes',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['billing'] as _i4.BillingEndpoint).createSale(
            session,
            params['invoiceNumber'],
            params['partyId'],
            params['totalAmount'],
            params['discountAmount'],
            params['taxAmount'],
            params['netAmount'],
            params['paidAmount'],
            params['saleType'],
            params['status'],
            params['userId'],
            params['notes'],
          ),
        ),
        'getSalesByDateRange': _i1.MethodConnector(
          name: 'getSalesByDateRange',
          params: {
            'startDate': _i1.ParameterDescription(
              name: 'startDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'endDate': _i1.ParameterDescription(
              name: 'endDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['billing'] as _i4.BillingEndpoint).getSalesByDateRange(
            session,
            params['startDate'],
            params['endDate'],
          ),
        ),
        'getSalesByParty': _i1.MethodConnector(
          name: 'getSalesByParty',
          params: {
            'partyId': _i1.ParameterDescription(
              name: 'partyId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['billing'] as _i4.BillingEndpoint).getSalesByParty(
            session,
            params['partyId'],
          ),
        ),
        'updateSaleStatus': _i1.MethodConnector(
          name: 'updateSaleStatus',
          params: {
            'invoiceNumber': _i1.ParameterDescription(
              name: 'invoiceNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newStatus': _i1.ParameterDescription(
              name: 'newStatus',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['billing'] as _i4.BillingEndpoint).updateSaleStatus(
            session,
            params['invoiceNumber'],
            params['newStatus'],
          ),
        ),
        'recordPayment': _i1.MethodConnector(
          name: 'recordPayment',
          params: {
            'invoiceNumber': _i1.ParameterDescription(
              name: 'invoiceNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'amount': _i1.ParameterDescription(
              name: 'amount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['billing'] as _i4.BillingEndpoint).recordPayment(
            session,
            params['invoiceNumber'],
            params['amount'],
          ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['greeting'] as _i5.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['inventory'] = _i1.EndpointConnector(
      name: 'inventory',
      endpoint: endpoints['inventory']!,
      methodConnectors: {
        'getStockStatus': _i1.MethodConnector(
          name: 'getStockStatus',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['inventory'] as _i6.InventoryEndpoint)
                  .getStockStatus(session),
        ),
        'getLowStockItems': _i1.MethodConnector(
          name: 'getLowStockItems',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['inventory'] as _i6.InventoryEndpoint)
                  .getLowStockItems(session),
        ),
        'updateStock': _i1.MethodConnector(
          name: 'updateStock',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newStockLevel': _i1.ParameterDescription(
              name: 'newStockLevel',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['inventory'] as _i6.InventoryEndpoint).updateStock(
            session,
            params['productId'],
            params['newStockLevel'],
          ),
        ),
        'generatePurchaseOrders': _i1.MethodConnector(
          name: 'generatePurchaseOrders',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['inventory'] as _i6.InventoryEndpoint)
                  .generatePurchaseOrders(session),
        ),
      },
    );
    connectors['masterData'] = _i1.EndpointConnector(
      name: 'masterData',
      endpoint: endpoints['masterData']!,
      methodConnectors: {
        'createProduct': _i1.MethodConnector(
          name: 'createProduct',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'sku': _i1.ParameterDescription(
              name: 'sku',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'unit': _i1.ParameterDescription(
              name: 'unit',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'purchasePrice': _i1.ParameterDescription(
              name: 'purchasePrice',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'sellingPrice': _i1.ParameterDescription(
              name: 'sellingPrice',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'minStockLevel': _i1.ParameterDescription(
              name: 'minStockLevel',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'currentStock': _i1.ParameterDescription(
              name: 'currentStock',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint).createProduct(
            session,
            params['name'],
            params['description'],
            params['sku'],
            params['category'],
            params['unit'],
            params['purchasePrice'],
            params['sellingPrice'],
            params['minStockLevel'],
            params['currentStock'],
          ),
        ),
        'updateProduct': _i1.MethodConnector(
          name: 'updateProduct',
          params: {
            'sku': _i1.ParameterDescription(
              name: 'sku',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'unit': _i1.ParameterDescription(
              name: 'unit',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'purchasePrice': _i1.ParameterDescription(
              name: 'purchasePrice',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'sellingPrice': _i1.ParameterDescription(
              name: 'sellingPrice',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'minStockLevel': _i1.ParameterDescription(
              name: 'minStockLevel',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'currentStock': _i1.ParameterDescription(
              name: 'currentStock',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint).updateProduct(
            session,
            params['sku'],
            params['name'],
            params['description'],
            params['category'],
            params['unit'],
            params['purchasePrice'],
            params['sellingPrice'],
            params['minStockLevel'],
            params['currentStock'],
          ),
        ),
        'deleteProduct': _i1.MethodConnector(
          name: 'deleteProduct',
          params: {
            'sku': _i1.ParameterDescription(
              name: 'sku',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint).deleteProduct(
            session,
            params['sku'],
          ),
        ),
        'getAllProducts': _i1.MethodConnector(
          name: 'getAllProducts',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .getAllProducts(session),
        ),
        'getProductBySku': _i1.MethodConnector(
          name: 'getProductBySku',
          params: {
            'sku': _i1.ParameterDescription(
              name: 'sku',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .getProductBySku(
            session,
            params['sku'],
          ),
        ),
        'createSupplier': _i1.MethodConnector(
          name: 'createSupplier',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'contactPerson': _i1.ParameterDescription(
              name: 'contactPerson',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'address': _i1.ParameterDescription(
              name: 'address',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'gstin': _i1.ParameterDescription(
              name: 'gstin',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .createSupplier(
            session,
            params['name'],
            params['contactPerson'],
            params['email'],
            params['phone'],
            params['address'],
            params['gstin'],
          ),
        ),
        'updateSupplier': _i1.MethodConnector(
          name: 'updateSupplier',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'contactPerson': _i1.ParameterDescription(
              name: 'contactPerson',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'address': _i1.ParameterDescription(
              name: 'address',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'gstin': _i1.ParameterDescription(
              name: 'gstin',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .updateSupplier(
            session,
            params['id'],
            params['name'],
            params['contactPerson'],
            params['email'],
            params['phone'],
            params['address'],
            params['gstin'],
          ),
        ),
        'deleteSupplier': _i1.MethodConnector(
          name: 'deleteSupplier',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .deleteSupplier(
            session,
            params['id'],
          ),
        ),
        'getAllSuppliers': _i1.MethodConnector(
          name: 'getAllSuppliers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .getAllSuppliers(session),
        ),
        'createCustomer': _i1.MethodConnector(
          name: 'createCustomer',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'contactPerson': _i1.ParameterDescription(
              name: 'contactPerson',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'address': _i1.ParameterDescription(
              name: 'address',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'gstin': _i1.ParameterDescription(
              name: 'gstin',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .createCustomer(
            session,
            params['name'],
            params['contactPerson'],
            params['email'],
            params['phone'],
            params['address'],
            params['gstin'],
          ),
        ),
        'updateCustomer': _i1.MethodConnector(
          name: 'updateCustomer',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'contactPerson': _i1.ParameterDescription(
              name: 'contactPerson',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'address': _i1.ParameterDescription(
              name: 'address',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'gstin': _i1.ParameterDescription(
              name: 'gstin',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .updateCustomer(
            session,
            params['id'],
            params['name'],
            params['contactPerson'],
            params['email'],
            params['phone'],
            params['address'],
            params['gstin'],
          ),
        ),
        'deleteCustomer': _i1.MethodConnector(
          name: 'deleteCustomer',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .deleteCustomer(
            session,
            params['id'],
          ),
        ),
        'getAllCustomers': _i1.MethodConnector(
          name: 'getAllCustomers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .getAllCustomers(session),
        ),
        'createCategory': _i1.MethodConnector(
          name: 'createCategory',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'parentCategoryId': _i1.ParameterDescription(
              name: 'parentCategoryId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .createCategory(
            session,
            params['name'],
            params['description'],
            params['parentCategoryId'],
          ),
        ),
        'updateCategory': _i1.MethodConnector(
          name: 'updateCategory',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'parentCategoryId': _i1.ParameterDescription(
              name: 'parentCategoryId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .updateCategory(
            session,
            params['id'],
            params['name'],
            params['description'],
            params['parentCategoryId'],
          ),
        ),
        'deleteCategory': _i1.MethodConnector(
          name: 'deleteCategory',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .deleteCategory(
            session,
            params['id'],
          ),
        ),
        'getAllCategories': _i1.MethodConnector(
          name: 'getAllCategories',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .getAllCategories(session),
        ),
        'getAllCategoriesDetailed': _i1.MethodConnector(
          name: 'getAllCategoriesDetailed',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .getAllCategoriesDetailed(session),
        ),
        'getAllCategoryNames': _i1.MethodConnector(
          name: 'getAllCategoryNames',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .getAllCategoryNames(session),
        ),
        'getAllUnits': _i1.MethodConnector(
          name: 'getAllUnits',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .getAllUnits(session),
        ),
        'createExpense': _i1.MethodConnector(
          name: 'createExpense',
          params: {
            'expenseNumber': _i1.ParameterDescription(
              name: 'expenseNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'amount': _i1.ParameterDescription(
              name: 'amount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'date': _i1.ParameterDescription(
              name: 'date',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'paymentMethod': _i1.ParameterDescription(
              name: 'paymentMethod',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint).createExpense(
            session,
            params['expenseNumber'],
            params['category'],
            params['amount'],
            params['description'],
            params['date'],
            params['paymentMethod'],
            params['status'],
            params['userId'],
          ),
        ),
        'updateExpense': _i1.MethodConnector(
          name: 'updateExpense',
          params: {
            'expenseNumber': _i1.ParameterDescription(
              name: 'expenseNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'amount': _i1.ParameterDescription(
              name: 'amount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'date': _i1.ParameterDescription(
              name: 'date',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'paymentMethod': _i1.ParameterDescription(
              name: 'paymentMethod',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint).updateExpense(
            session,
            params['expenseNumber'],
            params['category'],
            params['amount'],
            params['description'],
            params['date'],
            params['paymentMethod'],
            params['status'],
          ),
        ),
        'deleteExpense': _i1.MethodConnector(
          name: 'deleteExpense',
          params: {
            'expenseNumber': _i1.ParameterDescription(
              name: 'expenseNumber',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint).deleteExpense(
            session,
            params['expenseNumber'],
          ),
        ),
        'getAllExpenses': _i1.MethodConnector(
          name: 'getAllExpenses',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .getAllExpenses(session),
        ),
        'getExpenseByNumber': _i1.MethodConnector(
          name: 'getExpenseByNumber',
          params: {
            'expenseNumber': _i1.ParameterDescription(
              name: 'expenseNumber',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .getExpenseByNumber(
            session,
            params['expenseNumber'],
          ),
        ),
        'getAllExpenseCategories': _i1.MethodConnector(
          name: 'getAllExpenseCategories',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .getAllExpenseCategories(session),
        ),
        'getAllExpenseStatuses': _i1.MethodConnector(
          name: 'getAllExpenseStatuses',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['masterData'] as _i7.MasterDataEndpoint)
                  .getAllExpenseStatuses(session),
        ),
      },
    );
  }
}
