import 'package:flutter/widgets.dart';
import 'package:hospital_management_system/models/pasien_data_model.dart';
import 'package:hospital_management_system/services/api_pasien_service.dart';

class PasienProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  bool showLoadingIndicator = false;
  bool isLoading = true;
  List<DataPasien> _search = [];

  List<DataPasien> get search => _search;

  ApiServicePasienData service = ApiServicePasienData();
  List<DataPasien> listPasienData = [];

  TextEditingController searchController = TextEditingController();

  PasienProvider() {
    getDataApiPasien();
  }

  changeLoadingIndicator() {
    showLoadingIndicator = !showLoadingIndicator;
    notifyListeners();
  }

  Future getDataApiPasien() async {
    listPasienData = (await service.getDataPasienApi())!;

    isLoading = false;
    notifyListeners();
  }

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      notifyListeners();

      return;
    }

    listPasienData.forEach((list) {
      if (list.nama!.toLowerCase().contains(text) ||
          list.nik.toString().contains(text)) {
        _search.add(list);
      }
    });

    notifyListeners();
  }
}
