import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sai_attendance/api/dioClient.dart';
import 'package:sai_attendance/entities/attendance_entity/attendance_history_request_entity.dart';
import 'package:sai_attendance/entities/attendance_entity/attendance_history_response_entity.dart' as AttendanceHistoryResponse;
import 'package:sai_attendance/entities/attendance_entity/attendance_request_entity.dart';
import 'package:sai_attendance/entities/login_entity/login_response_entity.dart';
import 'package:sai_attendance/utils/Constants.dart';
import 'package:sai_attendance/utils/ui_utils.dart';
import 'package:sai_attendance/views/camerapermission/camerapermission_view.dart';
import 'package:sai_attendance/views/camerapic/camerapic_view.dart';

import 'package:location/location.dart' as Location;
import 'package:sentry_flutter/sentry_flutter.dart';

import '../api/secureCacheManager.dart';

class HomeViewModel extends ChangeNotifier {
  String title = 'default';

  late BuildContext context;
  bool isCheckedIn = false;
  String employeeName="";
  bool isLoading = false;
  Future<void> initialise(BuildContext contexts) async {
    context=contexts;
    title = 'initialised';
    employeeName=constants.loginData.name!;
   // employeeName=  (await  storage.read(key: 'Name'))!;
    notifyListeners();
  //  loadData();

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

  AttendanceHistoryResponse.AttendanceHistoryResponse attendanceList=AttendanceHistoryResponse.AttendanceHistoryResponse() ;
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
        String? loginDataValue = await storage.read(key: 'loginResponse');
        if (loginDataValue != null) {
          var val = Data.fromJson(
              json.decode(loginDataValue) as Map<String, dynamic>);
          if (val.isLocationBound!) {
            isWithin5Meters(val.latitude, val.longitude, val.radius).then((
                iswithin) {
              if (iswithin) {

                takeToCameraPicView();

              } else {
                showToast(
                    'Please come to the allocated location ${val.location}');
              }
            });
          }
        }else{

          takeToCameraPicView();
        }
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
    }  catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      takeToCameraPicView();
    }
    notifyListeners();
  }

  Future<void> takeToCameraPicView() async {
    final result =await Navigator.push(
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

    if (result != null) {
      // Refresh your data here
      _refreshData();
    }
  }

  void _refreshData() {
    // Update the necessary variables here
    loadData();
    notifyListeners();
  }

  Future<bool> isWithin5Meters(double? targetLatitude,double? targetLongitude,int? radius ) async {
/*    double targetLatitude = 25.161327204419532;
    double targetLongitude = 55.20950915143249;
    const double radius = 5.0;*/

    Location.Location location = new Location.Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    /* _permissionGranted = (await location.hasPermission()) as PermissionStatus;
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = (await location.requestPermission()) as PermissionStatus;
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }*/

    Location.LocationData _locationData = await location.getLocation();
    double distance = calculateDistance(
        _locationData.latitude!, _locationData.longitude!, targetLatitude!, targetLongitude!);

    return distance <= radius!;
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371.0; // Radius of Earth in kilometers
    double dLat = _degreesToRadians(lat2 - lat1);
    double dLon = _degreesToRadians(lon2 - lon1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) * cos(_degreesToRadians(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = earthRadius * c * 1000; // Convert to meters
    return distance;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  Future<void> onRefresh() async {
    return Future.value();
  }

  ValueNotifier<bool> dataLoaded = ValueNotifier(false);
  Future<void> loadData() async {
    // Call the API and store the data in attendanceList
    attendanceList = await client.GetAttendanceHistory(AttendanceHistoryRequest(employeeId: constants.loginData.employeeId, monthId: 4));
    dataLoaded.value = true; // Indicate that the data has been loaded
    notifyListeners();
  }
}
