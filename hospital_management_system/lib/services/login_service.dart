import 'dart:developer';

import 'package:hospital_management_system/utilities/constants/api_url.dart';
import 'package:dio/dio.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;

class LoginService {
  final Dio _dio = Dio();

  Future post(loginData) async {
    try {
      Response response = await _dio.post(
        ApiUrl.login,
        data: loginData,
        options: Options(
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return response;
      } else {
        print("Request failed with status : ${response.statusCode}");
        return response;
      }
    } catch (exception) {
      log('============================== Dio Exception ==============================');
      log(exception.toString());
    }
  }
}

// class LoginService {
//   Future post(Map<String, dynamic> loginData) async {
//     try {
//       var response = await http.post(
//         Uri.parse(ApiUrl.login),
//         body: loginData,
//       );

//       if (response.statusCode >= 200 && response.statusCode <= 300) {
//         return response;
//       } else {
//         print("Request failed with status : ${response.statusCode}");
//       }
//     } catch (exception) {
//       log('============================== Http Exception ==============================');
//       log(exception.toString());
//     }
//   }
// }
