

import 'dart:io';
import 'package:dio/src/multipart_file.dart';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sai_attendance/api/dioClient.dart';
import 'package:sai_attendance/utils/Debouncer.dart';
import 'package:sai_attendance/views/home/home_view.dart';

class RegisterFaceViewModel extends ChangeNotifier {
  String title = 'default';

  OverlayEntry? overlayEntry;
  late BuildContext context;
  void initialise(BuildContext contexts) {
    context=contexts;
    notifyListeners();
  }
  List<File?> capturedImages = [];
  int currentStep = 0;
  bool faceDetected=false;
  List<String> directions = [
    'Look straight',
    'Turn your head a little to the right',
    'Turn your head a little to the left',
    'Tilt your head a little up',
   // 'Tilt your head a little down',
  ];

  final storage = const FlutterSecureStorage();
  Future<void> onCaptureClick(File? image) async {
    try{
      if (image == null) {
        print("Error capturing image: Image is null");
        return;
      }
      capturedImages.add(image);
      currentStep++;
      if(currentStep>3){
        storage.read(key: 'EmployeeId').then((value) {
          String? employeeId=value;
          if (employeeId == null) {
            print("Error: EmployeeId is null");
            return;
          }
          // Show loading indicator
          overlayEntry = _buildLoadingOverlay(context);
          Overlay.of(context).insert(overlayEntry!);
          try{
            client.RegisterEmployeeImages(employeeId,capturedImages).then((response) {
              if(response.status==200) {
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
              }  else {
                print("Error: API returned status ${response.status}");
                // Show error message to user
              }
            });
          } catch (e) {
            print("Error calling API: $e");
            // Show error message to user
          } finally {
            overlayEntry?.remove();
            overlayEntry = null;
            notifyListeners();
          }
        });
        /* String employeeId='1';*/
      }
    } catch (e) {
      print("Error capturing image: $e");
    }
    // notifyListeners();
  }

/* void onFaceDetected(bool isFaceDetected) {
    faceDetected=isFaceDetected;
    notifyListeners();
  }*/

  OverlayEntry _buildLoadingOverlay(BuildContext context) {
    return OverlayEntry(builder: (context) {
      return Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      );
    });
  }

}
