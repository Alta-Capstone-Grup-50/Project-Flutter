import 'package:hospital_management_system/utilities/constants/api_url.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future post(loginData) async {
    final response = await http
        .post(
      Uri.parse(Uri.encodeFull(ApiUrl.login)),
      body: loginData,
    )
        .onError((error, stackTrace) {
      throw (error.toString());
    });
    print(response.body);
    return response;
  }
}
