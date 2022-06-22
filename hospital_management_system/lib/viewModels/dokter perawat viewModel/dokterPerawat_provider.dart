import 'package:flutter/cupertino.dart';
import 'package:hospital_management_system/models/dokterPerawat_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../services/dokterPerawat_service.dart';
import '../../utilities/constants/color.dart';

class DokterPerawatProvider extends ChangeNotifier {
  bool showLoadingIndicator = false;
  bool isLoading = true;

  final GlobalKey<SfDataGridState> keyDokterPerawat =
      GlobalKey<SfDataGridState>();

  List<DataDoktorPerawat> listDokterPerawatData = [];
  List<DataDoktorPerawat> toReversed = [];
  List<DataDoktorPerawat> _search = [];

  List<DataDoktorPerawat> get search => _search;

  DokterPerawatService service = DokterPerawatService();

  TextEditingController searchController = TextEditingController();

  DokterPerawatProvider() {
    getDataApiDokter();
  }

  changeLoadingIndicator() {
    showLoadingIndicator = !showLoadingIndicator;
    notifyListeners();
  }

  Future getDataApiDokter() async {
    toReversed = (await service.getDataDokterApi())!;
    listDokterPerawatData = toReversed.reversed.toList();
    isLoading = false;
    notifyListeners();
  }

  void onSearch(String query) async {
    _search.clear();
    if (query.isEmpty) {
      notifyListeners();
    }

    _search = listDokterPerawatData
        .where((DataDoktorPerawat element) =>
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
