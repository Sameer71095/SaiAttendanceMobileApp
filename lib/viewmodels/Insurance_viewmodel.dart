import 'dart:convert';
import 'dart:math';

import 'package:ClockSpotter/views/home/home_view.dart';
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
import 'package:show_update_dialog/show_update_dialog.dart';

import '../api/secureCacheManager.dart';

class InsuranceViewModel extends ChangeNotifier {
  bool expandedIndex=false; // Keep track of the currently expanded index

  void toggleDetail() {
    expandedIndex=!expandedIndex;

    notifyListeners();
  }

void willPopScopeNavigation(){
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
}

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
    getUpdate();

    verifyVersion();

    //  loadData();

  }

  verifyVersion() async {
    try {
      final versionCheck = ShowUpdateDialog(iOSId: 'com.rushtech360.clockspotter', androidId: 'com.rushtech360.clockspotter', iOSAppStoreCountry: 'AE');

      final VersionModel vs = await versionCheck.fetchVersionInfo();

      print('localVersion: ${vs.localVersion}');
      print('appStoreLink: ${vs.appStoreLink}');
      print('storeVersion: ${vs.storeVersion}');
      print('releaseNotes: ${vs.releaseNotes}');

      int typeDemo = 1; // 0 simples, 1 custom dialog, 2 override

      switch (typeDemo) {
        case 0:
          versionCheck.showSimplesDialog(context);
          break;
        case 1:
          versionCheck.showCustomDialogUpdate(
            context: context,
            versionStatus: vs,
            buttonText: "Update",
            buttonColor: Colors.green,
            forceUpdate: true,
            title: 'ClockSpotter',
            bodyoverride: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.update,
                      size: 150,
                      color: Colors.green,
                    ),
                  ],
                ),
                Text(
                  "Please update your app",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Text(
                  "Local version: ${vs.localVersion}",
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  "Store version: ${vs.storeVersion}",
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(height: 30),
                Text(
                  "${vs.releaseNotes}",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          );
          break;
        case 2:
          var _releaseNotes = vs.releaseNotes!.replaceAll("<br>", "\n");
          versionCheck.showCustomDialogUpdate(
            context: context,
            versionStatus: vs,
            buttonText: "Update",
            buttonColor: Colors.green,
            bodyoverride: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.update,
                        size: 150,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Text(
                    "Please update your app",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(
                    "Local version: ${vs.localVersion}",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "Store version: ${vs.storeVersion}",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "${_releaseNotes}",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          );
          break;
        default:
      }
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
    notifyListeners();
  }
  int counter = 0;
  Future<void> getUpdate() async {

    try {
      client.GetUpdateEmployee(constants.loginData.employeeId).then((response) async {
        if(response.isSuccess==true) {
          await storage.deleteAll(); // Delete all existing keys and values
          await storage.write(key: 'EmployeeId', value:response.data!.employeeId.toString());
          await storage.write(key: 'Token', value:response.data!.token.toString());
          await storage.write(key: 'loginResponse', value:jsonEncode(response.data?.toJson()));

          await constants.init();

          //   showToast("Update Called",duration: 1);
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
          // showToast("Invalid login credentials. Please try again.");

        }
        notifyListeners();
      }).catchError((error) {
        // showToast("An error occurred. Please try again.");
        notifyListeners();
      });
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
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
          if (val.isLocationBound == true) {
            helper.isWithinMeters(val.locations).then((
                iswithin) {
              if (iswithin) {

                takeToCameraPicView();

              } else {
                showToast(
                    'Please come to the allocated location ${val.location}');
              }
            });
          }else{

            takeToCameraPicView();
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
