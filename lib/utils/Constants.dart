import 'dart:convert';
import 'package:sai_attendance/api/secureCacheManager.dart';
import 'package:sai_attendance/entities/login_entity/login_response_entity.dart';

class Constants {
  static final Constants _instance = Constants._internal();
  factory Constants() => _instance;
  Constants._internal();

  Data loginData = Data();

  Future<void> init() async {
    try {
      String? loginDataValue = await storage.read(key: 'loginResponse');
      if (loginDataValue != null && loginDataValue.isNotEmpty) {
        loginData = Data.fromJson(
            json.decode(loginDataValue) as Map<String, dynamic>);
      }
    } catch (e) {
      // Handle the error, e.g., log the error message or show an error dialog
      print('Error reading LoginData from storage: $e');
    }
  }
}

final Constants constants = Constants();
