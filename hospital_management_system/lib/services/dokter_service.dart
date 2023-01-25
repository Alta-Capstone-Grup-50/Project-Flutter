import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

import '../models/dokter_data_model.dart';

class DokterService {
  final Dio _dio = Dio();

  Future<List<DataDokter>?> getDataDokterApi() async {
    try {
      var response = await _dio.get(
        ApiUrl.getDataDokter,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        var model = DokterDataModel.fromJson(response.data);
        var listData = model.dataDokter;

        return listData;
      }
    } catch (e) {}
    return null;
  }
}
