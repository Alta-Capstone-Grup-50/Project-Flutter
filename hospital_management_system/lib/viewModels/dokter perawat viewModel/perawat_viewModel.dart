import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../models/dokter_data_model.dart';
import '../../models/perawat_data_model.dart';
import '../../services/perawat_service.dart';
import '../../utilities/constants/color.dart';

class PerawatViewModel extends ChangeNotifier {
  bool showLoadingIndicator = false;
  bool isLoading = true;

  final GlobalKey<SfDataGridState> keyPerawat = GlobalKey<SfDataGridState>();

  List<DataPerawat> listPerawatData = [];
  List<DataPerawat> toReversed = [];
  List<DataPerawat> _search = [];

  List<DataPerawat> get search => _search;

  PerawatService service = PerawatService();

  TextEditingController searchController = TextEditingController();

  PerawatViewModel() {
    getDataApiPerawat();
  }

  changeLoadingIndicator() {
    showLoadingIndicator = !showLoadingIndicator;
    notifyListeners();
  }

  Future getDataApiPerawat() async {
    toReversed = (await service.getDataPerawatApi())!;
    listPerawatData = toReversed.reversed.toList();
    isLoading = false;
    notifyListeners();
  }

  void onSearch(String query) async {
    _search.clear();
    if (query.isEmpty) {
      notifyListeners();
    }

    _search = listPerawatData
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
