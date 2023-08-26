import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ClockSpotter/api/restClient.dart';
import 'package:ClockSpotter/api/restClientPython.dart';
import 'package:dio/io.dart';

final dio = Dio(); // Provide a dio instance/ config your dio headers globally
final client = RestClient(dio);
final dioPython = Dio(); // Provide a dio instance/ config your dio headers globally
final clientPython = RestClientPython(dioPython);
//
/*
class DioClient {
  static var dio = Dio();

  static RestClient api() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return RestClient(dio);
  }
}
*/
