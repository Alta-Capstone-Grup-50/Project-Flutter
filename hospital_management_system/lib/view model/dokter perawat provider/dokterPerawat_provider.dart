import 'package:flutter/cupertino.dart';

import '../../services/api_dokter_service.dart';

class DokterPerawatProvider extends ChangeNotifier {
  bool showLoadingIndicator = false;
  bool isLoading = true;

  ApiServiceDokterData service = ApiServiceDokterData();
  var listDokterData;

  DokterPerawatProvider() {
    getDataApiDokter();
  }

  changeLoadingIndicator() {
    showLoadingIndicator = !showLoadingIndicator;
    notifyListeners();
  }

  Future getDataApiDokter() async {
    listDokterData = (await service.getDataDokterApi())!;
    isLoading = false;
    notifyListeners();
  }
}
