import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notificationsEnabled = true;
  bool _autoBackup = false;
  bool _isLoading = true;
  String _backupFrequency = 'Daily';
  String _language = 'English';
  String _currency = 'USD';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      
      if (!mounted) return;
      
      setState(() {
        _darkMode = prefs.getBool('darkMode') ?? false;
        _notificationsEnabled = prefs.getBool('notificationsEnabled') ?? true;
        _autoBackup = prefs.getBool('autoBackup') ?? false;
        _backupFrequency = prefs.getString('backupFrequency') ?? 'Daily';
        _language = prefs.getString('language') ?? 'English';
        _currency = prefs.getString('currency') ?? 'USD';
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      
      setState(() {
        _isLoading = false;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load settings: $e')),
      );
    }
  }

  Future<void> _saveSetting(String key, dynamic value) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    
    try {
      final prefs = await SharedPreferences.getInstance();
      
      if (value is bool) {
        await prefs.setBool(key, value);
      } else if (value is String) {
        await prefs.setString(key, value);
      } else if (value is int) {
        await prefs.setInt(key, value);
      } else if (value is double) {
        await prefs.setDouble(key, value);
      }
      
      if (!mounted) return;
      
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Settings saved')),
      );
    } catch (e) {
      if (!mounted) return;
      
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Failed to save setting: $e')),
      );
    }
  }
  
  Future<void> _exportData() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    
    try {
      // Show loading
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Exporting data...')),
      );
      
      // Simulate export process
      await Future.delayed(const Duration(seconds: 2));
      
      if (!mounted) return;
      
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Data exported successfully')),
      );
    } catch (e) {
      if (!mounted) return;
      
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Failed to export data: $e')),
      );
    }
  }
  
  Future<void> _importData() async {
    if (!mounted) return;

    // Store context reference before async operation
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    
    // Display confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Import Data'),
        content: const Text('Importing data will replace your existing data. Continue?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('CANCEL'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('IMPORT'),
          ),
        ],
      ),
    );
    
    if (confirmed != true || !mounted) return;
    
    try {
      // Show loading
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Importing data...')),
      );
      
      // Simulate import process
      await Future.delayed(const Duration(seconds: 2));
      
      if (!mounted) return;
      
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Data imported successfully')),
      );
    } catch (e) {
      if (!mounted) return;
      
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Failed to import data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('Appearance'),
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Enable dark mode for the app'),
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
              _saveSetting('darkMode', value);
            },
          ),
          ListTile(
            title: const Text('Language'),
            subtitle: Text(_language),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _showLanguageSelector(context),
          ),
          _buildDivider(),
          
          _buildSectionHeader('Notifications'),
          SwitchListTile(
            title: const Text('Enable Notifications'),
            subtitle: const Text('Get alerts for important events'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
              _saveSetting('notificationsEnabled', value);
            },
          ),
          _buildDivider(),
          
          _buildSectionHeader('Data Backup'),
          SwitchListTile(
            title: const Text('Auto Backup'),
            subtitle: const Text('Automatically backup your data'),
            value: _autoBackup,
            onChanged: (value) {
              setState(() {
                _autoBackup = value;
              });
              _saveSetting('autoBackup', value);
            },
          ),
          ListTile(
            title: const Text('Backup Frequency'),
            subtitle: Text(_backupFrequency),
            enabled: _autoBackup,
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: _autoBackup ? () => _showBackupFrequencySelector(context) : null,
          ),
          ListTile(
            title: const Text('Export Data'),
            subtitle: const Text('Export all your data as JSON'),
            leading: const Icon(Icons.upload),
            onTap: _exportData,
          ),
          ListTile(
            title: const Text('Import Data'),
            subtitle: const Text('Import data from a backup file'),
            leading: const Icon(Icons.download),
            onTap: _importData,
          ),
          _buildDivider(),
          
          _buildSectionHeader('Business Settings'),
          ListTile(
            title: const Text('Currency'),
            subtitle: Text(_currency),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _showCurrencySelector(context),
          ),
          ListTile(
            title: const Text('Tax Settings'),
            subtitle: const Text('Configure tax rates and rules'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tax settings not implemented yet')),
              );
            },
          ),
          _buildDivider(),
          
          _buildSectionHeader('System'),
          ListTile(
            title: const Text('Clear Cache'),
            subtitle: const Text('Free up storage space'),
            leading: const Icon(Icons.cleaning_services),
            onTap: () async {
              // Store ScaffoldMessenger before async operation
              final scaffoldMessenger = ScaffoldMessenger.of(context);
              // Simulate cache clearing
              scaffoldMessenger.showSnackBar(
                const SnackBar(content: Text('Clearing cache...')),
              );
              await Future.delayed(const Duration(seconds: 1));
              if (!mounted) return;
              scaffoldMessenger.showSnackBar(
                const SnackBar(content: Text('Cache cleared')),
              );
            },
          ),
          ListTile(
            title: const Text('About'),
            subtitle: const Text('Version 1.0.0'),
            leading: const Icon(Icons.info_outline),
            onTap: () => _showAboutDialog(context),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(indent: 16, endIndent: 16);
  }

  void _showLanguageSelector(BuildContext context) async {
    final languages = ['English', 'Spanish', 'French', 'German', 'Chinese', 'Japanese', 'Hindi'];
    
    final selectedLanguage = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Select Language'),
        children: languages.map((language) {
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(context, language),
            child: Text(language),
          );
        }).toList(),
      ),
    );
    
    if (!mounted) return;
    
    if (selectedLanguage != null && selectedLanguage != _language) {
      setState(() {
        _language = selectedLanguage;
      });
      _saveSetting('language', selectedLanguage);
    }
  }

  void _showBackupFrequencySelector(BuildContext context) async {
    final frequencies = ['Daily', 'Weekly', 'Monthly', 'Never'];
    
    final selectedFrequency = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Backup Frequency'),
        children: frequencies.map((frequency) {
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(context, frequency),
            child: Text(frequency),
          );
        }).toList(),
      ),
    );
    
    if (!mounted) return;
    
    if (selectedFrequency != null && selectedFrequency != _backupFrequency) {
      setState(() {
        _backupFrequency = selectedFrequency;
      });
      _saveSetting('backupFrequency', selectedFrequency);
    }
  }

  void _showCurrencySelector(BuildContext context) async {
    final currencies = ['USD', 'EUR', 'GBP', 'JPY', 'CAD', 'AUD', 'INR', 'CNY'];
    
    final selectedCurrency = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Select Currency'),
        children: currencies.map((currency) {
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(context, currency),
            child: Text('$currency - ${_getCurrencyName(currency)}'),
          );
        }).toList(),
      ),
    );
    
    if (!mounted) return;
    
    if (selectedCurrency != null && selectedCurrency != _currency) {
      setState(() {
        _currency = selectedCurrency;
      });
      _saveSetting('currency', selectedCurrency);
    }
  }
  
  String _getCurrencyName(String code) {
    switch (code) {
      case 'USD': return 'US Dollar';
      case 'EUR': return 'Euro';
      case 'GBP': return 'British Pound';
      case 'JPY': return 'Japanese Yen';
      case 'CAD': return 'Canadian Dollar';
      case 'AUD': return 'Australian Dollar';
      case 'INR': return 'Indian Rupee';
      case 'CNY': return 'Chinese Yuan';
      default: return '';
    }
  }
  
  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Inventory Management System',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(Icons.inventory, size: 50, color: Colors.blue),
      children: [
        const Text('A comprehensive inventory management system designed for small to medium businesses.'),
        const SizedBox(height: 16),
        const Text('© 2025 Your Company. All rights reserved.'),
      ],
    );
  }
}