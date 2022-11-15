import 'dart:developer';

import 'package:dio/dio.dart';

import '../../models/rawatJalan_data_model.dart';
import '../../utilities/constants/api_url.dart';

class RawatJalanService {
  final Dio _dio = Dio();

  Future<List<DataRawatJalan>?> getDataRawatJalanApi(int id) async {
    try {
      var response = await _dio.get(
        '${ApiUrl.getDataPasienRawatJalan}/$id',
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        var _model = RawatJalanDataModel.fromJson(response.data);
        var listData = _model.dataRawatJalan;

        return listData;
      }
    } catch (e) {
      // log(e.toString());
    }
    return null;
  }
}
