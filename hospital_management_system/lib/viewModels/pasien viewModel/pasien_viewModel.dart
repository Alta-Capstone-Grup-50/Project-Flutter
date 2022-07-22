import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_management_system/models/createPasien_model.dart';
import 'package:hospital_management_system/models/pasien_data_model.dart';
import 'package:hospital_management_system/models/updatePasien_model.dart';
import 'package:hospital_management_system/services/addPasien_service.dart';
import 'package:hospital_management_system/services/deletePasien_service.dart';
import 'package:hospital_management_system/services/pasien_service.dart';
import 'package:hospital_management_system/services/updatePasien_service.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../utilities/common/progress_dialog.dart';
import '../../utilities/common/snackbar.dart';
import '../../views/pasien screen/components/dialog_alert.dart';

enum StatusFetchPasien {
  idle,
  isLoading,
  letsGo,
}

class PasienViewModel extends ChangeNotifier {
  StatusFetchPasien fetchStatusPasien = StatusFetchPasien.idle;

  final GlobalKey<SfDataGridState> keyPasien = GlobalKey<SfDataGridState>();

  DateTime? dateTimeT;

  List<DataPasien> _listPasienData = [];
  List<DataPasien> _tempData = [];
  List<DataPasien> _search = [];

  bool hEdit = false;

  Map<String, dynamic> _result = {};

  List<DataPasien> get search => _search;
  Map<String, dynamic> get result => _result;
  List<DataPasien> get listPasienData => _listPasienData;

  PasienService service = PasienService();

  TextEditingController searchController = TextEditingController();

  PasienViewModel() {
    initialFun();
  }

  initialFun() async {
    await getDataApiPasien();
  }

  changeEditStatus() {
    hEdit = !hEdit;
    notifyListeners();
  }

  void dateTimeTanggal(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1901),
            lastDate: DateTime(2023))
        .then((date) {
      dateTimeT = date;
      notifyListeners();
    });
  }

  Future getDataApiPasien() async {
    fetchStatusPasien = StatusFetchPasien.isLoading;

    _tempData = (await service.getDataPasienApi())!;
    _listPasienData = _tempData
        .where((element) => element.nik != '' && element.nama != '')
        .toList();

    fetchStatusPasien = StatusFetchPasien.letsGo;
    notifyListeners();
  }

  Future<Map<String, dynamic>> addPasienData(BuildContext context,
      ProgressDialog progressWidget, CreatePasienData pasienData) async {
    progressWidget.show();

    notifyListeners();

    final Map<String, dynamic> createData = pasienData.toJson();

    log(createData.toString());

    Future.delayed(const Duration(seconds: 2), () {
      AddPasienService().postDataPasienApi(pasienData).then((response) async {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          _result = {
            'status': true,
            'message': 'Data Berhasil Ditambahkan',
          };

          notifyListeners();

          progressWidget.hide();

          Navigator.pop(context);

          await showAlertSuccess(context,
              label: 'Akun dengan nickname berhasil dibuat');
        } else if (response.statusCode! > 300) {
          _result = {
            'status': false,
            'message': 'Data gagal Ditambahkan',
          };

          notifyListeners();

          progressWidget.hide();

          Navigator.pop(context);

          await showAlertFailed(context,
              label: 'Akun tidak berhasil dibuat, silahkan coba lagi');
        }
      });
    });
    dateTimeT = null;
    return _result;
  }

  Future<void> updatePasienData(BuildContext context, int id,
      UpdatePasienData data, ProgressDialog progressWidget) async {
    Map<String, dynamic> updateData = data.toJson();

    progressWidget.show();

    log(id.toString());
    log(updateData.toString());

    UpdatePasienService()
        .updateDataPasienApi(id.toString(), updateData)
        .then((response) {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        progressWidget.hide();
        log('Endpoint Status Code : ${response.statusCode}');
        Navigator.pop(context);

        getDataApiPasien();
        showAlertSuccess(context,
            title: 'Update data berhasil',
            label: 'Selamat, data berhasil di perbarui silahkan lanjut kerja');
      } else if (response.statusCode! >= 300) {
        progressWidget.hide();
        Navigator.pop(context);

        showAlertFailed(context,
            title: 'Update data gagal',
            label:
                'Data gagal di perbarui, coba diulang kembali pastikan data dimasukan dengan benar');
      }
    });
    dateTimeT = null;
  }

  Future<void> deletePasienData(
    BuildContext context,
    int id,
    ProgressDialog progressWidget,
  ) async {
    progressWidget.show();

    log(id.toString());

    notifyListeners();
    await DeletePasienService()
        .deleteDataPasienApi(id.toString())
        .then((response) async {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        progressWidget.hide();
        log('Endpoint Status Code : ${response.statusCode}');
        Navigator.pop(context);
        getDataApiPasien();
        SnackBarComponent(
          context: context,
          message: 'Data pasien dengan id ${id} berhasil dihapus',
          type: 'danger',
          duration: const Duration(milliseconds: 2400),
        );
      } else if (response.statusCode! >= 300) {
        progressWidget.hide();
        Navigator.pop(context);
        SnackBarComponent(
          context: context,
          message: 'Data tidak berhasil dihapus',
          type: 'warning',
          duration: const Duration(milliseconds: 2400),
        );
      }
    });
  }

  void onSearch(String query) async {
    _search.clear();
    if (query.isEmpty) {
      notifyListeners();
    }

    _search = _listPasienData
        .where((DataPasien element) =>
            (element.nama!.toLowerCase().contains(query.toLowerCase())) ||
            (element.nik!.toLowerCase().contains(query.toLowerCase())))
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