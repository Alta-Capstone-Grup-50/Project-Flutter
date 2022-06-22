import 'dart:async';

import 'package:hospital_management_system/models/detailLogin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/openCardDetail_model.dart';
import '../models/user_model.dart';

class UserPreferences {
  // Future<bool> saveUser(UserModel user) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   prefs.setString('email', user.email ?? '');
  //   prefs.setString('token', user.accessToken ?? '');
  //   prefs.setString('expire', user.expire ?? '');

  //   return true;
  // }

  // Future<UserModel> getUser() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   String? email = prefs.getString("email");
  //   String? token = prefs.getString("token");
  //   String? expire = prefs.getString("expire");

  //   return UserModel(
  //     email: email,
  //     accessToken: token,
  //     expire: expire,
  //   );
  // }

  // void removeUser() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   prefs.remove('email');
  //   prefs.remove('token');
  //   prefs.remove('expire');
  // }

  // Future<String?> getToken() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString("token");
  //   return token;
  // }

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
    prefs.remove('type');
    prefs.remove('token');
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }

  Future<bool> saveLoginDetail(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('detailEmail', email);
    prefs.setString('detailPassword', password);

    return true;
  }

  Future getLoginDetail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? detailEmail = prefs.getString('detailEmail');
    String? detailPassword = prefs.getString('detailPassword');

    return DetailLoginModel(
      detailEmail: detailEmail ?? '',
      detailPassword: detailPassword ?? '',
    );
  }

  void removeDetailLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('detailEmail');
    prefs.remove('detailPassword');
  }

  Future checked(bool checked) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('checked', checked);
  }

  Future getCheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? check = prefs.getBool('checked');

    return check;
  }

  Future<bool> saveOpenCardDetail(
      String cardPasien, cardDokter, cardRawat) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('cardPasien', cardPasien);
    prefs.setString('cardDokter', cardDokter);
    prefs.setString('cardRawat', cardRawat);

    return true;
  }

  Future getOpenCardDetail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cardPasien = prefs.getString('cardPasien');
    String? cardDokter = prefs.getString('cardDokter');
    String? cardRawat = prefs.getString('cardRawat');

    return OpenCardDetail(
      cardPasien: cardPasien,
      cardDokter: cardDokter,
      cardRawat: cardRawat,
    );
  }

  void removeOpenCardDetail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cardPasien');
    prefs.remove('cardDokter');
    prefs.remove('cardRawat');
  }
}
