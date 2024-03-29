import 'dart:async';

import 'package:encrypt/encrypt.dart';
import 'package:hospital_management_system/models/account/save/account_save_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/account/validate/account_validate_model.dart';
import '../models/etc/openCardDetail_model.dart';

class UserPreferences {
  Future<void> saveId({int? id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', id ?? 0);
  }

  Future<int?> getId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('id');
    return id;
  }

  void removeId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('id');
  }

  Future<void> savePoli({String? poli}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('poli', poli ?? 'no data');
  }

  Future<String?> getPoli() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? poli = prefs.getString('poli');
    return poli;
  }

  void removePoli() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('poli');
  }

  Future<bool> saveUser(AccountValidateModel user) async {
    // Preference Authentication User Akun Model

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('id', user.id!);
    prefs.setInt('code', user.code!);
    prefs.setString('level', user.level!);

    return true;
  }

  Future<AccountValidateModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt('id');
    int? code = prefs.getInt('code');
    String? level = prefs.getString('level');

    return AccountValidateModel(
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

  Future<bool> saveLoginDetail(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final key = Key.fromLength(32);
    final iv = IV.fromLength(8);
    final encrypter = Encrypter(Salsa20(key));

    final encryptedPassword = encrypter.encrypt(password, iv: iv);

    prefs.setString('detailEmail', email);
    prefs.setString('detailPassword', encryptedPassword.base64);

    return true;
  }

  Future getLoginDetail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? detailEmail = prefs.getString('detailEmail');
    String? detailPassword = prefs.getString('detailPassword');

    final key = Key.fromLength(32);
    final iv = IV.fromLength(8);
    final encrypter = Encrypter(Salsa20(key));

    final decryptedPassword = encrypter.decrypt64(detailPassword!, iv: iv);

    return AccountSaveModel(
      email: detailEmail ?? '',
      password: decryptedPassword,
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
