import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hospital_management_system/models/manage_data_model.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

import '../models/dokter_data_model.dart';

class ManageService {
  final Dio _dio = Dio();

  Future<List<DataManage>?> getDataAkunApi() async {
    try {
      var response = await _dio.get(
        ApiUrl.getDataManage,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        var _model = ManageDataModel.fromJson(response.data);
        var listData = _model.dataManage;

        return listData;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
