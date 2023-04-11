

import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sai_attendance/api/secureCacheManager.dart';
import 'package:sai_attendance/main.dart';
import 'package:sai_attendance/utils/Constants.dart';
import 'package:sai_attendance/utils/ui_utils.dart';
import 'package:sai_attendance/views/home/home_view.dart';
import 'package:sai_attendance/views/login/login_view.dart';
import 'package:image/image.dart' as img;


import 'package:sentry_flutter/sentry_flutter.dart';

import '../api/dioClient.dart';

class CameraPicViewModel extends ChangeNotifier {

  File? capturedImage;
  String title = 'default';
  String userName="Loading";
  int retryCount = 0;


  late CameraController controller;
  late Future<void> initializeControllerFuture;

  int currentCameraIndex = 0;

  late BuildContext context;
  void initialise(BuildContext contexts) {
    context=contexts;
    currentCameraIndex = cameras.indexWhere((camera) => camera.lensDirection == CameraLensDirection.front);
    if (currentCameraIndex == -1) {
      currentCameraIndex = 0; // Default to the first camera if a front camera is not available
    }
    initializeCamera(currentCameraIndex);
    notifyListeners();
  }

  void initializeCamera(int cameraIndex) {

    controller = CameraController(cameras[cameraIndex], ResolutionPreset.medium);
    initializeControllerFuture = controller.initialize();
    notifyListeners();
  }
  void switchCamera() {
    currentCameraIndex = currentCameraIndex == cameras.indexWhere((camera) => camera.lensDirection == CameraLensDirection.front) ? cameras.indexWhere((camera) => camera.lensDirection == CameraLensDirection.back) : cameras.indexWhere((camera) => camera.lensDirection == CameraLensDirection.front);
    controller.dispose();
    initializeCamera(currentCameraIndex);
  }
  void onCaptureAgainClick(){
    capturedImage = null;
    notifyListeners();
  }
  void onCaptureClick(File? image) async {
    capturedImage = image;

    try {

      LocationData _locationData = await location.getLocation();
      showToast('clicked', duration: 1);
      // Pass the preprocessed image to the recognition algorithm
      final results = await clientPython.CheckInCheckOut(_locationData.latitude!, _locationData.longitude!,image);

      try {
        if(results.data!.isCheckedOut == 1){
          userName = '${results.data!.name} Checked-Out';
          if(results.data?.employeeID==constants.loginData.employeeId) {
            constants.loginData.isCheckedout=true;
            await storage.write(key: 'loginResponse',
                value: jsonEncode(constants.loginData.toJson()));
          }
        }else{
          userName = '${results.data!.name} Checked-In';
          if(results.data?.employeeID==constants.loginData.employeeId) {
            constants.loginData.isCheckedout=false;
            await storage.write(key: 'loginResponse',
                value: jsonEncode(constants.loginData.toJson()));
          }
        }
        // userName = results.data!.name.toString();
      } catch (exception) {
        showToast('Unable to detect $exception', duration: 10);
      }

      showToast(userName, duration: 10);
      Navigator.pop(context, 'refresh');
      notifyListeners();
    } catch (e) {
      showToast('Unable to detect $e', duration: 10);
    }
  }
  String? errorMessage;
  Future<void> handleCameraError(String message) async {
    errorMessage = message;
    await Sentry.captureException(
      errorMessage,
      stackTrace: "",
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Camera Error'),
          content: Text('An error occurred while accessing the camera: $message'),
          actions: <Widget>[
            TextButton(
              child: Text('Retry'),
              onPressed: () {
                Navigator.of(context).pop();
                if (retryCount < 3) {
                  retryCount++;
                  onCaptureAgainClick();
                } else {
                  // Handle max retry limit reached
                }
              },
            ),
          ],
        );
      },
    );

    notifyListeners();
  }

  Future<File> GenerateOptimizedFile(XFile image) async {
    final bytes = await image.readAsBytes();
    final decodedImage = img.decodeImage(bytes);
    final normalizedImage = img.copyResize(decodedImage!, width: 224);
    final grayscaleImage = img.grayscale(normalizedImage);
    final normalizedBytes = img.encodeJpg(grayscaleImage);

    // Save the normalized image
    final tempDir = await getTemporaryDirectory();
    final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final File imageFile = File('${tempDir.path}/$fileName.jpg');
    await imageFile.writeAsBytes(normalizedBytes);
    // Save the captured image to the file
    // await imageFile.writeAsBytes(await image.readAsBytes());
    return imageFile;
  }
/* Future<String> path(CaptureMode captureMode) async {
    final Directory extDir = await getTemporaryDirectory();
    final testDir =
    await Directory('${extDir.path}/test').create(recursive: true);
    final String fileExtension = captureMode == CaptureMode.photo ? 'jpg' : 'mp4';
    final String filePath =
        '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
    return filePath;
  }*/

}
