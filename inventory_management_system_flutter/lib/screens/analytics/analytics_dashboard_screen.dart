import 'package:flutter/material.dart';
import 'sales_analytics_screen.dart';
import 'inventory_analytics_screen.dart';
import 'expense_analytics_screen.dart';
import 'profit_analytics_screen.dart';
import 'sales_trends_screen.dart';

class AnalyticsDashboardScreen extends StatefulWidget {
  const AnalyticsDashboardScreen({super.key});

  @override
  State<AnalyticsDashboardScreen> createState() => _AnalyticsDashboardScreenState();
}

class _AnalyticsDashboardScreenState extends State<AnalyticsDashboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Map<String, dynamic>> _tabs = [
    {
      'title': 'Sales',
      'icon': Icons.show_chart,
      'color': Colors.blue,
      'screen': const SalesAnalyticsScreen(),
    },
    {
      'title': 'Inventory',
      'icon': Icons.inventory_2,
      'color': Colors.orange,
      'screen': const InventoryAnalyticsScreen(),
    },
    {
      'title': 'Expenses',
      'icon': Icons.account_balance_wallet,
      'color': Colors.red,
      'screen': const ExpenseAnalyticsScreen(),
    },
    {
      'title': 'Profit',
      'icon': Icons.savings,
      'color': Colors.green,
      'screen': const ProfitAnalyticsScreen(),
    },
    {
      'title': 'Trends',
      'icon': Icons.trending_up,
      'color': Colors.purple,
      'screen': const SalesTrendsScreen(),
    },
  ];
  
  String _selectedDateRange = 'Last 30 days';
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics Dashboard'),
        actions: [
          DropdownButton<String>(
            value: _selectedDateRange,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            underline: Container(),
            style: const TextStyle(color: Colors.white),
            dropdownColor: Theme.of(context).primaryColor,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedDateRange = newValue;
                });
              }
            },
            items: <String>[
              'Today',
              'Last 7 days',
              'Last 30 days',
              'This Month',
              'Last Quarter',
              'Year to Date',
              'Custom Range',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 14),
                ),
              );
            }).toList(),
          ),
          const SizedBox(width: 16),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3.0,
              tabs: _tabs.map((tab) {
                return Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(tab['icon'] as IconData, size: 18),
                        const SizedBox(width: 8),
                        Text(tab['title'] as String),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((tab) {
          return HeroMode(
            enabled: false,
            child: _buildDashboardContainer(tab['screen'] as Widget),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'analytics_fab',
        onPressed: () {
          // Export or share analytics data
          _showExportOptions(context);
        },
        child: const Icon(Icons.ios_share),
      ),
    );
  }
  
  Widget _buildDashboardContainer(Widget child) {
    // This wrapper allows us to add any dashboard-specific UI elements around each screen
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
      ),
      child: child,
    );
  }
  
  void _showExportOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Export Analytics',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const Divider(),
              _buildExportOption(
                context,
                icon: Icons.picture_as_pdf,
                title: 'Export as PDF',
                subtitle: 'Save all analytics data as a PDF file',
              ),
              _buildExportOption(
                context,
                icon: Icons.table_chart,
                title: 'Export as Excel',
                subtitle: 'Save all analytics data as an Excel spreadsheet',
              ),
              _buildExportOption(
                context,
                icon: Icons.email,
                title: 'Email Report',
                subtitle: 'Send analytics report to your email',
              ),
              _buildExportOption(
                context,
                icon: Icons.share,
                title: 'Share Report',
                subtitle: 'Share analytics report with your team',
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
  
  Widget _buildExportOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
        child: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
      ),
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title coming soon!')),
        );
      },
    );
  }
}