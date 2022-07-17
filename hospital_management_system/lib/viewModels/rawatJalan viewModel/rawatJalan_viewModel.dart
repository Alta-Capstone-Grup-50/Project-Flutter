import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_management_system/models/keterangan_model.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';

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
  int? hasMatchId;
  String? hasMatchPoli;
  String? noAntrian;

  List<DataRawatJalan> listRawatJalanData = [];
  List<DataKeterangan> listKeterangan = [];
  List<DataRawatJalan> _search = [];
  List<DataRawatJalan> get search => _search;

  RawatJalanService service = RawatJalanService();

  TextEditingController searchController = TextEditingController();

  RawatJalanViewModel() {
    initialFun();
  }

  initialFun() async {
    await getDataApiRawatJalan();
    await getCurrentAntrian();
  }

  Future<void> createKeterangan(DataKeterangan? keterangan) async {
    listKeterangan.add(keterangan!);
    notifyListeners();
  }

  getCurrentAntrian() {
    int countSelected = 0;
    listRawatJalanData.reversed.forEach((element) {
      if (!element.proses!) {
        noAntrian = element.nomerAntrian;
      }
      if (element.proses!) {
        countSelected++;
      }
    });
    if (countSelected == listRawatJalanData.length) {
      noAntrian = null;
    }
    notifyListeners();
  }

  Future<Map<String, dynamic>> putProsesKeterangan(
      context, int id, String keterangan, ProgressDialog progress) async {
    bool? proses;
    Map<String, dynamic> result = {};

    postStatusKeterangan = StatusPostKeterangan.isLoading;
    notifyListeners();

    listRawatJalanData.forEach((element) {
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
    log(listKeterangan.toString());
    postStatusKeterangan = StatusPostKeterangan.letsGo;
    notifyListeners();
    return result;
  }

  Future<Map<String, dynamic>> putProsesAntrian(int id, bool proses) async {
    Map<String, dynamic> result = {};
    String? keterangan;

    listKeterangan.forEach((element) {
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
    print('dari function getDataApiRawatJalan');
    fetchStatusRawat = StatusFetchRawat.isLoading;
    hasMatchId = await (UserPreferences().getId());
    hasMatchPoli = await (UserPreferences().getPoli());

    listRawatJalanData = (await service.getDataRawatJalanApi(hasMatchId!))!;
    listRawatJalanData.sort((a, b) =>
        a.nomerAntrian!.toString().compareTo(b.nomerAntrian!.toString()));
    listRawatJalanData
        .sort((a, b) => a.proses.toString().compareTo(b.proses.toString()));

    fetchStatusRawat = StatusFetchRawat.letsGo;
    notifyListeners();
  }

  void onSearch(String query) async {
    _search.clear();
    if (query.isEmpty) {
      notifyListeners();
    }

    _search = listRawatJalanData
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
