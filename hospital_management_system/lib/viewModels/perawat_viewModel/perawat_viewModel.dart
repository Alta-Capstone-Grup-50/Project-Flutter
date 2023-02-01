import 'package:flutter/cupertino.dart';
import 'package:hospital_management_system/models/perawat/data/perawat_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../models/perawat/update/perawat_update_model.dart';
import '../../services/perawat/deletePerawat_service.dart';
import '../../services/perawat/perawat_service.dart';
import '../../services/perawat/updatePerawat_service.dart';
import '../../utilities/common/progress_dialog.dart';
import '../../utilities/common/snackbar.dart';
import '../../utilities/constants/color.dart';
import '../../views/pasien screen/components/dialog_alert.dart';

enum StatusFetchPerawat {
  idle,
  isLoading,
  letsGo,
}

class PerawatViewModel extends ChangeNotifier {
  bool showLoadingIndicator = false;
  StatusFetchPerawat fetchStatusPerawat = StatusFetchPerawat.idle;

  final GlobalKey<SfDataGridState> keyPerawat = GlobalKey<SfDataGridState>();

  List<PerawatModel>? _listPerawatData = [];

  List<PerawatModel> _search = [];

  bool hEdit = false;

  List<PerawatModel> get search => _search;
  List<PerawatModel>? get listPerawatData => _listPerawatData;

  PerawatService service = PerawatService();

  TextEditingController searchController = TextEditingController();

  PerawatViewModel() {
    initialFun();
  }

  initialFun() async {
    await getDataApiPerawat();
  }

  changeEdit() {
    hEdit = !hEdit;
    notifyListeners();
  }

  changeLoadingIndicator() {
    showLoadingIndicator = !showLoadingIndicator;
    notifyListeners();
  }

  Future getDataApiPerawat() async {
    fetchStatusPerawat = StatusFetchPerawat.isLoading;

    _listPerawatData = (await service.getDataPerawatApi()) ?? [];

    fetchStatusPerawat = StatusFetchPerawat.letsGo;
    notifyListeners();
  }

  Future<void> updatePerawatData(BuildContext context, int id,
      PerawatUpdateModel data, ProgressDialog progressWidget) async {
    Map<String, dynamic> updateData = data.toJson();

    progressWidget.show();

    UpdatePerawatService()
        .updateDataPerawatApi(id.toString(), updateData)
        .then((response) {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        progressWidget.hide();
        Navigator.pop(context);

        getDataApiPerawat();
        showAlertSuccess(context,
            title: 'Update data berhasil',
            label: 'Selamat, data berhasil di perbarui silahkan lanjut kerja');
      } else if (response.statusCode == 400) {
        progressWidget.hide();
        Navigator.pop(context);

        showAlertFailed(context,
            title: 'Update data gagal',
            label:
                'Data gagal di perbarui, coba diulang kembali pastikan data dimasukan dengan benar');
      }
    });
  }

  Future<void> deletePerawatData(
    BuildContext context,
    int id,
    ProgressDialog progressWidget,
  ) async {
    progressWidget.show();

    notifyListeners();
    DeletePerawatService().deleteDataPerawatApi(id.toString()).then((response) {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        progressWidget.hide();

        getDataApiPerawat();
        SnackBarComponent(
          context: context,
          message: 'Data Perawat dengan id $id berhasil dihapus',
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

    _search = listPerawatData!
        .where((PerawatModel element) =>
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
