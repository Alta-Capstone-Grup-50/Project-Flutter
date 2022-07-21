import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_management_system/models/pasien_data_model.dart';
import 'package:hospital_management_system/services/pasien_service.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

enum StatusFetchPasien {
  idle,
  isLoading,
  letsGo,
}

class PasienViewModel extends ChangeNotifier {
  StatusFetchPasien fetchStatusPasien = StatusFetchPasien.idle;

  final GlobalKey<SfDataGridState> keyPasien = GlobalKey<SfDataGridState>();

  List<DataPasien> _listPasienData = [];
  List<DataPasien> _tempData = [];
  List<DataPasien> _search = [];
  List<DataPasien> get search => _search;
  List<DataPasien> get listPasienData => _listPasienData;

  PasienService service = PasienService();

  TextEditingController searchController = TextEditingController();

  PasienViewModel() {
    initialFun();
  }

  initialFun() async {
    await getDataApiPasien();
  }

  Future getDataApiPasien() async {
    fetchStatusPasien = StatusFetchPasien.isLoading;

    _tempData = (await service.getDataPasienApi())!;
    _listPasienData = _tempData.reversed
        .where((element) => element.nik != '' && element.nama != '')
        .toList();

    fetchStatusPasien = StatusFetchPasien.letsGo;
    notifyListeners();
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
