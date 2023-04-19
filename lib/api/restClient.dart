import 'dart:convert';

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
@RestApi(baseUrl: 'http://192.67.63.238:5000/api')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;


  @Headers(<String, String>{"Content-Type": "application/json"})
  @POST("/attendance/checkin")
  @FormUrlEncoded()
  Future<AttendanceResponseEntity> CheckIn(@Part() AttendanceRequestEntity? attendanceRequestEntity);

  @Headers(<String, String>{"Content-Type": "application/json"})
  @POST("/employee/login")
  Future<LoginResponseEntity> LoginEmployee(@Body()  LoginRequestEntity loginRequestEntity);

  @Headers(<String, String>{"Content-Type": "application/json"})
  @POST("/attendance/getAttendanceHistory")
  Future<AttendanceHistoryResponse> GetAttendanceHistory(@Body()  AttendanceHistoryRequest attendanceHistoryRequest);
}