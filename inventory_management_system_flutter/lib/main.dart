// ignore_for_file: prefer_const_constructors

import 'package:inventory_management_system_client/inventory_management_system_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/inventory/masters_screen.dart';
import 'screens/inventory/inventory_status_screen.dart';
import 'screens/analytics/dashboard_screen.dart';
import 'screens/accounting/accounts_tracker_screen.dart';
import 'screens/billing/bill_section_screen.dart';
import 'screens/orders/orders_screen.dart';
import 'screens/orders/purchase_orders_screen.dart';
import 'screens/analytics/market_analysis_screen.dart';
import 'screens/analytics/profit_analytics_screen.dart';
import 'screens/inventory/add_product_screen.dart';
import 'screens/inventory/add_supplier_screen.dart';
import 'screens/inventory/suppliers_screen.dart';
import 'screens/inventory/customers_screen.dart';
import 'screens/inventory/add_customer_screen.dart';
import 'screens/inventory/categories_screen.dart';
import 'screens/reports/reports_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/help/help_screen.dart';
import 'screens/orders/add_order_screen.dart';
import 'screens/inventory/add_category_screen.dart';
import 'screens/inventory/inventory_screen.dart';
import 'screens/analytics/analytics_screen.dart';

/// Sets up a global client object that can be used to talk to the server from
/// anywhere in our app.
late final Client client;

void main() {
  // Set up logging
  WidgetsFlutterBinding.ensureInitialized();

  // Set the server URL
  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  // Try different fallbacks for connection
  final serverUrl = serverUrlFromEnv.isNotEmpty 
      ? serverUrlFromEnv
      : 'http://192.168.25.35:8080/'; // Use your computer's local IP address on the same network
  
  // For debug output about connection issues
  debugPrint('Connecting to server at: $serverUrl');

  client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor();

  runApp(const InventoryManagementApp());
}

class InventoryManagementApp extends StatelessWidget {
  const InventoryManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/masters': (context) => const MastersScreen(),
        '/inventory_status': (context) => const InventoryStatusScreen(),
        '/accounts_tracker': (context) => const AccountsTrackerScreen(),
        '/bill_section': (context) => const BillSectionScreen(),
        '/orders': (context) => const OrdersScreen(),
        '/purchase_orders': (context) => const PurchaseOrdersScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/market_analysis': (context) => const MarketAnalysisScreen(),
        '/profit_analytics': (context) => const ProfitAnalyticsScreen(),
        
        // Updated routes with actual implementations
        '/add_product': (context) => const AddProductScreen(),
        '/add_supplier': (context) => const AddSupplierScreen(),
        '/suppliers': (context) => const SuppliersScreen(),
        '/customers': (context) => const CustomersScreen(),
        '/add_customer': (context) => const AddCustomerScreen(),
        '/categories': (context) => const CategoriesScreen(),
        
        // Updated routes that were previously placeholders
        '/add_order': (context) => const AddOrderScreen(),
        '/add_category': (context) => const AddCategoryScreen(),
        '/reports': (context) => const ReportsScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/help': (context) => const HelpScreen(),
        '/inventory': (context) => const InventoryScreen(),
        '/analytics': (context) => const AnalyticsScreen(),
      },
    );
  }
}
