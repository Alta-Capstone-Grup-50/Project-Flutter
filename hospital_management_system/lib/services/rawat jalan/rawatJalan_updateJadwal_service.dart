import 'dart:developer';

import 'package:dio/dio.dart';

import '../../utilities/constants/api_url.dart';

class UpdateRawatJalanService {
  final Dio _dio = Dio();

  Future updateDataRawatJalanApi(int id, Map<String, dynamic> data) async {
    try {
      var response = await _dio.put('${ApiUrl.updateDataPasienRawatJalan}/$id',
          data: data);
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return response;
      }
    } catch (e) {
      rethrow;
    }
  }
}
