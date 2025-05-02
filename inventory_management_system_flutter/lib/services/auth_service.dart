import 'package:flutter/material.dart';
import 'package:inventory_management_system_client/inventory_management_system_client.dart';
import '../main.dart';

class AuthService {
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();
  
  // Current user
  User? currentUser;
  
  // Sign up a new user
  Future<bool> signUp({
    required String username,  // Changed from name to username for clarity
    required String email,
    required String password,
  }) async {
    try {
      debugPrint('Attempting registration with username: $username, email: $email');
      
      // Call the server endpoint for user registration
      final user = await client.auth.register(
        username.trim(),  // Passing the username correctly
        email.trim(),     // Ensure email is trimmed
        password,
        'user',           // Default role for new users
      );
      
      debugPrint('User registered successfully: ${user.username}');
      // After successful registration, automatically log in
      currentUser = user;
      return true;
    } catch (e) {
      debugPrint('Error during registration: $e');
      // Log specific exception details to help with debugging
      if (e is ServerpodClientException) {
        debugPrint('Server error code: ${e.statusCode}');
        debugPrint('Exception details: $e');
        debugPrint('Server connection info: Using ${client.toString()}');
      }
      return false;
    }
  }

  // Log in an existing user
  Future<bool> login({
    required String username, // Changed from email to username to match server expectations
    required String password,
  }) async {
    try {
      debugPrint('Attempting login with username: $username');
      
      // Call the server endpoint for user authentication
      final user = await client.auth.login(
        username.trim(), // Server expects username, not email
        password,
      );
      
      if (user != null) {
        currentUser = user;
        debugPrint('User logged in successfully: ${user.username}');
        return true;
      } else {
        debugPrint('Invalid credentials');
        return false;
      }
    } catch (e) {
      debugPrint('Error during login: $e');
      // Log specific exception details to help with debugging
      if (e is ServerpodClientException) {
        debugPrint('Server error code: ${e.statusCode}');
        // Using toString() instead of response property
        debugPrint('Exception details: $e');
        debugPrint('Server connection info: Using ${client.toString()}');
      }
      return false;
    }
  }
  
  // Log out the current user
  Future<void> logout() async {
    try {
      // Note: No explicit logout method found in the endpoints
      // You may want to add a logout endpoint on the server
      currentUser = null;
      debugPrint('User logged out');
    } catch (e) {
      debugPrint('Error during logout: $e');
    }
  }
  
  // Check if a user is currently logged in
  bool isLoggedIn() {
    return currentUser != null;
  }
}