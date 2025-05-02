import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  Future<void> _launchUrl(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Error opening link: $e')),
      );
    }
  }

  void _showContactForm(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    
    showDialog(
      context: context,
      builder: (context) {
        // ignore: unused_local_variable
        String name = '';
        // ignore: unused_local_variable
        String email = '';
        // ignore: unused_local_variable
        String message = '';
        
        return AlertDialog(
          title: const Text('Contact Support'),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      // Store name for form submission
                      name = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      // Store email for form submission
                      email = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Message',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                    ),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your message';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      // Store message for form submission
                      message = value;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCEL'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // In a real app, we would send name, email, and message to a support service
                  // For example: SupportService().submitTicket(name, email, message);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Message sent to support team'),
                    ),
                  );
                }
              },
              child: const Text('SEND'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: Colors.blue[50],
              child: Column(
                children: [
                  Icon(Icons.support_agent, size: 56, color: Colors.blue[700]),
                  const SizedBox(height: 16),
                  const Text(
                    'How can we help you?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Fix overflow by constraining text width and adding text overflow handling
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Find answers to common questions or contact our support team',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'FREQUENTLY ASKED QUESTIONS',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            _buildFAQItem(
              context,
              'How do I add new inventory items?',
              'Go to the Inventory tab and tap the "+" button in the bottom right. Fill out the item details and save.',
            ),
            _buildFAQItem(
              context,
              'How can I create purchase orders?',
              'Navigate to the Orders tab, select "Purchase Orders" and tap the "+" button to create a new order.',
            ),
            _buildFAQItem(
              context,
              'Can I export my inventory reports?',
              'Yes! Go to the Reports section and select the report you want. Use the export button to download in various formats.',
            ),
            _buildFAQItem(
              context,
              'How do I set up low stock alerts?',
              'In the Inventory section, edit an item and set the "Minimum Stock Level". When inventory drops below this level, you\'ll receive an alert.',
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'SUPPORT OPTIONS',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            _buildSupportOption(
              icon: Icons.email,
              title: 'Contact Support',
              subtitle: 'Send an email to our support team',
              onTap: () => _showContactForm(context),
            ),
            _buildSupportOption(
              icon: Icons.chat,
              title: 'Live Chat',
              subtitle: 'Chat with our support team',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Live chat feature coming soon!'),
                  ),
                );
              },
            ),
            _buildSupportOption(
              icon: Icons.phone,
              title: 'Call Us',
              subtitle: '+1 (555) 123-4567',
              onTap: () => _launchUrl('tel:+15551234567', context),
            ),
            _buildSupportOption(
              icon: Icons.menu_book,
              title: 'Documentation',
              subtitle: 'Browse our detailed product guides',
              onTap: () => _launchUrl('https://example.com/docs', context),
            ),
            const SizedBox(height: 16),
            const Divider(),
            // Fix overflow by using Wrap for flexible layout of ListTiles
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Privacy Policy'),
                    leading: const Icon(Icons.privacy_tip),
                    contentPadding: EdgeInsets.zero,
                    onTap: () => _launchUrl('https://example.com/privacy', context),
                  ),
                  ListTile(
                    title: const Text('Terms of Service'),
                    leading: const Icon(Icons.description),
                    contentPadding: EdgeInsets.zero,
                    onTap: () => _launchUrl('https://example.com/terms', context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'Version 1.0.0',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(BuildContext context, String question, String answer) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text(
            answer,
            style: const TextStyle(height: 1.5), // Add line height for better readability
          ),
        ),
      ],
    );
  }

  Widget _buildSupportOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      subtitle: Text(
        subtitle,
        overflow: TextOverflow.ellipsis, // Prevent overflow of subtitle text
      ),
      onTap: onTap,
    );
  }
}