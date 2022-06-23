import 'dart:developer';

import 'package:hospital_management_system/utilities/constants/api_url.dart';
import 'package:dio/dio.dart';

class LoginService {
  final Dio _dio = Dio();

  Future post(loginData) async {
    try {
      Response response = await _dio.post(
        ApiUrl.login,
        data: loginData,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveDataWhenStatusError: true,
          contentType: Headers.jsonContentType,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      log(response.headers.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return response;
      } else {
        print("Request failed with status : ${response.statusCode}");
      }
    } on DioError catch (exception) {
      log('============================== Dio Exception ==============================');
      log(exception.error);
      log('========================== Another Dio Exception ==========================');
      if (exception.response!.statusCode != null) {
        log("Request failed with status : ${exception.response!.statusCode}");
      } else {
        log(exception.message);
        log(exception.response.toString());
      }
      throw Exception(exception.message);
    }
  }
}
