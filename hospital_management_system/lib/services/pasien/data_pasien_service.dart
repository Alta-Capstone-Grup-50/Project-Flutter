import 'package:dio/dio.dart';
import 'package:hospital_management_system/models/pasien/data/pasien_model.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

import '../../models/pasien/data/pasien_data_model.dart';

class DataPasienService {
  final Dio _dio = Dio();

  Future<List<PasienModel>?> getPasien() async {
    List<PasienModel>? listData = [];
    try {
      var response = await _dio.get(
        ApiUrl.getDataPasien,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        var model = PasienDataModel.fromJson(response.data);

        listData = model.data;
      }
    } catch (e) {
      rethrow;
    }

    return listData;
  }
}
