

import 'dart:convert';
import 'dart:io';

import 'package:ClockSpotter/entities/attendance_entity/attendance_request_entity.dart';
import 'package:ClockSpotter/entities/attendance_entity/attendance_response_entity.dart';
import 'package:ClockSpotter/entities/login_entity/login_response_entity.dart';
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

import 'package:device_info_plus/device_info_plus.dart';

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

  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  String deviceName="";
  String deviceId="";

  late BuildContext context;
  Future<void> initialise(BuildContext contexts) async {
    context=contexts;
    currentCameraIndex = cameras.indexWhere((camera) => camera.lensDirection == CameraLensDirection.front);
    if (currentCameraIndex == -1) {
      currentCameraIndex = 0; // Default to the first camera if a front camera is not available
    }
    initializeCamera(currentCameraIndex);
    notifyListeners();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      deviceName = "${androidInfo.manufacturer} ${androidInfo.model}";
      deviceId = androidInfo.id; // Considered unique but may change upon factory reset
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      deviceName = iosInfo.name; // This is the device's name
      deviceId = iosInfo.identifierForVendor!; // Unique identifier
    }

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
    if (image == null) return;  // Return early if image is null to prevent further processing

    try {
      // Convert the File image to a base64 encoded string
      final List<int> imageBytes = await image.readAsBytes();
      final String base64Image = base64Encode(imageBytes);

      // Fetching the current location data
      LocationData _locationData = await location.getLocation();
      // Check if location is mocked
      if (_locationData.isMock!) {
        showToast('Invalid location.', duration: 3);
        isLoading = false;
        return;
      }
      String? loginDataValue = await storage.read(key: 'loginResponse');
      if (loginDataValue == null) {
        showToast('Login data not found.', duration: 3);
        return;
      }

      var val = Login.Data.fromJson(
          json.decode(loginDataValue) as Map<String, dynamic>);


      if (val.isLocationBound!) {
        bool isWithin = await helper.isWithinMeters(val.locations?.cast<SiteLocations>());
        if (!isWithin) {
          showToast('Please come to the allocated location ${val.location}');
          isLoading = false;
          return;
        }
      }

      // Populate the AttendanceRequestEntity object
      AttendanceRequestEntity attendanceEntity = AttendanceRequestEntity(
          checkedImage: base64Image,
          employerId: val.employerId,
          loggedEmployeeId: val.employeeId,
          deviceName: deviceName,
          deviceId: deviceId,
          latitude: _locationData.latitude,
          longitude: _locationData.longitude,
        checkedTime: DateTime.now(),
        checkedDate: DateTime.now(),
        isCheckedOut: false,
        isLate: false,
        isExcused: false,
        location: val.location,
        reason: ""
      );


      AttendanceResponseEntity results = await client.AddAttendance(attendanceEntity);
      await afterClickedUIUpdate(results);
      isLoading = false;

    } catch (e) {
      isLoading = false;
      showToast('Unable to detect $e', duration: 3);
    }

    notifyListeners();
  }

  Future<void> afterClickedUIUpdate(AttendanceResponseEntity results) async {
    try {
      List<String> checkedInEmployees = [];
      List<String> checkedOutEmployees = [];
      if (results.data!.isEmpty) {
        showToast('No employees detected', duration: 10);
      } else {
        for (var result in results.data!) {
          if (result.isCheckedOut == 1) {
            userName = '${result.name} Checked-Out';
            checkedOutEmployees.add(result.name!); // add to checkedOut list
          } else {
            userName = '${result.name} Checked-In';
            checkedInEmployees.add(result.name!); // add to checkedIn list
          }
          showToast(userName, duration: 10);
        }
      }
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        showCheckedInOutPopup(context, checkedInEmployees, checkedOutEmployees);
      });
      isLoading = false;
      notifyListeners();
    } catch (exception) {
      isLoading = false;
      notifyListeners();
      showToast('Unable to detect $exception', duration: 3);
    }
  }

  void showCheckedInOutPopup(BuildContext context, List<String> checkedInEmployees, List<String> checkedOutEmployees) {
    try {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: constraints.maxWidth/1.2,
                  height: constraints.maxHeight/1.5,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /*Text('Checked-INs and Checked-Outs', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                         */ IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text('Checked-INs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      child: ListView.separated(
                                        physics: BouncingScrollPhysics(),
                                        padding: EdgeInsets.all(8.0),
                                        itemCount: checkedInEmployees.length,
                                        itemBuilder: (BuildContext context, int index) {

                                          return Container(
                                            color: Colors.green, // green background color
                                            padding: EdgeInsets.all(8.0), // optional: for some padding around the text
                                            child: Text(
                                              checkedInEmployees[index],
                                              style: TextStyle(
                                                color: Colors.white, // setting text color to white to be prominent against the green background
                                                fontSize: 16,
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (BuildContext context, int index) => const Divider(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(color: Colors.blueGrey, width: 1),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text('Checked-Outs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      child: ListView.separated(
                                        physics: BouncingScrollPhysics(),
                                        padding: EdgeInsets.all(8.0),
                                        itemCount: checkedOutEmployees.length,
                                        itemBuilder: (BuildContext context, int index) {

                                          return Container(
                                            color: Colors.red, // red background color
                                            padding: EdgeInsets.all(8.0), // optional: for some padding around the text
                                            child: Text(
                                              checkedOutEmployees[index],
                                              style: TextStyle(
                                                color: Colors.white, // setting text color to white to be prominent against the red background
                                                fontSize: 16,
                                              ),
                                            ),
                                          );
                                         },
                                        separatorBuilder: (BuildContext context, int index) => const Divider(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ).then((val) {
        Navigator.pop(context, 'refresh');
      });
    } catch (e) {
      print('Error showing dialog: $e');
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
