import 'dart:async';

import 'package:hospital_management_system/models/detailLogin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/openCardDetail_model.dart';
import '../models/akun_model.dart';

class UserPreferences {
  Future<bool> saveUser(AkunModel user) async {
    
  // Preference Authentication User Akun Model
   

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('code', user.code ?? 400);
    prefs.setString('expire', user.expire ?? '');
    prefs.setString('token', user.token ?? '');

    return true;
  }

  Future<AkunModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int? code = prefs.getInt("code");
    String? expire = prefs.getString("expire");
    String? token = prefs.getString("token");

    return AkunModel(
      code: code,
      expire: expire,
      token: token,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('code');
    prefs.remove('expire');
    prefs.remove('token');
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }


  // Preference Login Detail


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


 
    // Preference Checked to Save Login Detail


  Future checked(bool checked) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('checked', checked);
  }

  Future getCheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? check = prefs.getBool('checked');

    return check;
  }


  // Preference Card Detail


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
