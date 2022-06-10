import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class UserPreferences {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('userId', user.id ?? 0);
    prefs.setString('name', user.name ?? '');
    prefs.setString('email', user.email ?? '');
    prefs.setString('type', user.tokenType ?? '');
    prefs.setString('token', user.accessToken ?? '');
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int? userId = prefs.getInt("userId");
    String? name = prefs.getString("name");
    String? email = prefs.getString("email");
    String? type = prefs.getString("type");
    String? token = prefs.getString("token");

    return UserModel(
      id: userId,
      name: name,
      email: email,
      tokenType: type,
      accessToken: token,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('userId');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('phone');
    prefs.remove('type');
    prefs.remove('token');
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }
}
