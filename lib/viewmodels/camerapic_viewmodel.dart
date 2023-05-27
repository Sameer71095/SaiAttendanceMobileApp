

import 'dart:convert';
import 'dart:io';

import 'package:ClockSpotter/entities/attendance_entity/attendance_response_entity.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ClockSpotter/api/secureCacheManager.dart';
import 'package:ClockSpotter/main.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/utils/ui_utils.dart';
import 'package:ClockSpotter/views/home/home_view.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:image/image.dart' as img;


import 'package:sentry_flutter/sentry_flutter.dart';

import '../api/dio_client.dart';
import '../entities/login_entity/login_response_entity.dart' as Login;

class CameraPicViewModel extends ChangeNotifier {

  File? capturedImage;
  String title = 'default';
  String userName="Loading";
  int retryCount = 0;

  bool isLoading = false;

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

   /*   // Capture a sequence of frames
      List<XFile> frameSequence = await captureFrameSequence();

      // Analyze the sequence for liveness
      bool isLive = await analyzeSequenceForLiveness(frameSequence);

      // If the liveness check fails, handle it
      if (!isLive) {
        handleFailedLivenessCheck();
        return;
      }

      // If the liveness check passes, send the data to the server
      XFile? image = selectImageFromSequence(frameSequence);*/


      AttendanceResponseEntity results= AttendanceResponseEntity();
      LocationData _locationData = await location.getLocation();

      String? loginDataValue = await storage.read(key: 'loginResponse');
      if (loginDataValue != null) {
        var val = Login.Data.fromJson(
            json.decode(loginDataValue) as Map<String, dynamic>);
        if (val.isLocationBound!) {
          helper.isWithinMeters(val.locations).then((iswithin) async {
            if (iswithin) {
               results = await clientPython.CheckInCheckOut(
                  _locationData.latitude!, _locationData.longitude!, image);
          await     afterClickedUIUpdate(results);
            } else {
              showToast(
                  'Please come to the allocated location ${val.location}');

              isLoading = false;
            }
          });
        }else{

           results = await clientPython.CheckInCheckOut(
              _locationData.latitude!, _locationData.longitude!, image);
           await afterClickedUIUpdate(results);

           isLoading = false;
        }
      }
    } catch (e) {
      isLoading = false;
      showToast('Unable to detect $e', duration: 3);
    }

    notifyListeners();
  }
  Future<void> afterClickedUIUpdate(AttendanceResponseEntity results) async {

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

      showToast(userName, duration: 10);
      isLoading = false;
      Navigator.pop(context, 'refresh');
      // userName = results.data!.name.toString();
    } catch (exception) {
      isLoading = false;
      notifyListeners();
      showToast('Unable to detect $exception', duration: 3);
    }

    notifyListeners();

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


 /* Future<bool> analyzeSequenceForLiveness(List<XFile> frameSequence) async {
    const int MIN_BLINKS = 2;
    const int MIN_HEAD_MOVEMENTS = 2;

    int blinkCount = 0;
    int headMovementCount = 0;

    // Load your machine learning models
    var blinkDetector = await loadBlinkDetectorModel();
    var headMovementDetector = await loadHeadMovementDetectorModel();
    var textureAnalyzer = await loadTextureAnalyzerModel();

    // Analyze each frame in the sequence
    for (var frame in frameSequence) {
      // Preprocess the frame for the model
      var processedFrame = await preprocessFrameForModel(frame);

      // Pass the processed frame through the models concurrently
      var results = await Future.wait([
        blinkDetector.predict(processedFrame),
        headMovementDetector.predict(processedFrame),
        textureAnalyzer.analyze(processedFrame),
      ]);

      // If a blink was detected, increment the blink count
      if (results[0]) {
        blinkCount++;
      }

      // If a head movement was detected, increment the head movement count
      if (results[1]) {
        headMovementCount++;
      }

      // If the texture is inconsistent, return false early
      if (!results[2]) {
        return false;
      }
    }

    // If a certain number of blinks were detected, and the head moved a certain number of times,
    // consider it a live person
    return blinkCount > MIN_BLINKS && headMovementCount > MIN_HEAD_MOVEMENTS;
  }
*/
}
