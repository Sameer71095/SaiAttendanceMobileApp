import 'dart:convert';

import 'package:ClockSpotter/api/secureCacheManager.dart';
import 'package:ClockSpotter/entities/register_entity/register_request_entity.dart';
import 'package:ClockSpotter/utils/ui_utils.dart';
import 'package:ClockSpotter/views/OTP%20Verification/otp_verification.dart';
import 'package:ClockSpotter/views/Registeration/register_view_mobile.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ClockSpotter/entities/login_entity/login_request_entity.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/views/home/home_view.dart';
import 'package:ClockSpotter/views/registerface/registerface_view.dart';


import '../api/dio_client.dart';

class RegisterViewModel extends ChangeNotifier {

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;


  void searchedClicked() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) => OTPView(),
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

  String title = 'default';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late BuildContext context;

  bool passwordVisible = true;
  bool rememberpassword = false;

// Create storage

  void initialise(BuildContext contexts) {
    context = contexts;
    notifyListeners();
  }

  void onPasswordVisibility() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  void onCheckBox(bool value) {
    rememberpassword = value ?? false;
    notifyListeners();
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _isValidPassword(String password) {
    return password.length >= 6; // You can add more validation rules if needed
  }
  bool _isValidContact(String contact) {
    return contact.length == 11; // You can add more validation rules if needed
  }
  bool _isValidName(String username) {
    return username.length >0; // You can add more validation rules if needed
  }
  bool _isValidCompanyName(String companyName) {
    return companyName.length >0; // You can add more validation rules if needed
  }

  void alreadyClicked() {
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
    notifyListeners();
  }

  void registerClicked() async {
    if (!_isValidName(nameController.text)) {
      showToast("Please enter a valid name.");
      return;
    }
    if (!_isValidEmail(emailController.text)) {
      showToast("Please enter a valid email address.");
      return;
    }
    if (!_isValidContact(contactController.text)) {
      showToast("Please enter a valid mobile number.");
      return;
    }
    if (!_isValidCompanyName(companyNameController.text)) {
      showToast("Please enter a valid company name.");
      return;
    }

    if (!_isValidPassword(passwordController.text)) {
      showToast("Please enter a valid password with at least 6 characters.");
      return;
    }

      client.RegisterEmployee(
          RegisterRequestEntity(email: emailController.text,
              password: passwordController.text,
              name: nameController.text,
              companyName: companyNameController.text,
              contact: contactController.text)).then((response) async {
        // Navigate to home screen
        if (response.isSuccess == true) {
          isLoading=false;
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  OTPView(),
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
        } else {
          isLoading=false;
          // Display error message
          showToast("Invalid register credentials. Please try again.");
        }
        notifyListeners();
      }).catchError((error) {
        //  showToast("An error occurred. Please try again.");
        notifyListeners();
      });
    }



  }

