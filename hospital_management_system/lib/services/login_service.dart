import 'dart:math';

import 'package:hospital_management_system/utilities/constants/api_url.dart';
import 'package:dio/dio.dart';

class LoginService {
  final Dio _dio = Dio();
  Future post(loginData) async {
    try {
      final response = await _dio.post(ApiUrl.login,
          data: loginData,
          options: Options(
            validateStatus: (_) => true,
          ));

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        print('Get data : ${response.data}');
        return response;
      } else {
        return response;
      }
    } catch (e) {
      print('error');
    }
  }
}
