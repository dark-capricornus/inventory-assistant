import 'package:flutter/material.dart';
import '../analytics/analytics_screen.dart';
import '../analytics/dashboard_screen.dart';
import '../inventory/inventory_screen.dart';
import '../orders/orders_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _navigationItems = [
    {
      'title': 'Dashboard',
      'icon': Icons.dashboard,
      'route': '/dashboard',
    },
    {
      'title': 'Inventory',
      'icon': Icons.inventory_2,
      'route': '/inventory',
    },
    {
      'title': 'Orders',
      'icon': Icons.shopping_cart,
      'route': '/orders',
    },
    {
      'title': 'Analytics',
      'icon': Icons.bar_chart,
      'route': '/analytics',
    },
  ];

  // List of screen widgets to show based on the selected index
  final List<Widget> _screens = [
    const DashboardScreen(),
    const InventoryScreen(),
    const OrdersScreen(),
    const AnalyticsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: _buildDrawer(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // First half of items
            ..._navigationItems.sublist(0, 2).map((item) => _buildNavItem(
              item,
              _navigationItems.indexOf(item),
            )),
            
            // Center space for FAB
            const SizedBox(width: 40),
            
            // Second half of items
            ..._navigationItems.sublist(2).map((item) => _buildNavItem(
              item,
              _navigationItems.indexOf(item),
            )),
          ],
        ),
      ),
    );
  }
  
  Widget _buildNavItem(Map<String, dynamic> item, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item['icon'] as IconData,
              color: _currentIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
              size: 24,
            ),
            const SizedBox(height: 2),
            Text(
              item['title'] as String,
              style: TextStyle(
                fontSize: 12,
                color: _currentIndex == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        _showAddActionDialog();
      },
      child: const Icon(Icons.add),
    );
  }

  void _showAddActionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New'),
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildActionButton(
                  title: 'Add Product',
                  icon: Icons.add_box,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/add_product');
                  },
                ),
                const SizedBox(height: 10),
                _buildActionButton(
                  title: 'Add Order',
                  icon: Icons.shopping_cart_checkout,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/add_order');
                  },
                ),
                const SizedBox(height: 10),
                _buildActionButton(
                  title: 'Add Supplier',
                  icon: Icons.business,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/add_supplier');
                  },
                ),
                const SizedBox(height: 10),
                _buildActionButton(
                  title: 'Add Category',
                  icon: Icons.category,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/add_category');
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor),
            const SizedBox(width: 16),
            Text(title),
            const Spacer(),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('John Doe'),
            accountEmail: const Text('john.doe@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'JD',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          _buildDrawerItem(
            icon: Icons.dashboard,
            title: 'Dashboard',
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _currentIndex = 0;
              });
            },
          ),
          _buildDrawerItem(
            icon: Icons.inventory_2,
            title: 'Inventory',
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _currentIndex = 1;
              });
            },
          ),
          _buildDrawerItem(
            icon: Icons.shopping_cart,
            title: 'Orders',
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _currentIndex = 2;
              });
            },
          ),
          _buildDrawerItem(
            icon: Icons.bar_chart,
            title: 'Analytics',
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _currentIndex = 3;
              });
            },
          ),
          const Divider(),
          _buildDrawerItem(
            icon: Icons.business,
            title: 'Suppliers',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/suppliers');
            },
          ),
          _buildDrawerItem(
            icon: Icons.category,
            title: 'Categories',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/categories');
            },
          ),
          _buildDrawerItem(
            icon: Icons.people,
            title: 'Customers',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/customers');
            },
          ),
          _buildDrawerItem(
            icon: Icons.summarize,
            title: 'Reports',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/reports');
            },
          ),
          const Divider(),
          _buildDrawerItem(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
          _buildDrawerItem(
            icon: Icons.help,
            title: 'Help & Support',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/help');
            },
          ),
          _buildDrawerItem(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              Navigator.pop(context);
              // Show confirmation dialog before logout
              _showLogoutConfirmationDialog();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Clear user session and navigate to login screen
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}