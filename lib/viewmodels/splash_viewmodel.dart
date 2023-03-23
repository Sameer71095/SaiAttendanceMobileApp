

import 'package:flutter/material.dart';
import 'package:sai_attendance/views/home/home_view.dart';
import 'package:sai_attendance/views/login/login_view.dart';

class SplashViewModel extends ChangeNotifier {
  String title = 'default';

  late BuildContext context;
  void initialise(BuildContext contexts) {
    context=contexts;
    notifyListeners();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to home screen
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 400),
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
}
