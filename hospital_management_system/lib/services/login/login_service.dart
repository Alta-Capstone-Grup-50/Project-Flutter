import 'package:hospital_management_system/utilities/constants/api_url.dart';
import 'package:dio/dio.dart';

class LoginService {
  Dio dio = Dio();

  Future post(Map<String, dynamic> loginData) async {
    try {
      Response response = await dio.post(
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
        return response;
      }
    } catch (exception) {
      rethrow;
    }
  }
}
