import 'package:flutter/cupertino.dart';
import 'package:hospital_management_system/models/dokter/data/dokter_model.dart';
import 'package:hospital_management_system/models/dokter/update/dokter_update_model.dart';
import 'package:hospital_management_system/services/dokter/deleteDokter_service.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../services/dokter/dokter_service.dart';
import '../../services/dokter/updateDokter_service.dart';
import '../../utilities/common/progress_dialog.dart';
import '../../utilities/common/snackbar.dart';
import '../../utilities/constants/color.dart';
import '../../views/pasien screen/components/dialog_alert.dart';

enum StatusFetchDokter {
  idle,
  isLoading,
  letsGo,
}

class DokterViewModel extends ChangeNotifier {
  bool showLoadingIndicator = false;
  StatusFetchDokter fetchStatusDokter = StatusFetchDokter.idle;

  final GlobalKey<SfDataGridState> keyDokter = GlobalKey<SfDataGridState>();

  List<DokterModel>? _listDokterData = [];

  List<DokterModel> _search = [];

  bool hEdit = false;

  List<DokterModel> get search => _search;
  List<DokterModel>? get listDokterData => _listDokterData;

  DokterService service = DokterService();

  TextEditingController searchController = TextEditingController();

  DokterViewModel() {
    getDataApiDokter();
  }

  changeLoadingIndicator() {
    showLoadingIndicator = !showLoadingIndicator;
    notifyListeners();
  }

  changeEdit() {
    hEdit = !hEdit;
    notifyListeners();
  }

  Future getDataApiDokter() async {
    fetchStatusDokter = StatusFetchDokter.isLoading;

    _listDokterData = (await service.getDataDokterApi()) ?? [];

    fetchStatusDokter = StatusFetchDokter.letsGo;
    notifyListeners();
  }

  Future<void> updateDokterData(BuildContext context, int id,
      DokterUpdateModel data, ProgressDialog progressWidget) async {
    Map<String, dynamic> updateData = data.toJson();

    progressWidget.show();

    UpdateDokterService().updateDataDokterApi(id, updateData).then((response) {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        progressWidget.hide();
        Navigator.pop(context);

        getDataApiDokter();
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
  }

  Future<void> deleteDokterData(
    BuildContext context,
    int id,
    ProgressDialog progressWidget,
  ) async {
    await progressWidget.show();

    notifyListeners();
    DeleteDokterService().deleteDataDokterApi(id.toString()).then((response) {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        progressWidget.hide();

        getDataApiDokter();
        SnackBarComponent(
          context: context,
          message: 'Data Dokter dengan id $id berhasil dihapus',
          type: 'danger',
          duration: const Duration(milliseconds: 2400),
        );
      } else if (response.statusCode! >= 300) {
        progressWidget.hide();

        SnackBarComponent(
          context: context,
          message: 'Data tidak berhasil dihapus',
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

    _search = listDokterData!
        .where((DokterModel element) =>
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
