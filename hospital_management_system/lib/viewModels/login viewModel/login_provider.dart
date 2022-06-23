import 'dart:developer';
import 'package:flutter/material.dart';

import '/models/detailLogin_model.dart';
import '/models/akun_model.dart';
import '/screens/home%20screen/home_screen.dart';
import '/screens/login%20screen/login_screen.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool obscure = true;
  bool checkBox = false;

  AkunModel _user = AkunModel();

  AkunModel get user => _user;

  Status _loggedInStatus = Status.notLoggedIn;

  Status get loggedInStatus => _loggedInStatus;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginProvider() {
    getCheckBox();
    getDetailLogin();
  }

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
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

  void setUser(AkunModel user) {
    _user = user;
    notifyListeners();
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

    var form = formKey.currentState;

    if (form!.validate()) {
      form.save();
      if (checkBox == true) {
        UserPreferences().saveLoginDetail(
          usernameController.text,
          passwordController.text,
        );
      } else {
        UserPreferences().removeDetailLogin();
      }

      notifyListeners();
      LoginService().post(loginData).then(
        (response) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            var responseData = response.data ?? {};

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

            setUser(authUser);

            Future.delayed(
              const Duration(milliseconds: 1500),
              () async {
                await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const HomeScreen()),
                    ),
                    (Route<dynamic> route) => false);
                if (checkBox == false) {
                  usernameController.text = '';
                  passwordController.text = '';
                }
              },
            );
          } else {
            _loggedInStatus = Status.notLoggedIn;
            notifyListeners();

            result = {
              'status': false,
              'message': 'Username atau Password Salah',
            };

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
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const LoginScreen()),
        ),
      );
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
