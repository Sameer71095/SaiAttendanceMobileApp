import 'dart:convert';
import 'dart:math';

import 'package:ClockSpotter/api/restClient.dart';
import 'package:ClockSpotter/entities/task_entity/TaskType.dart';
import 'package:ClockSpotter/entities/task_entity/add_task_request.dart';
import 'package:ClockSpotter/entities/task_entity/employee_task_response.dart';
import 'package:ClockSpotter/views/registerface/registerface_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ClockSpotter/api/dio_client.dart';
import 'package:ClockSpotter/entities/attendance_entity/attendance_history_request_entity.dart';
import 'package:ClockSpotter/entities/attendance_entity/attendance_history_response_entity.dart'
as AttendanceHistoryResponse;
import 'package:ClockSpotter/entities/attendance_entity/attendance_request_entity.dart';
import 'package:ClockSpotter/entities/login_entity/login_response_entity.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/utils/ui_utils.dart';
import 'package:ClockSpotter/views/camerapermission/camerapermission_view.dart';
import 'package:ClockSpotter/views/camerapic/camerapic_view.dart';

import 'package:location/location.dart' as Location;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:show_update_dialog/show_update_dialog.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart'; // If not already imported

import '../api/secureCacheManager.dart';

class TaskSheetViewModel extends ChangeNotifier {

  List<EmployeeTask>? _employeeTasks;

  List<EmployeeTask>? get employeeTasks => _employeeTasks;

  final formKey = GlobalKey<FormState>();

  TaskType? selectedTaskType;


  TimeOfDay? _selectedTimeStart;
  TimeOfDay? get selectedTimeStart => _selectedTimeStart;

  TimeOfDay? _selectedTimeEnd;
  TimeOfDay? get selectedTimeEnd => _selectedTimeEnd;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  TextEditingController TimeIn = TextEditingController();
  TextEditingController taskDetails= TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();


  String get formattedDate => _selectedDate != null
      ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
      : '';
  String get formattedTimeStart =>
      _selectedTimeStart != null ? _selectedTimeStart!.hour.toString().padLeft(2, '0') + ':' +
          _selectedTimeStart!.minute.toString().padLeft(2, '0') + ':00' : '';
  String get formattedTimeEnd =>
      _selectedTimeEnd != null ? _selectedTimeEnd!.hour.toString().padLeft(2, '0') + ':' +
          _selectedTimeEnd!.minute.toString().padLeft(2, '0') + ':00' : '';


  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setSelectedTimeStart(TimeOfDay time) {
    _selectedTimeStart = time;
    notifyListeners();
  }

  void setSelectedTimeEnd(TimeOfDay time) {
    _selectedTimeEnd = time;
    notifyListeners();
  }

  String title = 'default';

  late BuildContext context;
  bool isCheckedIn = false;
  String employeeName = "";
  bool isLoading = false;
  int currentMonth = 1;
  int currentYear = 2023;
  Future<void> initialise(BuildContext contexts) async {
    await getTasksNames();
    context = contexts;
    title = 'initialised';
    DateTime now = DateTime.now();
    currentMonth = now
        .month; // This will give you the current month as an integer (e.g., 4)
    currentYear = now
        .year; // This will give you the current year as an integer (e.g., 2023)

    employeeName = constants.loginData.name!;
    // employeeName=  (await  storage.read(key: 'Name'))!;
    notifyListeners(); // getUpdate();

    //  loadData();
  }

  List<TaskType>? TaskTypes=[];
  Future<void> getTasksNames() async {
    var response = await client.getTasksNames();
    TaskTypes=response.data;
    notifyListeners();
  }

  // PageController pageController = PageController(viewportFraction: .8);
  // var paddingLeft = 0.0;
  //
  // bool button1 = true;
  // bool button2 = true;

  // AttendanceHistoryResponse.AttendanceHistoryResponse attendanceList =
  // AttendanceHistoryResponse.AttendanceHistoryResponse();
  // void buildMenu(int index) {
  //   paddingLeft = index * 150.0;
  //   if (button1 == true && index == 1) {
  //     button1 = false;
  //     index = 0;
  //   } else {
  //     button1 = true;
  //     index = 1;
  //   }
  //   notifyListeners();
  // }

  // Future<void> _refreshData() async {
  //   // Update the necessary variables here
  //
  //   DateTime now = DateTime.now();
  //   currentMonth = now
  //       .month; // This will give you the current month as an integer (e.g., 4)
  //   currentYear = now
  //       .year; // This will give you the current year as an integer (e.g., 2023)
  //
  //   // You should handle any errors that might occur during data loading
  //   try {
  //     loadData();
  //   } catch (e) {
  //     // Handle the error appropriately
  //     print('Failed to load data: $e');
  //
  //     await Sentry.captureException(
  //       e,
  //       stackTrace: e.toString(),
  //     );
  //   }
  //
  //   notifyListeners();
  // }

  Future<void> onRefresh() async {
    return loadData();
  }

  ValueNotifier<bool> dataLoaded = ValueNotifier(false);
  Future<void> loadData() async {
    // Call the API and store the data in attendanceList
    try {
      var response = await client.GetEmployeeTasks(constants.loginData.employeeId);
      _employeeTasks = response.data;
      print(_employeeTasks);
      dataLoaded.value = true;
      notifyListeners();
    } catch (error) {
      throw Exception('Failed to load employee tasks');
    }


  }





  // Function to save details from form into the AddTaskRequest object
  Future<void> saveTaskDetails() async {
    AddTaskRequest addTaskRequest = AddTaskRequest();
    if (formKey.currentState!.validate()) {
      addTaskRequest.taskName = '';
      addTaskRequest.taskDescription =  taskDetails.text;
      addTaskRequest.taskTypeId = selectedTaskType?.TaskTypeId;
      addTaskRequest.taskDate = formattedDate;
      addTaskRequest.taskStartTime = formattedTimeStart;
      addTaskRequest.taskEndTime = formattedTimeEnd;
      addTaskRequest.isTaskCompleted = false;
      addTaskRequest.employeeId = constants.loginData.employeeId;
      var response = await client.AddEmployeeTask(addTaskRequest);
      print(response);
      notifyListeners();
    }
  }



}