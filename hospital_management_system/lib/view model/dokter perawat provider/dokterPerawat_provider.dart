import 'package:flutter/cupertino.dart';

import '../../services/api_dokter_service.dart';
import '../../services/api_pasien_service.dart';

class DokterPerawatProvider extends ChangeNotifier {
  bool showLoadingIndicator = false;
  bool isLoading = true;

  ApiServiceDokterData service = ApiServiceDokterData();
  var listDokterData;

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
