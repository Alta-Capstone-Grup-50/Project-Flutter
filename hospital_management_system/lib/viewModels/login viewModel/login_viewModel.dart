import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/detailAkun_model.dart';
import '../../models/dokter_data_model.dart';
import '../../models/perawat_data_model.dart';
import '../dokter perawat viewModel/dokter_viewModel.dart';
import '../dokter perawat viewModel/perawat_viewModel.dart';
import '/models/akun_model.dart';
import '/services/login_service.dart';
import '/utilities/common/snackbar.dart';

import '../../services/perfs_service.dart';

enum StatusAuth {
  notLoggedIn,
  loggedIn,
  authenticating,
  loggedOut,
}

class LoginProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscure = true;
  bool checkBox = false;
  int? matchDataId;
  String? matchDataPoli;
  final AkunModel _user = AkunModel();
  StatusAuth _loggedInStatusAuth = StatusAuth.notLoggedIn;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AkunModel get user => _user;
  StatusAuth get loggedInStatusAuth => _loggedInStatusAuth;

  set loggedInStatus(StatusAuth value) {
    _loggedInStatusAuth = value;
  }

  LoginProvider() {
    getCheckBox();
    getDetailLogin();
  }

  functionCheckBox() {
    checkBox = !checkBox;
    UserPreferences().checked(checkBox);
    notifyListeners();
  }

  void getCheckBox() async {
    checkBox = await (UserPreferences().getCheck()) ?? false;
    notifyListeners();
  }

  void getDetailLogin() async {
    DetailAkunModel detailLogin = await (UserPreferences().getLoginDetail());

    usernameController.text = detailLogin.email ?? '';
    passwordController.text = detailLogin.password ?? '';

    notifyListeners();
  }

  void functionObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  Future<Map<String, dynamic>> login(BuildContext context) async {
    Map<String, dynamic> result = {};

    DokterViewModel dokteViewModel = context.read<DokterViewModel>();
    PerawatViewModel perawatViewModel = context.read<PerawatViewModel>();

    final Map<String, dynamic> loginData = {
      'email': usernameController.text,
      'password': passwordController.text,
    };

    log(jsonEncode(loginData));

    _loggedInStatusAuth = StatusAuth.authenticating;
    notifyListeners();

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (checkBox == true) {
        UserPreferences().saveLoginDetail(
          usernameController.text,
          passwordController.text,
        );
      } else {
        UserPreferences().removeDetailLogin();
      }

      LoginService().post(loginData).then(
        (response) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            var responseData = response.data;

            AkunModel authUser = AkunModel.fromJson(responseData);
            if (authUser.level == 'dokter' || authUser.level == 'perawat') {
              UserPreferences().saveUser(authUser);

              _loggedInStatusAuth = StatusAuth.loggedIn;
              notifyListeners();

              if (authUser.level == 'dokter') {
                DataDokter data = dokteViewModel.listDokterData
                    .firstWhere((element) => element.idUser == authUser.id);
                matchDataId = data.idUser;
                matchDataPoli = data.poli;
                log(matchDataId.toString());
                log(matchDataPoli.toString());
                notifyListeners();
                UserPreferences().saveId(matchDataId!);
                UserPreferences().savePoli(matchDataPoli!);
                log(data.namaDokter.toString());
              }
              if (authUser.level == 'perawat') {
                DataPerawat data = perawatViewModel.listPerawatData
                    .firstWhere((element) => element.idUser == authUser.id);
                matchDataId = data.idUser;
                matchDataPoli = data.poli;
                log(matchDataId.toString());
                log(matchDataPoli.toString());
                notifyListeners();
                UserPreferences().saveId(matchDataId!);
                UserPreferences().savePoli(matchDataPoli!);
                log(data.namaPerawat.toString());
              }

              result = {
                'status': true,
                'message': 'Login Berhasil',
                'user': authUser
              };

              SnackBarComponent(
                context: context,
                message: result['message'],
                type: 'success',
                duration: const Duration(milliseconds: 1400),
              );

              Future.delayed(
                const Duration(milliseconds: 1500),
                () async {
                  if (checkBox == false) {
                    usernameController.text = '';
                    passwordController.text = '';
                  }
                  await Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (Route<dynamic> route) => false);
                },
              );
            } else {
              _loggedInStatusAuth = StatusAuth.notLoggedIn;
              notifyListeners();

              result = {
                'status': false,
                'message': 'Hak akses terkunci',
              };

              SnackBarComponent(
                context: context,
                message: result['message'],
                type: 'warning',
                duration: const Duration(milliseconds: 1400),
              );
            }
          } else {
            _loggedInStatusAuth = StatusAuth.notLoggedIn;
            notifyListeners();

            result = {
              'status': false,
              'message': 'Username atau Password Salah',
            };

            passwordController.text = '';

            SnackBarComponent(
              context: context,
              message: result['message'],
              type: 'danger',
              duration: const Duration(seconds: 4),
            );
          }
        },
      ).onError((error, stackTrace) {
        _loggedInStatusAuth = StatusAuth.notLoggedIn;
        notifyListeners();

        result = {
          'status': false,
          'message': 'Error Response',
        };

        usernameController.text = '';
        passwordController.text = '';

        SnackBarComponent(
          context: context,
          message: result['message'],
          type: 'warning',
          duration: const Duration(seconds: 4),
        );
      });

      return result;
    } else {
      result = {
        'status': false,
        'message': 'Not Validate',
      };

      _loggedInStatusAuth = StatusAuth.notLoggedIn;
      notifyListeners();

      return result;
    }
  }

  void removePrefereces() {
    UserPreferences().removeUser();
    UserPreferences().removeId();
    UserPreferences().removePoli();
  }

  void logout(BuildContext context) {
    removePrefereces();
    Future.delayed(const Duration(seconds: 1), () async {
      await Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (Route<dynamic> route) => false,
      );
    });

    _loggedInStatusAuth = StatusAuth.loggedOut;
    notifyListeners();
  }
}
