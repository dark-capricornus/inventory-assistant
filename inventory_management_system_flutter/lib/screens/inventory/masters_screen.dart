import 'package:flutter/material.dart';

class MastersScreen extends StatefulWidget {
  const MastersScreen({super.key});

  @override
  State<MastersScreen> createState() => _MastersScreenState();
}

class _MastersScreenState extends State<MastersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Master Data Management',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: [
                _buildMasterCard(
                  'Party Master',
                  Icons.business,
                  Colors.blue,
                  () => _navigateToMaster('party'),
                ),
                _buildMasterCard(
                  'Product Master',
                  Icons.inventory_2,
                  Colors.green,
                  () => _navigateToMaster('product'),
                ),
                _buildMasterCard(
                  'Vehicle Master',
                  Icons.local_shipping,
                  Colors.orange,
                  () => _navigateToMaster('vehicle'),
                ),
                _buildMasterCard(
                  'Address Book',
                  Icons.contact_phone,
                  Colors.purple,
                  () => _navigateToMaster('address'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildRecentUpdatesSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddMasterDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMasterCard(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(0.2),
              child: Icon(
                icon,
                color: color,
                size: 28,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Manage ${title.toLowerCase()}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToMaster(String type) {
    // Navigate to the appropriate master screen based on type
    switch (type) {
      case 'party':
        _showPartyMasterScreen();
        break;
      case 'product':
        _showProductMasterScreen();
        break;
      case 'vehicle':
        _showVehicleMasterScreen();
        break;
      case 'address':
        _showAddressBookScreen();
        break;
    }
  }

  void _showPartyMasterScreen() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Party Master',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text('Party ${index + 1}'),
                        subtitle: Text('Category: ${index % 3 == 0 ? "Supplier" : "Customer"}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                // Edit party
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // Delete party
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showProductMasterScreen() {
    // Similar implementation as _showPartyMasterScreen but for products
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Product Master',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.withOpacity(0.2),
                          child: const Icon(Icons.inventory_2, color: Colors.green),
                        ),
                        title: Text('Product ${index + 1}'),
                        subtitle: Text('Stock: ${(index + 1) * 5} units'),
                        trailing: Text('\$${(index + 1) * 9.99}'),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showVehicleMasterScreen() {
    // Implementation for Vehicle Master
    // Similar structure as the other master screens
  }

  void _showAddressBookScreen() {
    // Implementation for Address Book
    // Similar structure as the other master screens
  }

  void _showAddMasterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Master Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.business, color: Colors.blue),
                title: const Text('Add Party'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to add party form
                },
              ),
              ListTile(
                leading: const Icon(Icons.inventory_2, color: Colors.green),
                title: const Text('Add Product'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to add product form
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_shipping, color: Colors.orange),
                title: const Text('Add Vehicle'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to add vehicle form
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_phone, color: Colors.purple),
                title: const Text('Add Contact'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to add contact form
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRecentUpdatesSection() {
    final updates = [
      {
        'title': 'Product Added',
        'description': 'New product "Widget X" added to inventory',
        'time': '2 hours ago',
      },
      {
        'title': 'Party Updated',
        'description': 'Contact info for "ABC Corp" updated',
        'time': '1 day ago',
      },
      {
        'title': 'Vehicle Removed',
        'description': 'Vehicle "TK-421" removed from fleet',
        'time': '3 days ago',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Updates',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: updates.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final update = updates[index];
              return ListTile(
                title: Text(update['title'] as String),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(update['description'] as String),
                    const SizedBox(height: 4),
                    Text(
                      update['time'] as String,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                isThreeLine: true,
              );
            },
          ),
        ),
      ],
    );
  }
}