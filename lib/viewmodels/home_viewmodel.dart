import 'dart:convert';
import 'dart:math';

import 'package:ClockSpotter/views/registerface/registerface_view.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ClockSpotter/api/dio_client.dart';
import 'package:ClockSpotter/entities/attendance_entity/attendance_history_request_entity.dart';
import 'package:ClockSpotter/entities/attendance_entity/attendance_history_response_entity.dart' as AttendanceHistoryResponse;
import 'package:ClockSpotter/entities/attendance_entity/attendance_request_entity.dart';
import 'package:ClockSpotter/entities/login_entity/login_response_entity.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/utils/ui_utils.dart';
import 'package:ClockSpotter/views/camerapermission/camerapermission_view.dart';
import 'package:ClockSpotter/views/camerapic/camerapic_view.dart';

import 'package:location/location.dart' as Location;
import 'package:sentry_flutter/sentry_flutter.dart';

import '../api/secureCacheManager.dart';

class HomeViewModel extends ChangeNotifier {
  String title = 'default';

  late BuildContext context;
  bool isCheckedIn = false;
  String employeeName="";
  bool isLoading = false;
  int currentMonth=1;
  int currentYear=2023;
  Future<void> initialise(BuildContext contexts) async {
    context=contexts;
    title = 'initialised';
    DateTime now = DateTime.now();
    currentMonth = now.month; // This will give you the current month as an integer (e.g., 4)
    currentYear = now.year; // This will give you the current year as an integer (e.g., 2023)

    employeeName=constants.loginData.name!;
    // employeeName=  (await  storage.read(key: 'Name'))!;
    notifyListeners();
   // getUpdate();
    //  loadData();

  }

  int counter = 0;
  void getUpdate() {

    client.GetUpdateEmployee().then((response) async {
      if(response.isSuccess==true) {
        await storage.deleteAll(); // Delete all existing keys and values
        await storage.write(key: 'EmployeeId', value:response.data!.employeeId.toString());
        await storage.write(key: 'Token', value:response.data!.token.toString());
        await storage.write(key: 'loginResponse', value:jsonEncode(response.data?.toJson()));

        await constants.init();

        showToast("Update Called",duration: 1);
        if(response.data!.isImagesRegistered==true){

        }else{

          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, animation, secondaryAnimation) => RegisterFaceView(),
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
        }
      }else {
        // Display error message
        showToast("Invalid login credentials. Please try again.");

      }
      notifyListeners();
    }).catchError((error) {
      showToast("An error occurred. Please try again.");
      notifyListeners();
    });
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
            isWithinMeters(val.locations).then((
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
            //pageBuilder: (context, animation, secondaryAnimation) => CameraPermissionView(),
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

    // if (result != null) {
    // Refresh your data here
    _refreshData();
    //}
  }


  Future<void> _refreshData() async {
    // Update the necessary variables here

    DateTime now = DateTime.now();
    currentMonth = now.month; // This will give you the current month as an integer (e.g., 4)
    currentYear = now.year; // This will give you the current year as an integer (e.g., 2023)

    // You should handle any errors that might occur during data loading
    try {
      loadData();
    } catch (e) {
      // Handle the error appropriately
      print('Failed to load data: $e');

      await Sentry.captureException(
        e,
        stackTrace: e.toString(),
      );
    }

    notifyListeners();
  }


  Future<bool> isWithinMeters(List<SiteLocations>? locations) async {

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


    Location.LocationData _locationData = await location.getLocation();
    for (SiteLocations targetLocation in locations!) {
      double distance = calculateDistance(
          _locationData.latitude!, _locationData.longitude!, targetLocation.latitude!, targetLocation.longitude!);

      if (distance <= targetLocation.radius!) {
        return true;
      }
    }

    return false;
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

    return loadData();
  }

  ValueNotifier<bool> dataLoaded = ValueNotifier(false);
  Future<void> loadData() async {
    // Call the API and store the data in attendanceList
    attendanceList = await client.GetAttendanceHistory(AttendanceHistoryRequest(employeeId: constants.loginData.employeeId, monthId: currentMonth));
    dataLoaded.value = true; // Indicate that the data has been loaded
    notifyListeners();
  }
}
