

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sai_attendance/entities/login_entity/login_request_entity.dart';
import 'package:sai_attendance/views/home/home_view.dart';
import 'package:sai_attendance/views/registerface/registerface_view.dart';

import '../api/dioClient.dart';

class LoginViewModel extends ChangeNotifier {
  String title = 'default';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late BuildContext context;

// Create storage
  final storage = FlutterSecureStorage();

  void initialise(BuildContext contexts) {
    context=contexts;
    notifyListeners();
  }

   void loginClicked() {
     emailController.text='sameer71095@gmail.com';
     passwordController.text='1234567';
     client.LoginEmployee(LoginRequestEntity(email:emailController.text,password: passwordController.text )).then((response) async {
       // Navigate to home screen
      if(response.isSuccess==true) {
        await storage.write(key: 'EmployeeId', value:response.data!.employeeID.toString());
        await storage.write(key: 'Token', value:response.data!.token.toString());
        await storage.write(key: 'loginResponse', value:jsonEncode(response.data?.toJson()) );
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
      }
       notifyListeners();
     });

  }
}
