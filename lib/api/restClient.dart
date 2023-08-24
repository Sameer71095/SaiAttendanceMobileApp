import 'dart:convert';

import 'package:ClockSpotter/api/MultipartFileWrapper.dart';
import 'package:ClockSpotter/entities/default_response_entity.dart';
import 'package:ClockSpotter/entities/departments/DepartmentsResponseEntity.dart';
import 'package:ClockSpotter/entities/location_entity/location_response.dart';
import 'package:ClockSpotter/entities/task_entity/TaskType.dart';
import 'package:ClockSpotter/entities/task_entity/add_task_request.dart';
import 'package:ClockSpotter/entities/task_entity/get_all_team_response.dart';
import 'package:ClockSpotter/entities/task_entity/employee_task_response.dart';
import 'package:ClockSpotter/entities/vacation_entity/vacation_request_entity.dart';
import 'package:ClockSpotter/entities/vacation_entity/vacation_type_response_entity.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:ClockSpotter/entities/attendance_entity/attendance_history_request_entity.dart';
import 'package:ClockSpotter/entities/attendance_entity/attendance_history_response_entity.dart';
import 'package:ClockSpotter/entities/attendance_entity/attendance_request_entity.dart';
import 'package:ClockSpotter/entities/attendance_entity/attendance_response_entity.dart';
import 'package:ClockSpotter/entities/login_entity/login_request_entity.dart';
import 'package:ClockSpotter/entities/login_entity/login_response_entity.dart';
part 'restClient.g.dart';

//@RestApi(baseUrl: 'http://10.39.1.117:8020/api')
@RestApi(baseUrl: 'https://api.clockspotter.com/api')
abstract class RestClient {

  factory RestClient(Dio dio, {String? baseUrl}) {
    dio
      ..options = BaseOptions(receiveTimeout: Duration(seconds: 30000), connectTimeout: Duration(seconds: 30000))
      ..interceptors.addAll([
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // Do something before request is sent
            options.headers.addAll(<String, String>{"Content-Type": "application/json"});
            print(options);
            return handler.next(options); // continue
          },
          onResponse: (response, handler) {
            // Do something with response data
            print(response);
            return handler.next(response); // continue
          },
          onError: (DioError error, handler) {
            // Error handling
            print(error.message);
            return handler.next(error); // continue
          },
        ),
        /*RetryInterceptor(
          options: const RetryOptions(
            retries: 3, // Number of retries before a failure
            retryInterval: const Duration(seconds: 1), // Interval between each retry
            retryEvaluator: (error) => error.type != DioErrorType.CANCEL && error.type != DioErrorType.RESPONSE, // Evaluating if a retry is necessary regarding the error. It is a good candidate for updating authentication token in case of a unauthorized error (be careful with concurrency though)
          ),
        ),*/
        LogInterceptor(responseBody: true, requestBody: true), // Logging
      ]);

    return _RestClient(dio, baseUrl: baseUrl);
  }


/*  @Headers(<String, String>{"Content-Type": "application/json"})*/
  @POST("/attendance/checkin")
  @FormUrlEncoded()
  Future<AttendanceResponseEntity> CheckIn(@Part() AttendanceRequestEntity? attendanceRequestEntity);

  @POST("/employee/login")
  Future<LoginResponseEntity> LoginEmployee(@Body()  LoginRequestEntity loginRequestEntity);

  @POST("/employee/getupdate")
  Future<LoginResponseEntity> GetUpdateEmployee(@Query("EmployeeId") int? employeeId);

  @POST("/attendance/getAttendanceHistory")
  Future<AttendanceHistoryResponse> GetAttendanceHistory(@Body()  AttendanceHistoryRequest attendanceHistoryRequest);

/*
  @POST("/vacation/requestvacation")
  Future<DefaultResponseEntity<String>> requestVacation(@Body() VacationRequestEntity vacationRequest);
*/

  /*@POST("/vacation/requestvacation")
  Future<DefaultResponseEntity<String>> requestVacation(@Body() FormData vacationRequest);*/
/*
  @Headers(<String, String>{"Content-Type": "multipart/form-data"})
  @POST("/vacation/requestvacation")
  @MultiPart()
  Future<DefaultResponseEntity<String>> requestVacation(
      @Part(name: 'employeeId') int employeeId,
      @Part(name: 'startDate') String startDate,
      @Part(name: 'endDate') String endDate,
      @Part(name: 'reason') String reason,
      @Part(name: 'vacationTypeId') int vacationTypeId,
      @Part(name: 'isPaid') bool isPaid,
      @Part(name: 'location') String location,
      @Part(name: 'document') MultipartFileWrapper document);
*/

  @POST("/vacation/getvacationtypes")
  Future<VacationTypeResponseEntity> getvacationtypes();


  @POST("/task/gettasktype")
  Future<TaskTypeResponseEntity> getTasksNames();


  @POST("/task/addemployeetask")
  Future<DefaultResponseEntity<String>> AddEmployeeTask(@Body()  AddTaskRequest addTaskRequest);


  @POST("/task/getemployeetasks")
  Future<EmployeeTasksResponse> GetEmployeeTasks(@Query("EmployeeId") int? employeeId);

  @POST("/employee/getallteam")
  Future<GetAllTeamResponse> GetAllTeam(@Query("employerId") int? employerId);




  @POST("/department/getdepartments")
  Future<DepartmentResponse> getDepartments();


  @POST("/location/getlocationsbyemployerid")
  Future<LocationResponse> GetLocations(@Query("employerId") int? employerId);



}
