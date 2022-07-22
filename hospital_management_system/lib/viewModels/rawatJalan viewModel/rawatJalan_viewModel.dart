import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_management_system/models/keterangan_model.dart';
import 'package:hospital_management_system/models/updateRawat_model.dart';
import 'package:hospital_management_system/services/rawat%20jalan/rawatJalan_serviceAdmin.dart';
import 'package:hospital_management_system/services/rawat%20jalan/rawatJalan_updateJadwal_service.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:hospital_management_system/viewModels/login%20viewModel/login_viewModel.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../models/rawatJalan_data_model.dart';
import '../../services/perfs_service.dart';
import '../../services/rawat jalan/rawatJalan_change_service.dart';
import '../../services/rawat jalan/rawatJalan_service.dart';
import '../../views/rawat screen/dokter perawat screen/components/notification_dialog.dart';
import '../../utilities/common/progress_dialog.dart';

enum StatusFetchRawat {
  idle,
  isLoading,
  letsGo,
}

enum StatusPostKeterangan {
  idle,
  isLoading,
  letsGo,
}

class RawatJalanViewModel extends ChangeNotifier {
  final GlobalKey<SfDataGridState> keyRawat = GlobalKey<SfDataGridState>();
  StatusFetchRawat fetchStatusRawat = StatusFetchRawat.idle;
  StatusPostKeterangan postStatusKeterangan = StatusPostKeterangan.idle;
  int? _hasMatchId;
  String? _hasMatchPoli;
  String? _noAntrian;

  List<DataRawatJalan> _listRawatJalanData = [];
  List<DataRawatJalan> _tempData = [];
  final List<DataKeterangan> _listKeterangan = [];
  List<DataRawatJalan> _search = [];
  bool hEdit = false;

  DateTime? dateTimeJ;

  String? get hasMatchPoli => _hasMatchPoli;
  String? get noAntrian => _noAntrian;
  LoginProvider? valueProvide;
  List<DataRawatJalan> get search => _search;
  List<DataRawatJalan> get listRawatJalanData => _listRawatJalanData;

  RawatJalanService service = RawatJalanService();
  RawatJalanServiceAdmin serviceForAdmin = RawatJalanServiceAdmin();

  TextEditingController searchController = TextEditingController();

  RawatJalanViewModel() {
    initialFun();
  }

  initialFun() async {
    await getCurrentAntrian();
  }

  changeEditStatus() {
    hEdit = !hEdit;
    notifyListeners();
  }

  void dateTimeJadwal(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1901),
            lastDate: DateTime(2023))
        .then((date) {
      dateTimeJ = date;
      notifyListeners();
    });
  }

  Future<void> createKeterangan(DataKeterangan? keterangan) async {
    _listKeterangan.add(keterangan!);
    notifyListeners();
  }

  getCurrentAntrian() {
    int countSelected = 0;
    _listRawatJalanData.reversed.forEach((element) {
      if (!element.proses!) {
        _noAntrian = element.nomerAntrian;
      }
      if (element.proses!) {
        countSelected++;
      }
    });
    if (countSelected == _listRawatJalanData.length) {
      _noAntrian = null;
    }
    notifyListeners();
  }

  Future<Map<String, dynamic>> putProsesKeterangan(
      context, int id, String keterangan, ProgressDialog progress) async {
    bool? proses;
    Map<String, dynamic> result = {};

    postStatusKeterangan = StatusPostKeterangan.isLoading;
    notifyListeners();

    _listRawatJalanData.forEach((element) {
      if (element.id == id) {
        proses = element.proses;
      }
    });

    final Map<String, dynamic> prosesAntrian = {
      "proses": proses,
      "keterangan": keterangan
    };

    RawatJalanChangeService()
        .putDataRawatJalanApi(id, prosesAntrian)
        .then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var responseData = response.data;
        result = responseData;
      } else {
        result = {
          'status': response.statusCode,
          'message': 'Gagal',
        };
      }
    });
    progress.hide();
    Navigator.pop(context);
    Navigator.pop(context);
    showNotifSuccess(context, label: "Keterangan Dokter Berhasil Tersimpan");

    postStatusKeterangan = StatusPostKeterangan.letsGo;
    notifyListeners();
    return result;
  }

  Future<Map<String, dynamic>> putProsesAntrian(int id, bool proses) async {
    Map<String, dynamic> result = {};
    String? keterangan;

    _listKeterangan.forEach((element) {
      if (element.id == id) {
        keterangan = element.keterangan;
      }
    });

    final Map<String, dynamic> prosesAntrian = {
      "proses": proses,
      "keterangan": keterangan
    };

    RawatJalanChangeService()
        .putDataRawatJalanApi(id, prosesAntrian)
        .then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var responseData = response.data;
        result = responseData;
      } else {
        result = {
          'status': response.statusCode,
          'message': 'Gagal',
        };
      }
    });
    return result;
  }

  Future getDataApiRawatJalan() async {
    fetchStatusRawat = StatusFetchRawat.isLoading;
    _hasMatchId = await (UserPreferences().getId());
    _hasMatchPoli = await (UserPreferences().getPoli());

    _tempData = (await service.getDataRawatJalanApi(_hasMatchId!))!;

    _listRawatJalanData = _tempData
        .where((element) => element.nik != '' && element.nama != '')
        .toList();

    _listRawatJalanData.sort((a, b) =>
        a.nomerAntrian!.toString().compareTo(b.nomerAntrian!.toString()));
    _listRawatJalanData
        .sort((a, b) => a.proses.toString().compareTo(b.proses.toString()));

    fetchStatusRawat = StatusFetchRawat.letsGo;
    notifyListeners();
  }

  Future getDataApiRawatJalanAdmin() async {
    fetchStatusRawat = StatusFetchRawat.isLoading;
    _hasMatchId = await (UserPreferences().getId());
    _hasMatchPoli = await (UserPreferences().getPoli());

    _tempData = (await serviceForAdmin.getDataRawatJalanApiAdmin())!;

    _listRawatJalanData = _tempData
        .where((element) => element.nik != '' && element.nama != '')
        .toList();

    _listRawatJalanData.sort((a, b) =>
        a.nomerAntrian!.toString().compareTo(b.nomerAntrian!.toString()));
    _listRawatJalanData
        .sort((a, b) => a.proses.toString().compareTo(b.proses.toString()));

    fetchStatusRawat = StatusFetchRawat.letsGo;
    notifyListeners();
  }

  Future<void> updateDataApiRawatJalanAdmin(BuildContext context, int id,
      UpdateRawatData data, ProgressDialog progressWidget) async {
    Map<String, dynamic> updateData = data.toJson();

    progressWidget.show();

    log(id.toString());
    log(updateData.toString());

    UpdateRawatJalanService()
        .updateDataRawatJalanApi(id, updateData)
        .then((response) {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        progressWidget.hide();
        log('Endpoint Status Code : ${response.statusCode}');
        Navigator.pop(context);

        getDataApiRawatJalanAdmin();
        showNotifSuccess(context, label: 'Update data berhasil');
      } else if (response.statusCode! >= 300) {
        progressWidget.hide();
        Navigator.pop(context);
        showNotifFailed(context, label: 'Update data gagal');
      }
      dateTimeJ = null;
    });
  }

  void onSearch(String query) async {
    _search.clear();
    if (query.isEmpty) {
      notifyListeners();
    }

    _search = _listRawatJalanData
        .where((DataRawatJalan element) =>
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