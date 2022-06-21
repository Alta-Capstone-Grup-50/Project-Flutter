import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

import '../models/dokterPerawat_model.dart';
import '../models/pasien_data_model.dart';

class DokterPerawatService {
  final Dio _dio = Dio();

  Future<List<DataDoktorPerawat>?> getDataDokterApi() async {
    try {
      var response = await _dio.get(ApiUrl.getDataDokter,
          options: Options(headers: {
            "x-hasura-admin-secret":
                "WxgA2zHO3k5x78XJHimGkWwFWEGS7KrseH9PyY9ljNbY6mvsIszBEQHgUh6X84y4"
          }));
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        var _model = DokterPerawatModel.fromJson(response.data);
        var listData = _model.dataDoktorPerawat;

        return listData;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
