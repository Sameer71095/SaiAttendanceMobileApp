

import 'package:flutter/material.dart';
import 'package:ClockSpotter/views/home/home_view.dart';
import 'package:ClockSpotter/views/login/login_view.dart';

import '../api/secureCacheManager.dart';

class SplashViewModel extends ChangeNotifier {
  String title = 'default';

  late BuildContext context;
  Future<void> initialise(BuildContext contexts) async {
    context=contexts;
    notifyListeners();
    // Read the value associated with the key 'EmployeeId'
    String? storedValue = await storage.read(key: 'EmployeeId');

    if (storedValue != null) {
      // The key 'EmployeeId' exists and its value is not null

      navigateToHome();
    } else {
      navigateToLogin();
    }
   // navigateToHome();
  }

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: 0), () {
      // Navigate to home screen
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 00),
          pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );
    });
  }
  void navigateToHome() {
    Future.delayed(const Duration(seconds: 0), () {
      // Navigate to home screen
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 00),
          pageBuilder: (context, animation, secondaryAnimation) => HomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );
    });
  }
}
