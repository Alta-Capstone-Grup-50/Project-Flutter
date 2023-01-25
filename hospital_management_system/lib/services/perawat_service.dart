import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

import '../models/perawat_data_model.dart';

class PerawatService {
  final Dio _dio = Dio();

  Future<List<DataPerawat>?> getDataPerawatApi() async {
    try {
      var response = await _dio.get(
        ApiUrl.getDataPerawat,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        var model = PerawatDataModel.fromJson(response.data);
        var listData = model.dataPerawat;

        return listData;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
