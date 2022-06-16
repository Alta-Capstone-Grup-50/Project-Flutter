import 'package:flutter/widgets.dart';
import 'package:hospital_management_system/services/api_service_pasien.dart';

class PasienProvider extends ChangeNotifier {
  ApiServicePasienData service = ApiServicePasienData();
  var listPasienData;
  bool isLoading = true;

  Future getDataApiPasien() async {
    listPasienData = (await service.getDataPasienApi())!;
    isLoading = false;
    notifyListeners();
  }
}
