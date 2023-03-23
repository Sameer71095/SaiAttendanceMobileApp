import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sai_attendance/entities/attendance_entity/attendance_request_entity.dart';
import 'package:sai_attendance/entities/attendance_entity/attendance_response_entity.dart';
import 'package:sai_attendance/entities/login_entity/login_request_entity.dart';
import 'package:sai_attendance/entities/login_entity/login_response_entity.dart';

import '../entities/recognize_entity/recognize_response_entity.dart';

part 'restClient.g.dart';

@RestApi(baseUrl: 'http://10.39.1.117:8020/api')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;


  @Headers(<String, String>{"Content-Type": "application/json"})
  @POST("/recognize")
  @FormUrlEncoded()
  Future<RecognizeResponseEntity> Recognize(@Part() File? image);

  @Headers(<String, String>{"Content-Type": "application/json"})
  @POST("/attendance/checkin")
  @FormUrlEncoded()
  Future<AttendanceResponseEntity> CheckIn(@Part() AttendanceRequestEntity? attendanceRequestEntity);



  @Headers(<String, String>{"Content-Type": "application/json"})
  @POST("/employee/login")
  Future<LoginResponseEntity> LoginEmployee(@Body()  LoginRequestEntity loginRequestEntity);


  //@Headers(<String, String>{"Content-Type": "application/json"})
 /* @POST("/registeremployeeimages")
  @FormUrlEncoded()
  Future<RecognizeResponseEntity> RegisterEmployeeImages(String? foldername,@Part() List<File?> images);*/
  @POST("/registeremployeeimages")
  @FormUrlEncoded()
  Future<RecognizeResponseEntity> RegisterEmployeeImages(
      @Part() String? foldername,
      @Part()List<File?> images,
      );


}
