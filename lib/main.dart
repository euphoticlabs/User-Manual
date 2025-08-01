import 'package:flutter/material.dart';
import 'package:user_manual/screens/user_manual_home.dart';
import 'package:user_manual/layout/responsive_wrapper.dart';
import 'package:user_manual/utils/image_preloader.dart';

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
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ResponsiveBreakPointWrapper(child: child!);
      },
      // Go directly to the app - no custom splash screen
      home: const OptimizedUserManualPage(),
    );
  }
}

class OptimizedUserManualPage extends StatefulWidget {
  const OptimizedUserManualPage({super.key});

  @override
  State<OptimizedUserManualPage> createState() => _OptimizedUserManualPageState();
}

class _OptimizedUserManualPageState extends State<OptimizedUserManualPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preloadImagesInBackground();
    });
  }

  Future<void> _preloadImagesInBackground() async {
    try {
      await Future.wait([
        ImagePreloader.preloadCriticalImages(context),
      ]).timeout(
        const Duration(seconds: 3),
        onTimeout: () => <void>[],
      );
    } catch (e) {
      // Ignore preloading errors - app will still work
    }
  }

  @override
  Widget build(BuildContext context) {
    return const UserManualPage();
  }
}

