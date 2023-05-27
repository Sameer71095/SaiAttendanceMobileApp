import 'dart:convert';
import 'dart:math';
import 'package:ClockSpotter/api/dio_client.dart';
import 'package:ClockSpotter/api/secureCacheManager.dart';
import 'package:ClockSpotter/entities/login_entity/login_response_entity.dart';
import 'package:ClockSpotter/utils/ui_utils.dart';
import 'package:dio/dio.dart';
import 'package:location/location.dart' as loc;
import 'package:location/location.dart';

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
        dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              options.headers['Authorization'] = 'Bearer ${loginData.token}';
              return handler.next(options);
            },
          ),
        );
      }
    } catch (e) {
      // Handle the error, e.g., log the error message or show an error dialog
      showToast('Error reading LoginData from storage: $e');
    }
  }
}

 class Helper {
   loc.Location location = loc.Location();

   Future<bool> isWithinMeters(List<SiteLocations>? locations) async {
     PermissionStatus _permissionGranted;
     bool _serviceEnabled;
     loc.LocationData _locationData;

     _serviceEnabled = await location.serviceEnabled();
     if (!_serviceEnabled) {
       _serviceEnabled = await location.requestService();
       if (!_serviceEnabled) {
         return false;
       }
     }

     _permissionGranted = await location.hasPermission();
     if (_permissionGranted == loc.PermissionStatus.denied) {
       _permissionGranted = await location.requestPermission();
       if (_permissionGranted != loc.PermissionStatus.granted) {
         return false;
       }
     }

     _locationData = await location.getLocation();
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
}
final Constants constants = Constants();

final Helper helper = Helper();
