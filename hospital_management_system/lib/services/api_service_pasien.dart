import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

import '../models/pasien_data_model.dart';

class ApiServicePasienData {
  final Dio _dio = Dio();

  Future<List<DataPasien>?> getDataPasienApi() async {
    try {
      var response = await _dio.get(ApiUrl.getData,
          options: Options(headers: {
            "x-hasura-admin-secret":
                "WxgA2zHO3k5x78XJHimGkWwFWEGS7KrseH9PyY9ljNbY6mvsIszBEQHgUh6X84y4"
          }));
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        var _model = PasienDataModel.fromJson(response.data);
        var listData = _model.dataPasien;

        return listData;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
