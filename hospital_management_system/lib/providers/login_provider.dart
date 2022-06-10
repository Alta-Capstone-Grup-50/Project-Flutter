import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hospital_management_system/models/user_model.dart';
import 'package:hospital_management_system/services/login_service.dart';
import 'package:hospital_management_system/utilities/common/snackbar.dart';

import '../utilities/constants/user_preferences.dart';

enum Status {
  notLoggedIn,
  loggedIn,
  authenticating,
  loggedOut,
}

class LoginProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  bool obscure = false;

  Status _loggedInStatus = Status.notLoggedIn;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();
      LoginService().post(loginData).then(
        (response) {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
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

            print('berhasil login');
          } else {
            _loggedInStatus = Status.notLoggedIn;
            notifyListeners();
            result = {'status': false, 'message': authUser.message};
            SnackBarComponent(
                context: context, message: result['message'], type: 'warning');
          }
        },
      );
      return result;
    } else {
      _loggedInStatus = Status.notLoggedIn;
      notifyListeners();
      return SnackBarComponent(
          context: context, message: 'Invalid Form', type: 'danger');
    }
  }

  static onError(error) {
    print('the error is ${error.detail}');
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
