import 'package:flutter/material.dart';

void main() {
  runApp(const UserManualApp());
}

class UserManualApp extends StatelessWidget {
  const UserManualApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Manual',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserManualPage(),
    );
  }
}

class UserManualPage extends StatelessWidget {
  const UserManualPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Manual'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the User Manual!\n\nThis is a user manual for the app.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
