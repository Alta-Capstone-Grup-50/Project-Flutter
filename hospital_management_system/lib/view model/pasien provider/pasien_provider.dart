import 'package:flutter/widgets.dart';
import 'package:hospital_management_system/services/api_pasien_service.dart';

class PasienProvider extends ChangeNotifier {
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
