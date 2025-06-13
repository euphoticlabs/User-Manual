import 'package:flutter/material.dart';
import 'package:user_manual/screens/user_manual_home.dart';
import 'package:user_manual/layout/responsive_wrapper.dart';

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
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ResponsiveBreakPointWrapper(child: child!);
      },
      home: const UserManualPage(),
    );
  }
}

