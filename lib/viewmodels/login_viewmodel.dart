import 'dart:convert';

import 'package:ClockSpotter/api/secureCacheManager.dart';
import 'package:ClockSpotter/utils/ui_utils.dart';
import 'package:ClockSpotter/views/Registeration/register_view.dart';
import 'package:ClockSpotter/views/forgot%20password/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/entities/login_entity/login_request_entity.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/views/home/home_view.dart';
import 'package:ClockSpotter/views/registerface/registerface_view.dart';


import '../api/dio_client.dart';

class LoginViewModel extends ChangeNotifier {


  String title = 'default';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late BuildContext context;

  bool passwordVisible = true;
  bool rememberpassword=false;
  bool isLoading = false;


// Create storage

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
  void forgotClicked() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) => ForgotView(),
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
  void loginClicked() {
  /*  if (!_isValidEmail(emailController.text)) {
      showToast("Please enter a valid email address.");
      return;
    }*/

    if (!_isValidPassword(passwordController.text)) {
      showToast("Please enter a valid password with at least 6 characters.");
      return;
    }
    // emailController.text='sameer71095@gmail.com';
    // passwordController.text='123456';
     client.LoginEmployee(LoginRequestEntity(email:emailController.text,password: passwordController.text )).then((response) async {
       // Navigate to home screen
      if(response.isSuccess==true) {
        isLoading=false;
        notifyListeners();
        await storage.deleteAll(); // Delete all existing keys and values
        await storage.write(key: 'EmployeeId', value:response.data!.employeeId.toString());
        await storage.write(key: 'Token', value:response.data!.token.toString());
        await storage.write(key: 'loginResponse', value:jsonEncode(response.data?.toJson()));
        await constants.init();
        if(response.data!.isImagesRegistered==true){

          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, animation, secondaryAnimation) => HomeView(),
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
        }else{
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, animation, secondaryAnimation) => RegisterFaceView(),
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
      }else {
        isLoading=false;
        notifyListeners();
        // Display error message
        showToast("Invalid login credentials. Please try again.");

      }
       notifyListeners();
     }).catchError((error) {
       isLoading=false;

       //  showToast("An error occurred. Please try again.");
       notifyListeners();
     });

  }
}
