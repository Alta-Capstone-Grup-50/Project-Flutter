import 'package:flutter/cupertino.dart';

import '../../services/api_service_pasien.dart';

class DokterPerawatProvider extends ChangeNotifier {
  bool showLoadingIndicator = false;
  bool isLoading = true;

  ApiServicePasienData service = ApiServicePasienData();
  var listPasienData;

 



  changeLoadingIndicator() {
    showLoadingIndicator = !showLoadingIndicator;
    notifyListeners();
  }

  Future getDataApiPasien() async {
    listPasienData = (await service.getDataPasienApi())!;
    isLoading = false;
    notifyListeners();
  }
}
