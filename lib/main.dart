
import 'package:ClockSpotter/utils/Custom_Theme.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/utils/ui_utils.dart';
import 'package:ClockSpotter/views/splash/splash_view.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';

List<CameraDescription> cameras=<CameraDescription>[];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await FaceCamera.initialize();

  try {
    cameras = await availableCameras();
  } on Exception catch (e) {
    // TODO
  }
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
      accuracy: LocationAccuracy.high, interval: 1000, distanceFilter: 0,);
    location.enableBackgroundMode(enable: false);

    await constants.init();
    await SentryFlutter.init(
          (options) {
        options.dsn = 'https://5b7267ffa3e34271821e6cd73592a633@o4504977164402688.ingest.sentry.io/4504977170497536';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
        options.enableAppHangTracking = true;
        options.enableAutoSessionTracking = true;
       // options.debug = !kReleaseMode; // Enable debug mode in non-release builds
        options.attachStacktrace = true; // Attach stack trace to all events
        options.attachThreads = true; // Attach threads information to all events

        // Set environment and release information
        options.environment = kReleaseMode ? 'production' : 'debug';
        options.release = 'AttendanceSystem@1.0.0'; // Replace with your app's name and version
          },
      appRunner: () => runApp(MyApp()),
    );
   // runApp(MyApp());
  }  catch (exception, stackTrace) {
    await Sentry.captureException(
      exception,
      stackTrace: stackTrace,
    );
    print("An error occurred while initializing the app: $exception");
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

/*    return  NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'ClockSpotter',
      themeMode: ThemeMode.light,
      theme: customNeumorphicTheme,
      home: SplashView(),
    );*/
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ClockSpotter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashView());
  }
}
