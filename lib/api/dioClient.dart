import 'package:dio/dio.dart';
import 'package:sai_attendance/api/restClient.dart';

final dio = Dio(); // Provide a dio instance/ config your dio headers globally
final client = RestClient(dio);
//
// class DioClient {
//   static var dio = Dio();
//
//   static RestClient api() {
//     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//         (HttpClient client) {
//       client.badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//       return client;
//     };
//
//     return RestClient(dio);
//   }
// }
