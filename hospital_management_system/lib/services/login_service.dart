import 'package:http/http.dart' as http;

import '../utilities/constants/api_url.dart';

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
