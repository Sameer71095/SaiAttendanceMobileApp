import 'dart:convert';

import 'package:ClockSpotter/api/secureCacheManager.dart';
import 'package:ClockSpotter/utils/ui_utils.dart';
import 'package:ClockSpotter/views/OTP%20Verification/otp_verification.dart';
import 'package:ClockSpotter/views/Registeration/register_view.dart';
import 'package:ClockSpotter/views/forgot%20password/forgot_password.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ClockSpotter/entities/login_entity/login_request_entity.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/views/home/home_view.dart';
import 'package:ClockSpotter/views/registerface/registerface_view.dart';


import '../api/dio_client.dart';

class OTPViewModel extends ChangeNotifier {



  void willPopScopeNavigation(){
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
        transitionsBuilder: (context, animation, secondaryAnimation,
            child) {
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
  }


  final TextEditingController textEditingController = TextEditingController();

  bool isLoading = false;
  bool verificationFailed = false;



  void handleOTPVerification() {
    // Simulate loading for 5 seconds
      isLoading = true;
      notifyListeners();
    Future.delayed(Duration(seconds: 5), () {

        isLoading = false;
        verificationFailed = true;
          showToast("unable to verify otp.");

        notifyListeners();
      // Perform your OTP verification logic here
      // Once verification is complete, navigate to the next screen

    });
  }


  String title = 'default';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late BuildContext context;

  bool passwordVisible = false;
  bool rememberpassword=false;




  // Create storage
  void rememberedPassword() {

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) => RegisterView(),
        transitionsBuilder: (context, animation, secondaryAnimation,
            child) {
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
    notifyListeners();
  }


  void initialise(BuildContext contexts) {
    context=contexts;
    notifyListeners();
  }
  void onCheckBox(bool value) {
    rememberpassword=value ?? false;
    notifyListeners();
  }

  void onPasswordVisibility() {
    passwordVisible=!passwordVisible;
    notifyListeners();
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _isValidPassword(String password) {
    return password.length >= 6; // You can add more validation rules if needed
  }
  void backClicked() {
    /*  if (!_isValidEmail(emailController.text)) {
      showToast("Please enter a valid email address.");
      return;
    }*/
    Navigator.pop(context);

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
        transitionsBuilder: (context, animation, secondaryAnimation,
            child) {
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

  }
  void RegisterClicked() {

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) => RegisterView(),
        transitionsBuilder: (context, animation, secondaryAnimation,
            child) {
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

  }
}