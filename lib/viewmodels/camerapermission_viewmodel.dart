

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ClockSpotter/views/home/home_view.dart';
import 'package:ClockSpotter/views/login/login_view.dart';

class CameraPermissionViewModel extends ChangeNotifier {
  String title = 'default';

  late BuildContext context;
  void initialise(BuildContext contexts) {
    context=contexts;
    notifyListeners();
  }

  void requestCameraPermission() async {
    final PermissionStatus cameraPermissionStatus = await Permission.camera.request();
    if (cameraPermissionStatus == PermissionStatus.granted) {

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => HomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );
    } else {
      // permission not granted, show a message or navigate to a customized page for permission
    }
  }
}
