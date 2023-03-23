import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:sai_attendance/utils/ui_utils.dart';
import 'package:sai_attendance/views/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FaceCamera.initialize();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  Location location = Location();

  try {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print("Location service is not enabled.");
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print("Location permission is not granted.");
      }
    }

    location.changeSettings(
        accuracy: LocationAccuracy.high, interval: 1000, distanceFilter: 0);
    location.enableBackgroundMode(enable: false);

    runApp(MyApp());
  } catch (e) {
    print("An error occurred while initializing the app: $e");
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SAI Attendance',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashView());
  }
}
