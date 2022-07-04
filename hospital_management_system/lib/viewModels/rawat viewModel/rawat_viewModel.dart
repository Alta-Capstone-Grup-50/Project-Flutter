import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_management_system/models/pasien_data_model.dart';
import 'package:hospital_management_system/services/pasien_service.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class RawatProvider extends ChangeNotifier {
  bool isLoading = true;
  final GlobalKey<SfDataGridState> keyRawat = GlobalKey<SfDataGridState>();

  List<DataPasien> listPasienData = [];
  List<DataPasien> toReversed = [];
  List<DataPasien> _search = [];

  List<DataPasien> get search => _search;

  PasienService service = PasienService();

  TextEditingController searchController = TextEditingController();

  RawatProvider() {
    getDataApiPasien();
  }

  Future getDataApiPasien() async {
    toReversed = (await service.getDataPasienApi())!;
    listPasienData = toReversed.reversed.toList();

    isLoading = false;
    notifyListeners();
  }

  void onSearch(String query) async {
    _search.clear();
    if (query.isEmpty) {
      notifyListeners();
    }

    _search = listPasienData
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
