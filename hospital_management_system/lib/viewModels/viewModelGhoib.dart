import 'package:flutter/widgets.dart';

import '../models/modelGhoib.dart';
import '../services/serviceGhoib.dart';

class ArtisDetailViewModel with ChangeNotifier {
  ApiService service = ApiService();
  List<Results> listResultDetail = [];
  String artistName = '';

  ArtisDetailViewModel() {
    getResult();
  }

  void onSearch(String query) async {
    if (query.isEmpty) {
      notifyListeners();
    }
    artistName = query;

    notifyListeners();

    getResult();
  }

  getResult() async {
    listResultDetail = (await service.getArtisDetail(artistName))!;
    print(listResultDetail.length);
    notifyListeners();
  }
}
