import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../models/perawat_data_model.dart';
import '../../models/updatePerawat_model.dart';
import '../../services/deletePerawat_service.dart';
import '../../services/perawat_service.dart';
import '../../services/updatePerawat_service.dart';
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

  List<DataPerawat>? _listPerawatData = [];

  List<DataPerawat> _search = [];

  bool hEdit = false;

  List<DataPerawat> get search => _search;
  List<DataPerawat>? get listPerawatData => _listPerawatData;

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

<<<<<<< HEAD
    _listPerawatData = (await service.getDataPerawatApi()) ?? [];
=======
    _listPerawatData = (await service.getDataPerawatApi())!;
    _listPerawatData[1].jabatan;
>>>>>>> 984bc04aa025e084bcf5a26be19105c3205c9886

    fetchStatusPerawat = StatusFetchPerawat.letsGo;
    notifyListeners();
  }

  Future<void> updatePerawatData(BuildContext context, int id,
      UpdatePerawatModel data, ProgressDialog progressWidget) async {
    Map<String, dynamic> updateData = data.toJson();

    progressWidget.show();

    // log(id.toString());
    // log(updateData.toString());

    UpdatePerawatService()
        .updateDataPerawatApi(id.toString(), updateData)
        .then((response) {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        progressWidget.hide();
        // log('Endpoint Status Code : ${response.statusCode}');
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
<<<<<<< HEAD
    await progressWidget.show();
=======
    progressWidget.show();

    // log(id.toString());
>>>>>>> 984bc04aa025e084bcf5a26be19105c3205c9886

    notifyListeners();
    DeletePerawatService().deleteDataPerawatApi(id.toString()).then((response) {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        progressWidget.hide();
<<<<<<< HEAD
        log('Endpoint Status Code : ${response.statusCode}');

=======
        // log('Endpoint Status Code : ${response.statusCode}');
        Navigator.pop(context);
>>>>>>> 984bc04aa025e084bcf5a26be19105c3205c9886
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
        .where((DataPerawat element) =>
            (element.namaPerawat!.toLowerCase().contains(query.toLowerCase())))
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
