import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

import '../models/pasien_data_model.dart';

class PasienService {
  final Dio _dio = Dio();

  Future<List<DataPasien>?> getDataPasienApi() async {
    List<DataPasien>? listData = [];
    try {
      var response = await _dio.get(
        ApiUrl.getDataPasien,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        var model = PasienDataModel.fromJson(response.data);
        listData = model.dataPasien;
      }
    } catch (e) {
      log(e.toString());
    }
    return listData;
  }
}
