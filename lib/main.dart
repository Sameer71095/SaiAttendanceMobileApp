
import 'package:device_preview/device_preview.dart';

import 'package:ClockSpotter/utils/Custom_Theme.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/views/splash/splash_view.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_screenutil/flutter_screenutil.dart';
List<CameraDescription> cameras=<CameraDescription>[];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    await Sentry.captureException(e);
    print('Error: ${e.code}\nError Message: ${e.description}');
  } catch (e) {
    await Sentry.captureException(e);
    print("An unknown error occurred while checking camera availability: $e");
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
        throw Exception("Location service is not enabled.");
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        throw Exception("Location permission is not granted.");
      }
    }

    location.changeSettings(
      accuracy: LocationAccuracy.high, interval: 1000, distanceFilter: 0,);

    if (!kIsWeb) {
      location.enableBackgroundMode(enable: false);
    }

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
     /* appRunner: () => runApp(DevicePreview(
        enabled: true,
        builder: (context)=>MyApp())),*/

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
/*    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ClockSpotter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashView());
    */

   /* return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {*/
        return MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'ClockSpotter',
          // You can use the library anywhere in the app even in theme
          theme: AppTheme.appTheme,
          home: SplashView(),
        );
     /* },
      child:  SplashView(),
    );*/
  }
}
