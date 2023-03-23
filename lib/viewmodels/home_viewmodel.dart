import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sai_attendance/views/camerapermission/camerapermission_view.dart';
import 'package:sai_attendance/views/camerapic/camerapic_view.dart';

class HomeViewModel extends ChangeNotifier {
  String title = 'default';

  late BuildContext context;
  bool isCheckedIn = false;
  bool isLoading = false;
  void initialise(BuildContext contexts) {
    context=contexts;
    title = 'initialised';
    notifyListeners();
  }

  int counter = 0;
  void updateTitle() {
    counter++;
    title = '$counter';
    notifyListeners();
  }

  PageController pageController = PageController(viewportFraction: .8);
  var paddingLeft = 0.0;

  bool button1 = true;
  bool button2 = true;

  List<String> attendanceList=['sam','s'];
  void buildMenu(int index) {
    paddingLeft = index * 150.0;
    if (button1 == true && index == 1) {
      button1 = false;
        index = 0;
    } else {
      button1 = true;
        index = 1;
    }
    notifyListeners();
  }

  Future<void> onCheckInClicked() async {
    try {
      PermissionStatus cameraPermissionStatus = await Permission.camera.status;
      if (cameraPermissionStatus == PermissionStatus.granted) {

        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) => CameraPicView(),
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
      } else {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) => CameraPermissionView(),
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
      }
    } on Exception catch (e) {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => CameraPicView(),
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
    }
    notifyListeners();
  }
}
