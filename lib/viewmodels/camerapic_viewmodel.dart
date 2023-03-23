

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sai_attendance/views/home/home_view.dart';
import 'package:sai_attendance/views/login/login_view.dart';

import '../api/dioClient.dart';

class CameraPicViewModel extends ChangeNotifier {

  File? capturedImage;
  String title = 'default';
  String userName="Loading";



  late BuildContext context;
  void initialise(BuildContext contexts) {
    context=contexts;
    notifyListeners();
  }

  void onCaptureAgainClick(){
    capturedImage = null;
    notifyListeners();
  }
  void onCaptureClick(File? image){
    capturedImage = image;
    //  Navigator.pop(context);

    client.Recognize(image).then((response) {
      userName=response.data!.toString();
      notifyListeners();
    });
    notifyListeners();
  }
}
