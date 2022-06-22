import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/detailLogin_model.dart';
import 'package:hospital_management_system/models/user_model.dart';
import 'package:hospital_management_system/screens/home%20screen/home_screen.dart';
import 'package:hospital_management_system/screens/login%20screen/login_screen.dart';
import 'package:hospital_management_system/services/login_service.dart';
import 'package:hospital_management_system/utilities/common/snackbar.dart';

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

  UserModel _user = UserModel();

  UserModel get user => _user;

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
    log('============================== User Login ==============================');
    log('Username : ${detailLogin.detailEmail}');
    log('Password : ${detailLogin.detailPassword}');
  }

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void functionObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
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
        UserPreferences()
            .saveLoginDetail(usernameController.text, passwordController.text);
      } else {
        UserPreferences().removeDetailLogin();
      }
      print(checkBox);

      notifyListeners();
      LoginService().post(loginData).then(
        (response) {
          final Map<String, dynamic> responseData = response.data;
          UserModel authUser = UserModel.fromJson(responseData);

          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            UserPreferences().saveUser(authUser);

            _loggedInStatus = Status.loggedIn;
            notifyListeners();

            result = {
              'status': true,
              'message': 'Successful',
              'user': authUser
            };
            SnackBarComponent(
                context: context,
                message: 'Login berhasil',
                type: 'success',
                duration: const Duration(milliseconds: 1400));
            setUser(authUser);
            Future.delayed(const Duration(milliseconds: 1500), () async {
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
            });
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
                duration: const Duration(seconds: 4));
          }
        },
      );
      return result;
    } else {
      _loggedInStatus = Status.notLoggedIn;
      notifyListeners();
      return 'wrong';
    }
  }

  logout(BuildContext context) {
    UserPreferences().removeUser();

    Future.delayed(const Duration(seconds: 1), () async {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const LoginScreen()),
        ),
      );
    });
  }

  static onError(error) {
    print('the error is ${error.detail}');
    return {
      'status': false,
      'message': 'Unsuccessful Request',
      'data': error,
    };
  }
}
