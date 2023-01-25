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
      rethrow;
    }
  }
}
