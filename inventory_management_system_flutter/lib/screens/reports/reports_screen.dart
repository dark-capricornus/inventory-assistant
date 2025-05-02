import 'package:flutter/material.dart';
import 'dart:math';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  ReportsScreenState createState() => ReportsScreenState();
}

class ReportsScreenState extends State<ReportsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;
  String? _error;
  final List<ReportItem> _reports = [];
  late DateTime _startDate;
  late DateTime _endDate;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _startDate = DateTime.now().subtract(const Duration(days: 30));
    _endDate = DateTime.now();
    _loadReports();
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  void _loadReports() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    
    try {
      // Simulating API call delay
      await Future.delayed(const Duration(milliseconds: 1500));
      
      // Mock data - in a real app this would come from an API
      final mockReports = List.generate(15, (index) {
        final date = DateTime.now().subtract(Duration(days: Random().nextInt(30)));
        return ReportItem(
          id: "RPT${10000 + index}",
          title: _getReportTitle(index),
          type: ["Sales", "Inventory", "Financial"][index % 3],
          date: date,
          status: ["Generated", "Pending", "Failed"][index % 3],
          fileSize: "${(Random().nextInt(500) + 100).toString()} KB",
        );
      });
      
      if (mounted) {
        setState(() {
          _reports.clear();
          _reports.addAll(mockReports);
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _error = e.toString();
        });
      }
    }
  }
  
  String _getReportTitle(int index) {
    final titles = [
      "Monthly Sales Summary",
      "Inventory Status Report",
      "Profit and Loss Statement",
      "Top Selling Products",
      "Low Stock Alert",
      "Customer Purchase History",
      "Tax Summary Report",
      "Supplier Transaction Report",
      "Cash Flow Analysis",
      "Product Performance Analysis",
      "Sales by Category",
      "Expense Report",
      "Employee Performance",
      "Payment Collection Report",
      "Purchase Order Summary",
    ];
    return titles[index % titles.length];
  }
  
  Future<void> _selectDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(start: _startDate, end: _endDate);
    
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: initialDateRange,
    );
    
    if (newDateRange != null && mounted) {
      setState(() {
        _startDate = newDateRange.start;
        _endDate = newDateRange.end;
      });
      _loadReports(); // Reload with new date range
    }
  }
  
  Future<void> _generateReport(BuildContext context) async {
    // Store the ScaffoldMessenger before the async operation
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    
    final reportType = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Generate Report'),
        children: [
          'Sales Summary',
          'Inventory Status',
          'Financial Statement',
          'Tax Report',
          'Customer Analysis',
        ].map((type) => SimpleDialogOption(
          onPressed: () => Navigator.pop(context, type),
          child: Text(type),
        )).toList(),
      ),
    );
    
    if (reportType != null) {
      if (!mounted) return;
      
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Generating $reportType report...')),
      );
      
      // In a real app, call an API to generate the report
      await Future.delayed(const Duration(seconds: 2));
      
      if (mounted) {
        _loadReports(); // Refresh report list
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        actions: [
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: () => _selectDateRange(context),
            tooltip: 'Select Date Range',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadReports,
            tooltip: 'Refresh Reports',
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Sales'),
            Tab(text: 'Inventory'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildReportList(null),
          _buildReportList('Sales'),
          _buildReportList('Inventory'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _generateReport(context),
        tooltip: 'Generate Report',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildReportList(String? type) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $_error', style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadReports,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }
    
    final filteredReports = type == null 
        ? _reports 
        : _reports.where((report) => report.type == type).toList();
    
    if (filteredReports.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.folder_open, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text('No ${type?.toLowerCase() ?? ""} reports found'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _generateReport(context),
              child: const Text('Generate Report'),
            ),
          ],
        ),
      );
    }
    
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Date Range: ${_startDate.toString().substring(0, 10)} to ${_endDate.toString().substring(0, 10)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredReports.length,
            itemBuilder: (context, index) {
              final report = filteredReports[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  leading: _getReportIcon(report.type),
                  title: Text(report.title),
                  subtitle: Text('${report.type} • ${report.date.toString().substring(0, 10)} • ${report.fileSize}'),
                  trailing: _buildReportStatusChip(report.status),
                  onTap: () => _showReportDetails(context, report),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  
  Widget _getReportIcon(String type) {
    switch (type) {
      case 'Sales':
        return const Icon(Icons.attach_money, color: Colors.green);
      case 'Inventory':
        return const Icon(Icons.inventory_2, color: Colors.blue);
      case 'Financial':
        return const Icon(Icons.account_balance, color: Colors.purple);
      default:
        return const Icon(Icons.description);
    }
  }
  
  Widget _buildReportStatusChip(String status) {
    Color color;
    IconData icon;
    
    switch (status) {
      case 'Generated':
        color = Colors.green;
        icon = Icons.check_circle;
        break;
      case 'Pending':
        color = Colors.orange;
        icon = Icons.pending;
        break;
      case 'Failed':
        color = Colors.red;
        icon = Icons.error;
        break;
      default:
        color = Colors.grey;
        icon = Icons.help;
    }
    
    return Chip(
      label: Text(
        status,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: color,
      avatar: Icon(icon, color: Colors.white, size: 12),
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
  
  void _showReportDetails(BuildContext context, ReportItem report) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(report.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoRow('Report ID', report.id),
            _infoRow('Type', report.type),
            _infoRow('Generated On', report.date.toString().substring(0, 10)),
            _infoRow('Status', report.status),
            _infoRow('File Size', report.fileSize),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CLOSE'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Downloading report...')),
              );
            },
            child: const Text('DOWNLOAD'),
          ),
        ],
      ),
    );
  }
  
  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class ReportItem {
  final String id;
  final String title;
  final String type;
  final DateTime date;
  final String status;
  final String fileSize;
  
  const ReportItem({
    required this.id,
    required this.title,
    required this.type,
    required this.date,
    required this.status,
    required this.fileSize,
  });
}