import 'package:serverpod/serverpod.dart';
import 'package:inventory_management_system_server/src/generated/protocol.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class AuthEndpoint extends Endpoint {
  Future<User?> login(Session session, String username, String password) async {
    try {
      session.log('Attempting login with username: $username');
      
      // Find user by username
      final users = await session.db.find<User>(
        where: User.t.username.equals(username),
      );

      if (users.isEmpty) {
        session.log('User not found: $username');
        throw Exception('User not found');
      }

      final user = users.first;
      session.log('User found: ${user.username}, verifying password');
      
      // Verify password - use the same hashing method as in register
      final hashedPassword = sha256.convert(utf8.encode(password)).toString();
      
      // Debug log for password verification
      session.log('Password verification: Input hash: $hashedPassword, Stored hash: ${user.passwordHash}');
      
      if (user.passwordHash != hashedPassword) {
        session.log('Invalid password for user: $username');
        throw Exception('Invalid password');
      }

      // Update last login
      user.lastLogin = DateTime.now();
      await session.db.update([user]);
      
      session.log('User logged in successfully: $username');
      return user;
    } catch (e, stackTrace) {
      session.log('ERROR during login: $e');
      session.log('Stack trace: $stackTrace');
      
      // Rethrow with more context
      throw Exception('Failed to login user: $e');
    }
  }

  Future<User> register(
    Session session,
    String username,
    String email,
    String password,
    String role,
  ) async {
    try {
      // Log the database connection status
      session.log('Attempting to register user: $username, email: $email, role: $role');
      
      // Check if username or email already exists
      session.log('Checking for existing users');
      final existingUsers = await session.db.find<User>(
        where: User.t.username.equals(username) | User.t.email.equals(email), // Use the 'User' class for table reference
      );

      if (existingUsers.isNotEmpty) {
        session.log('User already exists with this username or email');
        throw Exception('Username or email already exists');
      }

      // Create the user
      session.log('Creating new user');
      final hashedPassword = sha256.convert(utf8.encode(password)).toString();
      final user = User(
        username: username,
        email: email,
        passwordHash: hashedPassword,
        role: role,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        lastLogin: DateTime.now()
      );

      session.log('Inserting user into database');
      final insertedUsers = await session.db.insert<User>([user]); // Changed from insertReturning to insert
      session.log('User registered successfully: ${insertedUsers.first.username}');
      return insertedUsers.first;
    } catch (e, stackTrace) {
      // Log the error details
      session.log('ERROR during registration: $e');
      session.log('Stack trace: $stackTrace');
      
      // Log the database state for debugging
      final users = await session.db.find<User>(); // Fetch all users for debugging
      session.log('Database state: ${users.map((u) => u.username).toList()}');
      
      // Rethrow with more context
      throw Exception('Failed to register user: $e');
    }
  }
}
