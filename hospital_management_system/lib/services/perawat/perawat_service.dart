import 'package:dio/dio.dart';
import 'package:hospital_management_system/models/perawat/data/perawat_model.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

import '../../models/perawat/data/perawat_data_model.dart';

class PerawatService {
  final Dio _dio = Dio();

  Future<List<PerawatModel>?> getDataPerawatApi() async {
    try {
      var response = await _dio.get(
        ApiUrl.getDataPerawat,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        var model = PerawatDataModel.fromJson(response.data);
        var listData = model.data;

        return listData;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
