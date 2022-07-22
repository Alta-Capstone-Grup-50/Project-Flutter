import 'dart:developer';

import 'package:dio/dio.dart';

import '../../utilities/constants/api_url.dart';

class RawatJalanChangeService {
  final Dio _dio = Dio();

  Future<Response> putDataRawatJalanApi(
      int id, Map<String, dynamic> data) async {
    log(id.toString());
    var response = await _dio
        .put('${ApiUrl.putDataPasienRawatJalan}/$id', data: data)
        .onError((error, stackTrace) {
      log(error.toString());
      throw error.toString();
    });

    return response;
  }
}
