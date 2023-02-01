import 'package:dio/dio.dart';
import 'package:hospital_management_system/models/dokter/data/dokter_model.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

import '../../models/dokter/data/dokter_data_model.dart';

class DokterService {
  final Dio _dio = Dio();

  Future<List<DokterModel>?> getDataDokterApi() async {
    try {
      var response = await _dio.get(
        ApiUrl.getDataDokter,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        var model = DokterDataModel.fromJson(response.data);
        var listData = model.data;

        return listData;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
