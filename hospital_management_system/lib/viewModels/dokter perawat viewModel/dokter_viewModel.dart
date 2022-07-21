import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../models/dokter_data_model.dart';
import '../../services/dokter_service.dart';
import '../../utilities/constants/color.dart';

enum StatusFetchDokter {
  idle,
  isLoading,
  letsGo,
}

class DokterViewModel extends ChangeNotifier {
  bool showLoadingIndicator = false;
  StatusFetchDokter fetchStatusDokter = StatusFetchDokter.idle;

  final GlobalKey<SfDataGridState> keyDokter = GlobalKey<SfDataGridState>();

  List<DataDokter> _listDokterData = [];
  List<DataDokter> _tempData = [];
  List<DataDokter> _search = [];

  List<DataDokter> get search => _search;
  List<DataDokter> get listDokterData => _listDokterData;

  DokterService service = DokterService();

  TextEditingController searchController = TextEditingController();

  DokterViewModel() {
    getDataApiDokter();
  }

  changeLoadingIndicator() {
    showLoadingIndicator = !showLoadingIndicator;
    notifyListeners();
  }

  Future getDataApiDokter() async {
    fetchStatusDokter = StatusFetchDokter.isLoading;

    _tempData = (await service.getDataDokterApi())!;
    _listDokterData = _tempData.reversed
        .where((element) => element.sip != '' && element.namaDokter != null)
        .toList();
    fetchStatusDokter = StatusFetchDokter.letsGo;
    notifyListeners();
  }

  void onSearch(String query) async {
    _search.clear();
    if (query.isEmpty) {
      notifyListeners();
    }

    _search = listDokterData
        .where((DataDokter element) =>
            (element.namaDokter!.toLowerCase().contains(query.toLowerCase())))
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
