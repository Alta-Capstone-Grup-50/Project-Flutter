import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hospital_management_system/models/account/create/account_create_model.dart';
import 'package:hospital_management_system/models/account/data/account_model.dart';
import 'package:hospital_management_system/services/account/create_account_service.dart';
import 'package:hospital_management_system/services/account/delete_account_service.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../services/account/account_service.dart';
import '../../utilities/common/progress_dialog.dart';
import '../../utilities/common/snackbar.dart';
import '../../utilities/constants/color.dart';
import '../../views/pasien screen/components/dialog_alert.dart';

enum StatusFetchManage {
  idle,
  isLoading,
  letsGo,
}

class ManageViewModel extends ChangeNotifier {
  bool showLoadingIndicator = false;
  StatusFetchManage fetchStatusManage = StatusFetchManage.idle;

  final GlobalKey<SfDataGridState> keyManage = GlobalKey<SfDataGridState>();

  List<AccountModel> _listManageData = [];
  List<AccountModel>? _tempData = [];
  List<AccountModel> _search = [];
  Map<String, dynamic>? _result;
  int grupValue = 1;
  bool obscure = false;
  List<AccountModel> get search => _search;
  List<AccountModel> get listManageData => _listManageData;

  AccountService service = AccountService(dio: Dio());

  TextEditingController searchController = TextEditingController();

  ManageViewModel() {
    getAkunApi();
  }

  changeLoadingIndicator() {
    showLoadingIndicator = !showLoadingIndicator;
    notifyListeners();
  }

  setGroupValue(int value) {
    grupValue = value;
    notifyListeners();
  }

  changeObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  Future getAkunApi() async {
    fetchStatusManage = StatusFetchManage.isLoading;

    _tempData = (await service.getAccount()) ?? [];
    _listManageData = _tempData!
        .where((element) => element.email != '' && element.password != null)
        .toList();
    fetchStatusManage = StatusFetchManage.letsGo;
    notifyListeners();
  }

  Future<Map<String, dynamic>?> createAkunApi(BuildContext context,
      ProgressDialog progressWidget, AccountCreateModel data) async {
    await progressWidget.show();

    final Map<String, dynamic> createData = data.toJson();

    await Future.delayed(const Duration(seconds: 2), () {
      CreateAccountService(dio: Dio())
          .createAccount(createData)
          .then((response) async {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          _result = {
            'status': true,
            'message': 'Data Berhasil Ditambahkan',
          };

          progressWidget.hide();

          notifyListeners();

          getAkunApi();

          await showAlertSuccess(context, label: 'Akun berhasil dibuat',
              backButton: () {
            Navigator.pushReplacementNamed(context, '/manage');
          });
        } else if (response.statusCode! > 300) {
          _result = {
            'status': false,
            'message': 'Data gagal Ditambahkan',
          };

          progressWidget.hide();

          notifyListeners();

          showAlertFailed(context,
              label: 'Akun tidak berhasil dibuat, silahkan coba lagi',
              backButton: () {
            Navigator.pushReplacementNamed(context, '/manage');
          });
        }
      }).onError((error, stackTrace) {
        _result = {
          'status': false,
          'message': 'Data gagal Ditambahkan',
        };

        notifyListeners();

        progressWidget.hide();

        showAlertFailed(context,
            label: 'Akun tidak berhasil dibuat, silahkan coba lagi',
            backButton: () {
          Navigator.pushReplacementNamed(context, '/manage');
        });
      });
    });

    return _result;
  }

  Future<void> deleteAkunApi(
    BuildContext context,
    int id,
    String email,
    ProgressDialog progressWidget,
  ) async {
    await progressWidget.show();

    DeleteAccountService(dio: Dio())
        .deleteAccount(id.toString())
        .then((response) {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        progressWidget.hide();

        getAkunApi();

        SnackBarComponent(
          context: context,
          message: 'Account dengan email $email berhasil dihapus',
          type: 'danger',
          duration: const Duration(milliseconds: 2400),
        );
      } else if (response.statusCode! >= 300) {
        progressWidget.hide();

        SnackBarComponent(
          context: context,
          message: 'Account tidak bisa dihapus',
          type: 'warning',
          duration: const Duration(milliseconds: 2400),
        );
      }
    }).whenComplete(() => Navigator.pop(context));
  }

  void onSearch(String query) async {
    _search.clear();
    if (query.isEmpty) {
      notifyListeners();
    }

    _search = _listManageData
        .where((AccountModel element) =>
            (element.nama!.toLowerCase().contains(query.toLowerCase())))
        .toList();

    notifyListeners();
  }

  List<TextSpan> highlightOccurences(String source, String query) {
    if (query.isEmpty) {
      return <TextSpan>[TextSpan(text: source)];
    }

    final List<Match> matches = <Match>[];
    for (final String token in query.trim().toLowerCase().split(' ')) {
      matches.addAll(token.allMatches(source.toLowerCase()));
    }

    if (matches.isEmpty) {
      return <TextSpan>[TextSpan(text: source)];
    }
    matches.sort((Match a, Match b) => a.start.compareTo(b.start));

    int lastMatchEnd = 0;
    final List<TextSpan> children = <TextSpan>[];
    Color matchColor = primaryColor.shade900;
    for (final Match match in matches) {
      if (match.end <= lastMatchEnd) {
      } else if (match.start <= lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.end),
          style: TextStyle(fontWeight: FontWeight.bold, color: matchColor),
        ));
      } else {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));

        children.add(TextSpan(
          text: source.substring(match.start, match.end),
          style: TextStyle(fontWeight: FontWeight.bold, color: matchColor),
        ));
      }

      if (lastMatchEnd < match.end) {
        lastMatchEnd = match.end;
      }
    }

    if (lastMatchEnd < source.length) {
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, source.length),
      ));
    }

    return children;
  }
}
