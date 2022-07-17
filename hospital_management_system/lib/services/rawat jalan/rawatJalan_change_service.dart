import 'dart:developer';

import 'package:dio/dio.dart';

import '../../utilities/constants/api_url.dart';

class RawatJalanChangeService {
  final Dio _dio = Dio();

  Future putDataRawatJalanApi(int id, Map<String, dynamic> data) async {
    try {
      var response =
          await _dio.put('${ApiUrl.putDataPasienRawatJalan}/$id', data: data);
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
