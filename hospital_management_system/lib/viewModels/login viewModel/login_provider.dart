import 'dart:developer';
import 'package:flutter/material.dart';

import '/models/detailLogin_model.dart';
import '/models/akun_model.dart';
import '/services/login_service.dart';
import '/utilities/common/snackbar.dart';

import '../../services/perfs_service.dart';

enum Status {
  notLoggedIn,
  loggedIn,
  authenticating,
  loggedOut,
}

class LoginProvider extends ChangeNotifier {
  bool obscure = true;
  bool checkBox = false;

  AkunModel _user = AkunModel();

  AkunModel get user => _user;

  Status _loggedInStatus = Status.notLoggedIn;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginProvider() {
    getCheckBox();
    getDetailLogin();
  }

  functionCheckBox() {
    checkBox = !checkBox;
    UserPreferences().checked(checkBox);
    notifyListeners();
  }

  getCheckBox() async {
    checkBox = await (UserPreferences().getCheck()) ?? false;
    notifyListeners();
  }

  getDetailLogin() async {
    DetailLoginModel detailLogin = await (UserPreferences().getLoginDetail());

    usernameController.text = detailLogin.detailEmail ?? '';
    passwordController.text = detailLogin.detailPassword ?? '';

    notifyListeners();
    log('============================= User Login =============================');
    log('Username : ${detailLogin.detailEmail}');
    log('Password : ${detailLogin.detailPassword}');
  }

  void functionObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  Future<Object> login(BuildContext context) async {
    Map<String, dynamic> result = {};

    final Map<String, dynamic> loginData = {
      'email': usernameController.text,
      'password': passwordController.text,
    };

    _loggedInStatus = Status.authenticating;
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
          log(response.data.toString());
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            var responseData = response.data;
            log(responseData.toString());

            AkunModel authUser = AkunModel.fromJson(responseData);
            UserPreferences().saveUser(authUser);

            _loggedInStatus = Status.loggedIn;
            notifyListeners();

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
                    context, '/home', ModalRoute.withName('/home'));
              },
            );
          } else {
            _loggedInStatus = Status.notLoggedIn;
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
        _loggedInStatus = Status.notLoggedIn;
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
          type: 'danger',
          duration: const Duration(seconds: 4),
        );
      });

      return result;
    } else {
      result = {
        'status': false,
        'message': 'Not Validate',
      };

      _loggedInStatus = Status.notLoggedIn;
      notifyListeners();

      return result;
    }
  }

  logout(BuildContext context) {
    Map<String, dynamic> result = {};
    UserPreferences().removeUser();

    Future.delayed(const Duration(seconds: 1), () async {
      await Navigator.pushNamedAndRemoveUntil(
          context, '/login', ModalRoute.withName('/login'));
    });

    result = {
      'status': false,
      'message': 'Not Validate',
    };

    _loggedInStatus = Status.loggedOut;
    notifyListeners();

    return result;
  }
}
