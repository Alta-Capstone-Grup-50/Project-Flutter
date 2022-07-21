import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../models/dokter_data_model.dart';
import '../../models/manage_data_model.dart';
import '../../services/dokter_service.dart';
import '../../services/manage_service.dart';
import '../../utilities/constants/color.dart';

enum StatusFetchManage {
  idle,
  isLoading,
  letsGo,
}

class ManageViewModel extends ChangeNotifier {
  bool showLoadingIndicator = false;
  StatusFetchManage fetchStatusManage = StatusFetchManage.idle;

  final GlobalKey<SfDataGridState> keyManage = GlobalKey<SfDataGridState>();

  List<DataManage> _listManageData = [];
  List<DataManage> _tempData = [];
  List<DataManage> _search = [];

  List<DataManage> get search => _search;
  List<DataManage> get listManageData => _listManageData;

  ManageService service = ManageService();

  TextEditingController searchController = TextEditingController();

  ManageViewModel() {
    getAkunApi();
  }

  changeLoadingIndicator() {
    showLoadingIndicator = !showLoadingIndicator;
    notifyListeners();
  }

  Future getAkunApi() async {
    fetchStatusManage = StatusFetchManage.isLoading;

    _tempData = (await service.getDataAkunApi())!;
    _listManageData = _tempData.reversed
        .where((element) => element.email != '' && element.password != null)
        .toList();
    fetchStatusManage = StatusFetchManage.letsGo;
    notifyListeners();
  }

  void onSearch(String query) async {
    _search.clear();
    if (query.isEmpty) {
      notifyListeners();
    }

    _search = _listManageData
        .where((DataManage element) =>
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
