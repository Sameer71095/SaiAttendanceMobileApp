


import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showSnackBar(BuildContext context,String msg) {
  final snackBar = SnackBar(
    shape: RoundedRectangleBorder(
      side: BorderSide(color:Colors.black.withOpacity(0.7), width: 1),
      borderRadius: BorderRadius.circular(24),
    ),
    content: Text(msg),

    backgroundColor:  Colors.black.withOpacity(0.7),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(40),
    elevation: 30,
    action: SnackBarAction(
      label: 'OK',
      disabledTextColor: Colors.white,
      textColor: Colors.blue,
      onPressed: () {
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
        //Do whatever you want
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);

}