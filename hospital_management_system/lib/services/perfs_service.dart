import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class UserPreferences {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('email', user.email ?? '');
    prefs.setString('token', user.accessToken ?? '');
    prefs.setString('expire', user.expire ?? '');

    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? email = prefs.getString("email");
    String? token = prefs.getString("token");
    String? expire = prefs.getString("expire");

    return UserModel(email: email, accessToken: token, expire: expire);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('email');
    prefs.remove('token');
    prefs.remove('expire');
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }
}
