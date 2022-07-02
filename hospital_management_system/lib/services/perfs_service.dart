import 'dart:async';

import 'package:hospital_management_system/models/detailAkun_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/akun_model.dart';
import '../models/openCardDetail_model.dart';

class UserPreferences {
  Future<bool> saveUser(AkunModel user) async {
    // Preference Authentication User Akun Model

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('id', user.id!);
    prefs.setInt('code', user.code!);
    prefs.setString('level', user.level!);

    return true;
  }

  Future<AkunModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt('id');
    int? code = prefs.getInt('code');
    String? level = prefs.getString('level');

    return AkunModel(
      id: id,
      code: code,
      level: level,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('id');
    prefs.remove('code');
    prefs.remove('level');
  }

  // Future<String?> getToken() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString("token");
  //   return token;
  // }

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

    return DetailAkunModel(
      email: detailEmail ?? '',
      password: detailPassword ?? '',
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
