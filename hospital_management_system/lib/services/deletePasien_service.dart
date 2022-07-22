import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

class DeletePasienService {
  final Dio _dio = Dio();

  Future<Response> deleteDataPasienApi(String id) async {
    Response response;

    response = await _dio
        .delete(
      '${ApiUrl.deleteDataPasien}/$id',
    )
        .onError((error, stackTrace) {
      log(error.toString());
      throw error!;
    });

    return response;
  }
}
