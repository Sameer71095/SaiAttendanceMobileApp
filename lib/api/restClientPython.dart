import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:ClockSpotter/entities/attendance_entity/attendance_request_entity.dart';
import 'package:ClockSpotter/entities/attendance_entity/attendance_response_entity.dart';
import 'package:ClockSpotter/entities/login_entity/login_response_entity.dart';
import 'package:ClockSpotter/entities/recognize_entity/recognize_response_entity.dart';
import 'package:ClockSpotter/entities/recognize_entity/registerface_response_entity.dart';

part 'restClientPython.g.dart';

//@RestApi(baseUrl: 'http://10.39.1.117:8020/api')
@RestApi(baseUrl: 'http://192.67.63.238:8020/api')
abstract class RestClientPython {
  factory RestClientPython(Dio dio, {String? baseUrl}) = _RestClientPython;

/*  @Headers(<String, String>{"Content-Type": "application/json"})
  @POST("/recognize")
  @FormUrlEncoded()
  Future<RecognizeResponseEntity> Recognize(@Part() File? image);

  @Headers(<String, String>{"Content-Type": "application/json"})
  @POST("/attendance/checkin")
  @FormUrlEncoded()
  Future<AttendanceResponseEntity> CheckIn(
      @Part() String? latitude,
      @Part() String? longitude,
      @Part()File? image);*/


  @Headers(<String, String>{"Content-Type": "application/json"})
  @POST("/attendance/recognize")
  @FormUrlEncoded()
  Future<AttendanceResponseEntity> CheckInCheckOut(
      @Part() double? latitude,
      @Part() double? longitude,
      @Part()File? image);


  //@Headers(<String, String>{"Content-Type": "application/json"})
 /* @POST("/registeremployeeimages")
  @FormUrlEncoded()
  Future<RecognizeResponseEntity> RegisterEmployeeImages(String? foldername,@Part() List<File?> images);*/
  @POST("/employee/registerimages")
  @FormUrlEncoded()
  Future<RegisterFaceResponseEntity> RegisterEmployeeImages(
      @Part() String? foldername,
      @Part()List<File?> images,
      );
}
