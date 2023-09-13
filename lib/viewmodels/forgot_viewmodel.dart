import 'dart:convert';

import 'package:ClockSpotter/api/secureCacheManager.dart';
import 'package:ClockSpotter/utils/custom_toast.dart';
import 'package:ClockSpotter/utils/ui_utils.dart';
import 'package:ClockSpotter/views/Registeration/register_view.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/entities/login_entity/login_request_entity.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/views/home/home_view.dart';
import 'package:ClockSpotter/views/registerface/registerface_view.dart';


import '../api/dio_client.dart';

class ForgotViewModel extends ChangeNotifier {

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




  void isLoadinFalse(){
    isLoading=false;
    notifyListeners();

  }
  void isLoadinTrue(){
    isLoading=true;
    notifyListeners();

  }
  bool isLoading = false;



  bool _isValidforgot(String controller){
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return  emailRegex.hasMatch(controller);
  }



  String title = 'default';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late BuildContext context;

  bool passwordVisible = false;
  bool rememberpassword=false;

  void forgetClicked() async {

    if (!_isValidforgot(emailController.text)) {
      isLoading=false;
      showToast("Please enter a valid forgot credentials.");
      return;
    }



    client.ForgetPassword(emailController.text).then((response) async {
      if (response.isSuccess == true) {
        isLoading=false;
        notifyListeners();
        showSnackBar(context,response.data.toString());
        // showToast(response.data.toString());

      } else {
        isLoading=false;
        notifyListeners();
        // Display error message
        showToast("Invalid forget credentials. Please try again.");
      }
      notifyListeners();
    }).catchError((error) {
      isLoading=false;
      //  showToast("An error occurred. Please try again.");
      notifyListeners();
    });
  }



  void rememberedPassword() {

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
  // void forgotClicked() {
  //   /*  if (!_isValidEmail(emailController.text)) {
  //     showToast("Please enter a valid email address.");
  //     return;
  //   }*/
  //
  //   Navigator.pushReplacement(
  //     context,
  //     PageRouteBuilder(
  //       transitionDuration: const Duration(milliseconds: 200),
  //       pageBuilder: (context, animation, secondaryAnimation) => ForgotView(),
  //       transitionsBuilder: (context, animation, secondaryAnimation,
  //           child) {
  //         return SlideTransition(
  //           position: Tween<Offset>(
  //             begin: const Offset(1.0, 0.0),
  //             end: Offset.zero,
  //           ).animate(animation),
  //           child: child,
  //         );
  //       },
  //     ),
  //   );
  // }
}
