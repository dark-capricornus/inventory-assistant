import 'package:flutter/material.dart';
import 'help_support_screen.dart';

/// Help Screen that serves as a wrapper for the HelpSupportScreen
/// This allows for future expansion of the help section with additional tabs or features
class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simply return the existing HelpSupportScreen for now
    return const HelpSupportScreen();
  }
}