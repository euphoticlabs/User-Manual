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
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    // Show the app immediately after a short delay
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _isLoaded = true;
        });
      }
    });

    // Preload images in the background (non-blocking)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preloadImagesInBackground();
    });
  }

  Future<void> _preloadImagesInBackground() async {
    try {
      // Add a timeout to prevent hanging
      await Future.wait([
        ImagePreloader.preloadCriticalImages(context),
      ]).timeout(
        const Duration(seconds: 3),
        onTimeout: () {
          return <void>[];
        },
      );
    } catch (e) {
      // Ignore preloading errors - app will still work
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded) {
      return const Scaffold(
        backgroundColor: Color(0xFFFF6B2C),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'Loading Nosh User Manual...',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    return const UserManualPage();
  }
}

