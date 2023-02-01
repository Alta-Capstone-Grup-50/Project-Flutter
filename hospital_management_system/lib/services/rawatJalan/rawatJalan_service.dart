import 'package:dio/dio.dart';
import 'package:hospital_management_system/models/rawatJalan/data/rawatJalan_model.dart';

import '../../models/rawatJalan/data/rawatJalan_data_model.dart';
import '../../utilities/constants/api_url.dart';

class RawatJalanService {
  final Dio _dio = Dio();

  Future<List<RawatJalanModel>?> getDataRawatJalanApi(int id) async {
    List<RawatJalanModel>? listData = [];

    try {
      var response = await _dio.get(
        '${ApiUrl.getDataPasienRawatJalan}/$id',
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        var model = RawatJalanDataModel.fromJson(response.data);
        listData = model.data;

        return listData;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
