import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hospital_management_system/utilities/common/case_dialog.dart';
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
  Timer? authTimer;
  String? matchDataPoli;

  AkunModel _user = AkunModel();
  StatusAuth _loggedInStatusAuth = StatusAuth.notLoggedIn;
  Map<String, dynamic> result = {};

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
    getLevel();
  }

  functionCheckBox() {
    checkBox = !checkBox;
    UserPreferences().checked(checkBox);
    notifyListeners();
  }

  getLevel() async {
    _user = await UserPreferences().getUser();
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

  validasiUserData(BuildContext context, {required AkunModel authUser}) async {
    DokterViewModel dokteViewModel = context.read<DokterViewModel>();
    PerawatViewModel perawatViewModel = context.read<PerawatViewModel>();
    await dokteViewModel.getDataApiDokter();
    await perawatViewModel.getDataApiPerawat();

    DataDokter? dataDokter;
    DataPerawat? dataPerawat;

    if (authUser.level == 'Dokter') {
      dataDokter = dokteViewModel.listDokterData!
          .firstWhere((element) => element.idUser == authUser.id);
      matchDataId = dataDokter.idUser ?? 0;
      matchDataPoli = dataDokter.poli ?? '';

      notifyListeners();
    }
    if (authUser.level == 'Perawat') {
      dataPerawat = perawatViewModel.listPerawatData!
          .firstWhere((element) => element.idUser == authUser.id);
      matchDataId = dataPerawat.idUser ?? 0;
      matchDataPoli = dataPerawat.poli ?? '';

      notifyListeners();
    }

    log(matchDataId.toString());
    log(matchDataPoli.toString());

    await UserPreferences().saveId(id: matchDataId);
    await UserPreferences().savePoli(poli: matchDataPoli);
  }

  Future<Map<String, dynamic>> login(BuildContext context) async {
    final Map<String, dynamic> loginData = {
      'email': usernameController.text,
      'password': passwordController.text,
    };

    log(loginData.toString());

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
        (response) async {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            var responseData = response.data;

            AkunModel authUser = AkunModel.fromJson(responseData);
            UserPreferences().saveUser(authUser);
            getLevel();

            if (authUser.level == 'Dokter' || authUser.level == 'Perawat') {
              validasiUserData(context, authUser: authUser);
              // UserPreferences().saveUser(authUser);

              _loggedInStatusAuth = StatusAuth.loggedIn;
              notifyListeners();

              result = {
                'status': true,
                'message': 'Login Berhasil',
                'user': authUser,
                'role': authUser.level
              };

              log(authUser.level.toString());

              if (result['status'] == true) {
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
              }
            } else {
              _loggedInStatusAuth = StatusAuth.loggedIn;
              notifyListeners();

              result = {
                'status': true,
                'message': 'Login Berhasil, Welcome Admin',
                'user': authUser,
                'role': authUser.level
              };

              log(authUser.level.toString());

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
            }
          } else {
            _loggedInStatusAuth = StatusAuth.notLoggedIn;
            notifyListeners();

            passwordController.text = '';

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
        _loggedInStatusAuth = StatusAuth.notLoggedIn;
        notifyListeners();

        result = {
          'status': false,
          'message':
              'Akun bermasalah/belum validasi ulang, silahkan hubungi admin',
        };

        // usernameController.text = '';
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
    if (result['role'] == 'dokter' || result['role'] == 'perawat') {
      UserPreferences().removeId();
      UserPreferences().removePoli();
    }
  }

  Future<void> autologout(BuildContext context) async {
    if (authTimer != null) {
      authTimer!.cancel();
      authTimer = null;
    }

    authTimer = Timer(const Duration(hours: 8), () {
      showCaseDialog(context,
          title: 'Logout',
          label: 'Tidak ada aktivitas pada akun anda, silahkan login kembali',
          confirmLabel: 'Oke',
          cancelVisible: false, onPressed: () {
        logout(context);
      });
    });
  }

  Future<void> logout(BuildContext context) async {
    if (authTimer != null) {
      authTimer!.cancel();
      authTimer = null;
    }

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      removePrefereces();
      Future.delayed(const Duration(seconds: 1), () async {
        await Navigator.pushNamedAndRemoveUntil(
          context,
          '/login',
          (Route<dynamic> route) => false,
        );
      });
    });

    _loggedInStatusAuth = StatusAuth.loggedOut;
    notifyListeners();
  }
}
