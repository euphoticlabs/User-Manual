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
      home: const UserManualPage(),
    );
  }
}

// class OptimizedUserManualPage extends StatefulWidget {
//   const OptimizedUserManualPage({super.key});

//   @override
//   State<OptimizedUserManualPage> createState() => _OptimizedUserManualPageState();
// }

// class _OptimizedUserManualPageState extends State<OptimizedUserManualPage> {
//   bool _isLoaded = false;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // Preload critical images after the first frame
//   //   WidgetsBinding.instance.addPostFrameCallback((_) {
//   //     ImagePreloader.preloadCriticalImages(context);
//   //     setState(() {
//   //       _isLoaded = true;
//   //     });
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     if (!_isLoaded) {
//       return const Scaffold(
//         backgroundColor: Color(0xFFFF6B2C),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Loading Nosh User Manual...',
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     return const UserManualPage();
//   }
// }

