import 'dart:convert';

import 'package:ClockSpotter/entities/departments/DepartmentsResponseEntity.dart';
import 'package:ClockSpotter/entities/location_entity/location_response.dart';
import 'package:ClockSpotter/entities/location_entity/location_response.dart';
import 'package:ClockSpotter/entities/task_entity/get_all_team_response.dart';
import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/views/home/home_view.dart';
import 'package:ClockSpotter/views/registerface/registerface_view.dart';
import 'package:ClockSpotter/widgets/teamMember.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ClockSpotter/api/dio_client.dart';
import 'package:ClockSpotter/entities/attendance_entity/attendance_history_request_entity.dart';
import 'package:ClockSpotter/entities/attendance_entity/attendance_history_response_entity.dart' as AttendanceHistoryResponse;
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/utils/ui_utils.dart';
import 'package:ClockSpotter/views/camerapic/camerapic_view.dart';

import 'package:location/location.dart' as Location;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:show_update_dialog/show_update_dialog.dart';

import '../api/secureCacheManager.dart';
import '../entities/location_entity/location_response.dart';

class PeoplesViewModel extends ChangeNotifier {
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






  String? selectedDepartment;
  String? selectedBranch;

  void updateSelectedDepartment(String? department) {
    selectedDepartment = department;
    notifyListeners();
  }

  void updateSelectedBranch(String? branch) {
    selectedBranch = branch;
    notifyListeners();
  }

  List<Employee> get filteredTeam {
    if (selectedDepartment == null && selectedBranch == null) {
      return getAllTeam ?? [];
    }
    return (getAllTeam ?? []).where((employee) {
      final departmentCondition =
          selectedDepartment == null || employee.departmentName == selectedDepartment;
      final branchCondition =
          selectedBranch == null || employee.branchName == selectedBranch;

      return departmentCondition && branchCondition;
    }).toList();
  }






  List<String> departmentNames = [];
  List<Department> Departments=[];
  Future<void> getDepartments() async {
    var response = await client.getDepartments();
    Departments=response.data;
    departmentNames = Departments.map((department) => department.departmentName).toList();

    notifyListeners();
  }


  List<String> locationNames = [];
  List<LocationNew> Locations=[];
  Future<void> GetLocations() async {
    var response = await client.GetLocations(2);
    Locations=response.data;
    locationNames = Locations.map((location) => location.name).toList();

    notifyListeners();
  }



  List<Employee>? _getAllTeam;

  List<Employee>? get getAllTeam => _getAllTeam;

  Future<void> onRefresh() async {
    return loadData();
  }

  ValueNotifier<bool> dataLoaded = ValueNotifier(false);
  Future<void> loadData() async {

    // Call the API and store the data in attendanceList
    try {
      var response = await client.GetAllTeam(2);
      _getAllTeam = response.data;
      dataLoaded.value = true;
      notifyListeners();
    } catch (error) {
      throw Exception('Failed to load All Team');
    }


  }

   dropDownFitler( String? filterName,List<String> item,
   Icon? filterIcon,  void Function(String? selectedValue) onChangedCallback,
       ){
    return DropdownSearch<String>(


      clearButtonProps: ClearButtonProps(
        isVisible: true,
          iconSize: 2,
        visualDensity: VisualDensity(horizontal: -4, vertical: 0),


      ),

      items: item,



      onChanged: onChangedCallback,



      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold
        ),

        dropdownSearchDecoration: InputDecoration(



          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          // labelText: "Filter by ${filterName}",
          prefixIcon:filterIcon,
          filled: true,
          fillColor: AppColor.fieldColor,
          hintText: "${filterName} ",
          // labelStyle: TextStyle(color: AppColor.textColorBlack),
          hintStyle: TextStyle(color: Colors.grey.shade700,fontSize: 13,fontWeight: FontWeight.bold),
        ),
      ),
      dropdownButtonProps: DropdownButtonProps(
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.grey.shade600,
        ),
      ),
      popupProps: PopupProps.menu(
        showSearchBox: true,
      ),

    );

    notifyListeners();
  }

  int? expandedIndex; // Keep track of the currently expanded index

  void toggleDetail(int index) {
    if (expandedIndex == index) {
      expandedIndex = null; // Collapse the card if it's already expanded
    } else {
      expandedIndex = index; // Expand the clicked card
    }
    notifyListeners();
  }




//This code is deliberately leaved  for such scenario when there is the need to apply filter when button is pressed
  // TextEditingController nameController = TextEditingController();
  // TextEditingController branchController = TextEditingController();
  // TextEditingController positionController = TextEditingController();
  //
  // List<Member> memberList = [
  //   Member('rakesh', 'ned', 'flutter'),
  //   Member('rakesh2', 'ned2', 'dart'),
  //   Member('rakesh3', 'ned3', 'firebase'),
  //   Member('rakes4', 'ned4', 'react'),
  //   Member('rakes5', 'ned5', 'react2'),
    // List of member names
  //   // Add more members here
  // ];
  //
  // List<Member> filteredMemberList = [];
  //
  //
  // void filterMembers() {
  //   String name = nameController.text.toLowerCase();
  //   String branch = branchController.text.toLowerCase();
  //   String position = positionController.text.toLowerCase();
  //
  //   filteredMemberList = memberList.where((member) {
  //     return member.name!.toLowerCase().contains(name) &&
  //         member.branch!.toLowerCase().contains(branch) &&
  //         member.position!.toLowerCase().contains(position);
  //   }).toList();
  //   notifyListeners();
  // }

  String title = 'default';

  late BuildContext context;
  bool isCheckedIn = false;
  String employeeName="";
  bool isLoading = false;
  int currentMonth=1;
  int currentYear=2023;
  Future<void> initialise(BuildContext contexts) async {
    await getDepartments();
    await GetLocations();

    context=contexts;
    title = 'initialised';
    DateTime now = DateTime.now();
    currentMonth = now.month; // This will give you the current month as an integer (e.g., 4)
    currentYear = now.year; // This will give you the current year as an integer (e.g., 2023)

    employeeName=constants.loginData.name!;
    notifyListeners();
    getUpdate();

    verifyVersion();


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





}
