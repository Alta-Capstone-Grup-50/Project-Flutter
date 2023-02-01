import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/pasien/create/pasien_create_model.dart';
import 'package:hospital_management_system/models/pasien/data/pasien_model.dart';
import 'package:hospital_management_system/models/pasien/update/pasien_update_model.dart';
import 'package:hospital_management_system/services/pasien/create_pasien_service.dart';
import 'package:hospital_management_system/services/pasien/data_pasien_service.dart';
import 'package:hospital_management_system/services/pasien/delete_pasien_service.dart';
import 'package:hospital_management_system/services/pasien/update_pasien_service.dart';
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

  List<PasienModel> _listPasienData = [];
  List<PasienModel> _tempData = [];
  List<PasienModel> _search = [];

  bool hEdit = false;

  Map<String, dynamic> _result = {};

  List<PasienModel> get search => _search;
  Map<String, dynamic> get result => _result;
  List<PasienModel> get listPasienData => _listPasienData;

  DataPasienService service = DataPasienService();

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
            lastDate: DateTime(2024))
        .then((date) {
      dateTimeT = date;
      notifyListeners();
    });
  }

  Future getDataApiPasien() async {
    fetchStatusPasien = StatusFetchPasien.isLoading;

    _tempData = (await service.getPasien()) ?? [];

    _listPasienData = _tempData
        .where((element) => element.nik != '' && element.nama != '')
        .toList();

    fetchStatusPasien = StatusFetchPasien.letsGo;
    notifyListeners();
  }

  Future<Map<String, dynamic>> addPasienData(BuildContext context,
      ProgressDialog progressWidget, PasienCreateModel pasienData) async {
    await progressWidget.show();

    notifyListeners();

    final Map<String, dynamic> createData = pasienData.toJson();

    Future.delayed(const Duration(seconds: 2), () {
      CreatePasienService().postPasien(pasienData).then((response) async {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          _result = {
            'status': true,
            'message': 'Data Berhasil Ditambahkan',
          };

          notifyListeners();

          getDataApiPasien();

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
      PasienUpdateModel data, ProgressDialog progressWidget) async {
    Map<String, dynamic> updateData = data.toJson();

    progressWidget.show();

    UpdatePasienService()
        .updatePasien(id.toString(), updateData)
        .then((response) {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        progressWidget.hide();

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

    notifyListeners();
    await DeletePasienService()
        .deletePasien(id.toString())
        .then((response) async {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        progressWidget.hide();

        Navigator.pop(context);
        getDataApiPasien();
        SnackBarComponent(
          context: context,
          message: 'Data pasien dengan id $id berhasil dihapus',
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
        .where((PasienModel element) =>
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
